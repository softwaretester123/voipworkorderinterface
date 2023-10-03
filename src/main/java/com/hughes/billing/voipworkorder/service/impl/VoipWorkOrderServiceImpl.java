package com.hughes.billing.voipworkorder.service.impl;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import com.hughes.billing.voipworkorder.exception.BillingUserException;
import com.hughes.billing.voipworkorder.repositroy.VoipWorkOrderMsgRepo;
import com.hughes.billing.voipworkorder.service.PublisherService;
import com.hughes.billing.voipworkorder.service.VoipWorkOrderService;
import com.hughes.billing.voipworkorder.utils.RequestUtility;
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
        String workOrderType = RequestUtility.getWorkOrderType(request);
        log.info("processRequest : WorkOrderType = " + workOrderType);

        String result = null;
        String responseMessage = null;
        VoIPWorkOrderAckMsg voIPWorkOrderAckMsg = null;

        try {
            // Determine the action based on the work order type
            if (VoipWorkOrderConstants.ADD_VOIP_WORKORDER.equals(workOrderType)) {
                result = createVoipWorkOrder(request);
                responseMessage = VoipWorkOrderConstants.VOIP_WO_CREATE_SUCCESS_MESSAGE;
            } else if (VoipWorkOrderConstants.CANCEL_VOIP_WORKORDER.equals(workOrderType)) {
                result = cancelVoipWorkOrder(request);
                responseMessage = VoipWorkOrderConstants.VOIP_WO_CANCEL_SUCCESS_MESSAGE;
            }

            if (result != null) {
                log.info("processRequest : result = " + result);
                if (result.equals(VoipWorkOrderConstants.SP_CALL_SUCCESS_RET_VAL)) {
                    voipWorkOrderMsgDTO.setState(VoipWorkOrderConstants.VOIP_REQ_STATE_SP_CALLED_OK);
                    voipWorkOrderMsgDTO.setRemarks(VoipWorkOrderConstants.VOIP_REQ_STATE_SP_CALLED_OK_MSG);
                    voipWorkOrderMsgDTO.setStatus(VoipWorkOrderConstants.VOIP_MSG_STATUS_SUCCESS);
                    voIPWorkOrderAckMsg = VoipAckResponseGenerator
                            .prepareResponse(voipWorkOrderMsgDTO, Boolean.TRUE.toString(), responseMessage);
                } else {
                    voipWorkOrderMsgDTO.setState(VoipWorkOrderConstants.VOIP_REQ_STATE_SP_CALLED_FAIL);
                    voipWorkOrderMsgDTO.setRemarks(VoipWorkOrderConstants.VOIP_REQ_STATE_SP_CALLED_FAIL_MSG);
                    voipWorkOrderMsgDTO.setStatus(VoipWorkOrderConstants.VOIP_MSG_STATUS_FAILURE);
                    voIPWorkOrderAckMsg = VoipAckResponseGenerator
                            .prepareResponse(voipWorkOrderMsgDTO, Boolean.FALSE.toString(), result);
                }
            }
        } catch (Exception e) {
            throw new BillingUserException(e.getMessage(), voipWorkOrderMsgDTO);
        }

        log.info("processRequest : ENDS");
        return new ResponseEntity<>(voIPWorkOrderAckMsg, HttpStatus.OK);
    }

    public VoipWorkOrderMsgDTO getVoipWOMsg(VoIPWorkOrder request) {
        log.info("getVoipWOMsg : STARTS");
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
            voipWorkOrderMsgDTO.setState(VoipWorkOrderConstants.VOIP_REQ_STATE_LANDED);
            voipWorkOrderMsgDTO.setRemarks(VoipWorkOrderConstants.VOIP_REQ_STATE_LANDED_MSG);
            voipWorkOrderMsgDTO.setConsumedPayload(request.toString());

            Date timestamp = RequestUtility.getTransactionDateTime(request);

            if (timestamp != null) {
                voipWorkOrderMsgDTO.setTransactionDateTime(new Timestamp(timestamp.getTime()));
            } else {
                voipWorkOrderMsgDTO.setTransactionDateTime(null);
            }

        } catch (Exception e) {
            log.error("getVoipWOMsg : Exception Occurred" + e.getMessage());
            throw new BillingUserException(e.getMessage(), voipWorkOrderMsgDTO);
        }
        log.info("getVoipWOMsg : ENDS");
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
        } catch (Exception e) {
            log.error("saveRequest : Exception Occurred : " + e.getMessage());
            throw new BillingUserException(e.getMessage(), voipWorkOrderMsgDTO);
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
        log.info("saveData : STARTS");
        voipWorkOrderMsgDTO.setModifiedTimeStamp(voipWorkOrderMsgRepo.getServerTime());
        voipWorkOrderMsgRepo.save(voipWorkOrderMsgDTO);
        voipWorkOrderMsgRepo.flush();
        log.info("saveData : ENDS");
    }

    @Override
    public boolean publishMessage(VoIPWorkOrderAckMsg response, String orderingKey) throws PubSubFrwkException {
        return publisherService.publish(response, orderingKey, topicId);
    }
}
