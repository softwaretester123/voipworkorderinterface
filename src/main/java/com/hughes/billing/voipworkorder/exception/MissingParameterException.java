package com.hughes.billing.voipworkorder.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

public class MissingParameterException extends ResponseStatusException {
    public MissingParameterException(String parameterName) {
        super(HttpStatus.BAD_REQUEST, "Parameter '" + parameterName + "' is missing");
    }
}
