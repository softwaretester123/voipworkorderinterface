select * from all_tables;

CREATE SEQUENCE HNS_BILLING_VOIP_WO_MSG_REQ_T_SEQ
 START WITH     1
 INCREMENT BY   1
 NOCACHE
 NOCYCLE;

DROP SEQUENCE HNS_BILLING_VOIP_WO_MSG_REQ_T_SEQ;

select HNS_BILLING_VOIP_WO_MSG_REQ_T_SEQ.nextval from dual;

CREATE TABLE "HNS_BILLING_VOIP_WO_MSG_REQ_T" 
   (
	"ID" NUMBER PRIMARY KEY, -- create sequence
	"TRANSACTION_SEQUENCE_ID" VARCHAR(60) , -- TransactionSequenceId 
		-- format in request : "POP2021-03-19T08:41:24.903Z"
	"TRANSACTIONDATETIME" TIMESTAMP(6), --TransactionDateTime (Request timestamp in yyyy-MM-dd'T'HH:mm:ss.SSS'Z' format) [2021-03-19T08:41:24.903Z]
	"CREATED_T" NUMBER(38),  -- Billing Pvt 
	"MESSAGE_NAME" VARCHAR2(60 BYTE),  --VoIPWorkOrder
	"MSG_SOURCE" VARCHAR2(20), -- DSS
	"SAN" VARCHAR2(60 BYTE), 
	"WORKORDERTYPE" VARCHAR2(10), -- A/CAN 
	--"STATUS" VARCHAR2(10),  -- true/false (P, F, D) 
	--"STATE"	 NUMBER,	-- 1= Landed; 2 = Validation OK ; 3 = Validation KO ; 4 = SP Called KO ; 
	"REMARKS" VARCHAR2(255), -- Error desc/other remarks (verify length from HNS_VOIP_REQUEST_T),
	"CONSUMED_PAYLOAD" CLOB

);

CREATE TABLE "HNS_BILLING_VOIP_WO_MSG_RES_T" 
   (
	"REQ_ID" NUMBER,  -- ID from HNS_BILLING_VOIP_WO_MSG_REQ_T
	"TRANSACTIONDATETIME" TIMESTAMP(6), --TransactionDateTime (Response timestamp in yyyy-MM-dd'T'HH:mm:ss.SSS'Z' format)
	"CREATED_T" NUMBER(38),  -- Billing Pvt 
	"MESSAGE_NAME" VARCHAR2(60 BYTE),  --VoIPWorkOrderAckMsg
	"MSG_DESTINATION" VARCHAR2(20), -- DSS
	--"STATUS" VARCHAR2(10),  -- true/false (P, F, D)
	--"STATE"	 NUMBER,	-- 1= Landed; 2 = Validation OK ; 3 = Validation KO ; 4 = SP Called OK ; 5 = SP Called KO; 6 = Response Sent;
		-- "6 = Response Sent"
	"REMARKS" VARCHAR2(255), -- Error desc/other remarks (verify length from HNS_VOIP_REQUEST_T),
	"PUBLISHED_PAYLOAD" CLOB -- Json response
);

commit;

select * from HNS_BILLING_VOIP_WO_MSG_REQ_T;

select * from HNS_BILLING_VOIP_WO_MSG_RES_T;

delete from HNS_BILLING_VOIP_WO_MSG_REQ_T where id > 0;

drop table HNS_BILLING_VOIP_WO_MSG_REQ_T;

drop table HNS_BILLING_VOIP_WO_MSG_RES_T;

describe HNS_BILLING_VOIP_WO_MSG_REQ_T;

select * from HNS_VOIP_REQUEST_T where san='DSS200197435';

delete from HNS_VOIP_REQUEST_T where san = 'DSS200197435';

select * from HNS_VOIP_ACTIVATION_STATUS_T where san='DSS200197435';

delete from HNS_VOIP_ACTIVATION_STATUS_T where san = 'DSS200197435';
