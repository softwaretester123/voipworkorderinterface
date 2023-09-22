package com.hughes.billing.voipworkorder.exception;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.utils.VoipAckResponseGenerator;
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
    public ResponseEntity<VoIPWorkOrderAckMsg> handleMandatoryParameterMissing(MissingParameterException e, VoIPWorkOrder request) {
        log.info("handleMandatoryParameterMissing : STARTS");
        VoIPWorkOrderAckMsg errorResponse = VoipAckResponseGenerator.prepareErrorResponse(request, e.getMessage());
        log.info("handleMandatoryParameterMissing : ENDS");
        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(ParseException.class)
    public ResponseEntity<VoIPWorkOrderAckMsg> handleParseException(ParseException e, VoIPWorkOrder request) {
        log.info("handleParseException : STARTS");
        VoIPWorkOrderAckMsg errorResponse = VoipAckResponseGenerator.prepareErrorResponse(request, e.getMessage());
        log.info("handleParseException : ENDS");
        return new ResponseEntity<>(errorResponse, HttpStatus.BAD_REQUEST);
    }

}
