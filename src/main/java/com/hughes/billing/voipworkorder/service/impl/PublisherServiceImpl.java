package com.hughes.billing.voipworkorder.service.impl;

import com.hughes.billing.voipworkorder.service.PublisherService;
import com.hughes.billing.voipworkorder.utils.PublisherUtils;
import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;
import com.hughes.bits.framework.pubsub.message.Message;
import com.hughes.bits.framework.pubsub.publisher.PublisherFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class PublisherServiceImpl implements PublisherService {
    @Override
    public boolean sendMessageToPubSub(String jsonMessage, String orderingKey, String topic) throws PubSubFrwkException {
        log.info("PublisherServiceImpl :: sendMessageToPubSub : STARTS");
        boolean status;

        byte[] serializedResponse = PublisherUtils.serializeResponse(jsonMessage);

        String msgId = PublisherFactory.INSTANCE.publishMessage(new Message(new String(serializedResponse), orderingKey), topic);

        log.info("PublisherServiceImpl :: sendMessageToPubSub : msgId : " + msgId);

        status = msgId != null && !("").equals(msgId);

        log.info("PublisherServiceImpl :: sendMessageToPubSub : ENDS");
        return status;
    }
}
