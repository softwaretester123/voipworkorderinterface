--------------------------------------------------------
--  File created - Friday-September-22-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ADJUSTMENT_BATCH_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ADJUSTMENT_BATCH_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 91 CACHE 30 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ADJUSTMENT_RECORD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ADJUSTMENT_RECORD_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 30 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence AUDIT_REPORT_ACTION_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."AUDIT_REPORT_ACTION_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence AUDIT_REPORT_CONNECTION_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."AUDIT_REPORT_CONNECTION_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 4 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence AUDIT_REPORT_EMPLOYEE_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."AUDIT_REPORT_EMPLOYEE_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 11 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence AUDIT_REPORT_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."AUDIT_REPORT_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 4 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence AUDIT_REPORT_QUERY_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."AUDIT_REPORT_QUERY_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence AUDIT_REPORT_TYPE_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."AUDIT_REPORT_TYPE_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 38 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence BILLNOW_QUE_REC_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."BILLNOW_QUE_REC_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 120987 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence CC_ALIAS_10_DIGIT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."CC_ALIAS_10_DIGIT_SEQ"  MINVALUE 1000000000 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1000000004 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence CC_ALIAS_11_DIGIT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."CC_ALIAS_11_DIGIT_SEQ"  MINVALUE 10000000000 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 10000000016 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence CON_REVFEES_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."CON_REVFEES_T_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence COURTESY_FAP_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."COURTESY_FAP_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 500141 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence CREATE_LOCATION_ACCOUNT_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."CREATE_LOCATION_ACCOUNT_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence DBI_HUGHESON_UPLOAD_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."DBI_HUGHESON_UPLOAD_SEQUENCE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence DEAL_CHANGE_BATCH_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."DEAL_CHANGE_BATCH_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 30 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence DEAL_CHANGE_RECORD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."DEAL_CHANGE_RECORD_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 30 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence EMBARQ_PAYMENT_RECORD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."EMBARQ_PAYMENT_RECORD_SEQ"  MINVALUE 1 MAXVALUE 1000000000000000000000000000 INCREMENT BY 1 START WITH 27 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence EMB_BILL_CREDIT_FEED_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."EMB_BILL_CREDIT_FEED_SEQ"  MINVALUE 1 MAXVALUE 1000000000000000000000000000 INCREMENT BY 1 START WITH 386 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_BILLNOW_QUEUE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_BILLNOW_QUEUE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_BILL_TO_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_BILL_TO_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 11 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_BULK_PAYMENT_RECORD_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_BULK_PAYMENT_RECORD_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_BULK_PAYMENT_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_BULK_PAYMENT_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_CHECKS_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_CHECKS_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_CM_BULK_FILE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_CM_BULK_FILE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_CM_BULK_RECORD_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_CM_BULK_RECORD_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_CONFIG_MINIMUM_SITES_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_CONFIG_MINIMUM_SITES_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_CONFIG_RULE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_CONFIG_RULE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_CREDIT_MEMO_ITEM_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_CREDIT_MEMO_ITEM_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_CREDIT_MEMO_SUMMARY_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_CREDIT_MEMO_SUMMARY_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_CREDIT_MEMO_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_CREDIT_MEMO_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_CURRENCY_CONVERSION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_CURRENCY_CONVERSION_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 101 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_CUSTOMER_VOIP_INFO_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_CUSTOMER_VOIP_INFO_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 623 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_DESCRIPTOR_MAPPING_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_DESCRIPTOR_MAPPING_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 13850067 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_DOWNLOAD_PDF_QUEUE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_DOWNLOAD_PDF_QUEUE_T_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_DOWNLOAD_QUEUE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_DOWNLOAD_QUEUE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_DSS_BUNDLING_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_DSS_BUNDLING_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 13682168 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_EMAIL_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_EMAIL_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_EXXON_FINAL_INVOICE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_EXXON_FINAL_INVOICE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_FAP_CONFIG_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_FAP_CONFIG_T_SEQ"  MINVALUE 1 MAXVALUE 1000000000000000000000000000 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_HOLD_PURCHASE_INSTID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_HOLD_PURCHASE_INSTID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_HOLD_PURCHASE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_HOLD_PURCHASE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 4123 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INVOCE_BS_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INVOCE_BS_T_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INVOCE_B_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INVOCE_B_T_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INVOICE_CHECKS_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INVOICE_CHECKS_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INVOICE_EXPLICIT_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INVOICE_EXPLICIT_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INVOICE_HISTORY_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INVOICE_HISTORY_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INVOICE_IDENTIFIER_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INVOICE_IDENTIFIER_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 7 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INVOICE_IMPLICIT_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INVOICE_IMPLICIT_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INVOICE_ITEMS_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INVOICE_ITEMS_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INVOICE_MERGE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INVOICE_MERGE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INVOICE_QUEUE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INVOICE_QUEUE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INVOICE_REVERSAL_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INVOICE_REVERSAL_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INVOICE_RULES_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INVOICE_RULES_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INVOICE_RULE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INVOICE_RULE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INVOICE_SUMMARY_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INVOICE_SUMMARY_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INVOICE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INVOICE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INV_CREDIT_TRANSFER_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INV_CREDIT_TRANSFER_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_INV_IMPLICIT_INST_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_INV_IMPLICIT_INST_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_LOC_SUMMARY_QUEUE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_LOC_SUMMARY_QUEUE_T_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_LOC_SUM_QUEUE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_LOC_SUM_QUEUE_T_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_NOTIFICATION_ACCOUNT_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_NOTIFICATION_ACCOUNT_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_NOTIFICATION_RECORD_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_NOTIFICATION_RECORD_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_PAYMENT_ITEMS_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_PAYMENT_ITEMS_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_PORTAL_CM_ITEM_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_PORTAL_CM_ITEM_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_PORTAL_OPERATIONS_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_PORTAL_OPERATIONS_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_PORTAL_PAYMENT_ITEM_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_PORTAL_PAYMENT_ITEM_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_PORTAL_WRITEOFF_ITEM_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_PORTAL_WRITEOFF_ITEM_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_POST_PM_ACC_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_POST_PM_ACC_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_PRINT_QUEUE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_PRINT_QUEUE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_REACTIVATE_CREDIT_ITEM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_REACTIVATE_CREDIT_ITEM_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 261 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_REACTIVATE_CREDIT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_REACTIVATE_CREDIT_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 281 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_REBILL_QUEUE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_REBILL_QUEUE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_SITE_INSTALL_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_SITE_INSTALL_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_TAX_EXEMPT_STATES_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_TAX_EXEMPT_STATES_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_TERMINATE_REVIVE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_TERMINATE_REVIVE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_TIERED_PM_INFO_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_TIERED_PM_INFO_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_TIERED_PM_RATE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_TIERED_PM_RATE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_TIERED_PM_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_TIERED_PM_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_UPFRONT_INVOICE_DEAL_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_UPFRONT_INVOICE_DEAL_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_UPFRONT_INVOICE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_UPFRONT_INVOICE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_WRITEOFF_ITEM_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_WRITEOFF_ITEM_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_WRITEOFF_QUEUE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_WRITEOFF_QUEUE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_WRITE_OFF_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_WRITE_OFF_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ENT_XLS_OPERATION_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."ENT_XLS_OPERATION_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence EVENT_NOTIFY_RECORD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."EVENT_NOTIFY_RECORD_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 11457434 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence FAPPURCHASESEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."FAPPURCHASESEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 19417068 CACHE 30 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence GATEWAY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."GATEWAY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNSPAYINFOHISTORY_ID_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNSPAYINFOHISTORY_ID_SEQUENCE"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 208542 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_ACCOUNT_TOKEN_MAP_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_ACCOUNT_TOKEN_MAP_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 30 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_AUTHORIZE_CC_RESP_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_AUTHORIZE_CC_RESP_T_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 35226 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BILLING_VOIP_WO_MSG_REQ_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BILLING_VOIP_WO_MSG_REQ_T_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BILL_MONITOR_HST_ID_S
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BILL_MONITOR_HST_ID_S"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 122893 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BILL_MONITOR_LOGIN_ID_S
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BILL_MONITOR_LOGIN_ID_S"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BILL_MONITOR_MON_ID_S
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BILL_MONITOR_MON_ID_S"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BILL_MONITOR_RL_FT_ID_S
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BILL_MONITOR_RL_FT_ID_S"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BILL_MONITOR_ROLE_ID_S
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BILL_MONITOR_ROLE_ID_S"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BILL_MONITOR_SUB_ID_S
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BILL_MONITOR_SUB_ID_S"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 141 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BRT_DEAL_PURCHASE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BRT_DEAL_PURCHASE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 10644182 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BRT_FILE_ITEM_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BRT_FILE_ITEM_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 15747417 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BRT_FILE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BRT_FILE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3812 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BRT_OVG_FILE_ITEM_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BRT_OVG_FILE_ITEM_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BRT_PORTOUT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BRT_PORTOUT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4274 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BRT_SCRIPT_LAST_RUN_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BRT_SCRIPT_LAST_RUN_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 2442 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BRT_ZERO_BILL_CYCLE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BRT_ZERO_BILL_CYCLE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2051283 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BULK_HOLD_ACTION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BULK_HOLD_ACTION_SEQ"  MINVALUE 0 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BULK_REACTIVATE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BULK_REACTIVATE_T_SEQ"  MINVALUE 1 MAXVALUE 1000000000000000000000000000 INCREMENT BY 1 START WITH 172 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BUSINESS_PROCESS_RESOURCE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BUSINESS_PROCESS_RESOURCE_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 100001 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_BUSINESS_PROCESS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_BUSINESS_PROCESS_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 100001 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_COLL_BNCE_DET_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_COLL_BNCE_DET_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 22 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_COLL_BNCE_FILE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_COLL_BNCE_FILE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_COLL_SETL_ADJUST_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_COLL_SETL_ADJUST_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1937 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_COLL_SETL_DET_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_COLL_SETL_DET_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2151 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_COLL_SETL_FILE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_COLL_SETL_FILE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 326 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_COLL_SETL_ITEM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_COLL_SETL_ITEM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3756 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_COMMITMENT_INFO_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_COMMITMENT_INFO_T_SEQ"  MINVALUE 1 MAXVALUE 1000000000000000000000000000 INCREMENT BY 1 START WITH 6362390 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_CON_DBI_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_CON_DBI_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 19226393 CACHE 30 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_CON_TNM_PURCHASE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_CON_TNM_PURCHASE_SEQ"  MINVALUE 1 MAXVALUE 1000000000000000000000000000 INCREMENT BY 1 START WITH 35801 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_CRM_TNM_NOTE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_CRM_TNM_NOTE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 15478 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_DATAFAST_REC_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_DATAFAST_REC_ID_SEQ"  MINVALUE 1 MAXVALUE 1000000000 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_DBI_CREATE_ACCOUNT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_DBI_CREATE_ACCOUNT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999 INCREMENT BY 1 START WITH 341 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_DBI_CRE_ACCOUNT_THREAD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_DBI_CRE_ACCOUNT_THREAD_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 341 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_DBI_FILE_INFO_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_DBI_FILE_INFO_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_DBI_PO_ORDER_SEQUENCE
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_DBI_PO_ORDER_SEQUENCE"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_DBI_PURCHASE_SO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_DBI_PURCHASE_SO_SEQ"  MINVALUE 1 MAXVALUE 500000 INCREMENT BY 1 START WITH 501 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_DEVICE_COUNT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_DEVICE_COUNT_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_DISPUTED_ORDER_RECORD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_DISPUTED_ORDER_RECORD_SEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_DSS_AUDIT_DATA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_DSS_AUDIT_DATA_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 36694770 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_EBRM_ACT_REC_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_EBRM_ACT_REC_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 634961 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_EMB_DUNNING_RECV_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_EMB_DUNNING_RECV_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_EMB_DUNNING_SEND_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_EMB_DUNNING_SEND_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 4103437 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_EMB_DUNNING_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_EMB_DUNNING_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 4232297 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_EMD_FILE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_EMD_FILE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3756 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_EMD_PRINT_DUNN_RESP_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_EMD_PRINT_DUNN_RESP_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2134274 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_EMD_PRINT_INV_RESP_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_EMD_PRINT_INV_RESP_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 8430361 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_EXCLUDE_CHURN_REC_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_EXCLUDE_CHURN_REC_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 189375 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_FINANCIAL_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_FINANCIAL_SEQ"  MINVALUE 1 MAXVALUE 1000000000000000000000000000 INCREMENT BY 1 START WITH 578225853 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_FIN_ASSIST_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_FIN_ASSIST_SEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_HOLD_INV_PYMT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_HOLD_INV_PYMT_SEQ"  MINVALUE 0 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_INFOST_TERM_NOT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_INFOST_TERM_NOT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 140 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_LOCKBOX_BOUNCE_DETS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_LOCKBOX_BOUNCE_DETS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 547 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_LOCKBOX_BOUNCE_FILES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_LOCKBOX_BOUNCE_FILES_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 239 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_LUT_REQUEST_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_LUT_REQUEST_T_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 54 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_LUT_RESPONSE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_LUT_RESPONSE_T_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_MANAGE_MAPPING_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_MANAGE_MAPPING_T_SEQ"  MINVALUE 1 MAXVALUE 1000000000000000000000000000 INCREMENT BY 1 START WITH 1558 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_NCTUE_REPORT_RUN_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_NCTUE_REPORT_RUN_T_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 74 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_PAYMENTECH_BIN_FILE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_PAYMENTECH_BIN_FILE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 16 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_PRINT_INV_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_PRINT_INV_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 224 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_PROFILE_GC_AUDIT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_PROFILE_GC_AUDIT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 48886 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_PYMTECH_DISP_DET_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_PYMTECH_DISP_DET_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 664352 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_PYMTECH_DISP_REVIEW_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_PYMTECH_DISP_REVIEW_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_PYMTECH_DISP_SUMM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_PYMTECH_DISP_SUMM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 9008 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_SAP_REFUND_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_SAP_REFUND_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1302 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_SITE_TYPE_LOC_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_SITE_TYPE_LOC_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 95861 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_SME_VOIP_REQUEST_ID
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_SME_VOIP_REQUEST_ID"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 793 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_SOAPUI_EXECUTION_INFO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_SOAPUI_EXECUTION_INFO_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1027 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_SOAPUI_NODE_DISK_INFO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_SOAPUI_NODE_DISK_INFO_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 100321 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_SOAPUI_NODE_INFO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_SOAPUI_NODE_INFO_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 10010 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_SOAPUI_NODE_JBOSS_INFO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_SOAPUI_NODE_JBOSS_INFO_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1000940 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_SOAPUI_NODE_PROCESS_INFO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_SOAPUI_NODE_PROCESS_INFO_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 100195 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_SOAPUI_TEST_RESULTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_SOAPUI_TEST_RESULTS_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 100946 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_SPONSOR_PURCHASE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_SPONSOR_PURCHASE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 164462 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_TRIAL_PERIOD_BAL_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_TRIAL_PERIOD_BAL_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 71941 CACHE 30 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_VOIP_MSG_QUEUE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_VOIP_MSG_QUEUE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 49241 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_VOIP_NOTIFICATION_ID
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_VOIP_NOTIFICATION_ID"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 421501 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_VOIP_REQUEST_ID
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_VOIP_REQUEST_ID"  MINVALUE 0 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1203554 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HNS_VOIP_SSM_TRANSID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HNS_VOIP_SSM_TRANSID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 750818 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence HUGHES_EMAIL_DATA_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."HUGHES_EMAIL_DATA_T_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 53412066 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence LOCKBOX_RECORD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."LOCKBOX_RECORD_SEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 6391047 CACHE 30 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence LOCKBOX_TRANS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."LOCKBOX_TRANS_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 6203857 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence MULTI_INVOICE_DOWNLOAD_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."MULTI_INVOICE_DOWNLOAD_T_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence OBJ_IDS
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."OBJ_IDS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 302029 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence POID_IDS2
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."POID_IDS2"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 7972011542 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence REACTIVATE_CREDIT_ITEM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."REACTIVATE_CREDIT_ITEM_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 38707099 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence REACTIVATE_CREDIT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."REACTIVATE_CREDIT_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 2717927 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FRAUD_CUST_RECID
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."SEQ_FRAUD_CUST_RECID"  MINVALUE 0 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 816 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SERVICE_CREDIT_ID
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."SERVICE_CREDIT_ID"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 1386109 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SPG_MONTHLY_VOIP_STATUS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."SPG_MONTHLY_VOIP_STATUS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1061 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SPG_WEEKLY_VOIP_STATUS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."SPG_WEEKLY_VOIP_STATUS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4521 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence STATUS_CHANGE_BATCH_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."STATUS_CHANGE_BATCH_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 91 CACHE 30 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence STATUS_CHANGE_RECORD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."STATUS_CHANGE_RECORD_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 30 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence STG_SITE_STATUS_COMP_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."STG_SITE_STATUS_COMP_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41390737 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SWITCHTOECHECKSEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."SWITCHTOECHECKSEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 183567 CACHE 30 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SYSTEM_HEALTH_CHECK_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."SYSTEM_HEALTH_CHECK_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 4 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence UPFRONT_CHARGE_TEMP_ACCT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."UPFRONT_CHARGE_TEMP_ACCT_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 2722979 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence VANTIVE_TRANSACTION_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."VANTIVE_TRANSACTION_ID_SEQ"  MINVALUE 1000000 MAXVALUE 1000000000 INCREMENT BY 1 START WITH 3521285 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence VAR_CONTRACT_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."VAR_CONTRACT_ID_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 101 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence VAR_RESIDUALS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."VAR_RESIDUALS_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence VISA_API_REC_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."VISA_API_REC_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1060 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence YAS_FAP_TOKEN_CHECK_NO_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."YAS_FAP_TOKEN_CHECK_NO_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence YAS_FAP_TOKEN_HISTORY_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."YAS_FAP_TOKEN_HISTORY_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence YAS_TOKEN_PAYMENT_QUEUE_T_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PIN"."YAS_TOKEN_PAYMENT_QUEUE_T_SEQ"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 3 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
