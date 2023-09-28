package com.hughes.billing.voipworkorder.consumer;

import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;
import com.hughes.bits.framework.pubsub.message.Message;
import com.hughes.bits.framework.pubsub.message.SubscriberResponseAdapter;
import java.util.Collections;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
@Slf4j
public class PubSubMessageSubscriber implements SubscriberResponseAdapter {
    @Override
    public boolean processMessage(Message message, String s) {
        log.info("processMessage : STARTS");
        log.info("Message Id : " + message.getMessageId());
        log.info("Message : " + message.getData());
        if (message.getOrderingKey() != null) {
            log.info("Ordering Key : " + message.getOrderingKey());
        }
        log.info("processMessage : ENDS");
        return true;
    }

    @Override
    public List<String> processMessages(List<Message> list, String s) {
        return Collections.emptyList();
    }

    @Override
    public boolean sendFailedResponse(PubSubFrwkException e) {
        return false;
    }

    @Override
    public void sendShutDownFailureResponse(Map<String, Exception> map) {
        //TODO Implement Shut Down on Failure
    }
}
