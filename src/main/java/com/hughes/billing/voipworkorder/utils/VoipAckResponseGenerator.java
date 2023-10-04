package com.hughes.billing.voipworkorder.utils;

import com.hughes.billing.voipworkorder.dto.avro.ack.*;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import com.hughes.billing.voipworkorder.exception.BillingUserException;
import lombok.extern.slf4j.Slf4j;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Slf4j
public class VoipAckResponseGenerator {

    private static VoIPWorkOrderAckMsg getGenericResponse(VoipWorkOrderMsgDTO voipWorkOrderMsgDTO) {
        log.info("getGenericResponse : STARTS");

        SimpleDateFormat sdf = new SimpleDateFormat(VoipWorkOrderConstants.TRANSACTION_DATE_TIME_FORMAT);
        String transactionDateTime = sdf.format(new Date());

        MessageHeader ackMessageHeader = new MessageHeader(voipWorkOrderMsgDTO.getTransactionSequenceId(),
                transactionDateTime,
                VoipWorkOrderConstants.VOIPWORKORDERACKMSG_MSG_NAME,
                VoipWorkOrderConstants.BILLING,
                voipWorkOrderMsgDTO.getTransactionSequenceId());

        List<MessageParameters> ackMessageParameters = new ArrayList<>();
        ackMessageParameters.add(new MessageParameters("WorkOrderType", voipWorkOrderMsgDTO.getWorkOrderType()));
        ackMessageParameters.add(new MessageParameters("Destination", VoipWorkOrderConstants.DSS));

        OrderInformation ackOrderInformation = new OrderInformation();
        ackOrderInformation.setSAN(voipWorkOrderMsgDTO.getSan());
        Orders ackOrder = new Orders(ackOrderInformation);

        List<Orders> orders = Collections.singletonList(ackOrder);

        MessageData ackMessageData = new MessageData(ackMessageParameters, orders);

        headers header = new headers();
        header.setKEY(voipWorkOrderMsgDTO.getSan());

        log.info("getGenericResponse : ENDS");
        return new VoIPWorkOrderAckMsg(ackMessageHeader, ackMessageData, header);
    }

    public static VoIPWorkOrderAckMsg prepareResponse(VoipWorkOrderMsgDTO voipWorkOrderMsgDTO, String status, String message) {
        log.info("prepareResponse : STARTS : voipWorkOrderMsgDTO = " + voipWorkOrderMsgDTO + ", status = " + status + ", message = " + message);
        VoIPWorkOrderAckMsg genericResponse = null;
        try {
            if (voipWorkOrderMsgDTO == null) {
                voipWorkOrderMsgDTO = new VoipWorkOrderMsgDTO();
            }
            genericResponse = getGenericResponse(voipWorkOrderMsgDTO);
            genericResponse.getMessageData().getMessageParameters().add(new MessageParameters("Status", status));
            genericResponse.getMessageData().getMessageParameters().add(new MessageParameters("Message", message));
        } catch (Exception e) {
            log.info("prepareResponse : Exception Occurred : " + e.getMessage());
            throw new BillingUserException(e.getMessage(), null);
        }
        log.info("prepareResponse : ENDS : response = " + genericResponse);
        return genericResponse;
    }
}
