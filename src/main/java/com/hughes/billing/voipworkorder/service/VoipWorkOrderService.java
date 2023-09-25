package com.hughes.billing.voipworkorder.service;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import org.springframework.http.ResponseEntity;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;;
import java.text.ParseException;

public interface VoipWorkOrderService {

    ResponseEntity<VoIPWorkOrderAckMsg> processRequest(VoIPWorkOrder request);

    Long dumpRequest(VoIPWorkOrder request) throws ParseException;

    void dumpResponse(VoIPWorkOrderAckMsg response, Long req_id) throws ParseException;
}
