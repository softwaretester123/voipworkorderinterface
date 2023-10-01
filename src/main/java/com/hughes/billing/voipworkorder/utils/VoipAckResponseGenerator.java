package com.hughes.billing.voipworkorder.utils;

import com.hughes.billing.voipworkorder.dto.avro.ack.*;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.exception.BillingUserException;
import lombok.extern.slf4j.Slf4j;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Slf4j
public class VoipAckResponseGenerator {

    private static VoIPWorkOrderAckMsg getGenericResponse(VoIPWorkOrder request) {
        log.info("getGenericResponse : STARTS");

        String transactionSequenceId = RequestUtility.getTransactionSequenceId(request);
        String transactionDateTime = RequestUtility.getTransactionDateTimeAsString(request);
        String correlationId = RequestUtility.getTransactionSequenceId(request);

        MessageHeader ackMessageHeader = new MessageHeader(transactionSequenceId,
                transactionDateTime,
                VoipWorkOrderConstants.VOIPWORKORDERACKMSG_MSG_NAME,
                VoipWorkOrderConstants.BILLING,
                correlationId);

        List<MessageParameters> ackMessageParameters = new ArrayList<>();
        ackMessageParameters.add(new MessageParameters("WorkOrderType", RequestUtility.getWorkOrderType(request)));
        ackMessageParameters.add(new MessageParameters("Destination", VoipWorkOrderConstants.DSS));

        OrderInformation ackOrderInformation = new OrderInformation();
        ackOrderInformation.setSAN(RequestUtility.getSan(request));
        Orders ackOrder = new Orders(ackOrderInformation);

        List<Orders> orders = Collections.singletonList(ackOrder);

        MessageData ackMessageData = new MessageData(ackMessageParameters, orders);

        log.info("getGenericResponse : ENDS");
        return new VoIPWorkOrderAckMsg(ackMessageHeader, ackMessageData);
    }

    /**
     * Generates a VoIPWorkOrderAckMsg response for a given VoIPWorkOrder request, status, and message.
     *
     * @param  request   the VoIPWorkOrder request
     * @param  status    the status of the response
     * @param  message   the message of the response
     * @return           the generated VoIPWorkOrderAckMsg response
     */
    public static VoIPWorkOrderAckMsg prepareResponse(VoIPWorkOrder request, String status, String message) {
        log.info("prepareResponse : STARTS");
        VoIPWorkOrderAckMsg genericResponse = null;
        try {
            genericResponse = getGenericResponse(request);
            genericResponse.getMessageData().getMessageParameters().add(new MessageParameters("Status", status));
            genericResponse.getMessageData().getMessageParameters().add(new MessageParameters("Message", message));
        } catch (Exception e) {
            log.info("prepareResponse : Exception Occurred : " + e.getMessage());
            throw new BillingUserException(e.getMessage(), request, null);
        }
        log.info("prepareResponse : ENDS : response = " + genericResponse);
        return genericResponse;
    }
}
