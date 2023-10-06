package com.hughes.billing.voipworkorder.service;

import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;
import com.hughes.sdg.avro.CommonMessage;

public interface PublisherService {
    boolean publish(CommonMessage jsonMessage, String orderingKey, String topic) throws PubSubFrwkException;
}
