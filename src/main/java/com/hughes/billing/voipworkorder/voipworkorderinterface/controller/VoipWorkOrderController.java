package com.hughes.billing.voipworkorder.voipworkorderinterface.controller;

import com.hughes.billing.voipworkorder.voipworkorderinterface.dto.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.ArrayList;
import java.util.List;

public class VoipWorkOrderController {
    private static final Logger LOG = LoggerFactory.getLogger(VoipWorkOrderController.class);

    @PostMapping(value = "/create", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public void create(@RequestBody VoipWorkOrder data) {
        LOG.info("Create request landed successfully");
        System.out.println(data);
    }

    @PostMapping(value = "/cancel", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    public void cancel(@RequestBody VoipWorkOrder data) {
        LOG.info("Cancel request landed successfully");
        System.out.println(data);
    }

    @GetMapping("/get")
    public VoipWorkOrder getVoipWorkOrder() {

        List<MessageParameters> messageParametersList = new ArrayList<>();
        messageParametersList.add(new MessageParameters("WorkOrderType", "A"));
        messageParametersList.add(new MessageParameters("Destination", "Billing"));

        List<InstallPhone> installPhoneList = new ArrayList<>();
        installPhoneList.add(new InstallPhone("3214895630", "Landline"));

        List<Orders> ordersList = new ArrayList<>();
        ordersList.add(new Orders(
                new OrderInformation("DSS200197435"),
                new InstallAddress(
                        "12 Walker Ave",
                        "",
                        "Gaithersburg",
                        "MD",
                        "20877",
                        "US"),
                installPhoneList
        ));

        return new VoipWorkOrder(
                new MessageHeader(
                        "POP2021-03-19T08:41:24.903Z",
                        "2021-03-19T08:41:24.903Z",
                        "VoIPWorkOrder",
                        "DSS"
                ),
                new MessageData(
                        messageParametersList,
                        ordersList
                )
        );
    }
}
