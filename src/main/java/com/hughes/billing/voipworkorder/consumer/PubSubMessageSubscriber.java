package com.hughes.billing.voipworkorder.consumer;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import com.hughes.billing.voipworkorder.exception.BillingUserException;
import com.hughes.billing.voipworkorder.exception.RequiredParameterMissingException;
import com.hughes.billing.voipworkorder.repositroy.VoipWorkOrderMsgRepo;
import com.hughes.billing.voipworkorder.service.VoipWorkOrderService;
import com.hughes.billing.voipworkorder.utils.RequestValidator;
import com.hughes.billing.voipworkorder.utils.SubscriberUtils;
import com.hughes.billing.voipworkorder.utils.Utility;
import com.hughes.billing.voipworkorder.utils.VoipWorkOrderConstants;
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
    private final RequestValidator requestValidator;

    @Autowired
    public PubSubMessageSubscriber(VoipWorkOrderService voipWorkOrderService, VoipWorkOrderMsgRepo voipWorkOrderMsgRepo, RequestValidator requestValidator) {
        this.voipWorkOrderService = voipWorkOrderService;
        this.voipWorkOrderMsgRepo = voipWorkOrderMsgRepo;
        this.requestValidator = requestValidator;
    }

    @Override
    public boolean processMessage(Message message, String s) {
        log.info("processMessage : STARTS");
        log.info("processMessage : processMessage : Message Id : " + message.getMessageId() + ", Message Data : " + message.getData());

        ResponseEntity<VoIPWorkOrderAckMsg> result = null;
        VoipWorkOrderMsgDTO voipWorkOrderMsgDTO = null;
        VoIPWorkOrder request = null;
        try {
            request = SubscriberUtils.deserializeRequest(message.getData());
            voipWorkOrderMsgDTO = voipWorkOrderService.saveRequest(request);

            voipWorkOrderMsgDTO.setState(VoipWorkOrderConstants.VOIP_REQ_STATE_VALIDATION_OK);
            voipWorkOrderMsgDTO.setModifiedTimeStamp(voipWorkOrderMsgRepo.getServerTime());

            result = voipWorkOrderService.processRequest(request, voipWorkOrderMsgDTO);

            log.info("processMessage : Response Received : " + result.getBody());

            if (result.getBody() != null) {
                voipWorkOrderMsgDTO.setPublishedPayload(result.getBody().toString());
            }
            voipWorkOrderMsgDTO.setModifiedTimeStamp(Utility.getTimeStamp());
            voipWorkOrderService.saveData(voipWorkOrderMsgDTO);

        } catch (RequiredParameterMissingException requiredParameterMissingException) {
            log.error("voipWorkOrder : RequiredParameterMissingException Occurred" + requiredParameterMissingException.getMessage());
            throw requiredParameterMissingException;
        } catch (Exception e) {
            log.error("voipWorkOrder : Exception Occurred" + e.getMessage());
            throw new BillingUserException(e.getMessage(), request, voipWorkOrderMsgDTO);
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
