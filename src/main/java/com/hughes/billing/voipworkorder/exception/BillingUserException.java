package com.hughes.billing.voipworkorder.exception;

import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper = true)
public class BillingUserException extends RuntimeException {
    private String message;
    private String code;
    private VoIPWorkOrder requestObj;

    public BillingUserException(String message) {
        super(message);
        this.message = message;
        this.code = null;
    }

    public BillingUserException(String message, String code) {
        super(message);
        this.message = message;
        this.code = code;
    }

    public BillingUserException(String message, VoIPWorkOrder requestObj) {
        super(message);
        this.message = message;
        this.code = null;
        this.requestObj = requestObj;
    }

    @Override
    public synchronized Throwable fillInStackTrace() {
        return this;
    }

}
