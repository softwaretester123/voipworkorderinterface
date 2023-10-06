package com.hughes.billing.voipworkorder.utils;

import com.hughes.sdg.avro.*;
import com.hughes.sdg.avro.types.*;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Component
@Slf4j
public class PubSubMessageValidator {

    private Map<String, String> errorMap;

    private void validateMessageHeader(CommonMessage message) {
        log.debug("validateMessageHeader : STARTS");
        if (message.getMessageHeader().getTransactionSequenceId().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageHeader->TransactionSequenceId is empty");
            return;
        }
        if (message.getMessageHeader().getTransactionDateTime().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageHeader->TransactionDateTime is empty");
            return;
        }
        if (message.getMessageHeader().getMessageName().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageHeader->MessageName is empty");
            return;
        }
        if (message.getMessageHeader().getOrigin().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageHeader->Origin is empty");
        }
        log.debug("validateMessageHeader : ENDS");
    }

    private void validateMessageParameters(List<NameValueParameter> messageParameters) {
        log.debug("validateMessageParameters : STARTS");
        if (messageParameters.isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->MessageParameters is empty");
            return;
        }

        if (messageParameters.stream().noneMatch(mp -> mp.getName().toString().equals("WorkOrderType"))) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->MessageParameters->name(WorkOrderType) is missing");
            return;
        }

        if (messageParameters.stream().noneMatch(mp -> mp.getName().toString().equals("Destination"))) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->MessageParameters->name(Destination) is missing");
            return;
        }

        if (messageParameters.stream().filter(mp -> mp.getName().toString().equals("WorkOrderType")).count() > 1) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->MessageParameters->name(WorkOrderType) is duplicated");
            return;
        }

        if (messageParameters.stream().filter(mp -> mp.getName().toString().equals("Destination")).count() > 1) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->MessageParameters->name(Destination) is duplicated");
        }
        log.debug("validateMessageParameters : ENDS");
    }

    private void validateOrder(Order order) {
        log.debug("validateOrder : STARTS");

        // Validating OrderInformation STARTS
        if (order.getOrderInformation().getSAN().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->OrderInformation->SAN is empty");
        }

        if (errorMap.containsKey(VoipWorkOrderConstants.ERROR_MESSAGE)) {
            return;
        }
        // Validating OrderInformation ENDS

        // Validating InstallName STARTS
        if (order.getInstallName().getFirstName().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallName->FirstName is empty");
            return;
        }

        if (order.getInstallName().getLastName().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallName->LastName is empty");
        }

        if (errorMap.containsKey(VoipWorkOrderConstants.ERROR_MESSAGE)) {
            return;
        }
        // Validating InstallName ENDS

        validateInstallAddress(order.getInstallAddress());

        if (errorMap.containsKey(VoipWorkOrderConstants.ERROR_MESSAGE)) {
            return;
        }

        // Validating InstallPhone STARTS
        if (order.getInstallPhone().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallPhone is empty");
            return;
        }

        if (order.getInstallPhone().stream().anyMatch(ip -> ip.getNumber().toString().isEmpty())) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallPhone->Number is empty");
        }

        if (errorMap.containsKey(VoipWorkOrderConstants.ERROR_MESSAGE)) {
            return;
        }
        // Validating InstallPhone STARTS

        // Validating Order Attributes STARTS
        if (order.getOrderAttributes().stream().noneMatch(oa -> oa.getName().toString().equals("GlSegmentId"))) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->OrderAttributes->name(GlSegmentId) is missing");
            return;
        }

        if (order.getOrderAttributes().stream().noneMatch(oa -> oa.getName().toString().equals("VoipBillingDeal"))) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->OrderAttributes->name(VoipBillingDeal) is missing");
            return;
        }
        // Validating Order Attributes ENDS
        log.debug("validateOrder : ENDS");
    }

    private void validateInstallAddress(Address installAddress) {
        log.debug("validateInstallAddress : STARTS");
        if (installAddress.getAddress1().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallAddress->Address1 is empty");
            return;
        }

        if (installAddress.getCity().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallAddress->City is empty");
            return;
        }

        if (installAddress.getState().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallAddress->State is empty");
            return;
        }

        if (installAddress.getZip().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallAddress->Zip is empty");
            return;
        }

        if (installAddress.getCountry().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallAddress->Country is empty");
        }
        log.debug("validateInstallAddress : ENDS");
    }

    public void validate(CommonMessage message) {
        log.debug("validate : STARTS");
        this.errorMap = new HashMap<>();
        validateMessageHeader(message);
        if (errorMap.containsKey(VoipWorkOrderConstants.ERROR_MESSAGE)) {
            return;
        }
        // Validating MessageData STARTS
        if (message.getMessageData().getOrders().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders is empty");
            return;
        }

        validateOrder(message.getMessageData().getOrders().get(0));

        if (errorMap.containsKey(VoipWorkOrderConstants.ERROR_MESSAGE)) {
            return;
        }

        validateMessageParameters(message.getMessageData().getMessageParameters());

        if (errorMap.containsKey(VoipWorkOrderConstants.ERROR_MESSAGE)) {
            return;
        }
        // Validating MessageData ENDS

        boolean headerKeyEmpty = message.getHeaders().entrySet().stream()
                .anyMatch(e -> e.getKey().toString().equals("KEY") && !e.getValue().toString().isEmpty());

        if (!headerKeyEmpty) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "Headers->KEY is empty");
        }
        log.debug("validate : ENDS");
    }

}
