package com.hughes.billing.voipworkorder.exception;

public class BillingUserException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    private String message;
    private String code;

    public BillingUserException(String message) {
        super(message);
        this.message = message;
    }

    public BillingUserException(String message, String code) {
        super(message);
        this.message = message;
        this.code = code;
    }

    public BillingUserException() {

    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Override
    public synchronized Throwable fillInStackTrace() {
        return this;
    }

}
