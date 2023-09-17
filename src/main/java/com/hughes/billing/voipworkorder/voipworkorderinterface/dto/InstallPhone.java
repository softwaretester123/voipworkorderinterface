package com.hughes.billing.voipworkorder.voipworkorderinterface.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class InstallPhone {
    private final String number;
    private final String type;

    public InstallPhone(String number, String type) {
        this.number = number;
        this.type = type;
    }

    @JsonProperty("Number")
    public String getNumber() {
        return number;
    }

    @JsonProperty("Type")
    public String getType() {
        return type;
    }

    @Override
    public String toString() {
        return "\nInstallPhone { " +
                "\n    Number = '" + number + '\'' +
                ",\n   Type = '" + type + '\'' +
                "\n    }";
    }
}
