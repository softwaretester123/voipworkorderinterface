package com.hughes.billing.voipworkorder.utils;

import com.hughes.billing.voipworkorder.dto.avro.req.*;
import com.hughes.billing.voipworkorder.exception.BillingUserException;
import lombok.extern.slf4j.Slf4j;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Slf4j
public class RequestUtility {

    /**
     * Retrieves the work order type from the given VoIPWorkOrder request.
     *
     * @param request the VoIPWorkOrder request object
     * @return the work order type extracted from the request
     */
    public static String getWorkOrderType(VoIPWorkOrder request) {
        log.info("getWorkOrderType : STARTS");
        CharSequence workOrderType = null;
        try {
            workOrderType = request.getMessageData().getMessageParameters()
                    .stream().filter(parameter -> parameter.getName().equals("WorkOrderType"))
                    .findFirst().orElse(new MessageParameter())
                    .getValue();
        } catch (NullPointerException e) {
            log.error("getWorkOrderType : Exception: " + e.getMessage());
        }
        log.info("getWorkOrderType : ENDS -> workOrderType = " + workOrderType);
        return workOrderType != null ? workOrderType.toString() : "";
    }

    /**
     * Retrieves the billing deal from the given VoIP work order request.
     *
     * @param request the VoIP work order request
     * @return the billing deal name
     */
    public static String getBillingDeal(VoIPWorkOrder request) {
        log.info("getBillingDeal : STARTS");
        CharSequence voipDealName = null;
        try {
            voipDealName = request.getMessageData().getOrders().get(0)
                    .getOrderAttributes()
                    .stream().filter(orderAttribute -> orderAttribute.getName().equals("VoipBillingDeal"))
                    .findFirst().orElse(new OrderAttribute())
                    .getValue();
        } catch (NullPointerException e) {
            log.error("getBillingDeal : Exception: " + e.getMessage());
        }
        log.info("getBillingDeal : ENDS -> voipDealName = " + voipDealName);
        return voipDealName != null ? voipDealName.toString() : "";
    }

    /**
     * Retrieves the GL Segment from a VoIP work order request.
     *
     * @param request the VoIP work order request
     * @return the GL Segment as a string
     */
    public static String getGlSegment(VoIPWorkOrder request) {
        log.info("getGlSegment : STARTS");
        CharSequence glSegmentId = null;
        try {
            glSegmentId = request.getMessageData().getOrders().get(0)
                    .getOrderAttributes()
                    .stream().filter(orderAttribute -> orderAttribute.getName().equals("GlSegmentId"))
                    .findFirst().orElse(new OrderAttribute())
                    .getValue();
        } catch (NullPointerException e) {
            log.error("getGlSegment : Exception: " + e.getMessage());
        }
        log.info("getWorkOrderTypeFromRequest : ENDS -> voipDealName = " + glSegmentId);
        return glSegmentId != null ? glSegmentId.toString() : "";
    }

    /**
     * Retrieves the SAN (Subscriber Access Number) from a VoIPWorkOrder request.
     *
     * @param request the VoIPWorkOrder request
     * @return the SAN as a String, or an empty string if it is not found
     */
    public static String getSan(VoIPWorkOrder request) {
        log.info("getSan : STARTS");
        CharSequence san = null;
        try {
            san = request.getMessageData().getOrders().get(0)
                    .getOrderInformation().getSAN();
        } catch (NullPointerException e) {
            log.error("getSan : Exception: " + e.getMessage());
        }
        log.info("getSan : ENDS -> san = " + san);
        return san != null ? san.toString() : "";
    }

    /**
     * Retrieves the transaction sequence ID from a VoIP work order request.
     *
     * @param request the VoIP work order request
     * @return the transaction sequence ID as a string, or an empty string if the message header is null
     */
    public static String getTransactionSequenceId(VoIPWorkOrder request) {
        log.info("getTransactionSequenceId : STARTS");
        MessageHeader messageHeader = request.getMessageHeader();
        if (messageHeader == null) {
            return "";
        }
        CharSequence transactionSequenceId = messageHeader.getTransactionSequenceId();
        log.info("getTransactionSequenceId : ENDS -> transactionSequenceId = " + transactionSequenceId);
        return transactionSequenceId != null ? transactionSequenceId.toString() : "";
    }

    /**
     * Retrieves the transaction date and time from the given VoIPWorkOrder request.
     *
     * @param request the VoIPWorkOrder request object
     * @return the transaction date and time as a string, or an empty string if the message header is null
     */
    public static Date getTransactionDateTime(VoIPWorkOrder request) throws ParseException {
        log.info("getTransactionDateTime : STARTS");
        MessageHeader messageHeader = request.getMessageHeader();
        if (messageHeader == null) {
            return null;
        }
        SimpleDateFormat transactionDateTimeFormat = new SimpleDateFormat(VoipWorkOrderConstants.TRANSACTION_DATE_TIME_FORMAT);
        CharSequence transactionDateTime = messageHeader.getTransactionDateTime();
        log.info("getTransactionDateTime : ENDS -> transactionDateTime = " + transactionDateTime);
        return transactionDateTime != null ? transactionDateTimeFormat.parse(transactionDateTime.toString()) : null;
    }

    public static String getTransactionDateTimeAsString(VoIPWorkOrder request) {
        log.info("getTransactionDateTimeAsString : STARTS");
        MessageHeader messageHeader = request.getMessageHeader();
        if (messageHeader == null) {
            return null;
        }
        CharSequence transactionDateTime = messageHeader.getTransactionDateTime();
        log.info("getTransactionDateTimeAsString : ENDS -> transactionDateTime = " + transactionDateTime);
        return transactionDateTime != null ? transactionDateTime.toString() : null;
    }
}
