package com.hughes.billing.voipworkorder.voipworkorderinterface.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class Orders {
    private final OrderInformation orderInformation;
    private final InstallAddress installAddress;
    private final List<InstallPhone> installPhone;

    public Orders() {
        this.orderInformation = null;
        this.installAddress = null;
        this.installPhone = null;
    }

    public Orders(OrderInformation orderInformation, InstallAddress installAddress, List<InstallPhone> installPhone) {
        this.orderInformation = orderInformation;
        this.installAddress = installAddress;
        this.installPhone = installPhone;
    }

    @JsonProperty("OrderInformation")
    public OrderInformation getOrderInformation() {
        return orderInformation;
    }

    @JsonProperty("InstallAddress")
    public InstallAddress getInstallAddress() {
        return installAddress;
    }

    @JsonProperty("InstallPhone")
    public List<InstallPhone> getInstallPhone() {
        return installPhone;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orderInformation=" + orderInformation +
                ", installAddress=" + installAddress +
                ", installPhone=" + installPhone +
                '}';
    }
}

