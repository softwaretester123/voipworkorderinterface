package com.hughes.billing.voipworkorder.utils;

//1= Landed; 2 = Validation OK ; 3 = Validation FAIL ; 4 = SP Called OK ; 5 = SP Called FAIL; 6 = Response Sent


public class VoipWorkOrderConstants {

    public static final String ADD_VOIP_WORKORDER = "A";

    public static final String CANCEL_VOIP_WORKORDER = "CAN";

    public static final String VOIPWORKORDER_MSG_NAME = "VoIPWorkOrder";

    public static final String VOIPWORKORDERACKMSG_MSG_NAME = "VoIPWorkOrderAckMsg";

    public static final String BILLING = "Billing";

    public static final String DSS = "DSS";

    public static final String VOIP_MSG_STATUS_PENDING = "PENDING";

    public static final String VOIP_MSG_STATUS_SUCCESS = "SUCCESS";

    public static final String VOIP_MSG_STATUS_FAILURE = "FAILURE";

    public static final Integer VOIP_MSG_STATE_LANDED = 1;

    public static final Integer VOIP_MSG_STATE_VALIDATION_OK = 2;

    public static final Integer VOIP_MSG_STATE_VALIDATION_FAIL = 3;

    public static final Integer VOIP_MSG_STATE_SP_CALLED_OK = 4;

    public static final Integer VOIP_MSG_STATE_SP_CALLED_FAIL = 5;

    public static final Integer VOIP_MSG_STATE_RESPONSE_SENT = 6;

    public static final String VOIP_MSG_STATE_LANDED_MSG = "Request Landed";

    public static final String VOIP_MSG_STATE_VALIDATION_OK_MSG = "Request Validated Successfully";

    public static final String VOIP_MSG_STATE_VALIDATION_FAIL_MSG = "Request Validation Failed";

    public static final String VOIP_MSG_STATE_SP_CALLED_OK_MSG = "SP Call Successful";

    public static final String VOIP_MSG_STATE_SP_CALLED_FAIL_MSG = "SP Call Failed";

    public static final String VOIP_MSG_STATE_RESPONSE_SENT_MSG = "Response Sent";

    public static final String VOIP_WO_CREATE_SUCCESS_MESSAGE = "Work Order Created Successfully";

    public static final String VOIP_WO_CANCEL_SUCCESS_MESSAGE = "Work Order Cancelled Successfully";

    public static final String TRANSACTION_DATE_TIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";

    public static final String SP_CALL_SUCCESS_RET_VAL = "0";
}
