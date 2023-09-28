package com.hughes.billing.voipworkorder.config;

import com.hughes.billing.voipworkorder.consumer.PubSubMessageSubscriber;
import com.hughes.bits.framework.pubsub.config.PublisherConfig;
import com.hughes.bits.framework.pubsub.config.SubscriberConfig;
import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;
import com.hughes.bits.framework.pubsub.publisher.PublisherFactory;
import com.hughes.bits.framework.pubsub.subscriber.SubscriberFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.Collections;

@Component
@Slf4j
public class PubSubConfig {

    @Value("${spring.cloud.gcp.pubsub.project.id}")
    private String projectId;

    @Value("${spring.cloud.gcp.pubsub.topic.id}")
    public String topicId;

    @Value("${spring.cloud.gcp.pubsub.subscription.id}")
    private String subscriptionId;

    @Value("${spring.cloud.gcp.pubsub.gcp.credentials.location}")
    private String filePath;

    @Autowired
    PubSubMessageSubscriber handler;

    /**
     * Initializes the subscriber for the given projectId, subscription, and file path.
     */
    @PostConstruct
    private void initializeSubscriber() {
        log.info("initializeSubscriber() : STARTS");

        SubscriberConfig config = new SubscriberConfig();

        try {
            log.info("initializeSubscriber() :projectId : " + projectId);
            log.info("initializeSubscriber() :subscriptionId : " + subscriptionId);
            log.info("initializeSubscriber() :filePath : " + filePath);
            config.setProjectId(projectId);
            config.setSubscriptionId(subscriptionId);
            config.setResponseAdapter(handler);
            config.setAuthenticationRequired(true);
            config.setCredentialFilePath(filePath);
            log.info("initializeSubscriber() : calling validateSubscriberConfig()");
            SubscriberFactory.INSTANCE.initializeSubscribers(Collections.singletonList(config));
            SubscriberFactory.INSTANCE.pullAsyncMessages(subscriptionId);
        } catch (PubSubFrwkException e) {
            log.error("initializeSubscriber() : Exception occurred while initializing the subscriber: " + e.getMessage());
        }

        log.info("initializeSubscriber() : ENDS");
    }

    @PostConstruct
    private void initializePublisher() {
        log.info("initializePublisher() : STARTS");

        PublisherConfig config = new PublisherConfig();

        try {
            log.info("initializePublisher() :projectId : " + projectId);
            log.info("initializePublisher() :topicId : " + topicId);
            log.info("initializePublisher() :filePath : " + filePath);
            config.setProjectId(projectId);
            config.setTopicId(topicId);
            config.setAuthenticationRequired(true);
            config.setCredentialFilePath(filePath);
            PublisherFactory.INSTANCE.initializePublishers(Collections.singletonList(config));
        } catch (PubSubFrwkException e) {
            log.error("initializePublisher() : Exception occurred while initializing the publisher: " + e.getMessage());
        }

        log.info("initializePublisher() : ENDS");
    }
}
