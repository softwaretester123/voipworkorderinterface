package com.hughes.billing.voipworkorder.exception;

import com.hughes.billing.voipworkorder.entities.VoipWorkOrderMsgDTO;
import com.hughes.billing.voipworkorder.service.VoipWorkOrderService;
import com.hughes.billing.voipworkorder.producer.VoipAckResponseGenerator;
import com.hughes.billing.voipworkorder.utils.ResponseUtility;
import com.hughes.billing.voipworkorder.utils.VoipWorkOrderConstants;
import com.hughes.sdg.avro.CommonMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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
    public void handleRequiredParameterMissing(RequiredParameterMissingException e) {
        log.info("handleMandatoryParameterMissing : STARTS : message = " + e.getMessage());

        CommonMessage response = null;
        String message = null;
        try {
            VoipWorkOrderMsgDTO voipWorkOrderMsgDTO = e.getVoipWorkOrderMsgDTO();
            message = e.getMessage();
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
        CommonMessage response = null;
        try {
            VoipWorkOrderMsgDTO voipWorkOrderMsgDTO = e.getVoipWorkOrderMsgDTO();
            response = e.getCommonMessage();
            if (response == null) {
                log.debug("handleBillingUserException : response is null - creating a new response object");
                response = VoipAckResponseGenerator.prepareResponse(voipWorkOrderMsgDTO, Boolean.FALSE.toString(), e.getMessage());
            } else {
                ResponseUtility.setStatusAndMessage(response, Boolean.FALSE.toString(), e.getMessage());
            }
            log.info("handleMandatoryParameterMissing : response = " + response);
            voipWorkOrderMsgDTO.setStatus(VoipWorkOrderConstants.VOIP_MSG_STATUS_FAILURE);
            voipWorkOrderMsgDTO.setPublishedPayload(response.toString());
            voipWorkOrderService.saveData(voipWorkOrderMsgDTO);
        } catch (Exception ex) {
            log.error("handleMandatoryParameterMissing : Exception = " + ex.getMessage());
        }
    }
}
