package com.hughes.billing.voipworkorder.voipworkorderinterface.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;
import java.util.List;

public class MessageData {
    private final List<MessageParameters> messageParameters;
    private final List<Orders> orders;

    public MessageData() {
        this.messageParameters = new ArrayList<>();
        this.orders = null;
    }

    public MessageData(List<MessageParameters> messageParameters, List<Orders> orders) {
        this.messageParameters = messageParameters;
        this.orders = orders;
    }

    @JsonProperty("MessageParameters")
    public List<MessageParameters> getMessageParameters() {
        return messageParameters;
    }

    @JsonProperty("Orders")
    public List<Orders> getOrders() {
        return orders;
    }

    @Override
    public String toString() {
        return "\n  MessageData{" +
                "\n   messageParameters=" + messageParameters +
                ", orders=" + orders +
                "\n   }";
    }
}
