package com.hughes.billing.voipworkorder.exception;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import lombok.Data;
import lombok.EqualsAndHashCode;


@Data
@EqualsAndHashCode(callSuper = true)
public class BillingUserException extends RuntimeException {
    private String message;
    private String code;
    private VoipWorkOrderMsgDTO voipWorkOrderMsgDTO;
    private VoIPWorkOrderAckMsg voipWorkOrderAckMsg;

    public BillingUserException(String message,
                                VoipWorkOrderMsgDTO voipWorkOrderMsgDTO,
                                VoIPWorkOrderAckMsg voipWorkOrderAckMsg) {
        super(message);
        this.message = message;
        this.code = null;
        this.voipWorkOrderMsgDTO = voipWorkOrderMsgDTO;
        this.voipWorkOrderAckMsg = voipWorkOrderAckMsg;
    }

    @Override
    public synchronized Throwable fillInStackTrace() {
        return this;
    }

}
