package com.hughes.billing.voipworkorder.voipworkorderinterface.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class OrderInformation {
    private final String SAN;

    public OrderInformation() {
        this.SAN = null;
    }

    public OrderInformation(String SAN) {
        this.SAN = SAN;
    }

    @JsonProperty("SAN")
    public String getSAN() {
        return SAN;
    }

    @Override
    public String toString() {
        return "OrderInformation{" +
                "SAN='" + SAN + '\'' +
                '}';
    }
}