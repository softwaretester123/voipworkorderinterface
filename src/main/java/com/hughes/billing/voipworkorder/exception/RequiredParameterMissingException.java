package com.hughes.billing.voipworkorder.exception;

import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import lombok.Getter;
import org.springframework.validation.BindingResult;

@Getter
public class RequiredParameterMissingException extends RuntimeException {
    // transient keyword prevents serialization of the variable
    // done to avoid sonar violation
    private final VoIPWorkOrder request;

    private final transient VoipWorkOrderMsgDTO voipWorkOrderMsgDTO;

    public RequiredParameterMissingException(String message, VoIPWorkOrder request, VoipWorkOrderMsgDTO voipWorkOrderMsgDTO) {
        super(message);
        this.request = request;
        this.voipWorkOrderMsgDTO = voipWorkOrderMsgDTO;
    }
}
