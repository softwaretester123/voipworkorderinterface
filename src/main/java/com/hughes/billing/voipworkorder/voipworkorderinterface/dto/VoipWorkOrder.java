package com.hughes.billing.voipworkorder.voipworkorderinterface.dto;


import com.fasterxml.jackson.annotation.JsonProperty;

public class VoipWorkOrder {
    private final MessageHeader messageHeader;
    private final MessageData messageData;

    public VoipWorkOrder() {
        this.messageHeader = null;
        this.messageData = null;
    }

    public VoipWorkOrder(MessageHeader messageHeader, MessageData messageData) {
        this.messageHeader = messageHeader;
        this.messageData = messageData;
    }

    @JsonProperty("MessageHeader")
    public MessageHeader getMessageHeader() {
        return messageHeader;
    }

    @JsonProperty("MessageData")
    public MessageData getMessageData() {
        return messageData;
    }

    @Override
    public String toString() {
        return "VoipWorkOrder {" +
                "\n messageHeader = " + messageHeader +
                "\n , messageData = " + messageData +
                "\n}";
    }
}
