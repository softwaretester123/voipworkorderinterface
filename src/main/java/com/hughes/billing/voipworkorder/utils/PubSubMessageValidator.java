package com.hughes.billing.voipworkorder.utils;

import com.hughes.billing.voipworkorder.dto.avro.req.*;
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

    private void validateMessageHeader(VoIPWorkOrder message) {
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

    private void validateMessageData(VoIPWorkOrder message) {
        log.debug("validateMessageData : STARTS");
        if (message.getMessageData().getOrders().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders is empty");
            return;
        }

        validateOrder(message.getMessageData().getOrders().get(0));

        if (errorMap.containsKey(VoipWorkOrderConstants.ERROR_MESSAGE)) {
            return;
        }

        validateMessageParameters(message.getMessageData().getMessageParameters());
        log.debug("validateMessageData : ENDS");
    }

    private void validateHeaders(VoIPWorkOrder message) {
        log.debug("validateHeaders : STARTS");
        if (message.getHeaders().getKEY().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "Headers->KEY is empty");
        }
        log.debug("validateHeaders : ENDS");
    }

    private void validateMessageParameters(List<MessageParameters> messageParameters) {
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

    private void validateOrder(Orders order) {
        log.debug("validateOrder : STARTS");
        validateOrderInformation(order.getOrderInformation());

        if (errorMap.containsKey(VoipWorkOrderConstants.ERROR_MESSAGE)) {
            return;
        }

        validateInstallName(order.getInstallName());

        if (errorMap.containsKey(VoipWorkOrderConstants.ERROR_MESSAGE)) {
            return;
        }

        validateInstallAddress(order.getInstallAddress());

        if (errorMap.containsKey(VoipWorkOrderConstants.ERROR_MESSAGE)) {
            return;
        }

        validateInstallPhones(order.getInstallPhone());

        if (errorMap.containsKey(VoipWorkOrderConstants.ERROR_MESSAGE)) {
            return;
        }

        validateOrderAttributes(order.getOrderAttributes());
        log.debug("validateOrder : ENDS");
    }

    private void validateOrderInformation(OrderInformation orderInformation) {
        log.debug("validateOrderInformation : STARTS");
        if (orderInformation.getSAN().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->OrderInformation->SAN is empty");
        }
        log.debug("validateOrderInformation : ENDS");
    }

    private void validateInstallName(InstallName installName) {
        log.debug("validateInstallName : STARTS");
        if (installName.getFirstName().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallName->FirstName is empty");
            return;
        }

        if (installName.getLastName().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallName->LastName is empty");
        }
        log.debug("validateInstallName : ENDS");
    }

    private void validateInstallAddress(InstallAddress installAddress) {
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

    private void validateInstallPhones(List<InstallPhone> installPhone) {
        log.debug("validateInstallPhones : STARTS");
        if (installPhone.isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallPhone is empty");
            return;
        }

        if (installPhone.stream().anyMatch(ip -> ip.getNumber().toString().isEmpty())) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallPhone->Number is empty");
        }
        log.debug("validateInstallPhones : ENDS");
    }

    private void validateOrderAttributes(List<OrderAttributes> orderAttributes) {
        log.debug("validateOrderAttributes : STARTS");
        if (orderAttributes.stream().noneMatch(oa -> oa.getName().toString().equals("GlSegmentId"))) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->OrderAttributes->name(GlSegmentId) is missing");
            return;
        }

        if (orderAttributes.stream().noneMatch(oa -> oa.getName().toString().equals("VoipBillingDeal"))) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->OrderAttributes->name(VoipBillingDeal) is missing");
            return;
        }

        if (orderAttributes.stream().filter(oa -> oa.getName().toString().equals("GlSegmentId")).count() > 1) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->OrderAttributes->name(GlSegmentId) is duplicated");
            return;
        }

        if (orderAttributes.stream().filter(oa -> oa.getName().toString().equals("VoipBillingDeal")).count() > 1) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->OrderAttributes->name(VoipBillingDeal) is duplicated");
        }
        log.debug("validateOrderAttributes : ENDS");
    }

    public void validate(VoIPWorkOrder message) {
        log.debug("validate : STARTS");
        this.errorMap = new HashMap<>();
        validateMessageHeader(message);
        if (errorMap.containsKey(VoipWorkOrderConstants.ERROR_MESSAGE)) {
            return;
        }
        validateMessageData(message);
        if (errorMap.containsKey(VoipWorkOrderConstants.ERROR_MESSAGE)) {
            return;
        }
        validateHeaders(message);
        log.debug("validate : ENDS");
    }

}
