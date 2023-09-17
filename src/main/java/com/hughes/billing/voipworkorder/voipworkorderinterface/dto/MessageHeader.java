package com.hughes.billing.voipworkorder.voipworkorderinterface.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MessageHeader {
    private final String transactionSequenceId;
    private final String transactionDateTime;
    private final String messageName;
    private final String origin;

    public MessageHeader(String transactionSequenceId, String transactionDateTime, String messageName, String origin) {
        this.transactionSequenceId = transactionSequenceId;
        this.transactionDateTime = transactionDateTime;
        this.messageName = messageName;
        this.origin = origin;
    }

    @JsonProperty("TransactionSequenceId")
    public String getTransactionSequenceId() {
        return transactionSequenceId;
    }

    @JsonProperty("TransactionDateTime")
    public String getTransactionDateTime() {
        return transactionDateTime;
    }

    @JsonProperty("MessageName")
    public String getMessageName() {
        return messageName;
    }

    @JsonProperty("Origin")
    public String getOrigin() {
        return origin;
    }

    @Override
    public String toString() {
        return "\n  MessageHeader { " +
                "\n  transactionSequenceId = '" + transactionSequenceId + '\'' +
                ",\n  transactionDateTime = '" + transactionDateTime + '\'' +
                ",\n  messageName = '" + messageName + '\'' +
                ",\n  origin = '" + origin + '\'' +
                "\n  }";
    }
}
