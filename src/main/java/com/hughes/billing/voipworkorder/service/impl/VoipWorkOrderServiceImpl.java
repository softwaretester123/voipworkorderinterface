package com.hughes.billing.voipworkorder.service.impl;

import com.hughes.billing.voipworkorder.dto.avro.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgReq;
import com.hughes.billing.voipworkorder.repositroy.VoipWorkOrderMsgReqRepo;
import com.hughes.billing.voipworkorder.service.VoipWorkOrderService;
import com.hughes.billing.voipworkorder.utils.Utility;
import com.hughes.billing.voipworkorder.utils.VoipWorkOrderConstants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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
import java.util.Optional;


@Service
@Slf4j
public class VoipWorkOrderServiceImpl implements VoipWorkOrderService {

    @Autowired
    VoipWorkOrderMsgReqRepo voipWorkOrderMsgReqRepo;

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
     */
    @Override
    public void processRequest(VoIPWorkOrder request) {
        //TODO Change the method of retrieving WorkOrderType
        //TODO Change constant names
        log.info("VoipWorkOrderServiceImpl :: processRequest : STARTS");

        // Retrieve the work order type from the request
        String workOrderType = Utility.getWorkOrderTypeFromRequest(request);
        log.info("VoipWorkOrderServiceImpl :: processRequest : WorkOrderType = " + workOrderType);

        // Determine the action based on the work order type
        if (workOrderType.equals(VoipWorkOrderConstants.ADD_VOIP_CONSTANT)) {
            log.info("VoipWorkOrderServiceImpl :: processRequest : calling createVoipWorkOrder()");

            // Create the VoIP work order
            Optional<String> result = createVoipWorkOrder(request);
            log.info("VoipWorkOrderServiceImpl :: processRequest : called createVoipWorkOrder() result = " + result);
        } else if (workOrderType.equals(VoipWorkOrderConstants.CANCEL_VOIP_CONSTANT)) {
            log.info("VoipWorkOrderServiceImpl :: processRequest : calling cancelVoipWorkOrder()");

            // Cancel the VoIP work order
            cancelVoipWorkOrder(request);
        }

        log.info("VoipWorkOrderServiceImpl :: processRequest : ENDS");
    }

    @Override
    public void dumpRequest(VoIPWorkOrder request) throws ParseException {
        log.info("VoipWorkOrderServiceImpl:: dumpRequest : STARTS");
        VoipWorkOrderMsgReq voipWorkOrderMsgReq = new VoipWorkOrderMsgReq();
        // Add TransactionSequenceId
        String transactionSequenceId = request.getMessageHeader().getTransactionSequenceId().toString();
        voipWorkOrderMsgReq.setTransactionSequenceId(transactionSequenceId);
        // Add TransactionDateTime
        String timestamp = request.getMessageHeader().getTransactionDateTime().toString();
        SimpleDateFormat DATE_TIME_FORMAT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
        voipWorkOrderMsgReq.setTransactionDateTime(new Timestamp(DATE_TIME_FORMAT.parse(timestamp).getTime()));

        voipWorkOrderMsgReq.setCreatedTimeStamp(new Date().getTime());

        voipWorkOrderMsgReq.setMessageName("VoIPWorkOrder");

        voipWorkOrderMsgReq.setMessageSource("DSS");

        voipWorkOrderMsgReq.setSan(request.getMessageData().getOrders().get(0).getOrderInformation().getSAN().toString());

        voipWorkOrderMsgReq.setWorkOrderType(Utility.getWorkOrderTypeFromRequest(request));

        voipWorkOrderMsgReq.setRemarks("");

        voipWorkOrderMsgReq.setConsumedPayload(request.toString());

        voipWorkOrderMsgReqRepo.save(voipWorkOrderMsgReq);
        voipWorkOrderMsgReqRepo.flush();

        log.info("VoipWorkOrderServiceImpl:: dumpRequest : ENDS");
    }

    private Optional<String> createVoipWorkOrder(VoIPWorkOrder request) {
        log.info("createVoipWorkOrder : STARTS");
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

        Optional<String> result = Optional.empty();

        try {

            Map<String, Object> out = createBRTWOCall.execute(inputSqlParameterSource);

            if (out != null) {
                if (out.containsKey("RETVAL")) {
                    String retVal = (String) out.get("RETVAL");
                    result = Optional.of(retVal);
                }
            }

        } catch (DataAccessException e) {
            // ORA-01403: no data found, or any java.sql.SQLException
            log.error(e.getMessage());
            throw e;
        }
        log.info("createVoipWorkOrder : ENDS");
        return result;
    }


    private void cancelVoipWorkOrder(VoIPWorkOrder request) {
        log.info("cancelVoipWorkOrder : STARTS");
        log.info("cancelVoipWorkOrder : ENDS");
    }
}
