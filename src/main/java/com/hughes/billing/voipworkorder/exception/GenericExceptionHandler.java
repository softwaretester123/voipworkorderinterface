package com.hughes.billing.voipworkorder.exception;

import com.hughes.billing.voipworkorder.dto.avro.ack.VoIPWorkOrderAckMsg;
import com.hughes.billing.voipworkorder.dto.avro.req.VoIPWorkOrder;
import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import com.hughes.billing.voipworkorder.service.PublisherService;
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
    public ResponseEntity<Object> handleMandatoryParameterMissing(RequiredParameterMissingException e) {
        log.info("handleMandatoryParameterMissing : STARTS : message = " + e.getMessage());

        VoIPWorkOrderAckMsg response = null;
        try {
            VoipWorkOrderMsgDTO voipWorkOrderMsgDTO = e.getVoipWorkOrderMsgDTO();
            if (voipWorkOrderMsgDTO == null) {
                voipWorkOrderMsgDTO = new VoipWorkOrderMsgDTO();
            }
            VoIPWorkOrder request = e.getRequest();
            String message = e.getMessage() + "is missing";
            response = VoipAckResponseGenerator.prepareResponse(request, Boolean.FALSE.toString(), message);
            log.info("handleMandatoryParameterMissing : response = " + response);

            voipWorkOrderMsgDTO.setState(VoipWorkOrderConstants.VOIP_MSG_STATE_VALIDATION_FAIL);
            voipWorkOrderMsgDTO.setRemarks(VoipWorkOrderConstants.VOIP_MSG_STATE_VALIDATION_FAIL_MSG);
            voipWorkOrderMsgDTO.setStatus(VoipWorkOrderConstants.VOIP_MSG_STATUS_FAILURE);
            voipWorkOrderMsgDTO.setModifiedTimeStamp(Utility.getTimeStamp());
            voipWorkOrderMsgDTO.setPublishedPayload(response.toString());
            voipWorkOrderService.saveData(voipWorkOrderMsgDTO);
        } catch (Exception ex) {
            log.error("handleMandatoryParameterMissing : Exception = " + ex.getMessage());
        }

        log.info("handleMandatoryParameterMissing : ENDS");
        return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }

    /**
     * Handles the BillingUserException and returns a ResponseEntity object.
     *
     * @param  e  the BillingUserException to be handled
     * @return    a ResponseEntity object with the error message and HTTP status code
     */
    @ExceptionHandler(BillingUserException.class)
    public ResponseEntity<Object> handleBillingUserException(BillingUserException e) {
        log.info("handleBillingUserException : STARTS");
        VoIPWorkOrderAckMsg response = null;
        try {
            VoipWorkOrderMsgDTO voipWorkOrderMsgDTO = e.getVoipWorkOrderMsgDTO();
            if (voipWorkOrderMsgDTO == null) {
                voipWorkOrderMsgDTO = new VoipWorkOrderMsgDTO();
            }
            VoIPWorkOrder request = e.getRequestObj();
            response = VoipAckResponseGenerator.prepareResponse(request, Boolean.FALSE.toString(), e.getMessage());
            log.info("handleMandatoryParameterMissing : response = " + response);
            voipWorkOrderMsgDTO.setStatus(VoipWorkOrderConstants.VOIP_MSG_STATUS_FAILURE);
            voipWorkOrderMsgDTO.setModifiedTimeStamp(Utility.getTimeStamp());
            voipWorkOrderMsgDTO.setPublishedPayload(response.toString());
            voipWorkOrderService.saveData(voipWorkOrderMsgDTO);
        } catch (Exception ex) {
            log.error("handleMandatoryParameterMissing : Exception = " + ex.getMessage());
        }
        return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
}
