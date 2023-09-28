package com.hughes.billing.voipworkorder.exception;

import lombok.Getter;
import org.springframework.validation.BindingResult;

@Getter
public class RequiredParameterMissingException extends RuntimeException {
    // transient keyword prevents serialization of the variable
    // done to avoid sonar violation
    private final transient BindingResult bindingResult;

    public RequiredParameterMissingException(String message, BindingResult bindingResult) {
        super(message);
        this.bindingResult = bindingResult;
    }

    public RequiredParameterMissingException(String message) {
        super(message);
        this.bindingResult = null;
    }

}
