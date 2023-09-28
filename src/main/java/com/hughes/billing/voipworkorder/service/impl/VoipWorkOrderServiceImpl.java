package com.hughes.billing.voipworkorder.service.impl;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import com.hughes.billing.voipworkorder.exception.BillingUserException;
import com.hughes.billing.voipworkorder.exception.RequiredParameterMissingException;
import com.hughes.billing.voipworkorder.repositroy.VoipWorkOrderMsgRepo;
import com.hughes.billing.voipworkorder.service.PublisherService;
import com.hughes.billing.voipworkorder.service.VoipWorkOrderService;
import com.hughes.billing.voipworkorder.utils.RequestUtility;
import com.hughes.billing.voipworkorder.utils.Utility;
import com.hughes.billing.voipworkorder.utils.VoipAckResponseGenerator;
import com.hughes.billing.voipworkorder.utils.VoipWorkOrderConstants;
import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;

@Service
@Slf4j
public class VoipWorkOrderServiceImpl implements VoipWorkOrderService {

    @Autowired
    VoipWorkOrderMsgRepo voipWorkOrderMsgRepo;

    @Autowired
    PublisherService publisherService;

    @Value("${spring.cloud.gcp.pubsub.topic.id}")
    private String topicId;

    /**
     * A description of the entire Java function.
     *
     * @param request             description of parameter
     * @param voipWorkOrderMsgDTO description of parameter
     * @return description of return value
     */
    @Override
    public ResponseEntity<VoIPWorkOrderAckMsg> processRequest(VoIPWorkOrder request, VoipWorkOrderMsgDTO voipWorkOrderMsgDTO) {
        log.info("processRequest : STARTS");

        // Retrieve the work order type from the request
        String workOrderType = RequestUtility.getWorkOrderType(request);
        log.info("processRequest : WorkOrderType = " + workOrderType);

        String result = null;
        String responseMessage = null;
        VoIPWorkOrderAckMsg voIPWorkOrderAckMsg = null;

        try {
            // Determine the action based on the work order type
            if (workOrderType.equals(VoipWorkOrderConstants.ADD_VOIP_WORKORDER)) {
                log.info("processRequest : calling createVoipWorkOrder()");

                // Create the VoIP work order
                result = createVoipWorkOrder(request);
                responseMessage = VoipWorkOrderConstants.VOIP_WO_CREATE_SUCCESS_MESSAGE;
            } else if (workOrderType.equals(VoipWorkOrderConstants.CANCEL_VOIP_WORKORDER)) {
                log.info("processRequest : calling cancelVoipWorkOrder()");

                // Cancel the VoIP BRT Account
                result = cancelVoipWorkOrder(request);
                responseMessage = VoipWorkOrderConstants.VOIP_WO_CANCEL_SUCCESS_MESSAGE;
            }

            if (result != null) {
                log.info("processRequest : result = " + result);
                if (result.equals(VoipWorkOrderConstants.SP_CALL_SUCCESS_RET_VAL)) {
                    voipWorkOrderMsgDTO.setState(VoipWorkOrderConstants.VOIP_MSG_STATE_SP_CALLED_OK);
                    voipWorkOrderMsgDTO.setRemarks(VoipWorkOrderConstants.VOIP_MSG_STATE_SP_CALLED_OK_MSG);
                    voipWorkOrderMsgDTO.setStatus(VoipWorkOrderConstants.VOIP_MSG_STATUS_SUCCESS);
                    voipWorkOrderMsgDTO.setModifiedTimeStamp(voipWorkOrderMsgRepo.getServerTime());
                    voIPWorkOrderAckMsg = VoipAckResponseGenerator
                            .prepareResponse(request, Boolean.TRUE.toString(), responseMessage);
                } else {
                    voipWorkOrderMsgDTO.setState(VoipWorkOrderConstants.VOIP_MSG_STATE_SP_CALLED_FAIL);
                    voipWorkOrderMsgDTO.setRemarks(VoipWorkOrderConstants.VOIP_MSG_STATE_SP_CALLED_FAIL_MSG);
                    voipWorkOrderMsgDTO.setStatus(VoipWorkOrderConstants.VOIP_MSG_STATUS_FAILURE);
                    voipWorkOrderMsgDTO.setModifiedTimeStamp(voipWorkOrderMsgRepo.getServerTime());
                    voIPWorkOrderAckMsg = VoipAckResponseGenerator
                            .prepareResponse(request, Boolean.FALSE.toString(), result);
                }
            }
        } catch (Exception e) {
            voipWorkOrderMsgDTO.setModifiedTimeStamp(voipWorkOrderMsgRepo.getServerTime());
            throw new BillingUserException(e.getMessage(), request, voipWorkOrderMsgDTO);
        }

        log.info("processRequest : ENDS");
        return new ResponseEntity<>(voIPWorkOrderAckMsg, HttpStatus.OK);
    }

    public VoipWorkOrderMsgDTO getVoipWOMsg(VoIPWorkOrder request) {
        log.info("saveRequestHelper : STARTS");
        VoipWorkOrderMsgDTO voipWorkOrderMsgDTO = null;

        try {
            voipWorkOrderMsgDTO = new VoipWorkOrderMsgDTO();
            String transactionSequenceId = RequestUtility.getTransactionSequenceId(request);
            voipWorkOrderMsgDTO.setTransactionSequenceId(transactionSequenceId);
            voipWorkOrderMsgDTO.setCreatedTimeStamp(voipWorkOrderMsgRepo.getServerTime());
            voipWorkOrderMsgDTO.setMessageName(VoipWorkOrderConstants.VOIPWORKORDER_MSG_NAME);
            voipWorkOrderMsgDTO.setMessageSource(VoipWorkOrderConstants.DSS);
            voipWorkOrderMsgDTO.setMessageDestination(VoipWorkOrderConstants.BILLING);
            voipWorkOrderMsgDTO.setSan(RequestUtility.getSan(request));
            voipWorkOrderMsgDTO.setWorkOrderType(RequestUtility.getWorkOrderType(request));
            voipWorkOrderMsgDTO.setStatus(VoipWorkOrderConstants.VOIP_MSG_STATUS_PENDING);
            voipWorkOrderMsgDTO.setState(VoipWorkOrderConstants.VOIP_MSG_STATE_LANDED);
            voipWorkOrderMsgDTO.setRemarks("");
            voipWorkOrderMsgDTO.setConsumedPayload(request.toString());

            Date timestamp = RequestUtility.getTransactionDateTime(request);

            if (timestamp != null) {
                voipWorkOrderMsgDTO.setTransactionDateTime(new Timestamp(timestamp.getTime()));
            } else {
                throw new RequiredParameterMissingException("MessageHeader->TransactionDateTime", request, voipWorkOrderMsgDTO);
            }

        } catch (RequiredParameterMissingException requiredParameterMissingException) {
            log.error("saveRequestHelper : Exception Occurred" + requiredParameterMissingException.getMessage());
            throw requiredParameterMissingException;
        } catch (Exception e) {
            log.error("saveRequestHelper : Exception Occurred" + e.getMessage());
            throw new BillingUserException(e.getMessage(), request, voipWorkOrderMsgDTO);
        }
        log.info("saveRequestHelper : ENDS");
        return voipWorkOrderMsgDTO;
    }

    /**
     * Generates a VoipWorkOrderMsgDump object by dumping the VoIPWorkOrder request.
     *
     * @param request The VoIPWorkOrder request object to be dumped.
     * @return The generated VoipWorkOrderMsgDump object.
     */
    @Override
    public VoipWorkOrderMsgDTO saveRequest(VoIPWorkOrder request) {
        log.info("saveRequest : STARTS");

        VoipWorkOrderMsgDTO voipWorkOrderMsgDTO = null;
        try {
            voipWorkOrderMsgDTO = getVoipWOMsg(request);
            log.info("saveRequest : Saving to DB");
            voipWorkOrderMsgRepo.save(voipWorkOrderMsgDTO);
            voipWorkOrderMsgRepo.flush();
        } catch (RequiredParameterMissingException requiredParameterMissingException) {
            log.error("saveRequest : Exception Occurred" + requiredParameterMissingException.getMessage());
            throw requiredParameterMissingException;
        } catch (Exception e) {
            log.error("saveRequest : Exception Occurred : " + e.getMessage());

            throw new BillingUserException(e.getMessage(), request, voipWorkOrderMsgDTO);
        }

        log.info("saveRequest : ENDS");
        return voipWorkOrderMsgDTO;
    }

    /**
     * Creates a VoIP work order.
     *
     * @param request the VoIP work order request
     * @return the result of the work order creation
     */
    private String createVoipWorkOrder(VoIPWorkOrder request) {
        log.info("createVoipWorkOrder : STARTS");
        String accountNumber = request.getMessageData().getOrders().get(0).getOrderInformation().getSAN().toString();
        String woType = RequestUtility.getWorkOrderType(request);
        String fName = request.getMessageData().getOrders().get(0).getInstallName().getFirstName().toString();
        String lName = request.getMessageData().getOrders().get(0).getInstallName().getLastName().toString();
        String addr1 = request.getMessageData().getOrders().get(0).getInstallAddress().getAddress1().toString();
        String city = request.getMessageData().getOrders().get(0).getInstallAddress().getCity().toString();
        String state = request.getMessageData().getOrders().get(0).getInstallAddress().getState().toString();
        String zip = request.getMessageData().getOrders().get(0).getInstallAddress().getZip().toString();
        String phone = request.getMessageData().getOrders().get(0).getInstallPhone().get(0).getNumber().toString();
        String billingDeal = RequestUtility.getBillingDeal(request);
        String glSeg = RequestUtility.getGlSegment(request);

        String result = null;

        log.info("createVoipWorkOrder : calling SP");

        try {
            result = voipWorkOrderMsgRepo.createVoipWO(accountNumber, woType, fName, lName, addr1, city, state, zip, phone, billingDeal, glSeg);
        } catch (DataAccessException ex) {
            log.error("createVoipWorkOrder : Exception: " + ex.getMessage());
            throw ex;
        }

        log.info("createVoipWorkOrder : result = " + result);

        log.info("createVoipWorkOrder : ENDS");

        return result;
    }

    /**
     * Cancels a BRT account.
     *
     * @param request the VoIP work order request
     * @return the result of the cancellation
     */
    private String cancelVoipWorkOrder(VoIPWorkOrder request) {
        log.info("cancelVoipWorkOrder : STARTS");
        String accountNumber = RequestUtility.getSan(request);

        String result = null;

        log.info("cancelVoipWorkOrder : calling SP");

        try {
            result = voipWorkOrderMsgRepo.cancelVoipWo(accountNumber);
        } catch (DataAccessException ex) {
            log.error("cancelVoipWorkOrder : Exception: " + ex.getMessage());
            throw ex;
        }

        log.info("cancelVoipWorkOrder : result = " + result);

        log.info("cancelVoipWorkOrder : ENDS");
        return result;
    }

    @Override
    public void saveData(VoipWorkOrderMsgDTO voipWorkOrderMsgDTO) {
        voipWorkOrderMsgRepo.save(voipWorkOrderMsgDTO);
        voipWorkOrderMsgRepo.flush();
    }

    @Override
    public boolean publishMessage(VoIPWorkOrderAckMsg response, String orderingKey) throws PubSubFrwkException {
        return publisherService.publish(response, orderingKey, topicId);
    }
}
