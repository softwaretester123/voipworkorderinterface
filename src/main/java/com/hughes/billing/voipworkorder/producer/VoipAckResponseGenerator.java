package com.hughes.billing.voipworkorder.producer;

import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import com.hughes.billing.voipworkorder.exception.BillingUserException;
import com.hughes.billing.voipworkorder.utils.VoipWorkOrderConstants;
import com.hughes.sdg.avro.*;
import com.hughes.sdg.avro.types.NameValueParameter;
import lombok.extern.slf4j.Slf4j;

import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
public class VoipAckResponseGenerator {
    private VoipAckResponseGenerator() {
        throw new IllegalStateException("Utility class");
    }

    /**
     * Retrieves a generic response for the given VoipWorkOrderMsgDTO.
     *
     * @param  voipWorkOrderMsgDTO   the VoipWorkOrderMsgDTO object containing the necessary data
     * @return                       the VoIPWorkOrderAckMsg object representing the generic response
     */
    private static CommonMessage getGenericResponse(VoipWorkOrderMsgDTO voipWorkOrderMsgDTO) {
        log.info("getGenericResponse : STARTS");

        SimpleDateFormat sdf = new SimpleDateFormat(VoipWorkOrderConstants.TRANSACTION_DATE_TIME_FORMAT);
        String transactionDateTime = sdf.format(new Date());

        MessageHeader ackMessageHeader = new MessageHeader();
        ackMessageHeader.setTransactionSequenceId("BILL" + transactionDateTime);
        ackMessageHeader.setTransactionDateTime(transactionDateTime);
        ackMessageHeader.setMessageName(VoipWorkOrderConstants.VOIPWORKORDERACKMSG_MSG_NAME);
        ackMessageHeader.setTransactionSequenceId(voipWorkOrderMsgDTO.getTransactionSequenceId());
        ackMessageHeader.setOrigin(VoipWorkOrderConstants.BILLING);

        List<NameValueParameter> ackMessageParameters = new ArrayList<>();
        ackMessageParameters.add(new NameValueParameter("WorkOrderType", voipWorkOrderMsgDTO.getWorkOrderType()));
        ackMessageParameters.add(new NameValueParameter("Destination", VoipWorkOrderConstants.DSS));

        OrderInformation ackOrderInformation = new OrderInformation();
        ackOrderInformation.setSAN(voipWorkOrderMsgDTO.getSan());
        Order ackOrder = new Order();
        ackOrder.setOrderInformation(ackOrderInformation);

        List<Order> orders = Collections.singletonList(ackOrder);

        MessageData ackMessageData = new MessageData();
        ackMessageData.setMessageParameters(ackMessageParameters);
        ackMessageData.setOrders(orders);

        Map<CharSequence, CharSequence> header = new HashMap<>();
        header.put("KEY", voipWorkOrderMsgDTO.getSan());

        log.info("getGenericResponse : ENDS");
        return new CommonMessage(ackMessageHeader, ackMessageData, header);
    }

    /**
     * Prepares the response for the VoIP work order.
     *
     * @param  voipWorkOrderMsgDTO  the VoIP work order message DTO
     * @param  status               the status of the response
     * @param  message              the message of the response
     * @return                      the VoIP work order acknowledgement message
     */
    public static CommonMessage prepareResponse(VoipWorkOrderMsgDTO voipWorkOrderMsgDTO, String status, String message) {
        log.info("prepareResponse : STARTS : voipWorkOrderMsgDTO = " + voipWorkOrderMsgDTO + ", status = " + status + ", message = " + message);
        CommonMessage genericResponse = null;
        try {
            if (voipWorkOrderMsgDTO == null) {
                voipWorkOrderMsgDTO = new VoipWorkOrderMsgDTO();
            }
            genericResponse = getGenericResponse(voipWorkOrderMsgDTO);
            genericResponse.getMessageData().getMessageParameters().add(new NameValueParameter("Status", status));
            genericResponse.getMessageData().getMessageParameters().add(new NameValueParameter("Message", message));
        } catch (Exception e) {
            log.info("prepareResponse : Exception Occurred : " + e.getMessage());
            throw new BillingUserException(e.getMessage(), voipWorkOrderMsgDTO, genericResponse);
        }
        log.info("prepareResponse : ENDS : response = " + genericResponse);
        return genericResponse;
    }
}
