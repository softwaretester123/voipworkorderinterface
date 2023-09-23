package com.hughes.billing.voipworkorder.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.text.ParseException;

@ControllerAdvice
@Slf4j
public class CustomExceptionHandler {

    @ExceptionHandler(MissingParameterException.class)
    public ResponseEntity<Object> handleMandatoryParameterMissing(MissingParameterException e) {
        log.info("handleMandatoryParameterMissing : STARTS");
        // VoIPWorkOrderAckMsg errorResponse = VoipAckResponseGenerator.prepareErrorResponse(request, e.getMessage());
        String errorResponse = e.getMessage();
        log.info("handleMandatoryParameterMissing : ENDS");
        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(ParseException.class)
    public ResponseEntity<Object> handleParseException(ParseException e) {
        log.info("handleParseException : STARTS");
        // VoIPWorkOrderAckMsg errorResponse = VoipAckResponseGenerator.prepareErrorResponse(request, e.getMessage());
        log.info("handleParseException : ENDS");
        String errorResponse = e.getMessage();
        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(BillingUserException.class)
    public ResponseEntity<Object> handleParseException(BillingUserException e) {
        log.info("handleParseException : STARTS");
        // VoIPWorkOrderAckMsg errorResponse = VoipAckResponseGenerator.prepareErrorResponse(request, e.getMessage());
        log.info("handleParseException : ENDS");
        String errorResponse = e.getMessage();
        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }

}
