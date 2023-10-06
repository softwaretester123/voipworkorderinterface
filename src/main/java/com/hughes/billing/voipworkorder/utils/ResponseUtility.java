package com.hughes.billing.voipworkorder.utils;

import com.hughes.sdg.avro.CommonMessage;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class ResponseUtility {
    public static CommonMessage setStatusAndMessage(CommonMessage voipWorkOrderAckMsg, String status, String message) {
        log.info("setStatusAndMessage: STARTS");
        voipWorkOrderAckMsg
                .getMessageData()
                .getMessageParameters().forEach(p -> {
                    if (p.getName().equals("Status"))
                        p.setValue(status);
                    if (p.getName().equals("Message"))
                        p.setValue(message);
                });
        log.info("setStatusAndMessage: ENDS");
        return voipWorkOrderAckMsg;
    }
}
