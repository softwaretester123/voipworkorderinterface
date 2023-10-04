package com.hughes.billing.voipworkorder.service;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;
import org.springframework.http.ResponseEntity;

;
import java.text.ParseException;

public interface VoipWorkOrderService {

    VoIPWorkOrderAckMsg processRequest(VoIPWorkOrder request, VoipWorkOrderMsgDTO dumpedRequest);

    VoipWorkOrderMsgDTO saveRequest(VoIPWorkOrder request) throws ParseException;

    void saveData(VoipWorkOrderMsgDTO dumpedRequest);

    boolean publishMessage(VoIPWorkOrderAckMsg response, String orderingKey) throws PubSubFrwkException;
}
