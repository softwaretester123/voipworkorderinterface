package com.hughes.billing.voipworkorder.utils;

import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.exception.MissingParameterException;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Utility {
    /**
     * Retrieves the work order type from the given VoIPWorkOrder request.
     *
     * @param request the VoIPWorkOrder request object
     * @return the work order type extracted from the request
     */
    public static String getWorkOrderTypeFromRequest(VoIPWorkOrder request) {
        log.info("VoipWorkOrderServiceImpl:: getWorkOrderTypeFromRequest : STARTS");
        String workOrderType = request.getMessageData().getMessageParameters()
                .stream().filter(parameter -> parameter.getName().equals("WorkOrderType"))
                .findFirst().orElseThrow(() ->
                        new MissingParameterException("MessageData->MessageParameters->name(WorkOrderType)"))
                .getValue().toString();
        log.info("VoipWorkOrderServiceImpl:: getWorkOrderTypeFromRequest : ENDS -> workOrderType = " + workOrderType);
        return workOrderType;
    }

    /**
     * Retrieves the billing deal from the given VoIP work order request.
     *
     * @param request the VoIP work order request
     * @return the billing deal name
     */
    public static String getBillingDealFromRequest(VoIPWorkOrder request) {
        log.info("VoipWorkOrderServiceImpl:: getBillingDealFromRequest : STARTS");
        String voipDealName = request.getMessageData().getOrders().get(0)
                .getOrderAttributes()
                .stream().filter(orderAttribute -> orderAttribute.getName().equals("VoipBillingDeal"))
                .findFirst().orElseThrow(() ->
                        new MissingParameterException("MessageData->Orders->OrderAttributes->name(VoipBillingDeal)"))
                .getValue().toString();
        log.info("VoipWorkOrderServiceImpl:: getBillingDealFromRequest : ENDS -> voipDealName = " + voipDealName);
        return voipDealName;
    }

    /**
     * Retrieves the GL Segment from a VoIP work order request.
     *
     * @param request the VoIP work order request
     * @return the GL Segment as a string
     */
    public static String getGlSegmentFromRequest(VoIPWorkOrder request) {
        log.info("VoipWorkOrderServiceImpl:: getWorkOrderTypeFromRequest : STARTS");
        String voipDealName = request.getMessageData().getOrders().get(0)
                .getOrderAttributes()
                .stream().filter(orderAttribute -> orderAttribute.getName().equals("VoipBillingDeal"))
                .findFirst().orElseThrow(() ->
                        new MissingParameterException("MessageData->Orders->OrderAttributes->name(GlSegmentId)"))
                .getValue().toString();
        log.info("VoipWorkOrderServiceImpl:: getWorkOrderTypeFromRequest : ENDS -> voipDealName = " + voipDealName);
        return voipDealName;
    }
}
