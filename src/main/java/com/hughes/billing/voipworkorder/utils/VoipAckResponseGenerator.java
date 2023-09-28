package com.hughes.billing.voipworkorder.utils;

import com.hughes.billing.voipworkorder.dto.avro.ack.*;
import com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.exception.BillingUserException;
import com.hughes.billing.voipworkorder.exception.RequiredParameterMissingException;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Slf4j
public class VoipAckResponseGenerator {

    private static VoIPWorkOrderAckMsg getGenericResponse(VoIPWorkOrder request) {
        log.info("getGenericResponse : STARTS");
        MessageHeader ackMessageHeader;
        MessageData ackMessageData;
        try {
            String transactionSequenceId = RequestUtility.getTransactionSequenceId(request);
            String transactionDateTime = RequestUtility.getTransactionDateTimeAsString(request);
            String correlationId = RequestUtility.getTransactionSequenceId(request);

            ackMessageHeader = new MessageHeader(transactionSequenceId,
                    transactionDateTime,
                    VoipWorkOrderConstants.VOIPWORKORDERACKMSG_MSG_NAME,
                    VoipWorkOrderConstants.BILLING,
                    correlationId);

            List<MessageParameter> ackMessageParameters = new ArrayList<>();
            ackMessageParameters.add(new MessageParameter("WorkOrderType", RequestUtility.getWorkOrderType(request)));
            ackMessageParameters.add(new MessageParameter("Destination", VoipWorkOrderConstants.DSS));

            OrderInformation ackOrderInformation = new OrderInformation();
            ackOrderInformation.setSAN(RequestUtility.getSan(request));
            Order ackOrder = new Order(ackOrderInformation);

            List<Order> orders = Collections.singletonList(ackOrder);

            ackMessageData = new MessageData(ackMessageParameters, orders);
        } catch (Exception e) {
            log.info("getGenericResponse : Exception Occurred : " + e.getMessage());
            throw new BillingUserException(e.getMessage(), request, null);
        }
        log.info("getGenericResponse : ENDS");
        return new VoIPWorkOrderAckMsg(ackMessageHeader, ackMessageData);
    }

    public static VoIPWorkOrderAckMsg prepareResponse(VoIPWorkOrder request, String status, String message) {
        log.info("prepareResponse : STARTS");
        VoIPWorkOrderAckMsg genericResponse = getGenericResponse(request);
        genericResponse.getMessageData().getMessageParameters().add(new MessageParameter("Status", status));
        genericResponse.getMessageData().getMessageParameters().add(new MessageParameter("Message", message));
        log.info("prepareResponse : ENDS : response = " + genericResponse);
        return genericResponse;
    }
}
