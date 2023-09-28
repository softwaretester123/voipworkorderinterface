package com.hughes.billing.voipworkorder.exception;

import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper = true)
public class BillingUserException extends RuntimeException {
    private String message;
    private String code;
    private VoIPWorkOrder requestObj;
    private VoipWorkOrderMsgDTO voipWorkOrderMsgDTO;

    public BillingUserException(String message, VoIPWorkOrder requestObj, VoipWorkOrderMsgDTO voipWorkOrderMsgDTO) {
        super(message);
        this.message = message;
        this.code = null;
        this.requestObj = requestObj;
        this.voipWorkOrderMsgDTO = voipWorkOrderMsgDTO;
    }

    @Override
    public synchronized Throwable fillInStackTrace() {
        return this;
    }

}
