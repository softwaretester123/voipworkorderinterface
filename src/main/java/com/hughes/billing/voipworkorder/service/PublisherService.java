package com.hughes.billing.voipworkorder.service;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;

public interface PublisherService {
    boolean publish(VoIPWorkOrderAckMsg jsonMessage, String orderingKey, String topic) throws PubSubFrwkException;
}
