package com.hughes.billing.voipworkorder.controller;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.exception.BillingUserException;
import com.hughes.billing.voipworkorder.exception.MissingParameterException;
import com.hughes.billing.voipworkorder.service.VoipWorkOrderService;
import com.hughes.billing.voipworkorder.utils.RequestValidator;
import lombok.extern.slf4j.Slf4j;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;


@RestController
@Slf4j
public class VoipWorkOrderController {

    @Autowired
    VoipWorkOrderService voipWorkOrderService;
    @Autowired
    private RequestValidator requestValidator;

    @PostMapping(value = "/voipworkorder")
    public ResponseEntity<String> voipWorkOrder(@RequestBody @Validated VoIPWorkOrder request, BindingResult bindingResult) throws BillingUserException, IOException {
        log.info("voipWorkOrder : Request Received : " + request);

        ResponseEntity<VoIPWorkOrderAckMsg> result = null;

        try {
            Long id = voipWorkOrderService.dumpRequest(request);

            requestValidator.validate(request, bindingResult);

            if (bindingResult.hasErrors()) {
                // Handle validation errors here
                throw new MissingParameterException(bindingResult.getAllErrors().get(0).getCode());
            }

            result = voipWorkOrderService.processRequest(request);

            log.info("voipWorkOrder : Response Received : " + result.getBody());

            voipWorkOrderService.dumpResponse(result.getBody(), id);
        }  catch (Exception e) {
            log.error("voipWorkOrder : Request Received : Exception Occurred: " + e.getMessage());
            throw new BillingUserException(e.getMessage());
        }

        log.info("voipWorkOrder : ENDS");
        return new ResponseEntity<>("Response Created", result.getStatusCode());
    }
}
