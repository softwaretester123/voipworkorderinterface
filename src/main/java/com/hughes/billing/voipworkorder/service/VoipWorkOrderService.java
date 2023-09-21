package com.hughes.billing.voipworkorder.service;

import com.hughes.billing.voipworkorder.dto.avro.VoIPWorkOrder;

import java.text.ParseException;

public interface VoipWorkOrderService {
    public void processRequest(VoIPWorkOrder request);
    public void dumpRequest(VoIPWorkOrder request) throws ParseException;
}
