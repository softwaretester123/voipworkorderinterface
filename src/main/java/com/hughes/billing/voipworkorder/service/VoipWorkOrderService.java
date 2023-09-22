package com.hughes.billing.voipworkorder.service;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import org.springframework.http.ResponseEntity;

import java.text.ParseException;

public interface VoipWorkOrderService {
    public ResponseEntity<VoIPWorkOrderAckMsg> processRequest(VoIPWorkOrder request);
    public Long dumpRequest(VoIPWorkOrder request) throws ParseException;

    public void dumpResponse(VoIPWorkOrderAckMsg response, Long req_id) throws ParseException;
}
