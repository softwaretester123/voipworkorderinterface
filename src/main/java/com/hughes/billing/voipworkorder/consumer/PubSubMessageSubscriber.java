package com.hughes.billing.voipworkorder.consumer;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import com.hughes.billing.voipworkorder.exception.BillingUserException;
import com.hughes.billing.voipworkorder.exception.RequiredParameterMissingException;
import com.hughes.billing.voipworkorder.repositroy.VoipWorkOrderMsgRepo;
import com.hughes.billing.voipworkorder.service.VoipWorkOrderService;
import com.hughes.billing.voipworkorder.utils.*;
import com.hughes.bits.framework.pubsub.exceptions.PubSubFrwkException;
import com.hughes.bits.framework.pubsub.message.Message;
import com.hughes.bits.framework.pubsub.message.SubscriberResponseAdapter;

import java.util.Collections;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.MapBindingResult;

import java.util.List;
import java.util.Map;

@Component
@Slf4j
public class PubSubMessageSubscriber implements SubscriberResponseAdapter {

    private final VoipWorkOrderService voipWorkOrderService;
    private final VoipWorkOrderMsgRepo voipWorkOrderMsgRepo;
    private final PubSubMessageValidator pubSubMessageValidator;

    @Autowired
    public PubSubMessageSubscriber(VoipWorkOrderService voipWorkOrderService,
                                   VoipWorkOrderMsgRepo voipWorkOrderMsgRepo,
                                   PubSubMessageValidator pubSubMessageValidator) {
        this.voipWorkOrderService = voipWorkOrderService;
        this.voipWorkOrderMsgRepo = voipWorkOrderMsgRepo;
        this.pubSubMessageValidator = pubSubMessageValidator;
    }

    @Override
    public boolean processMessage(Message message, String subscriptionId) {
        log.info("processMessage : STARTS : Message Id : " + message.getMessageId() + ", Message Data : " + message.getData());

        VoIPWorkOrderAckMsg response = null;
        VoipWorkOrderMsgDTO voipWorkOrderMsgDTO = null;
        VoIPWorkOrder request = null;
        try {
            request = SubscriberUtils.deserializeRequest(message.getData());

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

                response = voipWorkOrderService.processRequest(request, voipWorkOrderMsgDTO);

                log.info("processMessage : Response Received : " + response);

                if (response != null) {
                    voipWorkOrderMsgDTO.setPublishedPayload(response.toString());
                }
                voipWorkOrderService.saveData(voipWorkOrderMsgDTO);
            }

        } catch (RequiredParameterMissingException requiredParameterMissingException) {
            log.error("processMessage : Required Parameter Missing : " + requiredParameterMissingException.getMessage());
            throw requiredParameterMissingException;
        } catch (Exception e) {
            log.error("voipWorkOrder : Exception Occurred" + e.getMessage());
            throw new BillingUserException(e.getMessage(), voipWorkOrderMsgDTO);
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
