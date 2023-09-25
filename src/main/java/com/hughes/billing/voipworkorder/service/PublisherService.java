package com.hughes.billing.voipworkorder.service;

import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;

public interface PublisherService {
    boolean sendMessageToPubSub(String jsonMessage, String orderingKey, String topic) throws PubSubFrwkException;
}
