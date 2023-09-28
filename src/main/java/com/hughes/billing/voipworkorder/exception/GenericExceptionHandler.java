package com.hughes.billing.voipworkorder.exception;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.repositroy.VoipWorkOrderMsgRepo;
import com.hughes.billing.voipworkorder.service.PublisherService;
import com.hughes.billing.voipworkorder.utils.VoipAckResponseGenerator;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.text.ParseException;

@ControllerAdvice
@Slf4j
public class GenericExceptionHandler {

    @Autowired
    PublisherService publisherService;

    /**
     * Handles the RequiredParameterMissingException and returns a ResponseEntity object.
     *
     * @param  e  the RequiredParameterMissingException to be handled
     * @return    the ResponseEntity object
     */
    @ExceptionHandler(RequiredParameterMissingException.class)
    public ResponseEntity<Object> handleMandatoryParameterMissing(RequiredParameterMissingException e) {
        log.info("handleMandatoryParameterMissing : STARTS");
        BindingResult bindingResult = e.getBindingResult();
        VoIPWorkOrder request;
        String message = e.getMessage() + "is missing";
        if (bindingResult != null) {
            request = (VoIPWorkOrder) bindingResult.getTarget();
            log.info("handleMandatoryParameterMissing : message = " + message);
            VoIPWorkOrderAckMsg response = VoipAckResponseGenerator.prepareResponse(request, Boolean.FALSE.toString(), message);
            log.info("handleMandatoryParameterMissing : response = " + response);
        }

        log.info("handleMandatoryParameterMissing : ENDS");
        return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }

    /**
     * Handles the BillingUserException and returns a ResponseEntity object.
     *
     * @param  e  the BillingUserException to be handled
     * @return    a ResponseEntity object with the error message and HTTP status code
     */
    @ExceptionHandler(BillingUserException.class)
    public ResponseEntity<Object> handleBillingUserException(BillingUserException e) {
        log.info("handleBillingUserException : STARTS");
        VoIPWorkOrderAckMsg response = null;
        if (e.getRequestObj() != null) {
            response = VoipAckResponseGenerator.prepareResponse(e.getRequestObj(), Boolean.FALSE.toString(), e.getMessage());
        }
        log.info("handleBillingUserException : ENDS : response = " + response);
        return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
}
