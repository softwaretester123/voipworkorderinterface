package com.hughes.billing.voipworkorder.consumer;

import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = PubSubConsumer.class)
@Slf4j
public class PubSubConsumerTest {

    @Autowired
    PubSubConsumer subscriber;
    @Test
    public void messageNull() {
        try {
            subscriber.processMessage(null, "123");
        } catch (Exception e) {
            log.error("Error : " +  e.getMessage());
        }
    }
}
