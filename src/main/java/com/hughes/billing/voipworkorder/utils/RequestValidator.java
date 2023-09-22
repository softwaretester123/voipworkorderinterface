package com.hughes.billing.voipworkorder.utils;

import com.hughes.billing.voipworkorder.dto.avro.*;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.List;

@Component
public class RequestValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return VoIPWorkOrder.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        VoIPWorkOrder req = (VoIPWorkOrder) target;

        MessageHeader messageHeader = req.getMessageHeader();
        MessageData messageData = req.getMessageData();

        if (messageHeader == null) {
            errors.reject("MessageHeader");
            return;
        }

        if (messageData == null) {
            errors.reject("MessageData");
            return;
        }

        if (messageHeader.getTransactionSequenceId() == null || messageHeader.getTransactionSequenceId().toString().isEmpty()) {
            errors.reject("MessageHeader->TransactionSequenceId");
        }

        if (messageHeader.getTransactionDateTime() == null || messageHeader.getTransactionDateTime().toString().isEmpty()) {
            errors.reject("MessageHeader->TransactionDateTime");
        }

        if (messageHeader.getMessageName() == null || messageHeader.getMessageName().toString().isEmpty()) {
            errors.reject("MessageHeader->MessageName");
        }

        if (messageHeader.getOrigin() == null || messageHeader.getOrigin().toString().isEmpty()) {
            errors.reject("MessageHeader->Origin");
        }

        if (messageData.getMessageParameters() == null) {
            errors.reject("MessageData->MessageParameters[Array{name: '', value: ''}]");
            return;
        }

        List<MessageParameter> messageParameters = messageData.getMessageParameters();

        //Structure Check for MessageParameters List
        for (MessageParameter messageParameter : messageParameters) {
            if (messageParameter.getName() == null) {
                errors.reject("MessageData->MessageParameters->name");
            }
            if (messageParameter.getValue() == null) {
                errors.reject("MessageData->MessageParameters->value");
            }
        }

        //Check for WorkOrderType and Destination in MessageParameters List
        boolean isWorkOrderTypePresent = messageParameters
                .stream().anyMatch(messageParameter -> messageParameter.getName().toString().equals("WorkOrderType"));
        boolean isDestinationPresent = messageParameters
                .stream().anyMatch(messageParameter -> messageParameter.getName().toString().equals("Destination"));

        if (!isWorkOrderTypePresent) {
            errors.reject("MessageData->MessageParameters->name(WorkOrderType)");
            return;
        }

        if (!isDestinationPresent) {
            errors.reject("MessageData->MessageParameters->name(Destination)");
            return;
        }

        List<Order> orders = messageData.getOrders();

        if (orders.isEmpty()) {
            errors.reject("MessageData->Orders");
            return;
        }

        for (Order order : orders) {
            if (order.getOrderInformation() == null) {
                errors.reject("MessageData->Orders->OrderInformation");
                return;
            }

            if (order.getInstallName() == null) {
                errors.reject("MessageData->Orders->InstallName");
                return;
            }

            if (order.getInstallAddress() == null) {
                errors.reject("MessageData->Orders->InstallAddress");
                return;
            }

            if (order.getInstallPhone() == null) {
                errors.reject("MessageData->Orders->InstallPhone");
                return;
            }

            if (order.getOrderAttributes() == null) {
                errors.reject("MessageData->Orders->OrderAttributes");
                return;
            }

            // OrderInformation properties check
            if (order.getOrderInformation().getSAN() == null) {
                errors.reject("MessageData->Orders->OrderInformation->SAN");
                return;
            }

            // InstallName properties check
            if (order.getInstallName().getFirstName() == null) {
                errors.reject("MessageData->Orders->InstallName->FirstName");
                return;
            }

            if (order.getInstallName().getMiddleName() == null) {
                errors.reject("MessageData->Orders->InstallName->MiddleName");
                return;
            }

            if (order.getInstallName().getLastName() == null) {
                errors.reject("MessageData->Orders->InstallName->LastName");
                return;
            }

            // InstallAddress properties check
            if (order.getInstallAddress().getAddress1() == null) {
                errors.reject("MessageData->Orders->InstallAddress->Address1");
                return;
            }


            if (order.getInstallAddress().getCity() == null) {
                errors.reject("MessageData->Orders->InstallAddress->City");
                return;
            }

            if (order.getInstallAddress().getState() == null) {
                errors.reject("MessageData->Orders->InstallAddress->State");
                return;
            }

            if (order.getInstallAddress().getZip() == null) {
                errors.reject("MessageData->Orders->InstallAddress->Zip");
                return;
            }

            if (order.getInstallAddress().getCountry() == null) {
                errors.reject("MessageData->Orders->InstallAddress->Country");
                return;
            }

            // InstallPhone properties
            if (order.getInstallPhone().isEmpty()) {
                errors.reject("[Array{Number: '', Type: ''}]");
                return;
            }

            for (InstallPhone installPhone : order.getInstallPhone()) {
                if (installPhone.getNumber() == null) {
                    errors.reject("MessageData->Orders->InstallPhone->Number");
                    return;
                }
            }

            if (order.getOrderAttributes() == null) {
                errors.reject("MessageData->Orders->OrderAttributes[Array{name: '', value: ''}]");
                return;
            }

            for (OrderAttribute orderAttribute : order.getOrderAttributes()) {
                if (orderAttribute.getName() == null) {
                    errors.reject("MessageData->Orders->OrderAttributes->name");
                    return;
                }

                if (orderAttribute.getValue() == null) {
                    errors.reject("MessageData->Orders->OrderAttributes->value");
                    return;
                }
            }

            //Check for GlSegmentId and VoipBillingDeal in OrderAttributes List
            boolean isGlSegmentIdPresent = order.getOrderAttributes()
                    .stream().anyMatch(orderAttribute -> orderAttribute.getName().toString().equals("GlSegmentId"));
            boolean isVoipBillingDealPresent = order.getOrderAttributes()
                    .stream().anyMatch(orderAttribute -> orderAttribute.getName().toString().equals("VoipBillingDeal"));

            if (!isGlSegmentIdPresent) {
                errors.reject("MessageData->Orders->OrderAttributes->name(GlSegmentId)");
                return;
            }

            if (!isVoipBillingDealPresent) {
                errors.reject("MessageData->Orders->OrderAttributes->name(VoipBillingDeal)");
                return;
            }

        }
    }
}
