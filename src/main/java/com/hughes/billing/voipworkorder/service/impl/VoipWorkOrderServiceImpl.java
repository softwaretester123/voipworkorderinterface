package com.hughes.billing.voipworkorder.service.impl;

import com.hughes.billing.voipworkorder.dto.avro.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgReq;
import com.hughes.billing.voipworkorder.exception.MissingParameterException;
import com.hughes.billing.voipworkorder.repositroy.VoipWorkOrderMsgReqRepo;
import com.hughes.billing.voipworkorder.service.VoipWorkOrderService;
import com.hughes.billing.voipworkorder.utils.VoipWorkOrderConstants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
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
public class VoipWorkOrderServiceImpl implements VoipWorkOrderService{

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

    @Override
    public void processRequest(VoIPWorkOrder request) {
        //TODO Change the method of retrieving WorkOrderType
        //TODO Change constant names
        //TODO Add loggers at each step
        log.info("VoipWorkOrderServiceImpl :: processRequest : STARTS");
        String workOrderType = getWorkOrderTypeFromRequest(request);
        log.info("VoipWorkOrderServiceImpl :: processRequest : WorkOrderType = " + workOrderType);

        if (workOrderType.equals(VoipWorkOrderConstants.ADD_VOIP_CONSTANT)) {
            log.info("VoipWorkOrderServiceImpl :: processRequest : calling createVoipWorkOrder()");
//            Optional<String> result = createVoipWorkOrder(request);
//            log.info("VoipWorkOrderServiceImpl :: processRequest : called createVoipWorkOrder() result = " + result);
        } else if (workOrderType.equals(VoipWorkOrderConstants.CANCEL_VOIP_CONSTANT)) {
            log.info("VoipWorkOrderServiceImpl :: processRequest : calling cancelVoipWorkOrder()");
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

        voipWorkOrderMsgReq.setWorkOrderType(getWorkOrderTypeFromRequest(request));

        voipWorkOrderMsgReq.setRemarks("");

        voipWorkOrderMsgReq.setConsumedPayload(request.toString());

        voipWorkOrderMsgReqRepo.save(voipWorkOrderMsgReq);
        voipWorkOrderMsgReqRepo.flush();

        log.info("VoipWorkOrderServiceImpl:: dumpRequest : ENDS");
    }

    private String getWorkOrderTypeFromRequest(VoIPWorkOrder request) {
        log.info("VoipWorkOrderServiceImpl:: getWorkOrderTypeFromRequest : STARTS");
        String workOrderType = request.getMessageData().getMessageParameters()
                .stream().filter(parameter -> parameter.getName().equals("WorkOrderType"))
                .findFirst().orElseThrow(() ->
                        new MissingParameterException("MessageData->MessageParameters->name(WorkOrderType)"))
                .getValue().toString();
        log.info("VoipWorkOrderServiceImpl:: getWorkOrderTypeFromRequest : ENDS -> workOrderType = " + workOrderType);
        return workOrderType;
    }

    private String getBillingDealFromRequest(VoIPWorkOrder request) {
        log.info("VoipWorkOrderServiceImpl:: getBillingDealFromRequest : STARTS");
        String voipDealName = request.getMessageData().getOrders().get(0)
                .getOrderAttributes()
                .stream().filter(orderAttribute -> orderAttribute.getName().equals("VoipBillingDeal"))
                .findFirst().orElseThrow(() ->
                        new MissingParameterException("MessageData->MessageParameters->name(WorkOrderType)"))
                .getValue().toString();
        log.info("VoipWorkOrderServiceImpl:: getBillingDealFromRequest : ENDS -> voipDealName = " + voipDealName);
        return voipDealName;
    }

    private String getGlSegmentFromRequest(VoIPWorkOrder request) {
        log.info("VoipWorkOrderServiceImpl:: getWorkOrderTypeFromRequest : STARTS");
        String voipDealName = request.getMessageData().getOrders().get(0)
                .getOrderAttributes()
                .stream().filter(orderAttribute -> orderAttribute.getName().equals("VoipBillingDeal"))
                .findFirst().orElseThrow(() ->
                        new MissingParameterException("MessageData->MessageParameters->name(WorkOrderType)"))
                .getValue().toString();
        log.info("VoipWorkOrderServiceImpl:: getWorkOrderTypeFromRequest : ENDS -> voipDealName = " + voipDealName);
        return voipDealName;
    }

    public Optional<String> createVoipWorkOrder(VoIPWorkOrder request) {
        log.info("createVoipWorkOrder : STARTS");
        String wo_type = getWorkOrderTypeFromRequest(request);
        String fname = request.getMessageData().getOrders().get(0).getInstallName().getFirstName().toString();
        String lanme = request.getMessageData().getOrders().get(0).getInstallName().getLastName().toString();
        String addr1 = request.getMessageData().getOrders().get(0).getInstallAddress().getAddress1().toString();
        String city = request.getMessageData().getOrders().get(0).getInstallAddress().getCity().toString();
        String state = request.getMessageData().getOrders().get(0).getInstallAddress().getState().toString();
        String zip = request.getMessageData().getOrders().get(0).getInstallAddress().getZip().toString();
        String phone = request.getMessageData().getOrders().get(0).getInstallPhone().get(0).getNumber().toString();
        String billing_deal = getBillingDealFromRequest(request);
        String gl_seg = request.getMessageData().getOrders().get(0).getInstallAddress().getAddress1().toString();
        SqlParameterSource in = new MapSqlParameterSource()
                .addValue("WO_TYPE", wo_type);

        Optional result = Optional.empty();

        try {

            Map out = createBRTWOCall.execute(in);

            if (out != null) {
                String retVal = (String) out.get("RETVAL");
                result = Optional.of(retVal);
            }

        } catch (Exception e) {
            // ORA-01403: no data found, or any java.sql.SQLException
            System.err.println(e.getMessage());
        }
        log.info("createVoipWorkOrder : ENDS");
        return result;
    }


    public void cancelVoipWorkOrder(VoIPWorkOrder request) {
        log.info("cancelVoipWorkOrder : STARTS");
        log.info("cancelVoipWorkOrder : ENDS");
    }
}
