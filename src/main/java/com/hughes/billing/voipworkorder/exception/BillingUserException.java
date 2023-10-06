package com.hughes.billing.voipworkorder.exception;

import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import com.hughes.sdg.avro.CommonMessage;
import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper = true)
public class BillingUserException extends RuntimeException {
    private String message;
    private String code;
    private VoipWorkOrderMsgDTO voipWorkOrderMsgDTO;
    private CommonMessage commonMessage;

    public BillingUserException(String message,
                                VoipWorkOrderMsgDTO voipWorkOrderMsgDTO,
                                CommonMessage commonMessage) {
        super(message);
        this.message = message;
        this.code = null;
        this.voipWorkOrderMsgDTO = voipWorkOrderMsgDTO;
        this.commonMessage = commonMessage;
    }

    @Override
    public synchronized Throwable fillInStackTrace() {
        return this;
    }

}
