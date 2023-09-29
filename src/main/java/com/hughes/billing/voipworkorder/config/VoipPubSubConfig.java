package com.hughes.billing.voipworkorder.config;

import com.hughes.billing.voipworkorder.consumer.PubSubMessageSubscriber;
import com.hughes.billing.voipworkorder.utils.VoipWorkOrderConstants;
import com.hughes.bits.framework.pubsub.config.PubSubConfig;
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
public class VoipPubSubConfig {

    @Value("${spring.cloud.gcp.pubsub.project.id}")
    private String projectId;

    @Value("${spring.cloud.gcp.pubsub.topic.id}")
    private String topicId;

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
    public VoipPubSubConfig(PubSubMessageSubscriber handler) {
        this.handler = handler;
    }

    @PostConstruct
    private void init() {
        initializePublisher();
        initializeSubscriber();
    }

    /**
     * Initializes the subscriber and sets up the necessary configuration.
     */
    private void initializeSubscriber() {
        log.info("initializeSubscriber() : STARTS");
        List<SubscriberConfig> subscriberConfigList;
        log.info("initializeSubscriber() :projectId : " + projectId + " : subscriptionIds : " + subscriptionIds + " : filePath : " + filePath);
        try {
            if (subscriptionIds != null) {
                subscriberConfigList = new ArrayList<>();
                String[] subscriptionIdList = subscriptionIds.split(",");
                for (String subscriptionId : subscriptionIdList) {
                    SubscriberConfig config = (SubscriberConfig) initializeHelper(VoipWorkOrderConstants.SUBSCRIBER, subscriptionId);
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

        PublisherConfig config;
        try {
            log.info("initializePublisher() :projectId : " + projectId + " : topicId : " + topicId + " : filePath : " + filePath);
            config = (PublisherConfig) initializeHelper(VoipWorkOrderConstants.PUBLISHER, topicId);
            PublisherFactory.INSTANCE.initializePublishers(Collections.singletonList(config));
        } catch (PubSubFrwkException e) {
            log.error("initializePublisher() : Exception occurred while initializing the publisher: " + e.getMessage());
        }

        log.info("initializePublisher() : ENDS");
    }

    private PubSubConfig initializeHelper(String type, String id) {
        SubscriberConfig subscriberConfig = null;
        PublisherConfig publisherConfig = null;
        if (type.equals(VoipWorkOrderConstants.SUBSCRIBER)) {
            subscriberConfig = new SubscriberConfig();
            subscriberConfig.setProjectId(projectId);
            subscriberConfig.setSubscriptionId(id);
            subscriberConfig.setResponseAdapter(handler);
            subscriberConfig.setEnableFlowControl(enableFlowControl);
            subscriberConfig.setAuthenticationRequired(true);
            subscriberConfig.setCredentialFilePath(filePath);
            subscriberConfig.setMaxAckExtensionPeriod(Duration.ofSeconds(ackDeadline));
            return subscriberConfig;
        } else {
            publisherConfig = new PublisherConfig();
            publisherConfig.setProjectId(projectId);
            publisherConfig.setTopicId(id);
            publisherConfig.setAuthenticationRequired(true);
            publisherConfig.setCredentialFilePath(filePath);
            return publisherConfig;
        }
    }
}
