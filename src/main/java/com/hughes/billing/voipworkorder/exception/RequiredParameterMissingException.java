package com.hughes.billing.voipworkorder.exception;

import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import lombok.Getter;

@Getter
public class RequiredParameterMissingException extends RuntimeException {
    // transient keyword prevents serialization of the variable
    // done to avoid sonar violation

    private final VoipWorkOrderMsgDTO voipWorkOrderMsgDTO;

    public RequiredParameterMissingException(String message, VoipWorkOrderMsgDTO voipWorkOrderMsgDTO) {
        super(message);
        this.voipWorkOrderMsgDTO = voipWorkOrderMsgDTO;
    }
}
