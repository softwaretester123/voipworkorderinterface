package com.hughes.billing.voipworkorder.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

public class PubSubConfig {
    private static final Logger LOG = LoggerFactory.getLogger(PubSubConfig.class);

    @Value("${pubsub.project.id}")
    String projectId;

    @Value("${pubsub.topic.id}")
    String topicIds;

    @Value("${pubsub.subscription.id}")
    String subscriptionIds;


}
