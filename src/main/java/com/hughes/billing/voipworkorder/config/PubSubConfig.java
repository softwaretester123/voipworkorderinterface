package com.hughes.billing.voipworkorder.config;

import com.hughes.billing.voipworkorder.consumer.PubSubMessageSubscriber;
import com.hughes.bits.framework.pubsub.config.SubscriberConfig;
import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;
import com.hughes.bits.framework.pubsub.subscriber.SubscriberFactory;
import com.hughes.bits.framework.pubsub.validators.ConfigValidator;
import com.hughes.bits.framework.pubsub.validators.SubscriberConfigValidator;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.File;
import java.util.Collections;

@Component
@Slf4j
public class PubSubConfig {

    @Value("${pubsub.project.id}")
    private String projectId;

    @Value("${pubsub.topic.id}")
    private String topicId;

    @Value("${pubsub.subscription.id}")
    private String subscriptionId;

    @Value("${pubsub.gcp.credentials.location}")
    private String filePath;

    @Autowired
    PubSubMessageSubscriber handler;

    /**
     * Initializes the subscriber for the given projectId, subscription, and file path.
     */
    @PostConstruct
    private void initializeSubscriber() {
        log.info("initializeSubscriber() : STARTS");
        try {
            SubscriberConfig config = new SubscriberConfig();
            log.info("initializeSubscriber() :projectId : "+projectId);
            log.info("initializeSubscriber() :subscriptionId : "+subscriptionId);
            log.info("initializeSubscriber() :filePath : "+filePath);
            config.setProjectId(projectId);
            config.setSubscriptionId(subscriptionId);
            config.setResponseAdapter(handler);
            config.setAuthenticationRequired(true);
            config.setCredentialFilePath(filePath);
            log.info("initializeSubscriber() : calling validateSubscriberConfig()");
            SubscriberFactory.INSTANCE.initializeSubscribers(Collections.singletonList(config));
            SubscriberFactory.INSTANCE.pullAsyncMessages(subscriptionId);
        } catch (PubSubFrwkException e) {
            log.error("initializeSubscriber() : Exception Occurred: " + e.getMessage());
        }
        log.info("initializeSubscriber() : ENDS");
    }

    @PostConstruct
    private void initializePublisher() {
        log.info("initializePublisher() : STARTS");
        log.info("initializePublisher() : ENDS");
    }
}
