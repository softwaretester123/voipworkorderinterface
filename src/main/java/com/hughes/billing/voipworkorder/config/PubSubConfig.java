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
import org.threeten.bp.Duration;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Component
@Slf4j
public class PubSubConfig {

    @Value("${spring.cloud.gcp.pubsub.project.id}")
    private String projectId;

    @Value("${spring.cloud.gcp.pubsub.topic.id}")
    public String topicId;

    @Value("${spring.cloud.gcp.pubsub.subscription.id}")
    private String subscriptionIds;

    @Value("${spring.cloud.gcp.pubsub.gcp.credentials.location}")
    private String filePath;

    @Value("${spring.cloud.gcp.pubsub.enable.flowcontrol}")
    private boolean enableFlowControl;

    @Value("${spring.cloud.gcp.pubsub.ack.deadline}")
    private Long ackDeadline;

    PubSubMessageSubscriber handler;

    @Autowired
    public PubSubConfig(PubSubMessageSubscriber handler) {
        this.handler = handler;
    }

    /**
     * Initializes the subscriber and sets up the necessary configuration.
     */
    private void initializeSubscriber() {
        log.info("initializeSubscriber() : STARTS");
        List<SubscriberConfig> subscriberConfigList;
        log.info("initializeSubscriber() :projectId : " + projectId);
        log.info("initializeSubscriber() :subscriptionId : " + subscriptionIds);
        log.info("initializeSubscriber() :filePath : " + filePath);

        try {
            if (subscriptionIds != null) {
                subscriberConfigList = new ArrayList<>();
                String[] subscriptionIdList = subscriptionIds.split(",");
                for (String subscriptionId : subscriptionIdList) {
                    SubscriberConfig config = new SubscriberConfig();
                    config.setProjectId(projectId);
                    config.setSubscriptionId(subscriptionId);
                    config.setResponseAdapter(handler);
                    config.setEnableFlowControl(enableFlowControl);
                    config.setAuthenticationRequired(true);
                    config.setCredentialFilePath(filePath);
                    config.setMaxAckExtensionPeriod(Duration.ofSeconds(ackDeadline));
                    subscriberConfigList.add(config);
                }

                if (!subscriberConfigList.isEmpty()) {
                    SubscriberFactory.INSTANCE.initializeSubscribers(subscriberConfigList);
                }

                for (String subscriptionId : subscriptionIdList) {
                    SubscriberFactory.INSTANCE.pullAsyncMessages(subscriptionId);
                }
            }
        } catch (PubSubFrwkException e) {
            log.error("initializeSubscriber() : Exception occurred while initializing the subscriber: " + e.getMessage());
        }
        log.info("initializeSubscriber() : ENDS");
    }

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

    @PostConstruct
    private void init() {
        initializePublisher();
        initializeSubscriber();
    }
}
