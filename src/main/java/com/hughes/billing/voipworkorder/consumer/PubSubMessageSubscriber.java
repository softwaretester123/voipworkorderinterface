package com.hughes.billing.voipworkorder.consumer;

import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;
import com.hughes.bits.framework.pubsub.message.Message;
import com.hughes.bits.framework.pubsub.message.SubscriberResponseAdapter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
@Slf4j
public class PubSubMessageSubscriber implements SubscriberResponseAdapter {
    @Override
    public boolean processMessage(Message message, String s) {
        log.info("Message : " + message.getData());
        return true;
    }

    @Override
    public List<String> processMessages(List<Message> list, String s) {
        return null;
    }

    @Override
    public boolean sendFailedResponse(PubSubFrwkException e) {
        return false;
    }

    @Override
    public void sendShutDownFailureResponse(Map<String, Exception> map) {

    }
}
