package com.hughes.billing.voipworkorder.consumer;

import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import com.hughes.billing.voipworkorder.exception.BillingUserException;
import com.hughes.billing.voipworkorder.exception.GenericExceptionHandler;
import com.hughes.billing.voipworkorder.exception.RequiredParameterMissingException;
import com.hughes.billing.voipworkorder.service.PublisherService;
import com.hughes.billing.voipworkorder.service.VoipWorkOrderService;
import com.hughes.billing.voipworkorder.utils.PubSubMessageValidator;
import com.hughes.billing.voipworkorder.utils.PubSubUtils;
import com.hughes.billing.voipworkorder.utils.VoipWorkOrderConstants;
import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;
import com.hughes.bits.framework.pubsub.message.Message;
import com.hughes.bits.framework.pubsub.message.SubscriberResponseAdapter;
import com.hughes.sdg.avro.CommonMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.List;
import java.util.Map;

@Component
@Slf4j
public class PubSubConsumer implements SubscriberResponseAdapter {

    private final VoipWorkOrderService voipWorkOrderService;
    private final GenericExceptionHandler genericExceptionHandler;
    private final PubSubMessageValidator pubSubMessageValidator;
    private final PublisherService publisherService;

    @Value("${spring.cloud.gcp.pubsub.topic.id}")
    private String topicId;

    @Autowired
    public PubSubConsumer(VoipWorkOrderService voipWorkOrderService,
                          GenericExceptionHandler genericExceptionHandler,
                          PubSubMessageValidator pubSubMessageValidator,
                          PublisherService publisherService) {
        this.voipWorkOrderService = voipWorkOrderService;
        this.genericExceptionHandler = genericExceptionHandler;
        this.pubSubMessageValidator = pubSubMessageValidator;
        this.publisherService = publisherService;
    }

    @Override
    public boolean processMessage(Message message, String subscriptionId) {
        log.info("processMessage : STARTS : Message Id : " + message.getMessageId() + ", Request : " + message.getData());
        VoipWorkOrderMsgDTO voipWorkOrderMsgDTO = null;
        CommonMessage request = null;
        CommonMessage response = null;
        try {
            request = PubSubUtils.deSerialize(message.getData().getBytes());
            log.info("processMessage : deSerialized request : " + request);

            if (request != null) {
                voipWorkOrderMsgDTO = voipWorkOrderService.saveRequest(request);

                pubSubMessageValidator.validate(request);

                if (!pubSubMessageValidator.getErrorMap().isEmpty()) {
                    throw new RequiredParameterMissingException(pubSubMessageValidator.
                            getErrorMap().
                            get(VoipWorkOrderConstants.ERROR_MESSAGE),
                            voipWorkOrderMsgDTO);
                }

                voipWorkOrderMsgDTO.setState(VoipWorkOrderConstants.VOIP_REQ_STATE_VALIDATION_OK);
                voipWorkOrderMsgDTO.setStatus(VoipWorkOrderConstants.VOIP_MSG_STATUS_PENDING);
                voipWorkOrderMsgDTO.setRemarks(VoipWorkOrderConstants.VOIP_REQ_STATE_VALIDATION_OK_MSG);

                response = voipWorkOrderService.processRequest(request, voipWorkOrderMsgDTO);

                log.info("processMessage : Response Received : " + response);

                boolean publishStatus = publisherService.publish(response,
                        voipWorkOrderMsgDTO.getSan(),
                        "topicId");

                if (response != null) {
                    voipWorkOrderMsgDTO.setPublishedPayload(response.toString());
                }
                voipWorkOrderService.saveData(voipWorkOrderMsgDTO);
            }

        } catch (RequiredParameterMissingException requiredParameterMissingException) {
            log.error("processMessage : Required Parameter Missing : " + requiredParameterMissingException.getMessage());
            genericExceptionHandler.handleRequiredParameterMissing(requiredParameterMissingException);
        } catch (PubSubFrwkException pubSubFrwkException) {
            log.error("processMessage : PubSubFrwkException Occurred : " + pubSubFrwkException.getMessage());
            genericExceptionHandler.handleBillingUserException(
                    new BillingUserException(pubSubFrwkException.getMessage(),
                            voipWorkOrderMsgDTO,
                            response));
        } catch (Exception e) {
            log.error("processMessage : Exception Occurred : " + e.getMessage());
            genericExceptionHandler.handleBillingUserException(
                    new BillingUserException(e.getMessage(),
                            voipWorkOrderMsgDTO,
                            response));
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
