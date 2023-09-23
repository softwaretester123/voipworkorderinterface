package com.hughes.billing.voipworkorder.controller;

import com.google.gson.Gson;
import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.exception.BillingUserException;
import com.hughes.billing.voipworkorder.exception.MissingParameterException;
import com.hughes.billing.voipworkorder.service.VoipWorkOrderService;
import com.hughes.billing.voipworkorder.utils.RequestValidator;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;


@RestController
@Slf4j
public class VoipWorkOrderController {

    @Autowired
    VoipWorkOrderService voipWorkOrderService;

    @Autowired
    private RequestValidator requestValidator;

    /**
     * This function handles the POST request for the "/voipworkorder" endpoint.
     *
     * @param  request        The VoIPWorkOrder object containing the request body.
     * @param  bindingResult  The BindingResult object for the request validation.
     * @return                The ResponseEntity object with the response body and status code.
     * @throws BillingUserException  If there is an exception related to the billing user.
     */
    @PostMapping(value = "/voipworkorder")
    public ResponseEntity<String> voipWorkOrder(@RequestBody @Validated VoIPWorkOrder request, BindingResult bindingResult) throws BillingUserException {
        log.info("voipWorkOrder : Request Received : " + request);

        Gson g = new Gson();
        String jsonString = g.toJson(request);

        log.info("voipWorkOrder : Request Json : " + jsonString);

        ResponseEntity<VoIPWorkOrderAckMsg> result = null;

        try {
            Long id = voipWorkOrderService.dumpRequest(request);

            requestValidator.validate(request, bindingResult);

            if (bindingResult.hasErrors()) {
                // Handle validation errors here
                log.error("voipWorkOrder : Request Validation Failed : Throwing MissingParameterException");
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
