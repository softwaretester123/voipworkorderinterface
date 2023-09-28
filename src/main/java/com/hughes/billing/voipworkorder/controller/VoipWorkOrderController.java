package com.hughes.billing.voipworkorder.controller;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import com.hughes.billing.voipworkorder.exception.BillingUserException;
import com.hughes.billing.voipworkorder.exception.RequiredParameterMissingException;
import com.hughes.billing.voipworkorder.repositroy.VoipWorkOrderMsgRepo;
import com.hughes.billing.voipworkorder.service.VoipWorkOrderService;
import com.hughes.billing.voipworkorder.utils.RequestValidator;
import com.hughes.billing.voipworkorder.utils.Utility;
import com.hughes.billing.voipworkorder.utils.VoipWorkOrderConstants;
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

@RestController
@Slf4j
public class VoipWorkOrderController {
    private final VoipWorkOrderService voipWorkOrderService;
    private final VoipWorkOrderMsgRepo voipWorkOrderMsgRepo;
    private final RequestValidator requestValidator;

    @Autowired
    public VoipWorkOrderController(VoipWorkOrderService voipWorkOrderService, VoipWorkOrderMsgRepo voipWorkOrderMsgRepo, RequestValidator requestValidator) {
        this.voipWorkOrderService = voipWorkOrderService;
        this.voipWorkOrderMsgRepo = voipWorkOrderMsgRepo;
        this.requestValidator = requestValidator;
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

        ResponseEntity<VoIPWorkOrderAckMsg> result = null;
        VoipWorkOrderMsgDTO voipWorkOrderMsgDTO = null;
        try {
            voipWorkOrderMsgDTO = voipWorkOrderService.saveRequest(request);

            requestValidator.validate(request, bindingResult);

            if (bindingResult.hasErrors()) {
                // Handle validation errors here
                log.error("voipWorkOrder : Request Validation Failed : Throwing MissingParameterException");
                voipWorkOrderMsgDTO.setState(VoipWorkOrderConstants.VOIP_MSG_STATE_VALIDATION_FAIL);
                voipWorkOrderMsgDTO.setStatus(VoipWorkOrderConstants.VOIP_MSG_STATUS_FAILURE);
                voipWorkOrderMsgDTO.setModifiedTimeStamp(Utility.getTimeStamp());
                voipWorkOrderService.saveData(voipWorkOrderMsgDTO);
                throw new RequiredParameterMissingException(bindingResult.getAllErrors().get(0).getCode(), bindingResult);
            }

            voipWorkOrderMsgDTO.setState(VoipWorkOrderConstants.VOIP_MSG_STATE_VALIDATION_OK);
            voipWorkOrderMsgDTO.setModifiedTimeStamp(Utility.getTimeStamp());

            result = voipWorkOrderService.processRequest(request, voipWorkOrderMsgDTO);

            log.info("voipWorkOrder : Response Received : " + result.getBody());

            if (result.getBody() != null) {
                voipWorkOrderMsgDTO.setPublishedPayload(result.getBody().toString());
            }
            voipWorkOrderMsgDTO.setModifiedTimeStamp(Utility.getTimeStamp());
            voipWorkOrderService.saveData(voipWorkOrderMsgDTO);

//            voipWorkOrderService.publishMessage(result.getBody(), "A");
        } catch (Exception e) {
            log.error("voipWorkOrder : Exception Occurred" + e.getMessage());
            throw new BillingUserException(e.getMessage(), request);
        }

        log.info("voipWorkOrder : ENDS");
        return new ResponseEntity<>("Response Created", result.getStatusCode());
    }

    @GetMapping(value = "/test")
    public ResponseEntity<Long> test() {
        Long result = voipWorkOrderMsgRepo.getServerTime();
        log.info(String.valueOf(result));
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
