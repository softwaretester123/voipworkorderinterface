package com.hughes.billing.voipworkorder.service.impl;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgReq;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgRes;
import com.hughes.billing.voipworkorder.repositroy.VoipWorkOrderMsgReqRepo;
import com.hughes.billing.voipworkorder.repositroy.VoipWorkOrderMsgResRepo;
import com.hughes.billing.voipworkorder.service.VoipWorkOrderService;
import com.hughes.billing.voipworkorder.utils.Utility;
import com.hughes.billing.voipworkorder.utils.VoipAckResponseGenerator;
import com.hughes.billing.voipworkorder.utils.VoipWorkOrderConstants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;


@Service
@Slf4j
public class VoipWorkOrderServiceImpl implements VoipWorkOrderService {

    @Autowired
    VoipWorkOrderMsgReqRepo voipWorkOrderMsgReqRepo;

    @Autowired
    VoipWorkOrderMsgResRepo voipWorkOrderMsgResRepo;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private SimpleJdbcCall createBRTWOCall;

    @PostConstruct
    void init() {
        jdbcTemplate.setResultsMapCaseInsensitive(true);

        createBRTWOCall = new SimpleJdbcCall(jdbcTemplate)
                .withProcedureName("CREATE_BRT_WO");

    }

    /**
     * Process the VoIP work order request.
     *
     * @param request the VoIP work order request
     * @return the ResponseEntity containing the VoIP work order acknowledgment message
     */
    @Override
    public ResponseEntity<VoIPWorkOrderAckMsg> processRequest(VoIPWorkOrder request) {
        //TODO Change the method of retrieving WorkOrderType
        //TODO Change constant names
        log.info("VoipWorkOrderServiceImpl :: processRequest : STARTS");

        // Retrieve the work order type from the request
        String workOrderType = Utility.getWorkOrderTypeFromRequest(request);
        log.info("VoipWorkOrderServiceImpl :: processRequest : WorkOrderType = " + workOrderType);

        String result = null;
        String responseMessage = null;

        // Determine the action based on the work order type
        if (workOrderType.equals(VoipWorkOrderConstants.ADD_VOIP_CONSTANT)) {
            log.info("VoipWorkOrderServiceImpl :: processRequest : calling createVoipWorkOrder()");

            // Create the VoIP work order
            result = createVoipWorkOrder(request);
            responseMessage = VoipWorkOrderConstants.VOIP_WO_CREATE_SUCCESS_MESSAGE;
            log.info("VoipWorkOrderServiceImpl :: processRequest : called createVoipWorkOrder() result = " + result);
        } else if (workOrderType.equals(VoipWorkOrderConstants.CANCEL_VOIP_CONSTANT)) {
            log.info("VoipWorkOrderServiceImpl :: processRequest : calling cancelVoipWorkOrder()");

            // Cancel the VoIP work order
            cancelVoipWorkOrder(request);
            responseMessage = VoipWorkOrderConstants.VOIP_WO_CANCEL_SUCCESS_MESSAGE;
        }

        VoIPWorkOrderAckMsg voIPWorkOrderAckMsg = null;

        if (result != null) {
            log.info("VoipWorkOrderServiceImpl :: processRequest : result = " + result);
            if (result.equals("0")) {
                voIPWorkOrderAckMsg = VoipAckResponseGenerator
                        .prepareResponse(request, Boolean.TRUE.toString(), responseMessage);
            } else {
//                voIPWorkOrderAckMsg = VoipAckResponseGenerator.prepareErrorResponse();
            }
        }

        // TODO: Prepare response
        // TODO: Send response
        // TODO: Save response to db

        log.info("VoipWorkOrderServiceImpl :: processRequest : ENDS");
        return new ResponseEntity<>(voIPWorkOrderAckMsg, HttpStatus.OK);
    }

    /**
     * Dumps the request to HNS_BILLING_VOIP_WO_MSG_REQ_T table
     *
     * @param  request  the VoIPWorkOrder object containing the request data
     * @return          the ID of the saved VoipWorkOrderMsgReq object
     * @throws ParseException  if there is an error parsing the timestamp
     */
    @Override
    public Long dumpRequest(VoIPWorkOrder request) throws ParseException {
        log.info("VoipWorkOrderServiceImpl:: dumpRequest : STARTS");
        VoipWorkOrderMsgReq voipWorkOrderMsgReq = new VoipWorkOrderMsgReq();

        String transactionSequenceId = request.getMessageHeader().getTransactionSequenceId().toString();
        voipWorkOrderMsgReq.setTransactionSequenceId(transactionSequenceId);

        String timestamp = request.getMessageHeader().getTransactionDateTime().toString();
        SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
        voipWorkOrderMsgReq.setTransactionDateTime(new Timestamp(dateTimeFormat.parse(timestamp).getTime()));

        voipWorkOrderMsgReq.setCreatedTimeStamp(new Date().getTime());

        voipWorkOrderMsgReq.setMessageName(VoipWorkOrderConstants.REQ_MESSAGE_NAME);

        voipWorkOrderMsgReq.setMessageSource(VoipWorkOrderConstants.DSS);

        voipWorkOrderMsgReq.setSan(request.getMessageData().getOrders().get(0).getOrderInformation().getSAN().toString());

        voipWorkOrderMsgReq.setWorkOrderType(Utility.getWorkOrderTypeFromRequest(request));

        voipWorkOrderMsgReq.setRemarks("");

        voipWorkOrderMsgReq.setConsumedPayload(request.toString());

        log.info("VoipWorkOrderServiceImpl:: dumpRequest : Saving to DB");

        voipWorkOrderMsgReqRepo.save(voipWorkOrderMsgReq);
        voipWorkOrderMsgReqRepo.flush();

        log.info("VoipWorkOrderServiceImpl:: dumpRequest : ENDS");
        return voipWorkOrderMsgReq.getId();
    }

    /**
     * Dump the response of the VoIP work order acknowledgement message.
     *
     * @param  response  the VoIP work order acknowledgement message
     * @param  req_id    the request ID
     */
    @Override
    public void dumpResponse(VoIPWorkOrderAckMsg response, Long req_id) {
        log.info("VoipWorkOrderServiceImpl:: dumpResponse : STARTS");
        VoipWorkOrderMsgRes voipWorkOrderMsgRes = new VoipWorkOrderMsgRes();

        voipWorkOrderMsgRes.setReqId(req_id);

        voipWorkOrderMsgRes.setTransactionDateTime(new Timestamp(new Date().getTime()));

        voipWorkOrderMsgRes.setCreatedTimeStamp(new Date().getTime());

        voipWorkOrderMsgRes.setMessageName(VoipWorkOrderConstants.ACK_MESSAGE_NAME);

        voipWorkOrderMsgRes.setMessageDestination(VoipWorkOrderConstants.BILLING);

        voipWorkOrderMsgRes.setRemarks("");

        voipWorkOrderMsgRes.setPublishedPayload(response.toString());

        log.info("VoipWorkOrderServiceImpl:: dumpResponse : Saving to DB");

        voipWorkOrderMsgResRepo.save(voipWorkOrderMsgRes);
        voipWorkOrderMsgResRepo.flush();

        log.info("VoipWorkOrderServiceImpl:: dumpResponse : ENDS");
    }

    /**
     * Creates a VoIP work order.
     *
     * @param  request   the VoIP work order request
     * @return           the result of the work order creation
     */
    private String createVoipWorkOrder(VoIPWorkOrder request) {
        log.info("VoipWorkOrderServiceImpl:: createVoipWorkOrder : STARTS");
        String account_number = request.getMessageData().getOrders().get(0).getOrderInformation().getSAN().toString();
        String wo_type = Utility.getWorkOrderTypeFromRequest(request);
        String f_name = request.getMessageData().getOrders().get(0).getInstallName().getFirstName().toString();
        String l_name = request.getMessageData().getOrders().get(0).getInstallName().getLastName().toString();
        String addr1 = request.getMessageData().getOrders().get(0).getInstallAddress().getAddress1().toString();
        String city = request.getMessageData().getOrders().get(0).getInstallAddress().getCity().toString();
        String state = request.getMessageData().getOrders().get(0).getInstallAddress().getState().toString();
        String zip = request.getMessageData().getOrders().get(0).getInstallAddress().getZip().toString();
        String phone = request.getMessageData().getOrders().get(0).getInstallPhone().get(0).getNumber().toString();
        String billing_deal = Utility.getBillingDealFromRequest(request);
        String gl_seg = Utility.getGlSegmentFromRequest(request);


        MapSqlParameterSource inputSqlParameterSource = new MapSqlParameterSource();
        inputSqlParameterSource.addValue("ACCNO", account_number);
        inputSqlParameterSource.addValue("WO_TYPE", wo_type);
        inputSqlParameterSource.addValue("FNAME", f_name);
        inputSqlParameterSource.addValue("LNAME", l_name);
        inputSqlParameterSource.addValue("ADDR1", addr1);
        inputSqlParameterSource.addValue("CITY", city);
        inputSqlParameterSource.addValue("STATE", state);
        inputSqlParameterSource.addValue("ZIP", zip);
        inputSqlParameterSource.addValue("PHONE", phone);
        inputSqlParameterSource.addValue("BILLING_DEAL", billing_deal);
        inputSqlParameterSource.addValue("GL_SEG", gl_seg);

        String result = null;

        try {
            log.info("VoipWorkOrderServiceImpl:: createVoipWorkOrder : calling SP");
            Map<String, Object> out = createBRTWOCall.execute(inputSqlParameterSource);

            if (out != null) {
                if (out.containsKey("RETVAL")) {
                    result = (String) out.get("RETVAL");
                }
            }
            log.info("VoipWorkOrderServiceImpl:: createVoipWorkOrder : Result from SP obtained successfully : " + result);

        } catch (DataAccessException e) {
            // ORA-01403: no data found, or any java.sql.SQLException
            log.error(e.getMessage());
            throw e;
        }
        log.info("VoipWorkOrderServiceImpl:: createVoipWorkOrder : ENDS");
        return result;
    }


    private String cancelVoipWorkOrder(VoIPWorkOrder request) {
        log.info("VoipWorkOrderServiceImpl:: cancelVoipWorkOrder : STARTS");
        String result = null;
        log.info("VoipWorkOrderServiceImpl:: cancelVoipWorkOrder : ENDS");
        return result;
    }
}
