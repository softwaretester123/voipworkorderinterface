package com.hughes.billing.voipworkorder.service.impl;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.service.PublisherService;
import com.hughes.billing.voipworkorder.utils.PublisherUtils;
import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;
import com.hughes.bits.framework.pubsub.message.Message;
import com.hughes.bits.framework.pubsub.publisher.PublisherFactory;
import lombok.Value;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class PublisherServiceImpl implements PublisherService {


    @Override
    public boolean publish(VoIPWorkOrderAckMsg response, String orderingKey, String topic) throws PubSubFrwkException {
        log.info("publish() : STARTS : response = " + response + ", orderingKey = " + orderingKey + ", topic = " + topic);

        boolean status;

        byte[] serializedResponse = PublisherUtils.serializeResponse(response);

        String msgId = PublisherFactory.INSTANCE.publishMessage(new Message(new String(serializedResponse), orderingKey), topic);
        log.info("publish() : msgId : " + msgId);

        status = msgId != null && !("").equals(msgId);

        log.info("publish : ENDS");
        return status;
    }
}
