package com.hughes.billing.voipworkorder.voipworkorderinterface.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MessageParameters {
    private final String name;
    private final String value;

    public MessageParameters(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public String getValue() {
        return value;
    }

    @Override
    public String toString() {
        return "\n      MessageParameter { " +
                "\n        name = '" + name + '\'' +
                ",\n        value = '" + value + '\'' +
                "\n      }";
    }
}
