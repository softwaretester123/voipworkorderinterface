package com.hughes.billing.voipworkorder.voipworkorderinterface.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class OrderInformation {
    private final String san;

    public OrderInformation() {
        this.san = null;
    }
    public OrderInformation(String san) {
        this.san = san;
    }

    @JsonProperty("SAN")
    public String getSAN() {
        return san;
    }

    @Override
    public String toString() {
        return "OrderInformation{" +
                "san='" + san + '\'' +
                '}';
    }
}