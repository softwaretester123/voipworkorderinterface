package com.hughes.billing.voipworkorder.service.impl;

import com.hughes.billing.voipworkorder.service.PublisherService;
import com.hughes.billing.voipworkorder.utils.PubSubUtils;
import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;
import com.hughes.bits.framework.pubsub.message.Message;
import com.hughes.bits.framework.pubsub.publisher.PublisherFactory;
import com.hughes.sdg.avro.CommonMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class PublisherServiceImpl implements PublisherService {

    @Override
    public boolean publish(CommonMessage response, String orderingKey, String topic) throws PubSubFrwkException {
        log.info("publish() : STARTS : response = " + response + ", orderingKey = " + orderingKey + ", topic = " + topic);

        boolean status = Boolean.FALSE;
        String msgId = null;
        try {
            byte[] serializedResponse = PubSubUtils.serialize(response);

            msgId = PublisherFactory.INSTANCE.publishMessage(new Message(new String(serializedResponse), orderingKey), topic);
            log.info("publish() : msgId : " + msgId);
        } catch (Exception e) {
            log.error("publish : Exception occurred while publishing the message: " + e.getMessage());
        }

        status = msgId != null && !msgId.isEmpty();

        log.info("publish : ENDS");
        return status;
    }
}
