package com.hughes.billing.voipworkorder.exception;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import com.hughes.billing.voipworkorder.service.VoipWorkOrderService;
import com.hughes.billing.voipworkorder.utils.Utility;
import com.hughes.billing.voipworkorder.utils.VoipAckResponseGenerator;
import com.hughes.billing.voipworkorder.utils.VoipWorkOrderConstants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
@Slf4j
public class GenericExceptionHandler {

    private final VoipWorkOrderService voipWorkOrderService;
    @Autowired
    public GenericExceptionHandler(VoipWorkOrderService voipWorkOrderService) {
        this.voipWorkOrderService = voipWorkOrderService;
    }

    /**
     * Handles the RequiredParameterMissingException and returns a ResponseEntity object.
     *
     * @param  e  the RequiredParameterMissingException to be handled
     * @return    the ResponseEntity object
     */
    @ExceptionHandler(RequiredParameterMissingException.class)
    public void handleMandatoryParameterMissing(RequiredParameterMissingException e) {
        log.info("handleMandatoryParameterMissing : STARTS : message = " + e.getMessage());

        VoIPWorkOrderAckMsg response = null;
        String message = null;
        try {
            //TODO move to a separate function
            VoipWorkOrderMsgDTO voipWorkOrderMsgDTO = e.getVoipWorkOrderMsgDTO();
            message = e.getMessage() + " is missing";
            response = VoipAckResponseGenerator.prepareResponse(voipWorkOrderMsgDTO, Boolean.FALSE.toString(), message);
            log.info("handleMandatoryParameterMissing : response = " + response);

            voipWorkOrderMsgDTO.setState(VoipWorkOrderConstants.VOIP_REQ_STATE_VALIDATION_FAIL);
            voipWorkOrderMsgDTO.setRemarks(VoipWorkOrderConstants.VOIP_REQ_STATE_VALIDATION_FAIL_MSG);
            voipWorkOrderMsgDTO.setStatus(VoipWorkOrderConstants.VOIP_MSG_STATUS_FAILURE);
            voipWorkOrderMsgDTO.setPublishedPayload(response.toString());
            voipWorkOrderService.saveData(voipWorkOrderMsgDTO);
        } catch (Exception ex) {
            log.error("handleMandatoryParameterMissing : Exception = " + ex.getMessage());
        }

        log.info("handleMandatoryParameterMissing : ENDS");
    }

    /**
     * Handles the BillingUserException and returns a ResponseEntity object.
     *
     * @param  e  the BillingUserException to be handled
     * @return    a ResponseEntity object with the error message and HTTP status code
     */
    @ExceptionHandler(BillingUserException.class)
    public void handleBillingUserException(BillingUserException e) {
        log.info("handleBillingUserException : STARTS");
        VoIPWorkOrderAckMsg response = null;
        try {
            VoipWorkOrderMsgDTO voipWorkOrderMsgDTO = e.getVoipWorkOrderMsgDTO();
            response = VoipAckResponseGenerator.prepareResponse(voipWorkOrderMsgDTO, Boolean.FALSE.toString(), e.getMessage());
            log.info("handleMandatoryParameterMissing : response = " + response);
            voipWorkOrderMsgDTO.setStatus(VoipWorkOrderConstants.VOIP_MSG_STATUS_FAILURE);
            voipWorkOrderMsgDTO.setPublishedPayload(response.toString());
            voipWorkOrderService.saveData(voipWorkOrderMsgDTO);
        } catch (Exception ex) {
            log.error("handleMandatoryParameterMissing : Exception = " + ex.getMessage());
        }
    }
}
