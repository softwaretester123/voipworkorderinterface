package com.hughes.billing.voipworkorder.service;

import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;
import com.hughes.sdg.avro.CommonMessage;

import java.text.ParseException;

public interface VoipWorkOrderService {

    CommonMessage processRequest(CommonMessage request, VoipWorkOrderMsgDTO dumpedRequest);

    VoipWorkOrderMsgDTO saveRequest(CommonMessage request) throws ParseException;

    void saveData(VoipWorkOrderMsgDTO dumpedRequest);

    boolean publishMessage(CommonMessage response, String orderingKey) throws PubSubFrwkException;
}
