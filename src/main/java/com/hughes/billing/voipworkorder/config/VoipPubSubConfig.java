package com.hughes.billing.voipworkorder.config;

import com.hughes.billing.voipworkorder.consumer.PubSubConsumer;
import com.hughes.billing.voipworkorder.utils.VoipWorkOrderConstants;
import com.hughes.bits.framework.pubsub.config.PubSubConfig;
import com.hughes.bits.framework.pubsub.config.PublisherConfig;
import com.hughes.bits.framework.pubsub.config.SubscriberConfig;
import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;
import com.hughes.bits.framework.pubsub.publisher.PublisherFactory;
import com.hughes.bits.framework.pubsub.subscriber.SubscriberFactory;
import lombok.Getter;
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

    @Getter
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

    PubSubConsumer handler;

    @Autowired
    public VoipPubSubConfig(PubSubConsumer handler) {
        this.handler = handler;
    }

    /**
     * Initializes the subscriber.
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
                    SubscriberConfig config = (SubscriberConfig) initializeConfig(VoipWorkOrderConstants.SUBSCRIBER, subscriptionId);
                    subscriberConfigList.add(config);
                }

                if (!subscriberConfigList.isEmpty()) {
                    SubscriberFactory.INSTANCE.initializeSubscribers(subscriberConfigList);
                }

                for (String subscriptionId : subscriptionIdList) {
                    SubscriberFactory.INSTANCE.pullAsyncMessages(subscriptionId);
                    log.info("initializeSubscriber() : Initialized subscriber successfully for subscriptionId: " + subscriptionId);
                }
            }
        } catch (PubSubFrwkException e) {
            log.error("initializeSubscriber() : Exception occurred while initializing the subscriber: " + e.getMessage());
        }
        log.info("initializeSubscriber() : ENDS");
    }

    /**
     * Initializes the publisher.
     */
    private void initializePublisher() {
        log.info("initializePublisher() : STARTS");

        PublisherConfig config = null;
        try {
            log.info("initializePublisher() :projectId : " + projectId + " : topicId : " + topicId + " : filePath : " + filePath);
            config = (PublisherConfig) initializeConfig(VoipWorkOrderConstants.PUBLISHER, topicId);
            PublisherFactory.INSTANCE.initializePublishers(Collections.singletonList(config));
            log.info("initializePublisher() : Initialized publisher successfully for topicId: " + topicId);
        } catch (PubSubFrwkException e) {
            log.error("initializePublisher() : Exception occurred while initializing the publisher: " + e.getMessage());
        }

        log.info("initializePublisher() : ENDS");
    }

    /**
     * Initializes the configuration for the given type and ID.
     *
     * @param  type  the type of configuration (subscriber or publisher)
     * @param  id    the ID of the configuration (subscription ID or topic ID)
     * @return       the initialized configuration object
     */
    private PubSubConfig initializeConfig(String type, String id) {
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

    /**
     * Initializes the publisher and subscriber for the Java function.
     */
    @PostConstruct
    private void init() {
        initializePublisher();
        initializeSubscriber();
    }
}
