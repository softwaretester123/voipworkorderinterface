package com.hughes.billing.voipworkorder.utils;

import com.hughes.billing.voipworkorder.dto.avro.req.*;
import lombok.Getter;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Component
public class PubSubMessageValidator {

    private Map<String, String> errorMap;

    private void validateMessageHeader(VoIPWorkOrder message) {
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
    }

    private void validateMessageData(VoIPWorkOrder message) {
        validateOrder(message.getMessageData().getOrders().get(0));
        validateMessageParameters(message.getMessageData().getMessageParameters());
    }

    private void validateHeaders(VoIPWorkOrder message) {
        if (message.getHeaders().getKEY().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "Headers->KEY is empty");
        }
    }

    private void validateMessageParameters(List<MessageParameters> messageParameters) {
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
    }

    private void validateOrder(Orders order) {
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
    }

    private void validateOrderInformation(OrderInformation orderInformation) {
        if (orderInformation.getSAN().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->OrderInformation->SAN is empty");
        }
    }

    private void validateInstallName(InstallName installName) {
        if (installName.getFirstName().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallName->FirstName is empty");
            return;
        }

        if (installName.getLastName().toString().isEmpty()) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallName->LastName is empty");
        }
    }

    private void validateInstallAddress(InstallAddress installAddress) {
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
    }

    private void validateInstallPhones(List<InstallPhone> installPhone) {
        if (installPhone.stream().anyMatch(ip -> ip.getNumber().toString().isEmpty())) {
            this.errorMap.put(VoipWorkOrderConstants.ERROR_MESSAGE, "MessageData->Orders->InstallPhone->Number is empty");
        }
    }

    private void validateOrderAttributes(List<OrderAttributes> orderAttributes) {
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
    }

    public void validate(VoIPWorkOrder message) {
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
    }

}
