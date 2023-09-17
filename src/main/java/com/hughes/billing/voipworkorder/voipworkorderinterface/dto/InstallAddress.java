package com.hughes.billing.voipworkorder.voipworkorderinterface.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class InstallAddress {
    private final String address1;
    private final String address2;
    private final String city;
    private final String state;
    private final String zip;
    private final String country;

    public InstallAddress(String address1, String address2, String city, String state, String zip, String country) {
        this.address1 = address1;
        this.address2 = address2;
        this.city = city;
        this.state = state;
        this.zip = zip;
        this.country = country;
    }

    @JsonProperty("Address1")
    public String getAddress1() {
        return address1;
    }

    @JsonProperty("Address2")
    public String getAddress2() {
        return address2;
    }

    @JsonProperty("City")
    public String getCity() {
        return city;
    }

    @JsonProperty("State")
    public String getState() {
        return state;
    }

    @JsonProperty("Zip")
    public String getZip() {
        return zip;
    }

    @JsonProperty("Country")
    public String getCountry() {
        return country;
    }

    @Override
    public String toString() {
        return "InstallAddress{" +
                "Address1='" + address1 + '\'' +
                ", Address2='" + address2 + '\'' +
                ", City='" + city + '\'' +
                ", State='" + state + '\'' +
                ", Zip='" + zip + '\'' +
                ", Country='" + country + '\'' +
                '}';
    }
}
