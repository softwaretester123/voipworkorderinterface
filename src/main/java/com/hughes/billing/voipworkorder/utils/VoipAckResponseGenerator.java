package com.hughes.billing.voipworkorder.utils;

import com.hughes.billing.voipworkorder.dto.avro.ack.*;
import com.hughes.billing.voipworkorder.dto.avro.ack.MessageParameter;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Slf4j
public class VoipAckResponseGenerator {
    private static VoIPWorkOrderAckMsg getGenericResponse(VoIPWorkOrder request) {
        log.info("VoipAckResponseGenerator:: getGenericResponse : STARTS");
        String transactionSequenceId = request.getMessageHeader().getTransactionSequenceId().toString();
        String transactionDateTime = request.getMessageHeader().getTransactionDateTime().toString();
        String messageName = VoipWorkOrderConstants.ACK_MESSAGE_NAME;
        String origin = VoipWorkOrderConstants.BILLING;
        String correlationId = request.getMessageHeader().getTransactionSequenceId().toString();
        MessageHeader ackMessageHeader = new MessageHeader(transactionSequenceId, transactionDateTime, messageName, origin, correlationId);

        List<MessageParameter> ackMessageParameters = new ArrayList<>();
        ackMessageParameters.add(new MessageParameter("WorkOrderType", Utility.getWorkOrderTypeFromRequest(request)));
        ackMessageParameters.add(new MessageParameter("Destination", VoipWorkOrderConstants.DSS));

        OrderInformation ackOrderInformation = new OrderInformation();
        ackOrderInformation.setSAN(request.getMessageData().getOrders().get(0).getOrderInformation().getSAN());
        Order ackOrder = new Order(ackOrderInformation);

        List<Order> orders = Collections.singletonList(ackOrder);

        MessageData ackMessageData = new MessageData(ackMessageParameters, orders);

        log.info("VoipAckResponseGenerator:: getGenericResponse : ENDS");
        return new VoIPWorkOrderAckMsg(ackMessageHeader, ackMessageData);
    }

    public static VoIPWorkOrderAckMsg prepareResponse(VoIPWorkOrder request, String status, String message) {

        VoIPWorkOrderAckMsg genericResponse = getGenericResponse(request);
        genericResponse.getMessageData().getMessageParameters().add(new MessageParameter("Status", status));
        genericResponse.getMessageData().getMessageParameters().add(new MessageParameter("Message", message));

        return genericResponse;
    }

    public static VoIPWorkOrderAckMsg prepareErrorResponse(VoIPWorkOrder request, String errorMessage) {

        VoIPWorkOrderAckMsg genericResponse = getGenericResponse(request);
        genericResponse.getMessageData().getMessageParameters()
                .add(new MessageParameter("Status", Boolean.FALSE.toString()));
        genericResponse.getMessageData().getMessageParameters()
                .add(new MessageParameter("errorCode", errorMessage));
        genericResponse.getMessageData().getMessageParameters()
                .add(new MessageParameter("Message", errorMessage));

        return genericResponse;
    }
}
