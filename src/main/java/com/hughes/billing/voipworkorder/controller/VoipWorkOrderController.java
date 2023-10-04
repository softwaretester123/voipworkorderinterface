package com.hughes.billing.voipworkorder.controller;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import com.hughes.billing.voipworkorder.exception.BillingUserException;
import com.hughes.billing.voipworkorder.exception.RequiredParameterMissingException;
import com.hughes.billing.voipworkorder.repositroy.VoipWorkOrderMsgRepo;
import com.hughes.billing.voipworkorder.service.VoipWorkOrderService;
import com.hughes.billing.voipworkorder.utils.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@RestController
@Slf4j
public class VoipWorkOrderController {
    private final VoipWorkOrderService voipWorkOrderService;
    private final VoipWorkOrderMsgRepo voipWorkOrderMsgRepo;
    private final RequestValidator requestValidator;
    private final PubSubMessageValidator pubSubMessageValidator;

    @Autowired
    public VoipWorkOrderController(VoipWorkOrderService voipWorkOrderService,
                                   VoipWorkOrderMsgRepo voipWorkOrderMsgRepo,
                                   RequestValidator requestValidator,
                                   PubSubMessageValidator pubSubMessageValidator) {
        this.voipWorkOrderService = voipWorkOrderService;
        this.voipWorkOrderMsgRepo = voipWorkOrderMsgRepo;
        this.requestValidator = requestValidator;
        this.pubSubMessageValidator = pubSubMessageValidator;
    }

    /**
     * This function handles the POST request for the "/voipworkorder" endpoint.
     *
     * @param request       The VoIPWorkOrder object containing the request body.
     * @param bindingResult The BindingResult object for the request validation.
     * @return The ResponseEntity object with the response body and status code.
     * @throws BillingUserException If there is an exception related to the billing user.
     */
    @PostMapping(value = "/voipworkorder")
    public ResponseEntity<String> voipWorkOrder(@RequestBody @Validated VoIPWorkOrder request, BindingResult bindingResult) {
        log.info("voipWorkOrder : Request Received : " + request);

        VoIPWorkOrderAckMsg result = null;
        VoipWorkOrderMsgDTO voipWorkOrderMsgDTO = null;
        try {
            voipWorkOrderMsgDTO = voipWorkOrderService.saveRequest(request);

//            requestValidator.validate(request, bindingResult);

            if (bindingResult.hasErrors()) {
                // Handle validation errors here
                log.error("voipWorkOrder : Request Validation Failed : Throwing MissingParameterException");
                throw new RequiredParameterMissingException(bindingResult.getAllErrors().get(0).getCode(), voipWorkOrderMsgDTO);
            }

            voipWorkOrderMsgDTO.setState(VoipWorkOrderConstants.VOIP_REQ_STATE_VALIDATION_OK);

            result = voipWorkOrderService.processRequest(request, voipWorkOrderMsgDTO);

            log.info("voipWorkOrder : Response Received : " + result);

            if (result != null) {
                voipWorkOrderMsgDTO.setPublishedPayload(result.toString());
            }
            voipWorkOrderService.saveData(voipWorkOrderMsgDTO);

//            voipWorkOrderService.publishMessage(result.getBody(), "A");
        } catch (RequiredParameterMissingException requiredParameterMissingException) {
            log.error("voipWorkOrder : RequiredParameterMissingException Occurred" + requiredParameterMissingException.getMessage());
            throw requiredParameterMissingException;
        } catch (Exception e) {
            log.error("voipWorkOrder : Exception Occurred" + e.getMessage());
            throw new BillingUserException(e.getMessage(), voipWorkOrderMsgDTO);
        }

        log.info("voipWorkOrder : ENDS");
        return new ResponseEntity<>(result != null ? result.toString() : "Failure", HttpStatus.OK);
    }

    @PostMapping(value = "/testValidation")
    public ResponseEntity<String> testValidation(@RequestBody VoIPWorkOrder request) {
        pubSubMessageValidator.validate(request);
        for (Map.Entry<String, String> entry : pubSubMessageValidator.getErrorMap().entrySet()) {
            log.info("Key : " + entry.getKey() + " Value : " + entry.getValue());
        }
        return new ResponseEntity<>(pubSubMessageValidator.getErrorMap().get(VoipWorkOrderConstants.ERROR_MESSAGE), HttpStatus.OK);
    }

    @PostMapping(value = "/deserialize")
    public ResponseEntity<String> deserialize(@RequestBody String request) {
        SubscriberUtils.deserializeRequest(request);
        return new ResponseEntity<>("Ok", HttpStatus.OK);
    }
}
