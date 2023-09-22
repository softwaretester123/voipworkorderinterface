--------------------------------------------------------
--  File created - Friday-September-22-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View ACCOUNT_PRODUCTS_T
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."ACCOUNT_PRODUCTS_T" ("OBJ_ID0", "CREATED_T", "CYCLE_DISCOUNT", "CYCLE_DISC_AMT", "CYCLE_FEE_AMT", "CYCLE_END_T", "CYCLE_START_T", "DEAL_OBJ_DB", "DEAL_OBJ_ID0", "DEAL_OBJ_TYPE", "DEAL_OBJ_REV", "DESCR", "FLAGS", "MMC_TYPE", "PLAN_OBJ_DB", "PLAN_OBJ_ID0", "PLAN_OBJ_TYPE", "PLAN_OBJ_REV", "PRODUCT_OBJ_DB", "PRODUCT_OBJ_ID0", "PRODUCT_OBJ_TYPE", "PURCHASE_DISCOUNT", "PURCHASE_DISC_AMT", "PURCHASE_FEE_AMT", "PURCHASE_END_T", "PURCHASE_START_T", "QUANTITY", "SERVICE_OBJ_DB", "SERVICE_OBJ_ID0", "SERVICE_OBJ_TYPE", "SERVICE_OBJ_REV", "SPONSOR_OBJ_DB", "SPONSOR_OBJ_ID0", "SPONSOR_OBJ_TYPE", "SPONSOR_OBJ_REV", "STATUS", "STATUS_FLAGS", "USAGE_DISCOUNT", "USAGE_END_T", "USAGE_START_T", "CYCLE_FEE_FLAGS", "LAST_MODIFIED_T", "NODE_LOCATION", "OFFERING_OBJ_ID0", "PACKAGE_ID") AS 
  select account_obj_id0 as obj_id0, 
created_t,
p.cycle_discount,
P.CYCLE_DISC_AMT,
P.CYCLE_FEE_AMT,
P.CYCLE_END_T,
P.CYCLE_START_T,
P.DEAL_OBJ_DB,
P.DEAL_OBJ_ID0,
P.DEAL_OBJ_TYPE,
P.DEAL_OBJ_REV,
P.DESCR,
P.FLAGS,
P.MMC_TYPE,
P.PLAN_OBJ_DB,
P.PLAN_OBJ_ID0,
P.PLAN_OBJ_TYPE,
P.PLAN_OBJ_REV,
P.PRODUCT_OBJ_DB,
P.PRODUCT_OBJ_ID0,
P.PRODUCT_OBJ_TYPE,
P.PURCHASE_DISCOUNT,
P.PURCHASE_DISC_AMT,
P.PURCHASE_FEE_AMT,
P.PURCHASE_END_T,
P.PURCHASE_START_T,
P.QUANTITY,
P.SERVICE_OBJ_DB,
P.SERVICE_OBJ_ID0,
P.SERVICE_OBJ_TYPE,
P.SERVICE_OBJ_REV,
P.SPONSOR_OBJ_DB,
P.SPONSOR_OBJ_ID0,
P.SPONSOR_OBJ_TYPE,
P.SPONSOR_OBJ_REV,
P.STATUS,
P.STATUS_FLAGS,
P.USAGE_DISCOUNT,
P.USAGE_END_T,
P.USAGE_START_T,
P.CYCLE_FEE_FLAGS,
P.MOD_T AS LAST_MODIFIED_T,
P.NODE_LOCATION,
P.POID_ID0 AS OFFERING_OBJ_ID0,
P.PACKAGE_ID from purchased_product_t p
;
--------------------------------------------------------
--  DDL for View ACTIVATION_REPORT_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."ACTIVATION_REPORT_VW" ("GLID_DESCR", "GL_SEGMENT", "GL_ID", "AMOUNT", "DT") AS 
  SELECT /*+ ordered use_nl(eb) */ cg.DESCR, a.GL_SEGMENT,cg.REC_ID,  eb.AMOUNT, i.EFFECTIVE_T 
FROM CONFIG_GLID_T cg, EVENT_BAL_IMPACTS_T eb,ITEM_T i, ACCOUNT_T a 
WHERE eb.ITEM_OBJ_ID0 = i.POID_ID0 
AND eb.ACCOUNT_OBJ_ID0 = a.POID_ID0 
AND SUBSTR(eb.GL_ID,6,8) = SUBSTR(cg.REC_ID,1,3) 
AND eb.GL_ID!=0 AND eb.resource_id=840 AND eb.amount <> 0 
AND (cg.DESCR LIKE '%HW Upfront%' OR cg.DESCR LIKE '%HW Act%')

;
--------------------------------------------------------
--  DDL for View BILLING_ADJUSTMENTS_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_ADJUSTMENTS_VW" ("ACCOUNT_OBJ_ID0", "ADJUSTMENT_MONTH", "ITEM_TOTAL") AS 
  SELECT account_obj_id0, TO_CHAR(INFRANET_TO_DATE(I.EFFECTIVE_T),'MM/YYYY') Adjustment_month,sum(ITEM_TOTAL) item_total FROM ITEM_T I WHERE POID_TYPE = '/item/adjustment' GROUP BY ACCOUNT_OBJ_ID0, 
TO_CHAR(INFRANET_TO_DATE(EFFECTIVE_T),'MM/YYYY')
;
--------------------------------------------------------
--  DDL for View BILLING_BALANCE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_BALANCE_VW" ("ACCOUNT_OBJ_ID0", "OBJ_ID0", "REC_ID", "REC_ID2", "VALID_FROM", "VALID_TO", "CURRENT_BAL", "CONTRIBUTOR", "ROLLOVER_DATA", "NEXT_BAL", "DELAYED_BAL") AS 
  select G.ACCOUNT_OBJ_Id0, S."OBJ_ID0",S."REC_ID",S."REC_ID2",S."VALID_FROM",S."VALID_TO",S."CURRENT_BAL",S."CONTRIBUTOR",S."ROLLOVER_DATA",S."NEXT_BAL",S."DELAYED_BAL" from BAL_GRP_SUB_BALS_T s,  BAL_GRP_T g 
where 
g.poid_Id0 = s.obj_id0 and 
s.VALID_TO = 0
;
--------------------------------------------------------
--  DDL for View BILLING_BILL_CITY_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_BILL_CITY_VW" ("POID_ID0", "BILL_CITY_POID", "CITY", "STATE", "ZIP") AS 
  SELECT A.POID_ID0, DECODE(A.PARENT_ID0,0,A.POID_ID0,A.PARENT_ID0)BILL_CITY_POID, AN.CITY, AN.STATE, AN.ZIP 
FROM ACCOUNT_T A, ACCOUNT_NAMEINFO_T AN 
WHERE AN.OBJ_ID0 = DECODE(A.PARENT_ID0,0,A.POID_ID0,A.PARENT_ID0)

;
--------------------------------------------------------
--  DDL for View BILLING_BILL_TYPE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_BILL_TYPE_VW" ("ACCNODASHES", "ACCOUNT_NO", "REFERENCE", "POID_ID0", "BILL_TYPE", "MODIFIED", "STATUS") AS 
  select REPLACE(ACCOUNT_NO,'-','')ACCNODASHES, ACCOUNT_NO,  replace(account_no,'-','')  ||'H'|| to_char(infranet_to_date(p.mod_t),'mm/dd/yyyy') REFERENCE,TO_CHAR(a. poid_id0) POID_ID0, b.pay_type bill_type,to_date(to_char(infranet_to_date(p.mod_t),'mm/dd/yyyy'),'mm/dd/yyyy')  modified,a.status  from account_t a, pin.billinfo_t b, payinfo_t p where a.poid_Id0 = b.account_obj_Id0 and b.payinfo_obj_id0 = p.poid_id0 and p.account_obj_id0 = a.poid_id0 and b.payinfo_obj_type = '/payinfo/internal'
;
--------------------------------------------------------
--  DDL for View BILLING_CCN_CUSTOMERS_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_CCN_CUSTOMERS_VW" ("HNS_CCN_NUMBER", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", "COMPANY", "ADDRESS", "CITY") AS 
  select HPC.HNS_CCN_NUMBER, AN.FIRST_NAME, AN.MIDDLE_NAME, AN.LAST_NAME, AN.COMPANY, AN.ADDRESS, AN.CITY 
from hns_profile_customer_t HPC, PROFILE_T P, ACCOUNT_NAMEINFO_T AN 
WHERE 
SUBSTR(HNS_CCN_NUMBER,1,1) = 2 AND 
P.POID_ID0 = HPC.OBJ_ID0 AND 
P.ACCOUNT_OBJ_ID0 = AN.OBJ_ID0

;
--------------------------------------------------------
--  DDL for View BILLING_CC_TYPE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_CC_TYPE_VW" ("OBJ_ID0", "CARD_TYPE") AS 
  select p.obj_id0, 
decode(c.debit_num,'','UNKNOWN',decode(substr(c.debit_num,1,1),'3','AMEX','6','DISC','4','VISA','MC')) as card_type 
FROM (select ep.obj_id0, ep.trans_id from event_billing_payment_t ep,event_billing_payment_cc_t epc where 
ep.obj_id0 = epc.obj_id0 and epc.result = 0 and ep.command <> 2 and auth_code <> 'pinXXX') p, 
(select * from event_billing_charge_t ec, event_billing_charge_cc_t ecc 
where ec.obj_id0 = ecc.obj_id0 and ec.command <> 2) c 
WHERE 
p.TRANS_id = c.trans_id (+)

;
--------------------------------------------------------
--  DDL for View BILLING_CHARGEBACK_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_CHARGEBACK_VW" ("ACCOUNT_OBJ_ID0", "EFFECTIVE_T", "POID_TYPE", "LOGIN", "STATUS", "AMOUNT", "DISPUTED") AS 
  SELECT I.ACCOUNT_OBJ_ID0,TO_CHAR(INFRANET_TO_DATE(I.MOD_T),'MM/DD/YYYY')EFFECTIVE_T, I.POID_TYPE, S.LOGIN, 
DECODE(ADJUSTED,0,DECODE(I.POID_TYPE,'/item/dispute','Opened','/item/settlement','Won','Unsettled'),'Lost') Status, 
DECODE(ADJUSTED,0,I.ITEM_TOTAL,ADJUSTED) Amount, I.DISPUTED 
FROM SERVICE_T S, ITEM_T I, (SELECT DISTINCT(ACCOUNT_OBJ_ID0) FROM ITEM_T WHERE POID_TYPE = '/item/dispute') DC 
WHERE 
DC.ACCOUNT_OBJ_ID0 = I.ACCOUNT_OBJ_ID0 AND 
S.ACCOUNT_OBJ_ID0 = I.ACCOUNT_OBJ_ID0 AND 
((I.ADJUSTED <> 0 AND NOT(I.POID_TYPE = '/item/payment') and NOT(I.POID_TYPE = '/item/refund')) or 
I.POID_TYPE = '/item/dispute' or 
(i.poid_type = '/item/settlement' AND I.ITEM_TOTAL <> 0) 
OR I.DISPUTED <> 0) AND 
ADJUSTED >= 0
;
--------------------------------------------------------
--  DDL for View BILLING_COLLECTION_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_COLLECTION_VW" ("ACCOUNT_NO", "LOGIN", "NAME", "END_OF_PERIOD", "PLAN_AND_USAGE", "ADJUSTMENTS", "TAXES", "PAYMENTS", "TOTAL_FEE") AS 
  SELECT A.ACCOUNT_NO,S.LOGIN,HAD.NAME,INFRANET_TO_DATE(I.EFFECTIVE_T) End_of_Period, SUM(DECODE(I.POID_TYPE,'/item/cycle_arrear',I.ITEM_TOTAL,'/item/usage',I.ITEM_TOTAL,'/item/cycle_forward',I.ITEM_TOTAL,0)) Plan_and_Usage, 
SUM(DECODE(I.POID_TYPE,'/item/adjustment',I.ITEM_TOTAL,0)) Adjustments, SUM(DECODE(I.POID_TYPE,'/item/taxes',I.ITEM_TOTAL,0)) Taxes,                          SUM(DECODE(I.POID_TYPE,'/item/payment',I.ITEM_TOTAL,'/item/payment/reversal',I.ITEM_TOTAL,0)) Payments, SUM(I.ITEM_TOTAL) Total_Fee 
FROM ITEM_T I,  ACCOUNT_NAMEINFO_T AN, SERVICE_T S, ACCOUNT_T A, HNS_ACCOUNT_DEAL_VW HAD 
WHERE 
A.POID_ID0 = S.ACCOUNT_OBJ_ID0 AND 
AN.OBJ_ID0 = I.ACCOUNT_OBJ_ID0 AND 
I.ACCOUNT_OBJ_ID0 = S.ACCOUNT_OBJ_ID0 AND 
I.POID_TYPE NOT LIKE '/item/misc' AND 
I.POID_TYPE NOT LIKE '/item/refund' AND 
I.ITEM_TOTAL <> 0  AND 
HAD.OBJ_ID0 = A.POID_ID0 
GROUP BY A.ACCOUNT_NO,S.LOGIN, HAD.NAME,INFRANET_TO_DATE(i.effective_T)
;
--------------------------------------------------------
--  DDL for View BILLING_COMMITMENT_TERM_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_COMMITMENT_TERM_VW" ("POID_ID0", "NAME", "TERM") AS 
  select d.poId_Id0,d.name, max(rq.STEP_MAX) AS TERM from deal_t d, deal_products_t dp, 
rate_plan_t rp, rate_t r, RATE_QUANTITY_TIERS_T rq 
where 
d.poid_Id0 = dp.obj_Id0 and 
permitted = '/service/commitment' and 
dp.PRODUCT_OBJ_ID0 = rp.PRODUCT_OBJ_ID0 and 
r.RATE_PLAN_OBJ_ID0 = rp.poid_Id0 and 
r.poid_id0 = rq.obj_id0 AND 
STEP_MAX IS NOT NULL 
group by D.POID_iD0,d.name
;
--------------------------------------------------------
--  DDL for View BILLING_COMMITMENT_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_COMMITMENT_VW" ("DEAL_ID", "COMMITMENT") AS 
  select DP.OBJ_iD0 DEAL_ID,MAX(RQ.STEP_MAX) AS COMMITMENT from
DEAL_PRODUCTS_T DP,
PRODUCT_T P,RATE_PLAN_T RP, RATE_T R, RATE_QUANTITY_TIERS_T RQ
WHERE
DP.PRODUCT_OBJ_ID0 = P.POID_ID0 AND
RP.PRODUCT_OBJ_ID0 = P.POID_ID0 AND
RP.POID_iD0 = R.RATE_PLAN_OBJ_ID0 AND
R.POID_ID0 = RQ.OBJ_ID0 and
STEP_RESOURCE in (1000008,10000070,1000099,10000073)
HAVING MAX(RQ.STEP_MAX) IS NOT NULL
GROUP BY DP.OBJ_iD0
;
--------------------------------------------------------
--  DDL for View BILLING_DEALFEE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_DEALFEE_VW" ("POID_ID0", "FEE", "OTHERFEES", "NAME", "DESCRIPTION", "PERMITTED", "MINIMUM", "MAXIMUM") AS 
  SELECT 
D.POID_ID0, 
SUM(Fee) FEE, 
SUM(OtherFees) OTHERFEES, 
D.NAME, 
SUBSTR(D.DESCR,DECODE(INSTR(D.DESCR,')'),0,0,INSTR(D.DESCR,')')+2), LENGTH(D.DESCR)) Description, 
D.PERMITTED, 
MIN(MINIMUM) MINIMUM, 
MAX(MAXIMUM) MAXIMUM 
FROM 
DEAL_T D, 
DEAL_PRODUCTS_T DP, 
(SELECT P.POID_ID0, P.NAME, MAX(DECODE(instr(RP.EVENT_TYPE,'cycle'),0,0,RBI.SCALED_AMOUNT+RBI.FIX_AMOUNT)) Fee, 
MAX(DECODE(instr(RP.EVENT_TYPE,'cycle'),0,RBI.SCALED_AMOUNT,0)) OtherFees,  MIN(MINIMUM) MINIMUM, MAX(MAXIMUM) MAXIMUM 
FROM RATE_T R,  RATE_BAL_IMPACTS_T RBI, RATE_PLAN_T RP, PRODUCT_T P, 
(SELECT OBJ_ID0, MIN(STEP_MIN) MINIMUM, MAX(STEP_MAX) MAXIMUM FROM RATE_QUANTITY_TIERS_T GROUP BY OBJ_ID0) RQ 
WHERE RBI.OBJ_ID0 = R.POID_ID0 AND  ELEMENT_ID = 840 AND (rp.event_type like '/event/billing/product/fee%'or 
rp.event_type like '/event/session/%' AND  RP.EVENT_TYPE NOT LIKE '/event/session/dur') and R.RATE_PLAN_OBJ_ID0 = RP.POID_ID0 AND 
RP.PRODUCT_OBJ_ID0 = P.POID_ID0 AND  R.POID_iD0 = RQ.OBJ_iD0 group by P.POID_ID0, P.NAME) P 
WHERE 
D.POID_ID0 = DP.OBJ_ID0 AND 
DP.PRODUCT_OBJ_ID0 = P.POID_ID0 
group by D.POID_ID0,D.NAME, SUBSTR(D.DESCR,DECODE(INSTR(D.DESCR,')'),0,0,INSTR(D.DESCR,')')+2), LENGTH(D.DESCR)),  D.PERMITTED

;
--------------------------------------------------------
--  DDL for View BILLING_DEALS_USED_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_DEALS_USED_VW" ("DEAL_OBJ_ID0") AS 
  SELECT DISTINCT(AP.DEAL_OBJ_ID0) 
FROM ACCOUNT_PRODUCTS_T AP, SERVICE_T S 
WHERE S.ACCOUNT_OBJ_ID0 = AP.OBJ_ID0 AND 
S.STATUS != 10103

;
--------------------------------------------------------
--  DDL for View BILLING_DEAL_CYCLE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_DEAL_CYCLE_VW" ("POID_ID0", "NAME", "EVENT_TYPE", "PERMITTED") AS 
  SELECT D.POID_ID0,D.NAME, event_type, d.permitted 
FROM RATE_T R, RATE_BAL_IMPACTS_T RBI, RATE_PLAN_T RP, PRODUCT_T P, DEAL_T D, 
DEAL_PRODUCTS_T DP 
WHERE RBI.OBJ_ID0 = R.POID_ID0 AND 
ELEMENT_ID = 840 AND 
(rp.event_type like '/event/billing/product/fee%'or 
rp.event_type like '/event/session/%' AND 
RP.EVENT_TYPE NOT LIKE '/event/session/dur') and 
R.RATE_PLAN_OBJ_ID0 = RP.POID_ID0 AND 
RP.PRODUCT_OBJ_ID0 = P.POID_ID0 AND 
DP.PRODUCT_OBJ_ID0 = P.POID_ID0 AND 
DP.OBJ_ID0 = D.POID_ID0 AND 
(D.PERMITTED = '/service/ip' OR 
D.PERMITTED = '/service/provider'or 
D.PERMITTED = '/account' or 
D.PERMITTED = '/service/hardware' OR 
D.PERMITTED = '/service/direcwaywireless') 
group by D.POID_ID0,D.NAME,event_type, d.permitted 
--90783416
;
--------------------------------------------------------
--  DDL for View BILLING_DEAL_PRICE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_DEAL_PRICE_VW" ("POID_ID0", "FEE", "OTHERFEES", "NAME", "DESCRIPTION", "PERMITTED", "MINIMUM", "MAXIMUM", "EVENT_TYPE") AS 
  SELECT D.POID_ID0,
            ROUND (
               SUM (
                  DECODE (dp.CYCLE_DISCOUNT,
                          0, fee,
                          fee - (cycle_discount * fee))),
               2)
               FEE,
            SUM (
               DECODE (dp.PURCHASE_DISCOUNT,
                       0, OtherFees,
                       otherfees - ROUND ( (purchase_discount * otherfees), 2)))
               OTHERFEES,
            D.NAME,
            SUBSTR (
               D.DESCR,
               DECODE (INSTR (D.DESCR, ')'), 0, 0, INSTR (D.DESCR, ')') + 2),
               LENGTH (D.DESCR))
               Description,
            D.PERMITTED,
            MIN (MINIMUM) MINIMUM,
            MAX (MAXIMUM) MAXIMUM,
            event_type
       FROM DEAL_T D,
            DEAL_PRODUCTS_T DP,
            (  SELECT P.POID_ID0,
                      P.NAME,
                      CASE WHEN MAX (
                         DECODE (INSTR (RP.EVENT_TYPE, 'cycle'),
                                 0, 0,
                                 RBI.SCALED_AMOUNT + RBI.FIX_AMOUNT)) = 0 THEN
                                 MIN (
                         DECODE (INSTR (RP.EVENT_TYPE, 'cycle'),
                                 0, 0,
                                 RBI.SCALED_AMOUNT + RBI.FIX_AMOUNT)) ELSE
                                 MAX (
                         DECODE (INSTR (RP.EVENT_TYPE, 'cycle'),
                                 0, 0,
                                 RBI.SCALED_AMOUNT + RBI.FIX_AMOUNT)) END Fee,
                      CASE WHEN MAX (
                         DECODE (INSTR (RP.EVENT_TYPE, 'cycle'),
                                 0, FIX_AMOUNT + RBI.SCALED_AMOUNT,
                                 0)) = 0 THEN
                                 MIN (
                         DECODE (INSTR (RP.EVENT_TYPE, 'cycle'),
                                 0, FIX_AMOUNT + RBI.SCALED_AMOUNT,
                                 0)) ELSE
                                 MAX (
                         DECODE (INSTR (RP.EVENT_TYPE, 'cycle'),
                                 0, FIX_AMOUNT + RBI.SCALED_AMOUNT,
                                 0)) END  OtherFees,
                      rp.EVENT_TYPE,
                      MIN (MINIMUM) MINIMUM,
                      MAX (MAXIMUM) MAXIMUM
                 FROM RATE_T R,
                      RATE_BAL_IMPACTS_T RBI,
                      RATE_PLAN_T RP,
                      PRODUCT_T P,
                      (  SELECT OBJ_ID0,
                                MIN (STEP_MIN) MINIMUM,
                                MAX (STEP_MAX) MAXIMUM
                           FROM RATE_QUANTITY_TIERS_T
                       GROUP BY OBJ_ID0) RQ
                WHERE     RBI.OBJ_ID0 = R.POID_ID0
                      AND ELEMENT_ID = 840
                      AND (   rp.event_type LIKE '/event/billing/product/fee%'
                           OR     rp.event_type LIKE '/event/session/%'
                              AND RP.EVENT_TYPE NOT LIKE '/event/session/dur')
                      AND R.RATE_PLAN_OBJ_ID0 = RP.POID_ID0
                      AND RP.PRODUCT_OBJ_ID0 = P.POID_ID0
                      AND R.POID_iD0 = RQ.OBJ_iD0
             GROUP BY P.POID_ID0, P.NAME, rp.event_type) P
      WHERE D.POID_ID0 = DP.OBJ_ID0 AND DP.PRODUCT_OBJ_ID0 = P.POID_ID0
   GROUP BY d.POID_ID0,
            D.NAME,
            SUBSTR (
               D.DESCR,
               DECODE (INSTR (D.DESCR, ')'), 0, 0, INSTR (D.DESCR, ')') + 2),
               LENGTH (D.DESCR)),
            D.PERMITTED,
            event_type
;
--------------------------------------------------------
--  DDL for View BILLING_DURING_PERIOD_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_DURING_PERIOD_VW" ("LOGIN", "POID_TYPE", "END_OF_PERIOD", "PLAN_FEE", "USAGE", "TAXES", "TOTAL_FEE") AS 
  SELECT S.LOGIN,S.POID_TYPE,TO_DATE(INFRANET_TO_DATE(I.EFFECTIVE_T)) End_of_Period,  
SUM(DECODE(I.POID_TYPE,'/item/cycle_arrear',I.ITEM_TOTAL,'/item/cycle_forward',I.ITEM_TOTAL,0)) Plan_Fee,  
SUM(DECODE(I.POID_TYPE,'/item/usage',I.ITEM_TOTAL,'/item/misc',I.ITEM_TOTAL,0)) Usage,  
SUM(DECODE(I.POID_TYPE,'/item/tax',I.ITEM_TOTAL,0)) Taxes, SUM(I.ITEM_TOTAL) Total_Fee  
FROM ITEM_T I,  SERVICE_T S  
WHERE  
I.ACCOUNT_OBJ_ID0 = S.ACCOUNT_OBJ_ID0 AND --Find CUSTOMER SITE  
I.POID_TYPE NOT LIKE '/item/adjustment%' AND  
I.POID_TYPE NOT LIKE '/item/refund%' AND  
I.POID_TYPE NOT LIKE '/item/payment%' AND  
I.ITEM_TOTAL > 0  
AND s.poid_id0 <> 60394347  
AND s.poid_type <> '/service/activation'  
GROUP BY  S.LOGIN,S.POID_TYPE, I.EFFECTIVE_T

;
--------------------------------------------------------
--  DDL for View BILLING_FREE_SERVICE_IP_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_FREE_SERVICE_IP_VW" ("OBJ_ID0", "DEAL_NAME", "DEAL_DESCRIPTION") AS 
  SELECT OBJ_ID0, BP.NAME, BP.DESCRIPTION FROM ACCOUNT_PRODUCTS_T AP, BILLING_DEAL_PRICE_VW BP 
WHERE 
AP.DEAL_OBJ_ID0 = BP.POID_ID0 AND 
bp.permitted = '/service/ip' AND 
AP.STATUS <> 3 AND 
AP.DEAL_OBJ_iD0 <> 176075285 AND 
(FEE = 0 OR AP.CYCLE_DISCOUNT = 1)
;
--------------------------------------------------------
--  DDL for View BILLING_HISTORY_TWO_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_HISTORY_TWO_VW" ("ACCOUNT_NO", "TRANSACTION_TYPE", "TRANSACTION_DATE", "AMOUNT", "CHILD_SAN") AS 
  SELECT A.ACCOUNT_NO, B.BILL_NO AS TRANSACTION_TYPE, B.END_T AS TRANSACTION_DATE, current_total + subords_total  AS AMOUNT, ACCOUNT_NO AS CHILD_SAN FROM 
BILL_T B, ACCOUNT_T A 
WHERE 
B.ACCOUNT_OBJ_ID0 = A.POID_ID0 AND 
B.PARENT_ID0 = 0 
UNION ALL 
SELECT A.ACCOUNT_NO, I.POID_TYPE AS TRANSACTION_TYPE, I.EFFECTIVE_T AS TRANSACTION_DATE,DUE-ADJUSTED-RECVD+TRANSFERED-WRITEOFF  AS AMOUNT, A2.ACCOUNT_NO AS CHILD_SAN 
FROM ITEM_T I, ACCOUNT_T A, ACCOUNT_T A2 
WHERE 
A.POID_ID0 = I.AR_ACCOUNT_OBJ_ID0 AND 
A2.POID_ID0 = I.ACCOUNT_OBJ_iD0 AND 
(I.BILL_OBJ_ID0 = 0 OR I.AR_BILL_OBJ_ID0 = 0)
;
--------------------------------------------------------
--  DDL for View BILLING_HISTORY_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_HISTORY_VW" ("ACCOUNT_NO", "TRANSACTION_TYPE", "TRANSACTION_DATE", "AMOUNT", "CHILD_SAN", "TRAN_DATE") AS 
  SELECT A.ACCOUNT_NO, B.BILL_NO AS TRANSACTION_TYPE, B.END_T AS TRANSACTION_DATE, B.DUE-B.ADJUSTED-B.RECVD+B.TRANSFERRED-WRITEOFF AS AMOUNT, ACCOUNT_NO AS CHILD_SAN, INFRANET_TO_DATE(B.END_T) TRAN_DATE FROM 
BILL_T B, billinfo_t bI, account_t a 
WHERE 
B.AR_BILLINFO_OBJ_ID0 = BI.POID_iD0 AND 
BI.ACCOUNT_OBJ_iD0 = A.POID_iD0 AND 
B.AR_BILLINFO_OBJ_iD0 = B.BILLINFO_OBJ_ID0 AND 
--(GL_SEGMENT = '.NAD.KU.ENTERPRISE.GOVT.GSC' OR 
--GL_SEGMENT = '.NAD.KA.ENTERPRISE.GOVT.GSC' OR 
--GL_SEGMENT = '.NAD.KU.ENTERPRISE.GOVT.GSE' OR 
--GL_SEGMENT = '.NAD.KA.ENTERPRISE.GOVT.GSE') AND 
B.PARENT_ID0 = 0 
UNION ALL 
SELECT A.ACCOUNT_NO, I.POID_TYPE AS TRANSACTION_TYPE, I.EFFECTIVE_T AS TRANSACTION_DATE,DUE-ADJUSTED-RECVD+TRANSFERED-WRITEOFF  AS AMOUNT, A2.ACCOUNT_NO AS CHILD_SAN, INFRANET_TO_DATE(I.EFFECTIVE_T) TRAN_DATE 
FROM ITEM_T I, ACCOUNT_T A, ACCOUNT_T A2, PIN.BILLINFO_T B 
WHERE 
A.POID_ID0 = B.ACCOUNT_OBJ_ID0 AND 
B.POID_ID0 = I.AR_BILLINFO_OBJ_ID0 AND 
A2.POID_ID0 = I.ACCOUNT_OBJ_iD0 AND 
--(GL_SEGMENT = '.NAD.KU.ENTERPRISE.GOVT.GSC' OR 
--GL_SEGMENT = '.NAD.KA.ENTERPRISE.GOVT.GSC' OR 
--GL_SEGMENT = '.NAD.KU.ENTERPRISE.GOVT.GSE' OR 
--GL_SEGMENT = '.NAD.KA.ENTERPRISE.GOVT.GSE') AND 
(I.BILL_OBJ_ID0 = 0 OR I.AR_BILL_OBJ_ID0 = 0)
;
--------------------------------------------------------
--  DDL for View BILLING_HOME_DEALS_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_HOME_DEALS_VW" ("POID_ID0", "NAME") AS 
  select POID_ID0, NAME from deal_t where name in 
('Coachcom Daily, $3.99', 
'Coachcom Daily, $4.99', 
'Coachcom Monthly, $29.99', 
'Coachcom Weekly, $14.99', 
'Coachcom Weekly, $19.99', 
'Default Plan', 
'Default Plan NC', 
'DIRECWAY 1-Way', 
'DIRECWAY 2-Way Service Upgrade', 
'DIRECWAY Consumer', 
'DIRECWAY Consumer DW6000', 
'DIRECWAY DirecTV 2-Way Service', 
'DIRECWAY Executive Surfer 25 Hour', 
'DIRECWAY Executive Surfer 25 Hour with Dial Account', 
'DIRECWAY Family Surfer', 
'DIRECWAY Family Surfer with Dial Account', 
'DIRECWAY One-Way Service - P', 
'DIRECWAY One-Way with Dial Account - P', 
'DIRECWAY Service', 
'DIRECWAY Two Way Service', 
'DIRECWAY Two Way Service - A', 
'DWW_Adhoc', 
'DWW_subscriprion', 
'Executive Surfer Bundled (G3R)', 
'Executive Surfer Bundled (GE1)', 
'Executive Surfer Unbundled (G3R)', 
'Executive Surfer Unbundled (GE1)', 
'NOW Daily, $4.99', 
'NOW Weekly, $19.99', 
'Powered By Consumer', 
'Powered By Consumer $35', 
'Powered By Consumer $35 (Agreement)', 
'Powered By Consumer $38', 
'Powered By Consumer $45 (Agreement)', 
'Red Technologies Consumer', 
'ThousandTrails Daily, $4.99', 
'ThousandTrails Monthly, $34.99', 
'ThousandTrails Weekly, $14.99', 
'Wi-Fi Access Daily, $3.99', 
'Wi-Fi Access Daily, $4.99', 
'Wi-Fi Access Monthly, $29.99', 
'Wi-Fi Access Weekly, $14.99', 
'DIRECWAY Consumer DW6000 ($45.00)', 
'Family Surfer 100 Bundled (EXP) (G3R)', 
'Wi-Fi Access, $19.99', 
'Wi-Fi Access, $3.99', 
'Wi-Fi Access, $5.99', 
'Wi-Fi Access Subscription, $34.99', 
'DIRECWAY Transaction 2nd Month Free', 
'DIRECWAY Small Office 2nd Month Free', 
'Powered By Consumer $45', 
'DIRECWAY Two Way Service (1st & 2nd Free)', 
'Moon Surfer Volume Based Plan (200 KBPS)', 
'Moon Surfer Hourly (200 KBPS)', 
'Moon Surfer Hourly', 
'Family Surfer 100 Unbundled (GE1)', 
'Basic Megabyte Plan', 
'Basic Hourly Plan', 
'DIRECWAY Two Way Service $59.99 (First Full 2 Months Free)', 
'Powered By Consumer (Agreement B)', 
'Wi-Fi Access, $29.99', 
'WIFI Access Plus', 
'Wi-Fi Access, $11.99', 
'Wi-Fi Access, $22.99', 
'Wi-Fi Access, $2.99', 
'Wi-Fi Access, $39.99', 
'Wi-Fi Access, $8.99', 
'DIRECWAY Business Consumer (Agreement B)', 
'Powered By Consumer $45 (Agreement B)')
;
--------------------------------------------------------
--  DDL for View BILLING_HW_DEAL_MONTHS_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_HW_DEAL_MONTHS_VW" ("DEAL_ID", "NAME", "PERIOD") AS 
  select DP.OBJ_iD0 DEAL_ID,P.NAME, MAX(RQ.STEP_MAX) AS PERIOD from 
DEAL_PRODUCTS_T DP, 
PRODUCT_T P,RATE_PLAN_T RP, RATE_T R, RATE_QUANTITY_TIERS_T RQ 
WHERE 
DP.PRODUCT_OBJ_ID0 = P.POID_ID0 AND 
RP.PRODUCT_OBJ_ID0 = P.POID_ID0 AND 
RP.POID_iD0 = R.RATE_PLAN_OBJ_ID0 AND 
R.POID_ID0 = RQ.OBJ_ID0 and 
STEP_RESOURCE in  (1000008,10000070,1000099) 
HAVING MAX(RQ.STEP_MAX) IS NOT NULL 
GROUP BY  DP.OBJ_iD0,P.NAME, STEP_RESOURCE
;
--------------------------------------------------------
--  DDL for View BILLING_HW_PHONES_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_HW_PHONES_VW" ("ACCOUNT_OBJ_ID0", "HOME", "WORKPHONE") AS 
  SELECT account_obj_id0, DECODE(INSTR(Home,'x'),0,HOME,SUBSTR(HOME,1,INSTR(HOME,'x')-1)) Home,  
DECODE(INSTR(WorkPhone,'x'),0,WorkPhone,SUBSTR(WorkPhone,1,INSTR(WorkPhone,'x')-1)) WorkPhone  
FROM (SELECT obj_id0 account_obj_id0, MAX(DECODE(TYPE,1,phone,'')) home, MAX(DECODE(TYPE,2,phone,'')) workphone  
FROM account_phones_t  
GROUP BY obj_id0)
;
--------------------------------------------------------
--  DDL for View BILLING_INV_FEE_ACCTS_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_INV_FEE_ACCTS_VW" ("ACCOUNT_OBJ_ID0") AS 
  select distinct(obj_id0) account_obj_id0 from account_products_t where 
deal_obj_id0 in (13122,478971725) and status = 1
;
--------------------------------------------------------
--  DDL for View BILLING_LASTPAYMENT_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_LASTPAYMENT_VW" ("ACCOUNT_OBJ_ID0", "LASTPAID") AS 
  select account_obj_id0, max(e.end_t)LastPaid from 
event_t e, event_billing_payment_t ebp, event_billing_payment_cc_t ebpc 
where 
(e.poid_type = '/event/billing/payment/cc' or 
e.poid_type = '/event/billing/adjustment/account' or 
e.poid_type = '/event/billing/adjustment/item' or 
e.poid_type = '/event/billing/writeoff/account' or 
e.poid_type = '/event/billing/writeoff/bill' or 
e.poid_type = '/event/billing/writeoff/item' or 
e.poid_type = '/event/billing/writeoff/tax_account' or 
e.poid_type = '/event/billing/writeoff/tax_bill' or 
e.poid_type = '/event/billing/writeoff/tax_item' or 
e.poid_type = '/event/billing/payment/check') 
and 
e.poid_id0 = ebp.obj_id0 and 
ebp.obj_id0 = ebpc.obj_id0(+) and 
((auth_code != 'pinXXX' and 
ebp.command != 2 and 
ebpc.RESULT = 0 ) or ebpc.RESULT is null) 
group by e.account_obj_id0

;
--------------------------------------------------------
--  DDL for View BILLING_LAST_INVOICE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_LAST_INVOICE_VW" ("ACCOUNT_NUMBER", "LAST_INVOICE") AS 
  SELECT ACCOUNT_NUMBER, MAX(BILL_END) LAST_INVOICE FROM INVOICES 
GROUP BY ACCOUNT_NUMBER
;
--------------------------------------------------------
--  DDL for View BILLING_MODIFIED_PROD_CYCLE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_MODIFIED_PROD_CYCLE_VW" ("ACCOUNT_OBJ_ID0") AS 
  SELECT DISTINCT(OBJ_ID0) AS ACCOUNT_OBJ_ID0 FROM ACCOUNT_PRODUCTS_T AP WHERE 
AP.CYCLE_DISCOUNT = 1 OR 
AP.CYCLE_FEE_AMT <> 0
;
--------------------------------------------------------
--  DDL for View BILLING_PARENTBALANCE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_PARENTBALANCE_VW" ("PARENT", "DUE") AS 
  select a.PARENT, sum(i.due) DUE from item_t i, billing_parent_vw a 
where a.POID_ID0 = i.account_obj_id0 
group by a.parent

;
--------------------------------------------------------
--  DDL for View BILLING_PARENT_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_PARENT_VW" ("PARENT", "POID_ID0") AS 
  SELECT DECODE(GB.PARENTPOID,'',A.POID_ID0,GB.PARENTPOID)PARENT,A.POID_ID0  
FROM (SELECT G.ACCOUNT_OBJ_ID0 PARENTPOID, GB.OBJECT_ID0 ACCOUNT_OBJ_ID0  
FROM GROUP_T G, GROUP_BILLING_MEMBERS_T GB  
WHERE G.POID_ID0 = GB.OBJ_ID0) GB, ACCOUNT_T A  
WHERE A.POID_ID0 = GB.ACCOUNT_OBJ_ID0(+)
;
--------------------------------------------------------
--  DDL for View BILLING_PHONES_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_PHONES_VW" ("OBJ_ID0", "PHONE") AS 
  SELECT DISTINCT(OBJ_ID0), MAX(PHONE) PHONE FROM ACCOUNT_PHONES_T GROUP BY OBJ_ID0
;
--------------------------------------------------------
--  DDL for View BILLING_PLANCODE_AND_FEE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_PLANCODE_AND_FEE_VW" ("PLAN_CODE", "FEE") AS 
  SELECT 
substr(DECODE(SUBSTR(PL.NAME,INSTR(PL.NAME,'(')+1,INSTR(PL.NAME,')')-2),'',D.NAME,SUBSTR(PL.NAME,INSTR(PL.NAME,'(')+1,INSTR(PL.NAME,')')-2)),1,50) plan_code, sum(RBI.SCALED_AMOUNT) Fee 
FROM RATE_T R, RATE_BAL_IMPACTS_T RBI, RATE_PLAN_T RP, PRODUCT_T P, DEAL_T D, 
DEAL_PRODUCTS_T DP, PLAN_SERVICES_T PS, PLAN_T PL 
WHERE RBI.OBJ_ID0 = R.POID_ID0 AND 
ELEMENT_ID = 840 AND 
(rp.event_type like '/event/billing/product/fee%'or 
rp.event_type like '/event/session/%' AND 
RP.EVENT_TYPE NOT LIKE '/event/session/dur') and 
R.RATE_PLAN_OBJ_ID0 = RP.POID_ID0 AND 
RP.PRODUCT_OBJ_ID0 = P.POID_ID0 AND 
DP.PRODUCT_OBJ_ID0 = P.POID_ID0 AND 
DP.OBJ_ID0 = D.POID_ID0 AND 
D.POID_ID0 = PS.DEAL_OBJ_ID0(+) AND 
PS.OBJ_ID0 = PL.POID_ID0(+) AND 
(D.PERMITTED = '/service/ip' OR 
D.PERMITTED = '/service/provider'or 
D.PERMITTED = '/account' or 
D.PERMITTED = '/service/hardware' OR 
D.PERMITTED = '/service/direcwaywireless') AND 
PL.NAME like '%(%' 
group by substr(DECODE(SUBSTR(PL.NAME,INSTR(PL.NAME,'(')+1,INSTR(PL.NAME,')')-2),'',D.NAME,SUBSTR(PL.NAME,INSTR(PL.NAME,'(')+1,INSTR(PL.NAME,')')-2)),1,50)
;
--------------------------------------------------------
--  DDL for View BILLING_PLANFEE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_PLANFEE_VW" ("POID_ID0", "PLANPOID", "PLAN_NAME", "FEE", "OTHERFEES", "NAME", "DESCRIPTION", "FULL_PLAN_NAME", "PERMITTED", "MINIMUM", "MAXIMUM") AS 
  SELECT 
D.POID_ID0, 
Pl.POID_ID0 PlanPoid, 
DECODE(SUBSTR(PL.NAME,INSTR(PL.NAME,'(')+1,INSTR(PL.NAME,')')-2),'',D.NAME,SUBSTR(PL.NAME,INSTR(PL.NAME,'(')+1,INSTR(PL.NAME,')')-2)) Plan_Name, 
SUM(Fee) FEE, 
SUM(OtherFees) OTHERFEES, 
D.NAME, 
SUBSTR(D.DESCR,DECODE(INSTR(D.DESCR,')'),0,0,INSTR(D.DESCR,')')+2), LENGTH(D.DESCR)) Description, 
PL.NAME FULL_PLAN_NAME, 
D.PERMITTED, 
MIN(MINIMUM) MINIMUM, 
MAX(MAXIMUM) MAXIMUM 
FROM 
PLAN_T PL, 
PLAN_SERVICES_T PS, 
DEAL_T D, 
DEAL_PRODUCTS_T DP, 
(SELECT P.POID_ID0, P.NAME, MAX(DECODE(instr(RP.EVENT_TYPE,'cycle'),0,0,RBI.SCALED_AMOUNT+RBI.FIX_AMOUNT)) Fee, 
MAX(DECODE(instr(RP.EVENT_TYPE,'cycle'),0,RBI.SCALED_AMOUNT,0)) OtherFees,rp.EVENT_TYPE,  MIN(MINIMUM) MINIMUM, MAX(MAXIMUM) MAXIMUM 
FROM RATE_T R,  RATE_BAL_IMPACTS_T RBI, RATE_PLAN_T RP, PRODUCT_T P, 
(SELECT OBJ_ID0, MIN(STEP_MIN) MINIMUM, MAX(STEP_MAX) MAXIMUM FROM RATE_QUANTITY_TIERS_T GROUP BY OBJ_ID0) RQ 
WHERE RBI.OBJ_ID0 = R.POID_ID0 AND  ELEMENT_ID = 840 AND (rp.event_type like '/event/billing/product/fee%'or 
rp.event_type like '/event/session/%' AND  RP.EVENT_TYPE NOT LIKE '/event/session/dur') and R.RATE_PLAN_OBJ_ID0 = RP.POID_ID0 AND 
RP.PRODUCT_OBJ_ID0 = P.POID_ID0 AND  R.POID_iD0 = RQ.OBJ_iD0 group by P.POID_ID0, P.NAME, rp.event_type) P 
WHERE 
PL.POID_ID0 = PS.OBJ_ID0 AND 
PS.DEAL_OBJ_ID0 = D.POID_ID0 AND 
D.POID_ID0 = DP.OBJ_ID0 AND 
DP.PRODUCT_OBJ_ID0 = P.POID_ID0 
group by Pl.POID_ID0,D.POID_ID0,SUBSTR(PL.NAME,INSTR(PL.NAME,'(')+1,INSTR(PL.NAME,')')-2) ,D.NAME, SUBSTR(D.DESCR,DECODE(INSTR(D.DESCR,')'),0,0,INSTR(D.DESCR,')')+2), LENGTH(D.DESCR)), PL.NAME, D.PERMITTED
;
--------------------------------------------------------
--  DDL for View BILLING_PLAN_ACTIVE_SITE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_PLAN_ACTIVE_SITE_VW" ("LOGIN", "NAME", "ACCOUNT_OBJ_ID0") AS 
  select distinct(s.login), p.name, s.account_obj_id0 from service_t s, plan_t p, account_products_t ap 
where 
s.account_obj_id0 = ap.obj_id0 and 
ap.PLAN_OBJ_ID0 = p.POID_ID0 AND 
(P.NAME  LIKE '(E%' OR 
P.NAME LIKE '(F%' OR 
P.NAME LIKE '(O%') AND 
NOT(P.NAME LIKE '%U%') AND 
S.STATUS <> 10103

;
--------------------------------------------------------
--  DDL for View BILLING_PLAN_CODES_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_PLAN_CODES_VW" ("PLAN_CODE") AS 
  SELECT 
SUBSTR(PL.NAME,INSTR(PL.NAME,'(')+1,INSTR(PL.NAME,')')-2) PLAN_CODE 
FROM 
PLAN_T PL WHERE 
NAME LIKE '(%'
;
--------------------------------------------------------
--  DDL for View BILLING_PLAN_FEE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_PLAN_FEE_VW" ("POID_ID0", "PLANPOID", "PLAN_NAME", "FEE", "OTHERFEES", "NAME", "DESCRIPTION", "FULL_PLAN_NAME", "PERMITTED", "MINIMUM", "MAXIMUM") AS 
  SELECT 
D.POID_ID0, 
Pl.POID_ID0 PlanPoid, 
DECODE(SUBSTR(PL.NAME,INSTR(PL.NAME,'(')+1,INSTR(PL.NAME,')')-2),'',D.NAME,SUBSTR(PL.NAME,INSTR(PL.NAME,'(')+1,INSTR(PL.NAME,')')-2)) Plan_Name, 
SUM(Fee) FEE, 
SUM(OtherFees) OTHERFEES, 
D.NAME, 
SUBSTR(D.DESCR,DECODE(INSTR(D.DESCR,')'),0,0,INSTR(D.DESCR,')')+2), LENGTH(D.DESCR)) Description, 
PL.NAME FULL_PLAN_NAME, 
D.PERMITTED, 
MIN(MINIMUM) MINIMUM, 
MAX(MAXIMUM) MAXIMUM 
FROM 
PLAN_T PL, 
PLAN_SERVICES_T PS, 
DEAL_T D, 
DEAL_PRODUCTS_T DP, 
(SELECT P.POID_ID0, P.NAME, MAX(DECODE(instr(RP.EVENT_TYPE,'cycle'),0,0,RBI.SCALED_AMOUNT+RBI.FIX_AMOUNT)) Fee, 
MAX(DECODE(instr(RP.EVENT_TYPE,'cycle'),0,RBI.SCALED_AMOUNT,0)) OtherFees,  MIN(MINIMUM) MINIMUM, MAX(MAXIMUM) MAXIMUM 
FROM RATE_T R,  RATE_BAL_IMPACTS_T RBI, RATE_PLAN_T RP, PRODUCT_T P, 
(SELECT OBJ_ID0, MIN(STEP_MIN) MINIMUM, MAX(STEP_MAX) MAXIMUM FROM RATE_QUANTITY_TIERS_T GROUP BY OBJ_ID0) RQ 
WHERE RBI.OBJ_ID0 = R.POID_ID0 AND  ELEMENT_ID = 840 AND (rp.event_type like '/event/billing/product/fee%'or 
rp.event_type like '/event/session/%' AND  RP.EVENT_TYPE NOT LIKE '/event/session/dur') and R.RATE_PLAN_OBJ_ID0 = RP.POID_ID0 AND 
RP.PRODUCT_OBJ_ID0 = P.POID_ID0 AND  R.POID_iD0 = RQ.OBJ_iD0 group by P.POID_ID0, P.NAME) P 
WHERE 
PL.POID_ID0 = PS.OBJ_ID0 AND 
PS.DEAL_OBJ_ID0 = D.POID_ID0 AND 
D.POID_ID0 = DP.OBJ_ID0 AND 
DP.PRODUCT_OBJ_ID0 = P.POID_ID0 
group by Pl.POID_ID0,D.POID_ID0,SUBSTR(PL.NAME,INSTR(PL.NAME,'(')+1,INSTR(PL.NAME,')')-2) ,D.NAME, SUBSTR(D.DESCR,DECODE(INSTR(D.DESCR,')'),0,0,INSTR(D.DESCR,')')+2), LENGTH(D.DESCR)), PL.NAME, D.PERMITTED

;
--------------------------------------------------------
--  DDL for View BILLING_POSSIBLE_MAPPING_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_POSSIBLE_MAPPING_VW" ("COMBO", "GL_SEGMENT", "GL_ID") AS 
  select gl_segment||gl_id combo, gl_segment,gl_id from 
(select distinct gl_segment from account_t) a, 
(select distinct gl_id from rate_bal_impacts_t) g
;
--------------------------------------------------------
--  DDL for View BILLING_PRODUCT_FEE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_PRODUCT_FEE_VW" ("NAME", "POID_ID0", "FEE", "OTHERFEES") AS 
  SELECT 
p.name, 
p.poid_id0, 
sum(DECODE(instr(RP.EVENT_TYPE,'cycle'),0,0,RBI.SCALED_AMOUNT)) Fee,sum(DECODE(instr(RP.EVENT_TYPE,'cycle'),0,RBI.SCALED_AMOUNT,0)) OtherFees 
FROM RATE_T R, RATE_BAL_IMPACTS_T RBI, RATE_PLAN_T RP, PRODUCT_T P, 
(SELECT OBJ_ID0, MIN(STEP_MIN) MINIMUM, MAX(STEP_MAX) MAXIMUM FROM RATE_QUANTITY_TIERS_T GROUP BY OBJ_ID0) RQ 
WHERE RBI.OBJ_ID0 = R.POID_ID0 AND 
ELEMENT_ID = 840 AND 
(rp.event_type like '/event/billing/product/fee%'or 
rp.event_type like '/event/session/%' AND 
RP.EVENT_TYPE NOT LIKE '/event/session/dur') and 
R.RATE_PLAN_OBJ_ID0 = RP.POID_ID0 AND 
RP.PRODUCT_OBJ_ID0 = P.POID_ID0 AND 
(P.PERMITTED = '/service/ip' OR 
P.PERMITTED = '/service/provider'or 
P.PERMITTED = '/account' or 
P.PERMITTED = '/service/hardware' OR 
P.PERMITTED = '/service/direcwaywireless') 
AND R.POID_iD0 = RQ.OBJ_iD0 
group by p.POID_ID0,p.NAME
;
--------------------------------------------------------
--  DDL for View BILLING_RES_DEP_PRODS_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_RES_DEP_PRODS_VW" ("NAME", "POID_ID0", "CREATED") AS 
  SELECT P.NAME, P.POID_ID0, infranet_to_date(P.CREATED_T) Created FROM 
PRODUCT_T P, RATE_PLAN_T RP, 
(SELECT DISTINCT(RATE_PLAN_OBJ_ID0) FROM RATE_T R, RATE_BAL_IMPACTS_T RBI 
WHERE 
R.POID_ID0 = RBI.OBJ_ID0 AND 
RBI.ELEMENT_ID = 840 AND 
STEP_TYPE = 2 AND SCALED_AMOUNT <> 0) RD WHERE 
P.POID_ID0 = RP.PRODUCT_OBJ_ID0 AND 
RP.POID_ID0 = RD.RATE_PLAN_OBJ_ID0 and 
rp.event_type in ('/event/billing/product/fee/cycle/cycle_forward_monthly','/event/billing/product/fee/cycle/cycle_forward_quarterly')
;
--------------------------------------------------------
--  DDL for View BILLING_SERIAL_NUMBER_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_SERIAL_NUMBER_VW" ("POID_ID0", "HNS_SERIAL_NUMBER") AS 
  SELECT A.POID_ID0, HPC.HNS_SERIAL_NUMBER 
FROM HNS_PROFILE_CUSTOMER_T HPC, PROFILE_T P, ACCOUNT_T A 
WHERE HPC.OBJ_ID0 = P.POID_ID0 AND 
A.POID_ID0 = P.ACCOUNT_OBJ_ID0

;
--------------------------------------------------------
--  DDL for View BILLING_SERVICE_MONTHS_PROD_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_SERVICE_MONTHS_PROD_VW" ("POID_ID0", "NAME") AS 
  SELECT DISTINCT P.POID_iD0,P.NAME FROM PRODUCT_T P, RATE_PLAN_T RP, RATE_T R 
WHERE 
P.POID_iD0 = RP.PRODUCT_OBJ_ID0 AND 
R.RATE_PLAN_OBJ_iD0 = RP.POID_iD0 AND 
STEP_RESOURCE = 10000080
;
--------------------------------------------------------
--  DDL for View BILLING_SERVICE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_SERVICE_VW" ("ACCOUNT_OBJ_ID0", "POID_TYPE", "LOGIN", "STATUS", "LASTSTATUS_T", "LASTSTAT_CMNT") AS 
  SELECT s.account_obj_id0,  
SUBSTR(s.svcinfo,INSTR(s.svcinfo,'@',1,1)+1,INSTR(s.svcinfo,'@',1,2)-INSTR(s.svcinfo,'@',1,1)-1) poid_type,  
SUBSTR(s.svcinfo,INSTR(s.svcinfo,'@',1,2)+1,INSTR(s.svcinfo,'@',1,3)-INSTR(s.svcinfo,'@',1,2)-1) login,  
SUBSTR(s.svcinfo,INSTR(s.svcinfo,'@',1,3)+1,INSTR(s.svcinfo,'@',1,4)-INSTR(s.svcinfo,'@',1,3)-1) status,  
TO_NUMBER(SUBSTR(s.svcinfo,INSTR(s.svcinfo,'@',1,4)+1,INSTR(s.svcinfo,'@',1,5)-INSTR(s.svcinfo,'@',1,4)-1)) laststatus_t,  
SUBSTR(s.svcinfo,INSTR(s.svcinfo,'@',1,5)+1) laststat_cmnt  
FROM (SELECT account_obj_id0,  
MAX(LPAD(TO_CHAR(created_t),10,'0')||'@'||poid_type||'@'||login||'@'||status  
||'@'||last_status_t||'@'||NVL(laststat_cmnt,' ')) svcinfo  
FROM SERVICE_T  
WHERE poid_type NOT LIKE '%promotion%'  
GROUP BY account_obj_id0) s

;
--------------------------------------------------------
--  DDL for View BILLING_SITE_DETAIL_CHARGES_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_SITE_DETAIL_CHARGES_VW" ("SITE_ID", "SAN_CREATED_T", "CITY", "STATE", "COUNTRY", "ZIP", "SITE_DETAIL_SEQ_ID", "INVOICE_NUMBER", "DESCRIPTION", "SERVICE_DESCRIPTION", "START_DATE", "END_DATE", "CHARGES", "PO_NUMBER", "CLIN", "TYPE") AS 
  SELECT SITE_ID, SAN_CREATED_T, CITY, STATE, COUNTRY, ZIP, D."SITE_DETAIL_SEQ_ID",D."INVOICE_NUMBER",D."DESCRIPTION",D."SERVICE_DESCRIPTION",D."START_DATE",D."END_DATE",D."CHARGES",D."PO_NUMBER",D."CLIN",D."TYPE" FROM 
HNS_SITE_DETAIL SD,
(SELECT C.SITE_DETAIL_SEQ_ID, 
INVOICE_NUMBER,  DESCRIPTION, SERVICE_DESCRIPTION, START_DATE, END_DATE, CHARGES, PO_NUMBER, CLIN, 'Billing' AS Type  FROM 
HNS_SITE_DETAIL_CHARGES C
UNION
SELECT SITE_DETAIL_SEQ_ID,INVOICE_NUMBER, DESCRIPTION, TAX_TYPE,SYSDATE AS START_DATE, SYSDATE AS END_DATE, CHARGES, 
'' AS PO_NUMBER, '' AS CLIN, 'Tax' as Type FROM  HNS_SITE_DETAIL_TAXES) D
WHERE
SD.INVOICE_NUMBER = D.INVOICE_NUMBER AND
SD.SEQ_ID = D.SITE_DETAIL_SEQ_ID 
;
--------------------------------------------------------
--  DDL for View BILLING_SITE_DETAIL_USAGE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_SITE_DETAIL_USAGE_VW" ("INVOICE_NUMBER", "SITE_ID", "DESCRIPTION", "START_DATE", "CHARGES") AS 
  SELECT d.invoice_number,site_id, description, start_date, charges FROM HNS_SITE_DETAIL  D, HNS_SITE_DETAIL_CHARGES C
WHERE
D.INVOICE_NUMBER = C.INVOICE_NUMBER AND
D.SEQ_ID = C.SITE_DETAIL_SEQ_ID AND
DESCRIPTION in ('VADB Usage - Non Local','VADB Usage - Local') 
;
--------------------------------------------------------
--  DDL for View BILLING_SITE_PLAN_ACTIVE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_SITE_PLAN_ACTIVE_VW" ("LOGIN", "ACCOUNT_OBJ_ID0", "NAME", "DESCR") AS 
  select distinct(s.login), s.account_obj_id0, p.name, p.descr from service_t s, account_products_t ap, plan_t p 
where s.account_obj_id0 = ap.obj_id0 and 
ap.plan_obj_id0 = p.poid_id0 and 
s.STATUS <> 10103

;
--------------------------------------------------------
--  DDL for View BILLING_SITE_SUMMARY_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_SITE_SUMMARY_VW" ("PERMITTED", "INVOICE_NUMBER", "SITE_ID", "DESCRIPTION", "SERVICE_DESCRIPTION", "CHARGES") AS 
  SELECT D.PERMITTED,SD.INVOICE_NUMBER, SD.SITE_ID, SDC.DESCRIPTION, SDC.SERVICE_DESCRIPTION,
SDC.CHARGES  FROM HNS_SITE_DETAIL_CHARGES SDC, 
HNS_SITE_DETAIL SD, DEAL_T D
WHERE
SDC.INVOICE_NUMBER = SD.INVOICE_NUMBER AND
SDC.SITE_DETAIL_SEQ_ID = SD.SEQ_ID AND
SDC.DESCRIPTION = D.NAME 
;
--------------------------------------------------------
--  DDL for View BILLING_TEMP
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_TEMP" ("ACCOUNT_ID") AS 
  select POID_iD0 AS ACCOUNT_ID from account_t where account_no IN 
('RET020AFFB401', 
'RET020B116402', 
'RET020B29AA01', 
'RET020B2A0201', 
'RET020B2A7501', 
'RET020B2AD101', 
'RET020B2ADA01', 
'RET020B2D7101', 
'RET020B647501', 
'RET020BE34203', 
'RET020BFBA801', 
'RET020C037B01', 
'RET020C042401', 
'RET020C046E01', 
'RET020C055001', 
'RET020C37CA01', 
'RET020C388201', 
'RET020C502C01', 
'RET020C50F503', 
'RET020CA93001', 
'RET020CA9B502', 
'RET020CD3ED02', 
'RET020CD46602', 
'RET020CEB5901', 
'RET020F541D01', 
'RET020F5D8801', 
'RET020F6BD401', 
'RET020F708A01', 
'RET020F7D2602', 
'RET02101B6E03', 
'RET02102DCB01', 
'RET02102E5001', 
'RET02102FD602', 
'RET0210301401', 
'RET0210301501', 
'RET0210305001', 
'RET021032ED01', 
'RET0210369601', 
'RET021036CC01', 
'RET021036E101', 
'RET0210868501', 
'RET0211038801', 
'RET02110D4B02', 
'RET02110DC902', 
'RET021111C101', 
'RET0211142001', 
'RET0211146901', 
'RET021117BB01', 
'RET021168A901', 
'RET02119E5301', 
'RET0212D1D002', 
'RET021381B502', 
'SCV020AB5B302', 
'SCV020AC15802', 
'SCV020AEA7B02', 
'SCV020BA1AC02', 
'SCV020C227802', 
'SCV020C742301', 
'SCV020C9AC203', 
'SCV020CB00A02', 
'SCV020D18DB03', 
'SCV020FEB0603', 
'SCV02101BC001', 
'SCV0210322302', 
'SCV0210374803', 
'SCV0210404002', 
'SCV0210510A01', 
'SCV0210B8E102', 
'SCV0210C90403', 
'SCV0210E7C402', 
'SCV0210E8A702', 
'SCV0210E8A801', 
'SCV02110A3C03', 
'SCV02110CDE02', 
'SCV02110D1301', 
'SCV02110D3702', 
'SCV02110D4001', 
'SCV02110D6B01', 
'SCV02110F0801', 
'SCV02110F5701', 
'SCV021117D901', 
'SCV0211390302', 
'SCV02113E0002', 
'SCV0211513D01', 
'SCV0211A8CD03', 
'SCV0211FB9002', 
'SCV02120E9202', 
'SCV02122A2B02', 
'SCV02123D7A03', 
'SCV02123D8E01', 
'SCV02123EC701', 
'SCV021255EE02', 
'SCV0212658501', 
'SCV0212BE7802', 
'SCV0212C40202', 
'SCV0213819401', 
'SCV021381B901', 
'SCV0213820401', 
'SCV021397AC01', 
'SCV021399C601', 
'SCV02139A2101', 
'SCV02139BA501', 
'SCV02139BBB01', 
'SCV02139BE601', 
'SCV02139C2001', 
'SCV0213EB0901', 
'V3005618', 
'V3006363', 
'V3006861', 
'V3008292', 
'V3009952', 
'V3009973', 
'V3011475', 
'V3012361', 
'V3009036', 
'V3005593', 
'SCV0213E7C301', 
'SCV0212CA7A01', 
'SCV0211142E01', 
'SCV02110F5C02', 
'RET0211184B02', 
'RET020F5D3702', 
'RET020F5D3701', 
'RET020D137B01', 
'RET020CD4E502', 
'RET020C4FE501', 
'OPTI0011', 
'OPTLS0', 
'OPTLS008', 
'V3012733', 
'SCV0213998401', 
'V3010415', 
'SCV020B2A3C02', 
'RET020B663902', 
'SCV020BD20401', 
'RET020C36ED03', 
'SCV020C758C03', 
'BIZ020CD37302', 
'SCV0210325D01', 
'RET021032F101', 
'SCV0210E71602', 
'OPT00247', 
'OPT00138', 
'SCV02125CB502', 
'SCV02139BD801', 
'SCV0213C8F201', 
'V3006754', 
'RET020B2A6101', 
'RET020BFD7901', 
'RET020C04BB01', 
'RET020C059301', 
'RET020C661E01', 
'RET020C98F303', 
'RET020CA8C401', 
'RET020CA90001', 
'RET020F486901', 
'RET020F79C805', 
'SCV020FDAA901', 
'SCV02101B4E01', 
'SCV02101BC603', 
'SCV0210BF6902', 
'SCV0212519801', 
'V3006100', 
'RET020B971D02', 
'V3012080', 
'V3016904', 
'RET0210301201', 
'MPN020AC4F501', 
'OPT00142', 
'OPT00164', 
'OPT00170', 
'OPT00189', 
'OPT00201', 
'OPT00243', 
'OPT00251', 
'OPT00255', 
'OPT00258', 
'OPTWI004', 
'RET020AC63D01', 
'RET020ACC3901', 
'OPTLS011', 
'OPTSC013', 
'RET020C052501', 
'RET020C058101', 
'RET020C182504', 
'RET020C1B5101', 
'RET020C1C2C01', 
'RET020C2A8C01', 
'RET020C372B01', 
'RET020C389C01', 
'RET020C38CD01', 
'RET020C454A02', 
'RET020C4D7302', 
'RET020C502701', 
'RET020C506B01', 
'RET020C517901', 
'RET020C6C5803', 
'RET020C7A6602', 
'RET020C98A001', 
'RET020CA89D01', 
'RET020CA89E01', 
'RET020CA8C302', 
'RET020CA8C802', 
'RET020CA8ED02', 
'RET020CA93301', 
'RET020CA97A01', 
'RET020CA98A02', 
'RET020CAA3D01', 
'RET020CAFA402', 
'RET020CAFC104', 
'RET020CDA7801', 
'RET020CDB8003', 
'RET020CE27501', 
'RET020D129501', 
'RET020CA8D701', 
'RET020CA8DE01', 
'RET020CA93701', 
'RET020CA99002', 
'RET020CA9B001', 
'RET020CA9C601', 
'RET020CAE7201', 
'RET020CD83302', 
'RET020F6BF602', 
'RET020F6FD702', 
'RET020FFE7801', 
'RET02101BC401', 
'RET02102E1701', 
'RET02102E3401', 
'RET02102E6501', 
'RET02102F1C01', 
'RET02102F2C01', 
'RET02102F6C01', 
'RET02102F7502', 
'RET02102F7B01', 
'RET02102F8E01', 
'RET02102F9001', 
'RET02102FBC01', 
'RET021030E901', 
'RET0210330102', 
'RET021036BA02', 
'RET02106D6903', 
'RET0210826602', 
'RET0210882601', 
'RET021088B101', 
'RET0210941501', 
'RET0210A08301', 
'RET0210C42401', 
'RET02110B0501', 
'RET02110D5701', 
'RET02110D7801', 
'OPT00174', 
'RET02110E2C01', 
'RET021111EE01', 
'RET0211121401', 
'OPT00215', 
'RET0211284401', 
'RET02114F2202', 
'RET02114FCA01', 
'RET021168D101', 
'RET021169D501', 
'RET02116B5302', 
'RET0211CACB02', 
'RET021242C902', 
'RET021381E601', 
'RET02102FD601', 
'RET020AC4F101', 
'RET020B2B4402', 
'RET020C058E04', 
'RET020CA92801', 
'RET020F546305', 
'RET02102DEE01', 
'RET02102E4301', 
'RET02102F1303', 
'RET02102F3D01', 
'RET02102FBB01', 
'RET0210800302', 
'RET0210909A01', 
'RET0210C41901', 
'RET0210CBEA01', 
'RET02110D8501', 
'RET02110E8801', 
'RET021111B301', 
'RET0211173D01', 
'RET021117A501', 
'RET0211284601', 
'RET02123DD302', 
'RET021381CC01', 
'BIZ020C18CC03', 
'BIZ020D17D902', 
'BIZ020F551602', 
'BIZ020F6F8C02', 
'RET020AC26702', 
'RET020AD29C02', 
'OPT00126', 
'RET020B07C103', 
'RET020B544902', 
'RET020B658402', 
'RET020BAB8802', 
'RET020BF96E03', 
'RET020C20AE02', 
'RET020C2B4702', 
'RET020C4C1D02', 
'RET020CACBD02', 
'RET0210309A01', 
'RET02109C6401', 
'RET02110D6401', 
'RET0211BEA303', 
'RET0213998001', 
'RET020B2FBD01', 
'V3011679', 
'V3015997', 
'V3016446', 
'V3016892', 
'V3014736', 
'V3018725', 
'V3011361', 
'V3026420', 
'V3011264', 
'V3023841', 
'SCV021258F301', 
'RET02102E0302', 
'SCV020CA5C303', 
'SCV0210E72403', 
'RET020AC45A02', 
'RET020CA8A603', 
'RET020CA98301', 
'RET020CC87003', 
'RET0210303D01', 
'RET0211122201', 
'RET0211A44B02', 
'RET02102DE901', 
'RET020B2A6801', 
'RET020BF8F602', 
'RET0212E23001', 
'RET020C050C01', 
'OPTLS002', 
'OPTDC007', 
'OPTDC064', 
'OPTI0014', 
'OPTWI003', 
'OPTWI005', 
'SCV02114D8001', 
'SCV020B1E5402', 
'SCV020B3C7902', 
'SCV020B57C602', 
'SCV020BAC4104', 
'SCV020BB43402', 
'SCV020BEB7703', 
'SCV020C045A03', 
'SCV020CA64202', 
'OPT00186', 
'SCV020F453402', 
'SCV020F817401', 
'SCV02106B4A02', 
'SCV02107C4C01', 
'OPT50003', 
'SCV0210865101', 
'SCV0210C67B01', 
'OPT00163', 
'SCV0210E77501', 
'OPT00129', 
'SCV0210E82B01', 
'SCV02110B9301', 
'SCV02110F6E01', 
'SCV02110F7601', 
'SCV02110F9501', 
'OPT00161', 
'OPT00149', 
'SCV02114F1E01', 
'SCV02114FD102', 
'SCV0211511001', 
'SCV0211515901', 
'SCV0211591401', 
'SCV0211EE5401', 
'SCV0212003302', 
'SCV0212049B01', 
'SCV0212120101', 
'SCV0212EE6001', 
'SCV0212EE7001', 
'SCV0213822501', 
'SCV0213825C01', 
'SCV0213986201', 
'SCV02139A2301', 
'SCV02139C1B02', 
'SCV0213C95D01', 
'SCV0213E42D01', 
'V3005707', 
'V3005822', 
'V3014878', 
'V3015958', 
'SCV02119F7102', 
'SCV0211BF5E01', 
'V3008080', 
'V3008211', 
'V3011216', 
'V3009940', 
'V3008673', 
'V3008995', 
'V3018863', 
'V3025724', 
'V3008428', 
'V3008432', 
'V3008448', 
'V3008744', 
'V3008970', 
'V3008729', 
'V3016523', 
'V3024681', 
'V3016262', 
'V3010674', 
'V3003498', 
'V3007758', 
'V3010150', 
'SCV020C3D4A03', 
'SCV0210E71601', 
'SCV020B2A3002', 
'SCV020B5A4E01', 
'SCV020C1C2E02', 
'SCV020CAFE402', 
'RET020AE8EE01', 
'RET020AE96801', 
'RET020AE96B05', 
'RET020AEEF002', 
'RET020AF31303', 
'RET020AF61C02', 
'SCV020B0E8B02', 
'AMR-15042990', 
'RET020B2A1D01', 
'RET020B2A6B01', 
'RET020B2A6E01', 
'SCV020B2FD402', 
'RET020B347801', 
'RET020B3DB904', 
'RET020B430C04', 
'SCV020B440E01', 
'AMR-15048396', 
'BIZ020B45B401', 
'RET020B53D001', 
'RET020B89B701', 
'RET020B8BAC02', 
'RET020B8CD201', 
'RET020BB95303', 
'RET020BC73C02', 
'RET020BE84002', 
'RET020BE95B02', 
'RET020BEAED03', 
'RET020BF79C03', 
'RET020C03E002', 
'RET020C04D402', 
'RET020C051801', 
'RET020C055B01', 
'RET020C180203', 
'RET020C1A9401', 
'RET020C1A9901', 
'MPN020C1F1A01', 
'MPN020C1F3D01', 
'RET020C226801', 
'RET020C351301', 
'RET020C38BD01', 
'RET020C450501', 
'RET020C4CA602', 
'RET020C508702', 
'RET020C50F201', 
'AMR-15046415', 
'RET020C63F202', 
'RET020C657701', 
'AMR-15051626', 
'AMR-15051661', 
'MPN020C90D201', 
'RET020C989B01', 
'RET020C9A1902', 
'RET020CA8F601', 
'RET020CA90201', 
'RET020CA96A01', 
'RET020CA9C301', 
'RET020CA9D201', 
'BIZ020CAFC502', 
'SCV020CD2F402', 
'MPN020CD35201', 
'MPN020CD3A801', 
'RET020CD40002', 
'MPN020CD42301', 
'BIZ020CD45401', 
'RET020CEA4E01', 
'RET020CEC7A01', 
'RET020D115A02', 
'RET020D12AE01', 
'RET020D130102', 
'RET020F487401', 
'RET020F502601', 
'SCV020F504302', 
'RET020F76A001', 
'RET020F76A801', 
'RET020F776601', 
'RET020F77CC03', 
'RET020F782601', 
'RET020F783201', 
'RET020F8F1902', 
'SCV020FAEBA02', 
'RET021032F701', 
'RET020FEAD003', 
'RET02101C0D02', 
'RET02101C2202', 
'RET02101C7703', 
'RET02102E0001', 
'RET02102E2001', 
'RET02102E2B01', 
'RET02102E3A01', 
'RET02102F2101', 
'RET02102F3001', 
'RET02102F7601', 
'SCV02102FC701', 
'RET02102FCB01', 
'RET02102FD501', 
'RET0210300901', 
'RET0210301A01', 
'SCV0210302903', 
'RET0210302E01', 
'SCV0210307201', 
'RET0210309601', 
'RET0210309901', 
'RET020F486201', 
'RET020F543903', 
'RET020F6B5601', 
'RET020F6B6E02', 
'RET020F6C1403', 
'RET020F76EC02', 
'RET020F77DE01', 
'RET020F781D02', 
'RET02102DE902', 
'RET02102DF101', 
'RET02102E3001', 
'RET02102E3101', 
'RET02102F1701', 
'RET02102F1A02', 
'RET02102F6901', 
'RET02102FC401', 
'RET0210304401', 
'RET0210304501', 
'RET0210305301', 
'RET0210305702', 
'RET0210310401', 
'RET0210324C01', 
'RET0210325901', 
'RET0210329201', 
'RET0210329701', 
'RET021032CC01', 
'RET021036BC01', 
'RET0210370601', 
'RET021088D801', 
'RET021090D501', 
'RET0210CED001', 
'RET0210FC9C01', 
'RET02110DD101', 
'RET0213E41E01', 
'SCV020C2A8C04', 
'SCV020CA92305', 
'SCV020FFECC03', 
'SCV02101BBA01', 
'SCV02106A3002', 
'SCV0210AB9202', 
'SCV0210CBE702', 
'SCV0213817601', 
'SCV0213E74901', 
'V3007668', 
'V3007915', 
'V3008059', 
'V3008077', 
'V3008078', 
'V3008129', 
'V3008132', 
'V3008392', 
'V3008568', 
'V3008681', 
'V3008682', 
'V3009252', 
'V3009290', 
'V3009545', 
'V3009785', 
'V3009833', 
'V3009964', 
'V3010591', 
'V3010681', 
'V3010685', 
'V3010686', 
'V3010687', 
'V3011138', 
'V3013223', 
'V3013225', 
'V3013226', 
'V3013227', 
'V3013228', 
'V3013230', 
'V3013994', 
'V3014115', 
'V3015061', 
'V3015862', 
'V3015959', 
'V3015962', 
'V3017177', 
'V3017609', 
'V3017613', 
'V3017650', 
'V3019118', 
'V3019356', 
'V3019750', 
'V3020077', 
'V3020141', 
'V3020142', 
'V3020515', 
'V3020908', 
'V3020971', 
'V3021464', 
'V3022198', 
'V3023172', 
'V3023292', 
'V3023719', 
'V3023720', 
'V3024032', 
'V3024308', 
'V3024320', 
'V3024322', 
'V3024409', 
'V3024410', 
'V3024641', 
'V3025248', 
'V3026081', 
'V3026322', 
'V3026551', 
'V3026694', 
'V3026970', 
'V3027034', 
'V3027228', 
'V3027230', 
'V3027336', 
'V3027337', 
'V3027598', 
'V3027760', 
'SCV020CAFE502', 
'SCV020CD34402', 
'SCV020F920602', 
'SCV02101BD001', 
'SCV0210311604', 
'SCV021043E402', 
'SCV0210619E02', 
'SCV0210B46003', 
'SCV0210CC9702', 
'SCV0210DF0B01', 
'SCV0210E76B02', 
'SCV0210F20D01', 
'SCV0211082E01', 
'SCV02110C5902', 
'SCV02110CF201', 
'SCV02110DCB01', 
'SCV02110E1001', 
'OPT00257', 
'SCV021111C002', 
'SCV021117CD02', 
'SCV02112B4A02', 
'SCV02114D6401', 
'SCV02114D7701', 
'SCV0210E77201', 
'SCV02116A0901', 
'SCV0211942801', 
'SCV02123DD701', 
'SCV02123E0401', 
'SCV02123ECE01', 
'SCV0212434002', 
'SCV0212769D03', 
'SCV0212FAE602', 
'SCV0212FF8D02', 
'SCV021381C201', 
'SCV021381C701', 
'SCV021381E701', 
'SCV0213820102', 
'SCV0213825D01', 
'SCV0213827501', 
'SCV0213985201', 
'SCV02139A1B04', 
'SCV02139C2301', 
'SCV0213E45601', 
'SCV0213E7CD01', 
'SCV0210E7D701', 
'SCV020F541D03', 
'SCV020AF5B905', 
'SCV020BBC6004', 
'SCV020C79DC02', 
'SCV020C7BE102', 
'SCV021031D105', 
'SCV0210A3D001', 
'SCV02114FB802', 
'SCV02117F8506', 
'SCV02117F9101', 
'V3024307', 
'V3016702', 
'V3020006', 
'V3010001', 
'V3025891', 
'V3020052', 
'V3020013', 
'V3025847', 
'V3010516', 
'OPT00180', 
'OPT00181', 
'SCV02139C1901', 
'SCV020B5CF601', 
'OPT00218', 
'SCV020CB0AC04', 
'SCV02109E5306', 
'SCV02139A5402', 
'SCV02139BAD02', 
'V3018593', 
'V3020170', 
'V3020169', 
'V3020166', 
'V3020168', 
'V3020167', 
'V3020162', 
'V3020057', 
'V3020058', 
'V3020164', 
'V3020050', 
'V3026962', 
'V3020059', 
'V3020172', 
'V3020161', 
'V3020163', 
'V3020171', 
'V3019983', 
'V3011387', 
'SCV0213818803', 
'SCV020FDBAC03', 
'SCV02139B2D01', 
'SCV02139C2901', 
'SCV0213C8D901', 
'SCV0213C8E301', 
'SCV020B371004', 
'SCV020B738702', 
'SCV020BC37802', 
'SCV020C222E02', 
'SCV020CA9A802', 
'SCV020CBAC801', 
'SCV020D164502', 
'SCV0210A78502', 
'SCV0210D05D02', 
'SCV02110CF001', 
'SCV02110D5802', 
'SCV02110D6D01', 
'SCV0211500402', 
'SCV0211A2ED02', 
'SCV02123D8B01', 
'SCV02123ED101', 
'SCV0213815703', 
'SCV0213998101', 
'SCV02139A5601', 
'SCV0213E41D02', 
'SCV020B1C1503', 
'OPT00221', 
'SCV020CD46A04', 
'SCV0211038205', 
'SCV02110D8401', 
'OPT00166', 
'SCV0212835502', 
'SCV021293F503', 
'SCV021397AA01', 
'AMR-15049893', 
'AMR-266853788', 
'V3007044', 
'V3004434', 
'V3003779', 
'V3004647', 
'V3004729', 
'V3018949', 
'V3005823', 
'V3005622', 
'V3006696', 
'V3006368', 
'V3006711', 
'V3006893', 
'V3006786', 
'V3017723', 
'V3010522', 
'V3014867', 
'V3014384', 
'V3014156', 
'V3013391', 
'V3013462', 
'V3013290', 
'V3014161', 
'V3007670', 
'V3006860', 
'V3018855', 
'V3017235', 
'V3011350', 
'V3013014', 
'V3010131', 
'V3009824', 
'V3009972', 
'V3009631', 
'V3017682', 
'V3017441', 
'V3017730', 
'V3019380', 
'V3014869', 
'V3017344', 
'V3011953', 
'V3013999', 
'V3014424', 
'V3020349', 
'V3019327', 
'V3019959', 
'V3019533', 
'V3018535', 
'V3021150', 
'V3019211', 
'V3021853', 
'V3005396', 
'V3003981', 
'V3010583', 
'V3005190', 
'V3009253', 
'V3005847', 
'V3006514', 
'V3006504', 
'V3006549', 
'V3008761', 
'V3008105', 
'V3010494', 
'V3017264', 
'V3009455', 
'V3017651', 
'V3009990', 
'V3017236', 
'V3012562', 
'V3016522', 
'V3020430', 
'V3025356', 
'V3012873', 
'V3014868', 
'V3012083', 
'V3011378', 
'V3018842', 
'V3011139', 
'V3006268', 
'V3007037', 
'V3006417', 
'V3014663', 
'V3020321', 
'V3017537', 
'V3010148', 
'V3019495', 
'V3017712', 
'V3008982', 
'V3008984', 
'V3018990', 
'V3012360', 
'V3019596', 
'V3010368', 
'V3023962', 
'V3025719', 
'V3022331', 
'V3024036', 
'V3024261', 
'RET0211119B01', 
'OPT00146', 
'RET020AB0DC02', 
'BIZ020AC43301', 
'RET020AC43903', 
'RET020AC44E01', 
'MPN020AC49301', 
'RET020AC5BB04', 
'AMR-15038330', 
'MPN020AC8B901', 
'RET020ACB3D01', 
'RET020ACC0C01', 
'MPN020AD02701', 
'RET020AD2C503', 
'RET020AE30E02', 
'RET0210309C01', 
'RET021030AB01', 
'RET021030B401', 
'RET021030EB01', 
'RET021030EC01', 
'RET0210317301', 
'RET0210321D01', 
'RET0210321E01', 
'RET0210322D01', 
'RET0210323101', 
'RET0210323201', 
'RET0210323C01', 
'RET0210325101', 
'RET0210328501', 
'RET021032F201', 
'RET021033E701', 
'RET021036C501', 
'RET0210371301', 
'RET0210371801', 
'RET0210659502', 
'RET021074C703', 
'SCV021083AA01', 
'SCV0210A39B02', 
'SCV0210B5BA02', 
'V3009320', 
'RET02110D1001', 
'RET02110D1201', 
'RET02110E9B01', 
'RET02110EA101', 
'RET02110F6001', 
'RET02110F7201', 
'RET0211106601', 
'RET021111C701', 
'RET0211143501', 
'AMR-54960087', 
'RET020AAFD002', 
'RET020AC44302', 
'RET020AD94001', 
'RET020B198803', 
'RET020B299101', 
'RET020B2A1101', 
'RET020B2A2402', 
'RET020B2A3D01', 
'RET020B2A4001', 
'RET020B2AC801', 
'RET020B2EA201', 
'RET020B2F2C03', 
'RET020B663803', 
'RET020B859E02', 
'RET020BF87101', 
'RET020BF97B01', 
'RET020C045101', 
'RET020C049301', 
'RET020C04AA01', 
'RET020C04C801', 
'RET020C050001', 
'RET020C050801', 
'RET0211159401', 
'RET021117D401', 
'RET021117D701', 
'RET0211181601', 
'RET0211181803', 
'RET0211181901', 
'RET0211183A01', 
'SCV0211A46E02', 
'V3026451', 
'RET021380C501', 
'SCV0213818301', 
'V3002055', 
'V3020331', 
'V3020375', 
'V3007279', 
'V3004496', 
'V3017201', 
'V3026122', 
'V3020159', 
'V3024490', 
'ENEDC075', 
'ENEDC119', 
'ENEDC120', 
'ENEDC216', 
'ENEDC270', 
'RET020B245402', 
'RET020CFF8A02', 
'AMR-93733681', 
'RET020F6B8202', 
'RET020B3DE402', 
'RET020C50F702', 
'RET020AC54001', 
'RET020ACF8602', 
'RET020AF19201', 
'RET020B2A2E01', 
'RET020B2A3201', 
'RET020B2A5C01', 
'RET020BEE4201', 
'RET020BFF5801', 
'RET020C03C801', 
'RET020C04AC03', 
'RET020C052201', 
'RET020C059402', 
'RET020C36AE01', 
'RET020C371D03', 
'RET020C4BEA02', 
'RET020C4DD902', 
'RET020CA8B202', 
'RET020CA8CD01')
;
--------------------------------------------------------
--  DDL for View BILLING_WBS_MAPPED_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."BILLING_WBS_MAPPED_VW" ("COMBO", "GL_SEGMENT", "GLID") AS 
  SELECT GL_SEGMENT||GLID AS COMBO, GL_SEGMENT, GLID FROM HNS_WBS_MAP_T

;
--------------------------------------------------------
--  DDL for View CHECK_FRIDAY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."CHECK_FRIDAY" ("RECORD_ID", "ACCOUNT_NUMBER", "INVOICE_NUMBER", "INVOICE_AMOUNT", "BATCH_ID", "CHECK_NUMBER", "CHECK_DATE", "CHECK_AMOUNT", "STATUS", "REASON_ID", "USER_LOGIN", "REMITTER_NAME", "ZIPCODE", "MICRRT", "AU_ACCOUNT_NUMBER", "AU_INVOICE_NUMBER", "AU_CHECK_NUMBER", "AU_CHECK_AMOUNT", "CREATION_T", "REPROCESSED_T") AS 
  (select "RECORD_ID","ACCOUNT_NUMBER","INVOICE_NUMBER","INVOICE_AMOUNT","BATCH_ID","CHECK_NUMBER","CHECK_DATE","CHECK_AMOUNT","STATUS","REASON_ID","USER_LOGIN","REMITTER_NAME","ZIPCODE","MICRRT","AU_ACCOUNT_NUMBER","AU_INVOICE_NUMBER","AU_CHECK_NUMBER","AU_CHECK_AMOUNT","CREATION_T","REPROCESSED_T" from hns_check_payments_t where creation_t < (select sysdate -2 from dual) 
and creation_t > (select sysdate -3 from dual) )
;
--------------------------------------------------------
--  DDL for View COLL_ACTION_IF_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."COLL_ACTION_IF_VIEW" ("AccountObj", "BillInfoObj", "AccountingType", "EventDescr", "ActionPoid", "ActionName", "ActionDescr", "ActionType", "Status", "OverdueAmount", "OverdueDate", "Currency", "CompletedDate", "DueDate", "CollGenDate", "CREATED_T", "ID") AS 
  SELECT  ('0.0.0.'||CA.ACCOUNT_OBJ_DB||' '||CA.ACCOUNT_OBJ_TYPE||' '||CA.ACCOUNT_OBJ_ID0||' '||'0') "AccountObj" ,('0.0.0.'||CA.BILLINFO_OBJ_DB||' '||CA.BILLINFO_OBJ_TYPE||' '||CA.BILLINFO_OBJ_ID0||' '||'0') "BillInfoObj" ,BI.ACTG_TYPE "AccountingType" , CASE (CA.AU_PARENT_OBJ_REV)  WHEN 0  THEN 'Action Created' WHEN 1  THEN  CASE (CA.AU_PARENT_OBJ_TYPE)  WHEN '/collections_action/manual_action' THEN 'Action Updated' ELSE 'Action Created' END  ELSE 'Action Updated' END AS "EventDescr",  ('0.0.0.1'||' '||CA.AU_PARENT_OBJ_TYPE||' '||CA.AU_PARENT_OBJ_ID0||' '||'0') "ActionPoid" , CCA.ACTION_NAME  "ActionName" , CCA.ACTION_DESCR "ActionDescr" , CASE(CCA.OPCODE)  WHEN 0 THEN 'Manual Action' WHEN 3883 THEN  'Custom Action' ELSE 'System Action' END AS "ActionType" , CA.STATUS AS "Status" , CS.OVERDUE_AMOUNT  AS "OverdueAmount" , CAST(FROM_TZ(CAST(TO_DATE('19700101','YYYYMMDD') + ceil(CS.OVERDUE_T/86400) AS TIMESTAMP),'GMT') AT TIME ZONE'US/Pacific'
						AS DATE) AS "OverdueDate" , BI.CURRENCY AS "Currency",  CASE(CA.COMPLETED_T)  WHEN 0 THEN NULL  ELSE CAST(FROM_TZ(CAST(TO_DATE('19700101','YYYYMMDD') + ceil(CA.COMPLETED_T/86400) AS TIMESTAMP),'GMT') AT TIME ZONE'US/Pacific'
						AS DATE) END AS "CompletedDate" , CAST(FROM_TZ(CAST(TO_DATE('19700101','YYYYMMDD') + ceil(CA.DUE_T/86400) AS TIMESTAMP),'GMT') AT TIME ZONE'US/Pacific'
						AS DATE) AS "DueDate" , CAST(FROM_TZ(CAST(TO_DATE('19700101','YYYYMMDD') + ceil(CA.MOD_T/86400) AS TIMESTAMP),'GMT') AT TIME ZONE'US/Pacific'
						AS DATE) AS "CollGenDate" , CA.CREATED_T "CREATED_T", CA.AU_PARENT_OBJ_ID0 "ID"  FROM  AU_COLLECTIONS_ACTION_T CA , CONFIG_COLLECTIONS_ACTION_T CCA , COLLECTIONS_SCENARIO_T CS , BILLINFO_T BI  WHERE CA.CONFIG_ACTION_OBJ_ID0 = CCA.OBJ_ID0  AND CA.SCENARIO_OBJ_ID0 = CS.POID_ID0  AND CA.BILLINFO_OBJ_ID0 = BI.POID_ID0  ORDER BY CA.CREATED_T ;

   COMMENT ON COLUMN "PIN"."COLL_ACTION_IF_VIEW"."DueDate" IS 'Returns Due Date in __TZ__ format'
;
--------------------------------------------------------
--  DDL for View COLL_SCENARIO_IF_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."COLL_SCENARIO_IF_VIEW" ("AccountObj", "BillInfoObj", "AccountingType", "EventDescr", "ActionPoid", "ActionName", "ActionDescr", "ActionType", "Status", "OverdueAmount", "OverdueDate", "Currency", "CompletedDate", "DueDate", "CollGenDate", "CREATED_T", "ID") AS 
  SELECT "AccountObj","BillInfoObj","AccountingType","EventDescr","ActionPoid","ActionName","ActionDescr","ActionType","Status","OverdueAmount","OverdueDate","Currency","CompletedDate","DueDate","CollGenDate","CREATED_T","ID" FROM ( SELECT  ('0.0.0.'||CS.ACCOUNT_OBJ_DB||' '||CS.ACCOUNT_OBJ_TYPE||' '||CS.ACCOUNT_OBJ_ID0||' '||'0') "AccountObj" ,('0.0.0.'||CS.BILLINFO_OBJ_DB||' '||CS.BILLINFO_OBJ_TYPE||' '||CS.BILLINFO_OBJ_ID0||' '||'0') "BillInfoObj" , BI.ACTG_TYPE "AccountingType" ,'Entered collections' AS "EventDescr" , NULL "ActionPoid",'No Action - Entered collections' AS "ActionName" , NULL AS "ActionDescr" , NULL AS "ActionType" , NULL AS "Status" , CS.OVERDUE_AMOUNT  AS "OverdueAmount" , CAST(FROM_TZ(CAST(TO_DATE('19700101','YYYYMMDD') + ceil(CS.OVERDUE_T/86400) AS TIMESTAMP),'GMT') AT TIME ZONE'US/Pacific'
							AS DATE) AS "OverdueDate" , BI.CURRENCY AS "Currency",  NULL AS "CompletedDate", NULL AS "DueDate", CAST(FROM_TZ(CAST(TO_DATE('19700101','YYYYMMDD') + ceil(CS.ENTRY_T/86400) AS TIMESTAMP),'GMT') AT TIME ZONE'US/Pacific'
							AS DATE) AS "CollGenDate" , CS.CREATED_T "CREATED_T" , CS.POID_ID0 "ID"  FROM  COLLECTIONS_SCENARIO_T CS , CONFIG_COLLECTIONS_SCENARIO_T CCS , BILLINFO_T BI  WHERE CS.CONFIG_SCENARIO_OBJ_ID0 = CCS.OBJ_ID0  AND CS.BILLINFO_OBJ_ID0 = BI.POID_ID0 UNION  SELECT  ('0.0.0.'||CS.ACCOUNT_OBJ_DB||' '||CS.ACCOUNT_OBJ_TYPE||' '||CS.ACCOUNT_OBJ_ID0||' '||'0') "AccountObj" ,('0.0.0.'||CS.BILLINFO_OBJ_DB||' '||CS.BILLINFO_OBJ_TYPE||' '||CS.BILLINFO_OBJ_ID0||' '||'0') "BillInfoObj" ,BI.ACTG_TYPE "AccountingType" ,'Exited collections' AS "EventDescr" , NULL "ActionPoid" ,'No Action - Exited collections' AS "ActionName" , NULL AS "ActionDescr" , NULL AS "ActionType" , NULL AS "Status" , CS.OVERDUE_AMOUNT  AS "OverdueAmount" , CAST(FROM_TZ(CAST(TO_DATE('19700101','YYYYMMDD') + ceil(CS.OVERDUE_T/86400) AS TIMESTAMP),'GMT') AT TIME ZONE'US/Pacific' AS DATE)
						AS "OverdueDate" , BI.CURRENCY AS "Currency" , CAST(FROM_TZ(CAST(TO_DATE('19700101','YYYYMMDD') + ceil(CS.EXIT_T/86400) AS TIMESTAMP),'GMT') AT TIME ZONE'US/Pacific'
						AS DATE) AS "CompletedDate" , NULL AS "DueDate" , CAST(FROM_TZ(CAST(TO_DATE('19700101','YYYYMMDD') + ceil(CS.ENTRY_T/86400) AS TIMESTAMP),'GMT') AT TIME ZONE'US/Pacific'
						AS DATE) AS "CollGenDate" , CS.MOD_T "CREATED_T" , CS.POID_ID0 "ID"  FROM  COLLECTIONS_SCENARIO_T CS , CONFIG_COLLECTIONS_SCENARIO_T CCS , BILLINFO_T BI  WHERE CS.CONFIG_SCENARIO_OBJ_ID0 = CCS.OBJ_ID0  AND CS.BILLINFO_OBJ_ID0 = BI.POID_ID0  AND CS.EXIT_T > 0  ) ORDER BY CREATED_T 
;
--------------------------------------------------------
--  DDL for View CONSUMEREXCISETAX2VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."CONSUMEREXCISETAX2VIEW" ("ITEM_NO", "CREATION_DATE", "CITY", "STATE", "COUNTRY", "TAX_CODE", "PRODUCT_NO", "INVOICE_DESCRIPTOR", "OBJ_ID0", "TOTAL_AMOUNT") AS 
  (SELECT
    ITEM_NO,
    I.EFFECTIVE_T creation_date,
    SUBSTR(REPLACE(E.TAX_LOCALES,'Germantown;MD;20876;US|Germantown;MD;20876;US|Germantown;MD;20876;US|',''),1,instr(replace(e.TAX_LOCALES,'Germantown;MD;20876;US|Germantown;MD;20876;US|Germantown;MD;20876;US|',''),';')-1) CITY,    SUBSTR(REPLACE(E.TAX_LOCALES,'Germantown;MD;20876;US|Germantown;MD;20876;US|Germantown;MD;20876;US|',''),instr(replace(e.TAX_LOCALES,'Germantown;MD;20876;US|Germantown;MD;20876;US|Germantown;MD;20876;US|',''),';')+1,2) STATE,
    SUBSTR(E.TAX_LOCALES,LENGTH(E.TAX_LOCALES)-1,2) COUNTRY,
    EBI.TAX_CODE,
    (SELECT NAME FROM PRODUCT_T WHERE POID_ID0 = EBI.PRODUCT_OBJ_ID0) PRODUCT_NO,
    RATE_TAG invoice_descriptor,
    EBI.OBJ_ID0,
    EBI.AMOUNT total_amount 
FROM
    EVENT_T E, EVENT_BAL_IMPACTS_T EBI, ITEM_T I
WHERE
    E.POID_ID0 = EBI.OBJ_ID0
    AND E.ITEM_OBJ_ID0 = I.POID_ID0
    AND I.ITEM_NO IS NOT NULL    
    AND I.ITEM_NO NOT LIKE 'P%'
    AND EBI.RESOURCE_ID = 840
    AND EBI.AMOUNT <> 0 and
    i.effective_t >=1230786000 
    and i.effective_t < 1233464400
    AND EBI.RATE_TAG <> 'Tax') 
;
--------------------------------------------------------
--  DDL for View CONSUMEREXCISETAXVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."CONSUMEREXCISETAXVIEW" ("ITEM_NO", "CREATION_DATE", "CITY", "STATE", "COUNTRY", "TAX_CODE", "PRODUCT_NO", "INVOICE_DESCRIPTOR", "OBJ_ID0", "TOTAL_AMOUNT") AS 
  (SELECT
    ITEM_NO,
    I.EFFECTIVE_T creation_date,
    SUBSTR(REPLACE(E.TAX_LOCALES,'Germantown;MD;20876;US|Germantown;MD;20876;US|Germantown;MD;20876;US|',''),1,instr(replace(e.TAX_LOCALES,'Germantown;MD;20876;US|Germantown;MD;20876;US|Germantown;MD;20876;US|',''),';')-1) CITY,    SUBSTR(REPLACE(E.TAX_LOCALES,'Germantown;MD;20876;US|Germantown;MD;20876;US|Germantown;MD;20876;US|',''),instr(replace(e.TAX_LOCALES,'Germantown;MD;20876;US|Germantown;MD;20876;US|Germantown;MD;20876;US|',''),';')+1,2) STATE,
    SUBSTR(E.TAX_LOCALES,LENGTH(E.TAX_LOCALES)-1,2) COUNTRY,
    EBI.TAX_CODE,
    (SELECT NAME FROM PRODUCT_T WHERE POID_ID0 = EBI.PRODUCT_OBJ_ID0) PRODUCT_NO,
    RATE_TAG invoice_descriptor,
    EBI.OBJ_ID0,
    EBI.AMOUNT total_amount 
FROM
    EVENT_T E, EVENT_BAL_IMPACTS_T EBI, ITEM_T I
WHERE
    E.POID_ID0 = EBI.OBJ_ID0
    AND E.ITEM_OBJ_ID0 = I.POID_ID0
    AND I.ITEM_NO IS NOT NULL    
    AND I.ITEM_NO NOT LIKE 'P%'
    AND EBI.RESOURCE_ID = 840
    AND EBI.AMOUNT <> 0
    AND I.POID_TYPE <> '/item/tax') 
;
--------------------------------------------------------
--  DDL for View COP_EXPIRE_30_DAYS_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."COP_EXPIRE_30_DAYS_VW" ("SUBORDINATE", "PARENT", "SITE_TERM", "SERVICE_TYPE", "HARDWARE_TYPE", "PARENT_EMAIL", "CONTACT_NUMBER", "ADDRESS", "CITY", "STATE", "ZIP") AS 
  select subordinate, parent, max(term_date) site_term, max(ck.service_type) as service_type, hardware_type, PARENT_EMAIL, contact_number, address, city, state, zip
from
(
SELECT DISTINCT account_created, purchased_date, current_balance, subordinate, PARENT, PARENT_EMAIL, deal,
                DECODE (INSTR (deal, 'Dedicated'),
                        0, DECODE (service_obj_type,
                                   '/service/dsl', 'Shared',
                                   '/service/ip', 'VSAT',
                                   NULL
                                  ),
                        'Dedicated'
                       ) service_type,
                DECODE (current_balance,
                        NULL, charge_amount,
                        DECODE (step_max, current_balance, 0, charge_amount)
                       ) charge_old,
                       Decode(sign(nvl(step_max,current_balance+1)-(current_balance-+1)),
                       -1,0,charge_amount)
                       charge,
                next_bill_date,
                ADD_MONTHS (next_bill_date,
                            DECODE (SIGN (term - current_balance),
                                    -1, term - current_balance,
                                    term - current_balance
                                   )
                           ) term_date,
                ADD_MONTHS (next_bill_date,
                           -current_balance) term_start_date,
                NVL (hw_type, 'Purchased') AS hardware_type, parent_company,
                address, city, state,
                first_name || ' ' || last_name owner_name, service_obj_type,
                rate_plan_start, rate_plan_end, charge_type,
                term - current_balance AS term_balance, step_resource, zip, term
              -- , (SELECT AP.PHONE FROM ACCOUNT_PHONES_T AP WHERE AP.OBJ_iD0 = A2P(PARENT) AND AP.PHONE IS NOT NULL AND ROWNUM = 1)
              , contact_number
           FROM (SELECT u2d(A.CREATED_T) account_created, u2d(ap.created_t) as purchased_date, a.account_no AS subordinate, an.address, an.city,
                        an.state, an.zip, an.first_name, an.last_name,
                        (Select TO_DATE (DECODE (drr.start_t,0, NULL,u2d (drr.start_t)) )
                        from date_ranges_t drr where rt.obj_id0 = drr.obj_id0  AND drr.rate_obj_id0 = r.poid_id0) rate_plan_start,
                        (select TO_DATE (DECODE (drr.end_t, 0, NULL, u2d (drr.end_t))
                                ) from date_ranges_t drr where rt.obj_id0 = drr.obj_id0  AND drr.rate_obj_id0 = r.poid_id0) rate_plan_end,
                        nvl((SELECT p2a(g.account_obj_id0)
                           FROM group_t g,
                                group_billing_members_t gbm
                          WHERE g.poid_id0 = gbm.obj_id0
                            AND gbm.object_id0 = a.poid_id0),a.account_no) AS PARENT,
                        nvl((SELECT (select EM.EMAIL_ADDR from account_nameinfo_t em where EM.OBJ_ID0 =  g.account_obj_id0)
                           FROM group_t g,
                                group_billing_members_t gbm
                          WHERE g.poid_id0 = gbm.obj_id0
                            AND gbm.object_id0 = a.poid_id0),a.account_no) AS PARENT_EMAIL,
                        nvl((SELECT aa.company
                           FROM account_nameinfo_t aa,
                                group_t g,
                                group_billing_members_t gbm
                          WHERE aa.obj_id0 = g.account_obj_id0
                            AND g.poid_id0 = gbm.obj_id0
                            AND gbm.object_id0 = a.poid_id0),an.company)
                                                            AS parent_company,
                        a.poid_id0, d.NAME deal, ap.service_obj_type,
                        d.poid_id0 deal_id,
                        (SELECT SUM (current_bal)
                           FROM bal_grp_sub_bals_t s,
                                bal_grp_t b
                          WHERE b.poid_id0 = s.obj_id0
                            AND s.valid_to = 0
                            AND b.account_obj_id0 = a.poid_id0
                            AND EXISTS (
                                   SELECT 1
                                     FROM rate_plan_t rp,
                                          rate_t r,
                                          rate_quantity_tiers_t rq
                                    WHERE ap.product_obj_id0 =
                                                            rp.product_obj_id0
                                      AND r.step_resource = s.rec_id2
                                      AND r.rate_plan_obj_id0 = rp.poid_id0
                                      AND r.poid_id0 = rq.obj_id0))
                                                           AS current_balance,
                        (SELECT MAX (rq.step_max) AS term
                           FROM rate_plan_t rp,
                                rate_t r,
                                rate_quantity_tiers_t rq
                          WHERE ap.product_obj_id0 = rp.product_obj_id0
                            AND r.rate_plan_obj_id0 = rp.poid_id0
                            AND r.poid_id0 = rq.obj_id0) AS term,
                        (SELECT MAX (rq.step_min) AS term
                           FROM rate_plan_t rp,
                                rate_t r,
                                rate_quantity_tiers_t rq
                          WHERE ap.product_obj_id0 = rp.product_obj_id0
                            AND r.rate_plan_obj_id0 = rp.poid_id0
                            AND r.poid_id0 = rq.obj_id0) high_min,
                        (SELECT   'Lease'
                             FROM account_products_t apl
                            WHERE apl.obj_id0 = a.poid_id0
                              AND apl.status != 3
                              AND apl.service_obj_type IN
                                     ('/service/hardware',
                                      '/service/rental',
                                      '/service/lease',
                                      '/service/lease_firewall'
                                     )
                         GROUP BY apl.obj_id0) hw_type,
                        (SELECT u2d (bi.next_bill_t)
                           FROM billinfo_t bi
                          WHERE a.poid_id0 =
                                            bi.account_obj_id0
                            AND bi.bill_info_id = 'Account Billinfo')
                                                               next_bill_date,
                        DECODE
                           (rp.event_type,
                            '/event/billing/product/fee/cancel', rbi.scaled_amount
                             + rbi.fix_amount,
                              ROUND (  (DECODE (ap.status_flags,
                                                33554432, ap.cycle_fee_amt,
                                                33554440, ap.cycle_fee_amt,
                                                50331648, ap.cycle_fee_amt,
                                                50331656, ap.cycle_fee_amt,
                                                  rbi.scaled_amount
                                                + rbi.fix_amount
                                               )
                                       )
                                     - (  DECODE (ap.status_flags,
                                                  33554432, ap.cycle_fee_amt,
                                                  33554440, ap.cycle_fee_amt,
                                                  50331648, ap.cycle_fee_amt,
                                                  50331656, ap.cycle_fee_amt,
                                                    rbi.scaled_amount
                                                  + rbi.fix_amount
                                                 )
                                        * ap.cycle_discount
                                       ),
                                     2
                                    )
                            - ap.cycle_disc_amt
                           ) AS charge_amount,
                        DECODE
                             (ap.status_flags,
                              33554432, 'override',
                              33554440, 'override',
                              50331648, 'override',
                              50331656, 'override',
                              DECODE (SIGN (  ap.cycle_discount
                                            + ap.cycle_disc_amt
                                            - 0
                                           ),
                                      0, 'default',
                                      'override'
                                     )
                             ) AS charge_by,
                        DECODE
                           (rp.event_type,
                            '/event/billing/product/fee/cancel', 'ETF',
                            '/event/billing/product/fee/purchase', 'One Time',
                            '/event/billing/product/fee/cycle/cycle_forward_monthly', 'Recurring',
                            '/event/billing/product/fee/cycle/cycle_arrear', 'Recurring Arrears',
                            '/event/billing/product/fee/cycle/cycle_forward_annual', 'Recurring Annual',
                            rp.event_type
                           ) AS charge_type,
                        rqt.step_min, rqt.step_max, r.step_resource
                        , (select (SELECT AP.PHONE FROM ACCOUNT_PHONES_T AP WHERE AP.OBJ_iD0 = BI.ACCOUNT_OBJ_ID0 AND AP.PHONE IS NOT NULL AND ROWNUM = 1) from
                        billinfo_t bi, billinfo_t bia where A.POID_ID0 = BIA.ACCOUNT_OBJ_ID0 and BIA.AR_BILLINFO_OBJ_ID0 = BI.POID_ID0 and BIA.BILL_INFO_ID =  'Account Billinfo'
                        and BI.BILL_INFO_ID  =  'Account Billinfo' )  contact_number
                   FROM account_products_t ap,
                        account_t a,
                       account_nameinfo_t an,
                        deal_t d,
                        rate_plan_t rp,
                        rate_t r,
                        rate_bal_impacts_t rbi,
                        rate_tiers_t rt,
                        rate_quantity_tiers_t rqt
                  WHERE ap.obj_id0 = a.poid_id0
                    AND a.poid_id0 = an.obj_id0
                    AND ap.deal_obj_id0 = d.poid_id0
                    AND ap.status != 3
                    AND ap.product_obj_id0 = rp.product_obj_id0
                    AND rp.event_type != '/event/billing/product/fee/purchase'
                    AND ap.service_obj_type != '/service/vadb'
                    AND ap.service_obj_type != '/service/tax'
                    AND rp.poid_id0 = r.rate_plan_obj_id0
                    AND rbi.obj_id0 = r.poid_id0
                    AND r.rate_plan_obj_id0 = rt.obj_id0
                    AND rqt.obj_id0 = r.poid_id0
                    AND rt.rec_id = rqt.rec_id
                    AND rqt.obj_id0 = r.poid_id0
                    AND DECODE(rbi.element_id,10100016,840,10100015,840,rbi.element_id) = 840
                    and not exists (select 1 from date_ranges_t drr where rt.obj_id0 = drr.obj_id0  AND drr.rate_obj_id0 = r.poid_id0
                    and sysdate not between  nvl(decode(drr.start_t,0,null,u2d(drr.start_t)),sysdate-1) and nvl(decode(drr.end_t,0,null,u2d(drr.end_t)),sysdate+1)
                    )
                   AND a.gl_segment = '.NAD.KU.ENTERPRISE.FRANCHISEE.COP'
                   and p2gl(ap.obj_id0) = '.NAD.KU.ENTERPRISE.FRANCHISEE.COP'
                    /* Place SITE ID for the ACCOUNT NO for Franchises */
                  -- AND a.account_no in ('CP857712D', 'CP205326','CP867684D','CP865845','CP805431','CP850000','CP819636','CP712207D','COP00014','CP714776')
                )
          WHERE ( nvl(current_balance,0)  between nvl(step_min,nvl(current_balance,0)) and nvl(step_max,nvl(current_balance,0)+1)-1
or current_balance >= term and step_min = high_min
  )
) ck
having max(term_date) between sysdate and add_months(sysdate,1)
group by  parent, subordinate,hardware_type, contact_number, address, city, state, zip,PARENT_EMAIL

;
--------------------------------------------------------
--  DDL for View CUSTOMER_TYPEINFO_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."CUSTOMER_TYPEINFO_VW" ("ACCOUNT_OBJ_ID0", "CUSTOMER_TYPE", "SAN") AS 
  SELECT
	HNS_CUSTOMER_TYPEINFO_T.ACCOUNT_OBJ_ID0 ACCOUNT_OBJ_ID0,
	HNS_CUSTOMER_TYPEINFO_T.CUSTOMER_TYPE CUSTOMER_TYPE,
	HNS_CUSTOMER_TYPEINFO_T.SAN SAN
FROM
	HNS_CUSTOMER_TYPEINFO_T
union
SELECT
	IAG_CUSTOMER_TYPE_T.ACCOUNT_OBJ_ID0 ACCOUNT_OBJ_ID0,
	DECODE(IAG_CUSTOMER_TYPE_T.CUSTOMER_TYPE , 'CONSUMER', 'Class_B_Customer','FRANCHISE','Franchiser','PROVIDER','Provider','VAR','Var_ServiceProvider',IAG_CUSTOMER_TYPE_T.CUSTOMER_TYPE),
 		NULL SAN
	FROM IAG_CUSTOMER_TYPE_T
;
--------------------------------------------------------
--  DDL for View EVENT_LAST_DEAL_PURCHASE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."EVENT_LAST_DEAL_PURCHASE_VW" ("ACCOUNT_ID", "SERVICE_ID", "LAST_PURCHASE_DATE", "DEAL_ID", "DEAL_NAME", "DEAL_DESCRIPTION") AS 
  (SELECT e.account_obj_id0 ACCOUNT_ID, e.service_obj_id0 SERVICE_ID,
	   infranet_to_date(max(e.end_t)) LAST_PURCHASE_DATE, d.poid_id0 DEAL_ID,
	   (select name from deal_t where poid_id0 = d.poid_id0) DEAL_NAME,
	   (select descr from deal_t where poid_id0 = d.poid_id0) DEAL_DESCRIPTION
FROM event_t e, event_billing_deal_info_t ebd, deal_t d
WHERE e.poid_id0 = ebd.obj_id0
AND ebd.deal_obj_id0 = d.poid_id0
AND d.permitted <> '/service/activation'
AND d.permitted <> '/account'
AND d.permitted <> '/service/email'
AND d.permitted NOT LIKE '/service/promotion%'
AND e.poid_type = '/event/billing/deal/purchase'
GROUP BY e.account_obj_id0, e.service_obj_id0, d.poid_id0)
;
--------------------------------------------------------
--  DDL for View FREE_PRODUCTS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."FREE_PRODUCTS" ("PRODUCT_ID", "PRODUCT_DESCRIPTION", "DEAL_DESCRIPTION") AS 
  select p.poid_id0 PRODUCT_ID,p.descr PRODUCT_DESCRIPTION, d.DESCR DEAL_DESCRIPTION
from rate_bal_impacts_t rbi, rate_t r, rate_plan_t rp, product_t p, deal_t d, deal_products_t dp
where r.poid_id0 = rbi.obj_id0
and rbi.element_id = 840
and rp.poid_id0 = r.RATE_PLAN_OBJ_ID0
and p.poid_id0 = rp.PRODUCT_OBJ_ID0
and p.permitted  = '/service/ip'
and d.poid_id0 = dp.obj_id0
and dp.product_obj_id0 = p.poid_id0
group by p.poid_id0,p.descr, d.descr
having (sum(rbi.FIX_AMOUNT) = 0 and sum(rbi.scaled_AMOUNT) = 0)
;
--------------------------------------------------------
--  DDL for View FREE_PRODUCTS_IP_HW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."FREE_PRODUCTS_IP_HW" ("PRODUCT_ID", "PRODUCT_DESCRIPTION", "DEAL_NAME") AS 
  select p.poid_id0 PRODUCT_ID,p.descr PRODUCT_DESCRIPTION, d.name DEAL_NAME
from rate_bal_impacts_t rbi, rate_t r, rate_plan_t rp, product_t p, deal_t d, deal_products_t dp
where r.poid_id0 = rbi.obj_id0
and rbi.element_id = 840
and rp.poid_id0 = r.RATE_PLAN_OBJ_ID0
and p.poid_id0 = rp.PRODUCT_OBJ_ID0
and (p.permitted  = '/service/ip' or p.permitted  = '/service/hardware')
and d.poid_id0 = dp.obj_id0
and dp.product_obj_id0 = p.poid_id0
group by p.poid_id0,p.descr, d.name
having (sum(rbi.FIX_AMOUNT) = 0 and sum(rbi.scaled_AMOUNT) = 0)
;
--------------------------------------------------------
--  DDL for View GLBILLEDPAYMENTVW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."GLBILLEDPAYMENTVW" ("ACCOUNT_NO", "GL_SEGMENT", "GL_ID", "EFFECTIVE_T", "GL_SEGMENT_ITEM", "RESOURCE_ID", "AMOUNT", "CHECK_NO") AS 
  SELECT  a.account_no,a.gl_segment,TO_CHAR(j.gl_id) GL_ID, i.effective_t,i.GL_SEGMENT GL_SEGMENT_ITEM,j.RESOURCE_ID,(j.DB_AR_NET_AMT - j.CR_AR_NET_AMT) Amount, ec.CHECK_NO 
FROM JOURNAL_T j, ITEM_T i, ACCOUNT_T a, 
EVENT_BAL_IMPACTS_T eb, EVENT_BILLING_PAYMENT_CHECK_T ec 
  WHERE 
j.item_obj_id0=i.poid_id0 AND i.account_obj_id0=a.poid_id0 
AND j.item_obj_id0=eb.item_obj_id0 
AND eb.obj_id0=ec.obj_id0 
AND ((j.DB_AR_NET_AMT - j.CR_AR_NET_AMT) <> 0)

;
--------------------------------------------------------
--  DDL for View GLBILLEDREFUNDVW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."GLBILLEDREFUNDVW" ("ACCOUNT_NO", "GL_SEGMENT", "GL_ID", "EFFECTIVE_T", "GL_SEGMENT_ITEM", "RESOURCE_ID", "AMOUNT", "CHECK_NO") AS 
  SELECT 
a.account_no,a.gl_segment,TO_CHAR(j.gl_id) GL_ID, i.effective_t, i.GL_SEGMENT GL_SEGMENT_ITEM,j.RESOURCE_ID, (j.DB_AR_NET_AMT - j.CR_AR_NET_AMT) Amount, ec.CHECK_NO 
 FROM JOURNAL_T j, ITEM_T i, ACCOUNT_T a, 
EVENT_BAL_IMPACTS_T eb, EVENT_BILLING_REFUND_CHECK_T ec 
  WHERE 
j.item_obj_id0=i.poid_id0 AND i.account_obj_id0=a.poid_id0 
AND j.item_obj_id0=eb.item_obj_id0 
AND eb.obj_id0=ec.obj_id0 
AND ((j.DB_AR_NET_AMT - j.CR_AR_NET_AMT) <> 0)

;
--------------------------------------------------------
--  DDL for View GLBILLEDREVERSALSVW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."GLBILLEDREVERSALSVW" ("AMOUNT", "GL_ID", "ACCOUNT_NO", "GL_SEGMENT", "CHECK_NO", "BANK_ACCOUNT_NO", "BANK_CODE", "EFFECTIVE_T") AS 
  SELECT (j.DB_AR_NET_AMT-j.CR_AR_NET_AMT) AMOUNT, TO_CHAR(j.gl_id) GL_ID, a.account_no, 
a.gl_segment,ec.CHECK_NO, ec.BANK_ACCOUNT_NO, ec.BANK_CODE,i.effective_t 
 FROM JOURNAL_T j, ITEM_T i, ACCOUNT_T a, 
EVENT_BAL_IMPACTS_T eb, EVENT_BILLING_PAYMENT_CHECK_T ec, EVENT_BILLING_REVERSAL_T ebr, 
EVENT_BILLING_PAYMENT_T ebp 
  WHERE 
j.item_obj_id0=i.poid_id0 AND i.account_obj_id0=a.poid_id0 
AND j.item_obj_id0=eb.item_obj_id0 
AND eb.obj_id0=ebr.obj_id0 
AND ebr.PAYMENT_TRANS_ID = ebp.TRANS_ID 
AND ebp.obj_id0=ec.obj_id0 
AND j.resource_id=840 
AND (j.DB_AR_NET_AMT-j.CR_AR_NET_AMT) <> 0

;
--------------------------------------------------------
--  DDL for View GLBILLEDVW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."GLBILLEDVW" ("ACCOUNT_NO", "GL_SEGMENT", "GL_ID", "EFFECTIVE_T", "RESOURCE_ID", "GL_SEGMENT_ITEM", "DB_AR_NET_AMT", "CR_AR_NET_AMT", "DB_AR_TAX_AMT", "CR_AR_TAX_AMT") AS 
  SELECT "ACCOUNT_T"."ACCOUNT_NO", "ACCOUNT_T"."GL_SEGMENT",TO_CHAR("JOURNAL_T"."GL_ID") "GL_ID", "ITEM_T"."EFFECTIVE_T", 
 "JOURNAL_T"."RESOURCE_ID", "ITEM_T"."GL_SEGMENT" GL_SEGMENT_ITEM, 
 "JOURNAL_T"."DB_AR_NET_AMT", "JOURNAL_T"."CR_AR_NET_AMT", "JOURNAL_T"."DB_AR_TAX_AMT","JOURNAL_T"."CR_AR_TAX_AMT" 
 FROM   "PIN"."JOURNAL_T" "JOURNAL_T", "PIN"."ITEM_T" "ITEM_T", "PIN"."ACCOUNT_T" "ACCOUNT_T" 
 WHERE  ("JOURNAL_T"."ITEM_OBJ_ID0"="ITEM_T"."POID_ID0") 
 AND ("ITEM_T"."ACCOUNT_OBJ_ID0"="ACCOUNT_T"."POID_ID0") AND ( (DB_AR_NET_AMT-CR_AR_NET_AMT <> 0) OR (DB_AR_TAX_AMT-CR_AR_TAX_AMT <> 0)) 
;
--------------------------------------------------------
--  DDL for View HNS_ACCOUNT_DEAL_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_ACCOUNT_DEAL_VW" ("OBJ_ID0", "SERVICE_OBJ_ID0", "POID_ID0", "NAME", "DESCR") AS 
  SELECT d.account_obj_id0 obj_id0, d.service_obj_id0, 
TO_NUMBER(SUBSTR(d.dealinfo,INSTR(d.dealinfo,'@',1,1)+1,INSTR(d.dealinfo,'@',1,2)-INSTR(d.dealinfo,'@',1,1)-1)) poid_id0, 
DE.name, 
DE.DESCR 
FROM 
(SELECT e.account_obj_id0, e.service_obj_id0, 
MAX(LPAD(TO_CHAR(e.end_t),10,'0')||'@'||ebd.deal_obj_id0||'@'||d.name||'@'||to_char(substr(REPLACE(REPLACE(d.descr,CHR(10),' '),CHR(13),' '),1,200))) as dealinfo 
FROM event_t e, event_billing_deal_info_t ebd,DEAL_T D 
WHERE 
((e.poid_id0 >= 15056979 and 
e.poid_id0 <= 106143740) 
or 
(ebd.obj_id0 >= 17592186044416 and 
ebd.obj_id0 <= 35184372088831)) and 
d.permitted != '/service/activation' 
AND d.permitted != '/account' 
AND d.permitted != '/service/email' 
AND d.permitted != '/service/promotion/ip' AND 
e.poid_id0 = ebd.obj_id0  AND 
ebd.deal_obj_id0 = d.poid_id0 
GROUP BY e.account_obj_id0, e.service_obj_id0) d, DEAL_T DE 
WHERE 
TO_NUMBER(SUBSTR(d.dealinfo,INSTR(d.dealinfo,'@',1,1)+1,INSTR(d.dealinfo,'@',1,2)-INSTR(d.dealinfo,'@',1,1)-1)) = DE.POID_ID0 AND 
SUBSTR(d.dealinfo,INSTR(d.dealinfo,'@',1,2)+1,INSTR(d.dealinfo,'@',1,3)-INSTR(d.dealinfo,'@',1,2)-1) = DE.NAME

;
--------------------------------------------------------
--  DDL for View HNS_ACCOUNT_JOB_NO_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_ACCOUNT_JOB_NO_VW" ("ACCOUNT_OBJ_ID0", "HNS_JOB_ID") AS 
  SELECT
  p.account_obj_id0 account_obj_id0,
  NVL(hpc.hns_job_id,'50557') hns_job_id
FROM
  PROFILE_T p ,
  HNS_PROFILE_CUSTOMER_T hpc
WHERE
  p.poid_id0 = hpc.obj_id0 			  AND
  p.poid_type = '/profile/customer'
;
--------------------------------------------------------
--  DDL for View HNS_AR_FEED_ADJUSTMENT_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_AR_FEED_ADJUSTMENT_VW" ("HNS_JOB_ID", "ADJUSTMENT_TOTAL") AS 
  select
     haj.hns_job_id hns_job_id,
     SUM(i.item_total) adjustment_total
from
     hns_account_job_no_vw haj, item_t i
where
    haj.account_obj_id0 = i.account_obj_id0 and
    i.effective_t >1047704400 and i.effective_t <= 1059624000 and
    i.poid_type = '/item/adjustment'
group by haj.hns_job_id
;
--------------------------------------------------------
--  DDL for View HNS_BILL_ITEM_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_BILL_ITEM_VW" ("SITEID", "ACCOUNT_POID", "BILL_POID", "START_DATE", "END_DATE", "CURRENT_TOTAL", "PREVIOUS_TOTAL", "CHILD_TOTAL", "TOTAL_AMOUNT", "ITEM_POID", "ITEM_NAME", "ITEM_ACCOUNT", "ITEM_DATE", "ITEM_TOTAL", "PARENT_ACCT_POID", "PARENT_BILL_POID") AS 
  SELECT
	s.login siteid,
	b.account_obj_id0 account_poid,
	b.poid_id0 bill_poid,
	b.start_t start_date,
	b.end_t end_date,
	b.current_total current_total,
	b.previous_total previous_total,
	b.subords_total child_total,
	b.total_due total_amount,
	i.poid_id0 item_poid,
	i.name item_name,
	i.account_obj_id0 item_account,
	i.effective_t item_date,
	i.item_total item_total,
	i.ar_account_obj_id0 parent_acct_poid,
	i.ar_bill_obj_id0 parent_bill_poid
FROM bill_t b, item_t i, service_t s
WHERE
	  b.poid_id0 = i.bill_obj_id0 AND
	  b.account_obj_id0 = s.account_obj_id0 AND
	  s.poid_type = '/service/ip'


;
--------------------------------------------------------
--  DDL for View HNS_BRM_ADMINPRIV
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_BRM_ADMINPRIV" ("PK_LOGIN_ID", "PK_ROLE") AS 
  SELECT  S.LOGIN, SA.ROLE_DESC FROM  SERVICE_T S, SERVICE_ADMIN_ROLE_T R, SERVICE_ADMINCLIENT_T SA WHERE  S.POID_ID0  =  R.OBJ_ID0
AND SA.OBJ_ID0  =  R.PROFILE_OBJ_ID0 AND S.STATUS = 10100 AND LOGIN NOT LIKE 'ROLE%'
;
--------------------------------------------------------
--  DDL for View HNS_BRM_ADMINROLES
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_BRM_ADMINROLES" ("PK_ROLE") AS 
  select role_desc from service_adminclient_t where role_desc not like 'null' 
;
--------------------------------------------------------
--  DDL for View HNS_BRM_ADMINUSERS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_BRM_ADMINUSERS" ("PK_LOGIN_ID", "FIRST_NAME", "LAST_NAME") AS 
  SELECT S.LOGIN, AN.FIRST_NAME, AN.LAST_NAME  FROM  SERVICE_T S, ACCOUNT_NAMEINFO_T AN WHERE  S.ACCOUNT_OBJ_ID0 = AN.OBJ_ID0 AND S.STATUS = 10100
AND LOGIN NOT LIKE 'ROLE%' AND EXISTS (SELECT 1 FROM SERVICE_ADMIN_ROLE_T R WHERE S.POID_ID0 = R.OBJ_ID0)
;
--------------------------------------------------------
--  DDL for View HNS_BRM_AdminPriv
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_BRM_AdminPriv" ("PK_LOGIN_ID", "pk_Role") AS 
  select  s.login, sa.role_desc from  service_t s, service_admin_role_t r, service_adminclient_t sa where  s.poid_id0  =  r.obj_id0 and sa.OBJ_ID0  =  r.profile_obj_id0 and s.status = 10100 and login not like 'ROLE%' 
;
--------------------------------------------------------
--  DDL for View HNS_COLLECTION_FEED_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_COLLECTION_FEED_VW" ("PAYMENT_DATE", "WRITE_OFF_AMOUNT", "TOTAL_PAYMENT", "TOTAL_CHECK_PAYMENT", "CHECK_LOCKBOX_PAYMENT", "CHECK_NCO_PAYMENT", "CHECK_OTHER_PAYMENT", "CHECK_REFUND", "CHECK_REVERSAL", "TOTAL_DD_PAYMENT", "TOTAL_CC_PAYMENT", "TOTAL_CC_REFUND", "TOTAL_CC_DISPUTE", "AMEX_PAYMENT", "VISA_PAYMENT", "MC_PAYMENT", "DISC_PAYMENT", "OTHER_CC_PAYMENT", "AMEX_REFUND", "VISA_REFUND", "MC_REFUND", "DISC_REFUND", "OTHER_CC_REFUND") AS 
  select 
 PAYMENT_DATE, 
 WRITE_OFF_AMOUNT, 
 TOTAL_PAYMENT, 
 TOTAL_CHECK_PAYMENT, 
 CHECK_LOCKBOX_PAYMENT, 
 CHECK_NCO_PAYMENT, 
 CHECK_OTHER_PAYMENT, 
 CHECK_REFUND        , 
 CHECK_REVERSAL       , 
 TOTAL_DD_PAYMENT     , 
 TOTAL_CC_PAYMENT     , 
 TOTAL_CC_REFUND      , 
 TOTAL_CC_DISPUTE     , 
 AMEX_PAYMENT         , 
 VISA_PAYMENT         , 
 MC_PAYMENT           , 
 DISC_PAYMENT         , 
 OTHER_CC_PAYMENT     , 
 AMEX_REFUND          , 
 VISA_REFUND          , 
 MC_REFUND            , 
 DISC_REFUND          , 
 OTHER_CC_REFUND 
from pin.hns_collection_feed_t
;
--------------------------------------------------------
--  DDL for View HNS_DEAL_INVOICE_DETAILS_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_DEAL_INVOICE_DETAILS_VW" ("BILLING_DEAL_CREATE_DT", "BILLING_DEAL_NAME", "INVOICE_DESC", "GROUP_NAME", "PAYMENT_FREQUENCY", "DOLLAR_AMOUNT", "BILLING_SERVICES_ID", "GROUP_ID", "SUB_GROUP_ID", "RATE_TAG", "PROMO_PERIOD") AS 
  SELECT z.deal_created
                 AS Billing_Deal_Create_Dt,
             z.deal_used
                 AS billing_deal_name,
             z.invoice_descr
                 AS invoice_desc,
             z.group_name,
             CASE
                 WHEN    rd.event_type = '/event/billing/product/fee/purchase'
                      OR LOWER (RD.RATE_DESC) LIKE '%one%time%'
                 THEN
                     'One-time'
                 WHEN rd.event_type LIKE '%cycle%'
                 THEN
                     'Recurring'
                 ELSE
                     rd.event_type
             END
                 payment_frequency,
             SUM (
                 CASE
                     WHEN rd.rate_plan = 'VAR Token Purchase' THEN 0
                     ELSE rd.FIX_AMOUNT + rd.SCALED_AMOUNT
                 END)
                 Dollar_Amount,
             z.PERMITTED
                 billing_services_id,
             z.group_order_no
                 GROUP_ID,
             z.service_order_no
                 sub_group_id,
             RD.RATE_DESC
                 Rate_tag,
             MAX (
                 NVL (
                     rd.term,
                     (SELECT MAX (RDV.STEP_MAX)     term
                        FROM hns_rate_detail_vw rdv
                       WHERE     RDV.PRODUCT_OBJ_ID0 = rd.product_obj_id0
                             AND RDV.RPT_ELEMENT_ID = 840
                             AND NOT EXISTS
                                     (SELECT 1
                                        FROM hns_rate_detail_vw ldv
                                       WHERE     LDV.PRODUCT_OBJ_ID0 =
                                                 RDV.PRODUCT_OBJ_ID0
                                             AND LDV.STEP_MIN = RDV.STEP_MAX
                                             AND RDV.ELEMENT_ID =
                                                 LDV.ELEMENT_ID)
                             AND RDV.STEP_RESOURCE NOT IN
                                     (0, 10100009, 101000099)
                             AND RDV.STEP_MAX IS NOT NULL)))
                 PROMO_PERIOD
        FROM (WITH sgl as
        (Select *
from HNS_CON_INV_SUBGROUP_T sg
where exists (select 1 from HNS_CON_INV_GROUP_T cf where cf.REC_ID = sg.GROUP_REC_ID and cf.GROUP_ID =1))
                  ,x
                  AS
                      (SELECT CASE
                                  WHEN dn.DEAL_NAME IS NOT NULL
                                  THEN
                                      'Deal'
                                  WHEN srv.service_type IS NOT NULL
                                  THEN
                                      'Service'
                                  ELSE
                                      NULL
                              END
                                  lnk_sort_type,
                              CASE
                                  WHEN dn.DEAL_NAME IS NOT NULL
                                  THEN
                                      dn.deal_name
                                  WHEN srv.service_type IS NOT NULL
                                  THEN
                                      srv.SERVICE_TYPE
                                  ELSE
                                      NULL
                              END
                                  lnk_type,
                              CASE
                                  WHEN dn.DEAL_NAME IS NULL
                                  THEN
                                      srv.SERVICE_TYPE
                                 ELSE
                                      ''
                              END
                                  lnk_service,
                              dn.deal_name
                                  AS lnk_deal,
                              d.name
                                  deal_used,
                              d.POID_ID0
                                  AS deal_id,
                              u2d (d.CREATED_T)
                                  deal_created,
                              d.permitted
                         FROM deal_t d
                              LEFT OUTER JOIN sgl srv
                                  ON srv.SERVICE_TYPE = d.PERMITTED
                              LEFT OUTER JOIN sgl dn
                                  ON d.name LIKE
                                         REPLACE (dn.DEAL_NAME, '*', '%')
                                         --where d.name = :DN
                                                                         ),
                  y
                  AS
                      (SELECT NVL (cis.service_type,
                                   NVL (cis.deal_name, cis.event_poid_type))
                                  event_item,
                              (CASE
                                   WHEN cis.service_type IS NOT NULL
                                   THEN
                                       'Service'
                                   WHEN cis.deal_name IS NOT NULL
                                   THEN
                                       'Deal'
                                   WHEN cis.event_poid_type IS NOT NULL
                                   THEN
                                       'Event'
                               END)
                                  AS sort_type,
                              cis.group_rec_id,
                              cis.order_no
                                  service_order_no,
                              cis.rec_id
                                  service_rec_id,
                              cig.group_name,
                              cig.order_no
                                  group_order_no,
                              cig.GROUP_ID,
                              cig.is_tax_group,
                              cnf.GROUP_ID
                                  config_group_id,
                              cnf.gl_segment
                         FROM HNS_CON_INV_SUBGROUP_T cis,
                              HNS_CON_INV_GROUP_T   cig,
                              HNS_CON_INV_GRP_CFG_T cnf
                        WHERE     cis.group_Rec_id = cig.rec_id
                              AND cig.GROUP_ID = cnf.GROUP_ID(+)
                              and cnf.GROUP_ID = 1
                              )
              SELECT x.*,
                     NVL (
                         (SELECT hci.deal_type
                            FROM hns_con_inv_deal_t hci
                           WHERE     hci.deal_name = x.deal_used
                                 AND hci.status = 'A'),
                         x.deal_used)
                         invoice_descr,
                     y.event_item,
                     NVL (y.GROUP_ORDER_NO, 6)
                         AS GROUP_ORDER_NO,
                     NVL (y.SERVICE_ORDER_NO, 999)
                         AS SERVICE_ORDER_NO,
                     NVL (y.GROUP_NAME, 'Other')
                         AS GROUP_NAME
                FROM x
                     LEFT OUTER JOIN y
                         ON     x.LNK_SORT_TYPE = y.sort_type
                            AND x.lnk_type = y.event_item) z
             JOIN deal_products_t dp ON z.deal_id = dp.obj_id0
             JOIN hns_rate_detail_vw rd
                 ON     rd.PRODUCT_OBJ_ID0 = dp.PRODUCT_OBJ_ID0
                    AND 0 BETWEEN NVL (rd.STEP_MIN, 0)
                              AND CASE
                                      WHEN rd.STEP_MAX IS NULL THEN 1
                                      ELSE rd.STEP_MAX - 1
                                  END
                    AND rd.ELEMENT_ID = 840 --and rd.FIX_AMOUNT + rd.SCALED_AMOUNT !=0
       WHERE (   rd.event_type = '/event/billing/product/fee/purchase'
              OR rd.event_type LIKE '%cycle%')
    GROUP BY z.deal_created,
             z.deal_used,
             z.invoice_descr,
             z.group_name,
             CASE
                 WHEN    rd.event_type =
                         '/event/billing/product/fee/purchase'
                      OR LOWER (RD.RATE_DESC) LIKE '%one%time%'
                 THEN
                     'One-time'
                 WHEN rd.event_type LIKE '%cycle%'
                 THEN
                     'Recurring'
                 ELSE
                     rd.event_type
             END,
             z.PERMITTED,
             z.group_order_no,
             z.service_order_no,
             RD.RATE_DESC,
             rd.term
    ORDER BY z.group_order_no,
             z.service_order_no,
             z.invoice_descr,
             dollar_amount
;
--------------------------------------------------------
--  DDL for View HNS_EVENT_TRX_RATE_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_EVENT_TRX_RATE_VW" ("POID_DB", "POID_ID0", "POID_TYPE", "POID_REV", "CREATED_T", "MOD_T", "READ_ACCESS", "WRITE_ACCESS", "ACCOUNT_OBJ_DB", "ACCOUNT_OBJ_ID0", "ACCOUNT_OBJ_TYPE", "ACCOUNT_OBJ_REV", "ARCHIVE_STATUS", "CURRENCY", "DESCR", "EFFECTIVE_T", "END_T", "EARNED_START_T", "EARNED_END_T", "EARNED_TYPE", "EVENT_NO", "FLAGS", "GROUP_OBJ_DB", "GROUP_OBJ_ID0", "GROUP_OBJ_TYPE", "GROUP_OBJ_REV", "ITEM_OBJ_DB", "ITEM_OBJ_ID0", "ITEM_OBJ_TYPE", "ITEM_OBJ_REV", "NAME", "PROGRAM_NAME", "PROVIDER_DESCR", "PROVIDER_ID_DB", "PROVIDER_ID_ID0", "PROVIDER_ID_TYPE", "PROVIDER_ID_REV", "PROVIDER_IPADDR", "RUM_NAME", "TOD_MODE", "TIMEZONE_MODE", "MIN_QUANTITY", "MIN_UNIT", "INCR_QUANTITY", "INCR_UNIT", "ROUNDING_MODE", "NET_QUANTITY", "UNRATED_QUANTITY", "SERVICE_OBJ_DB", "SERVICE_OBJ_ID0", "SERVICE_OBJ_TYPE", "SERVICE_OBJ_REV", "SESSION_OBJ_DB", "SESSION_OBJ_ID0", "SESSION_OBJ_TYPE", "SESSION_OBJ_REV", "START_T", "SYS_DESCR", "TAX_LOCALES", "TAX_SUPPLIER_ID_DB", "TAX_SUPPLIER_ID_ID0", "TAX_SUPPLIER_ID_TYPE", "TAX_SUPPLIER_ID_REV", "USERID_DB", "USERID_ID0", "USERID_TYPE", "USERID_REV", "INVOICE_DATA") AS 
  select /*+ RULE */ "POID_DB","POID_ID0","POID_TYPE","POID_REV","CREATED_T","MOD_T","READ_ACCESS","WRITE_ACCESS","ACCOUNT_OBJ_DB","ACCOUNT_OBJ_ID0","ACCOUNT_OBJ_TYPE","ACCOUNT_OBJ_REV","ARCHIVE_STATUS","CURRENCY","DESCR","EFFECTIVE_T","END_T","EARNED_START_T","EARNED_END_T","EARNED_TYPE","EVENT_NO","FLAGS","GROUP_OBJ_DB","GROUP_OBJ_ID0","GROUP_OBJ_TYPE","GROUP_OBJ_REV","ITEM_OBJ_DB","ITEM_OBJ_ID0","ITEM_OBJ_TYPE","ITEM_OBJ_REV","NAME","PROGRAM_NAME","PROVIDER_DESCR","PROVIDER_ID_DB","PROVIDER_ID_ID0","PROVIDER_ID_TYPE","PROVIDER_ID_REV","PROVIDER_IPADDR","RUM_NAME","TOD_MODE","TIMEZONE_MODE","MIN_QUANTITY","MIN_UNIT","INCR_QUANTITY","INCR_UNIT","ROUNDING_MODE","NET_QUANTITY","UNRATED_QUANTITY","SERVICE_OBJ_DB","SERVICE_OBJ_ID0","SERVICE_OBJ_TYPE","SERVICE_OBJ_REV","SESSION_OBJ_DB","SESSION_OBJ_ID0","SESSION_OBJ_TYPE","SESSION_OBJ_REV","START_T","SYS_DESCR","TAX_LOCALES","TAX_SUPPLIER_ID_DB","TAX_SUPPLIER_ID_ID0","TAX_SUPPLIER_ID_TYPE","TAX_SUPPLIER_ID_REV","USERID_DB","USERID_ID0","USERID_TYPE","USERID_REV","INVOICE_DATA" from event_t where poid_type = '/event/session/trx_rate'


;
--------------------------------------------------------
--  DDL for View HNS_FCC_PRODUCTS_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_FCC_PRODUCTS_VW" ("ACCOUNT_NO", "ACCOUNT_OBJ_ID0", "DEAL_NAME", "CYCLE_START_DATE", "CYCLE_END", "STATUS", "POID_ID0", "MAX_POID") AS 
  select
 a.account_no,
ap.account_obj_id0, d.name as deal_name, i2d(ap.cycle_start_t) as cycle_start_date, i2d(ap.cycle_end_t) as cycle_end , ap.status, AP.POID_ID0,'N' AS MAX_POID from purchased_product_t ap, deal_t d, account_t a where
a.poid_id0 = ap.account_obj_Id0 and
d.poid_id0 = ap.deal_obj_id0 and
 service_obj_type = '/service/ip' and
 ap.created_t <= (SELECT CASE WHEN TO_NUMBER(TO_CHAR(sysdate,'MM')) < 7 THEN d2i('01-JAN-'||TO_CHAR(SYSDATE,'YYYY'))
ELSE  d2i('01-JUL-'||TO_CHAR(SYSDATE,'YYYY')) END FROM DUAL) and
 (ap.status <> 3  OR
(AP.STATUS = 3 AND AP.cycle_end_t >= CASE WHEN TO_NUMBER(TO_CHAR(sysdate,'MM')) < 7 THEN d2i('01-JAN-'||TO_CHAR(SYSDATE,'YYYY'))
ELSE  d2i('01-JUL-'||TO_CHAR(SYSDATE,'YYYY')) END))

;
--------------------------------------------------------
--  DDL for View HNS_FCC_SITES_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_FCC_SITES_VW" ("ACCOUNT_OBJ_ID0", "ACCOUNT_NO", "CREATION_DATE", "LAST_STATUS_DATE", "GL_SEGMENT", "ADDRESS", "CITY", "STATE", "ZIP", "GEOCODE", "SOURCE") AS 
  select AP.ACCOUNT_OBJ_ID0, A.ACCOUNT_NO, I2D(AP.CREATED_T) AS CREATION_DATE,  I2D(AP.LAST_STATUS_T) AS LAST_STATUS_DATE, A.GL_SEGMENT,
AN.ADDRESS, AN.CITY, AN.STATE, AN.ZIP, P.GEOCODE,
'CBRM' AS SOURCE from SERVICE_T ap, ACCOUNT_T A ,
ACCOUNT_NAMEINFO_T AN , PROFILE_T P
where
A.POID_iD0 = P.ACCOUNT_OBJ_ID0 AND
A.POID_ID0  = AP.ACCOUNT_OBJ_ID0 AND
A.POID_iD0 = AN.OBJ_ID0 AND
ap.POID_TYPE = '/service/ip' and
ap.CREATED_T < CASE WHEN TO_NUMBER(TO_CHAR(sysdate,'MM')) < 7 THEN d2i('01-JAN-'||TO_CHAR(SYSDATE,'YYYY'))
ELSE  d2i('01-JUL-'||TO_CHAR(SYSDATE,'YYYY')) END  AND
(ap.status <> 10103  OR
(AP.STATUS = 10103 AND AP.LAST_STATUS_T >= CASE WHEN TO_NUMBER(TO_CHAR(sysdate,'MM')) < 7 THEN d2i('01-JAN-'||TO_CHAR(SYSDATE,'YYYY'))
ELSE  d2i('01-JUL-'||TO_CHAR(SYSDATE,'YYYY')) END))

;
--------------------------------------------------------
--  DDL for View HNS_INV_FEE_INVOICE_PO_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_INV_FEE_INVOICE_PO_VW" ("ACCOUNT_OBJ_ID0", "PO_ORDER_NO") AS 
  SELECT ACCOUNT_OBJ_ID0, PO_ORDER_NO FROM 
PAYINFO_T P, PAYINFO_INV_T PO WHERE 
P.POID_ID0 = PO.OBJ_ID0
;
--------------------------------------------------------
--  DDL for View HNS_ORDER_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_ORDER_VW" ("SAN", "CREATED_T", "SOURCEID") AS 
  (select customer_id SAN, date_to_infranet(create_dt) created_t, source_customer_id SOURCEID 
from dss_order_t) 
union 
(select san, created_t, sourceid from hns_order_t)

;
--------------------------------------------------------
--  DDL for View HNS_PAYINFO_CC_HISTORY_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_PAYINFO_CC_HISTORY_VW" ("REC_ID", "CREATED_T", "MOD_T", "ACCOUNT_OBJ_ID0", "AUTH_DATE", "DEBIT_EXP", "DEBIT_NUM", "DECLINE_CODE", "PO_ORDER_NO", "AUDIT_FLAG", "BILL_TYPE", "POID_ID0", "POID_TYPE", "ADDRESS", "CITY", "COUNTRY", "NAME", "STATE", "ZIP") AS 
  SELECT 
	  H.REC_ID, 
	  H.CREATED_T, 
	  H.MOD_T, 
	  H.ACCOUNT_OBJ_ID0, 
	  H.AUTH_DATE, 
	  H.DEBIT_EXP, 
	  H.DEBIT_NUM, 
	  H.DECLINE_CODE, 
	  H.PO_ORDER_NO, 
	  H.AUDIT_FLAG, 
	  H.BILL_TYPE, 
	  HA.POID_ID0, 
	  HA.POID_TYPE, 
	  HA.ADDRESS, 
	  HA.CITY, 
	  HA.COUNTRY, 
	  HA.NAME, 
	  HA.STATE, 
	  HA.ZIP 
FROM 
	 HNS_PAYINFO_CC_HISTORY_T H, 
     HNS_PAYINFO_ADDRESS_T HA 
WHERE 
	 H.ACCOUNT_OBJ_ID0  = HA.ACCOUNT_OBJ_ID0(+)

;
--------------------------------------------------------
--  DDL for View HNS_PROVIDER_ACCOUNT_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_PROVIDER_ACCOUNT_VW" ("ACCOUNT_NO", "REMOTES", "LOGIN", "ACCOUNT_POID", "SERVICE_POID") AS 
  select account_no , fnGetNumberOfRemotes(s.login,'06/01/2001') remotes ,
	   login , a.poid_id0 account_poid , s.poid_id0 service_poid
from account_t a , service_t s
where
	  a.poid_id0 = s.account_obj_id0 and
	  s.poid_type = '/service/provider' and
	  s.status = 10100


;
--------------------------------------------------------
--  DDL for View HNS_RATE_DETAIL_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_RATE_DETAIL_VW" ("PRODUCT_NAME", "PRODUCT_OBJ_ID0", "GLID_NAME", "RATE_PLAN_START", "RATE_PLAN_END", "RATE_PLAN", "RATE_PLAN_CREATED", "RATE_PLAN_MODIFIED", "TAX_CODE", "EVENT_TYPE", "CODE", "RATE_PLAN_OBJ_ID0", "RATE_DESC", "PRORATE_FIRST", "PRORATE_LAST", "STEP_TYPE", "STEP_RESOURCE", "RATE_TYPE", "RATE_OBJ_ID0", "ELEMENT_ID", "FIX_AMOUNT", "SCALED_AMOUNT", "GL_ID", "RATE_TIER_NAME", "PRIORITY", "RATE_TIER_REC_ID", "STEP_MIN", "STEP_MAX", "RESOURCE_NAME", "ELEMENT_NAME", "RPT_ELEMENT_ID", "TERM", "TAX_WHEN", "SERVICE_TYPE") AS 
  SELECT p2pr (x.product_obj_id0)
               product_name,
           x."PRODUCT_OBJ_ID0",
           x."GLID_NAME",
           x."RATE_PLAN_START",
           x."RATE_PLAN_END",
           x."RATE_PLAN",
           x."RATE_PLAN_CREATED",
           x."RATE_PLAN_MODIFIED",
           x."TAX_CODE",
           x."EVENT_TYPE",
           x."CODE",
           x."RATE_PLAN_OBJ_ID0",
           x."RATE_DESC",
           x."PRORATE_FIRST",
           x."PRORATE_LAST",
           x."STEP_TYPE",
           x."STEP_RESOURCE",
           x."RATE_TYPE",
           x."RATE_OBJ_ID0",
           x."ELEMENT_ID",
           x."FIX_AMOUNT",
           x."SCALED_AMOUNT",
           x."GL_ID",
           x."RATE_TIER_NAME",
           x."PRIORITY",
           x."RATE_TIER_REC_ID",
           x."STEP_MIN",
           x."STEP_MAX",
           x."RESOURCE_NAME",
           x."ELEMENT_NAME",
           x."RPT_ELEMENT_ID",
           (SELECT MAX (rq.step_max)     AS term
              FROM rate_plan_t rp, rate_t r, rate_quantity_tiers_t rq
             WHERE     x.product_obj_id0 = rp.product_obj_id0
                   AND RP.EVENT_TYPE = '/event/billing/product/fee/cancel'
                   AND x.element_id != 10100009
                   AND r.rate_plan_obj_id0 = rp.poid_id0
                   AND r.poid_id0 = rq.obj_id0)
               AS term
               ,TAX_WHEN
               , (select P.PERMITTED FROM PRODUCT_T P WHERE P.POID_ID0 = x.product_obj_id0) SERVICE_TYPE
      FROM (  SELECT RP.PRODUCT_OBJ_ID0,
                     (SELECT CGT.DESCR
                        FROM config_glid_t cgt
                       WHERE CGT.REC_ID = rbi.gl_id)
                        glid_name,
                     (SELECT TO_DATE (
                                 DECODE (drr.start_t,
                                         0, NULL,
                                         u2d (drr.start_t)))
                        FROM date_ranges_t drr
                       WHERE     rt.obj_id0 = drr.obj_id0
                             AND drr.rate_obj_id0 = r.poid_id0
                             AND DRR.START_T <> DRR.END_T)
                         rate_plan_start,
                     (SELECT TO_DATE (
                                 DECODE (drr.end_t, 0, NULL, u2d (drr.end_t)))
                        FROM date_ranges_t drr
                       WHERE     rt.obj_id0 = drr.obj_id0
                             AND drr.rate_obj_id0 = r.poid_id0
                             AND DRR.START_T <> DRR.END_T)
                         rate_plan_end,
                     (SELECT DRR.OBJ_ID0
                        FROM date_ranges_t drr
                       WHERE     r.rate_plan_obj_id0 = drr.obj_id0
                             AND drr.rate_obj_id0 = r.poid_id0
                             AND DRR.START_T <> DRR.END_T)
                         Rate_end_date_check,
                     (SELECT DISTINCT DRR.OBJ_ID0
                        FROM date_ranges_t drr
                       WHERE     r.rate_plan_obj_id0 = drr.obj_id0
                             AND DRR.START_T <> DRR.END_T)
                         Rate_end_check,
                     RP.NAME
                         rate_plan,
                     RP.CREATED_T
                         rate_plan_created,
                     RP.MOD_T
                         rate_plan_modified,
                     RP.TAX_CODE,
                     RP.EVENT_TYPE,
                     RP.CODE,
                     R.RATE_PLAN_OBJ_ID0,
                     R.DESCR
                         rate_desc,
                     R.PRORATE_FIRST,
                     R.PRORATE_LAST,
                     R.STEP_TYPE,
                     R.STEP_RESOURCE,
                     R.TYPE
                         rate_type,
                     R.POID_ID0
                         rate_obj_id0,
                     RBI.ELEMENT_ID,
                     RBI.FIX_AMOUNT,
                     RBI.SCALED_AMOUNT,
                     RBI.GL_ID,
                     RT.NAME
                         rate_tier_name,
                     RT.PRIORITY,
                     RT.REC_ID
                         rate_tier_rec_id,
                     RQT.STEP_MIN,
                     RQT.STEP_MAX,
                     (SELECT DECODE (cbb.NAME, 'Invalid', NULL, cbb.NAME)
                        FROM CONFIG_BEID_BALANCES_T cbb
                       WHERE cbb.REC_ID = r.STEP_RESOURCE)
                         resource_name,
                     (SELECT DECODE (cbb.NAME, 'Invalid', NULL, cbb.NAME)
                        FROM CONFIG_BEID_BALANCES_T cbb
                       WHERE cbb.REC_ID = rbi.ELEMENT_ID)
                         element_name,
                     DECODE (rbi.element_id,
                             10100016, 840,
                             10100015, 840,
                             rbi.element_id)
                         rpt_element_id,
                         rp.TAX_WHEN
                FROM rate_t r
                     JOIN rate_plan_t rp ON (rp.poid_id0 = r.rate_plan_obj_id0)
                     JOIN rate_bal_impacts_t rbi ON (rbi.obj_id0 = r.poid_id0)
                     JOIN rate_tiers_t rt
                         ON (    r.rate_plan_obj_id0 = rt.obj_id0
                             AND (   RT.RATE_OBJ_ID0 = R.POID_ID0
                                  OR     RT.RATE_OBJ_ID0 = 0
                                     AND RT.REC_ID = RBI.REC_ID))
                     JOIN rate_quantity_tiers_t rqt
                         ON (    rqt.obj_id0 = r.poid_id0
                             AND RBI.REC_ID2 = RQT.REC_ID)
            ORDER BY RP.PRODUCT_OBJ_ID0,
                     RP.EVENT_TYPE,
                     RQT.STEP_MIN,
                     RQT.STEP_MAX) x
     WHERE (   x.Rate_end_check IS NULL
            OR x.Rate_end_check = x.Rate_end_date_check)
;
--------------------------------------------------------
--  DDL for View HNS_TRX_RATE_REPORT_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_TRX_RATE_REPORT_VW" ("EVENT_POID", "EVENT_ACCOUNT_POID", "EVENT_SERVICE_POID", "START_TIME", "END_TIME", "EVENT_TIME", "TRX_AMOUNT", "TRX_REMOTES", "PRIORITY", "RATE", "MB", "AMOUNT", "RESOURCE_ID", "QUANTITY", "ACCOUNT_NO", "REMOTES", "SITE_ID") AS 
  select /*+ FIRST_ROWS */
	   ev.poid_id0 event_poid ,
	   ev.account_obj_id0 event_account_poid ,
	   ev.service_obj_id0 event_service_poid ,
	   ev.start_t start_time ,
	   ev.end_t end_time ,
	   ev.effective_t event_time,
	   h.amount trx_amount,
	   h.number_of_remotes trx_remotes,
	   h.priority ,
	   h.rate ,
	   h.MB ,
	   e.amount ,
	   e.resource_id ,
	   e.quantity ,
	   hp.account_no ,
	   hp.remotes ,
	   hp.login site_id
from hns_tx_rate_t h , event_bal_impacts_t e ,  hns_event_trx_rate_vw ev , hns_provider_account_vw  hp
where
	  h.obj_id0 = e.obj_id0 and
	  h.obj_id0 = ev.poid_id0 and
	  ev.service_obj_id0 = hp.service_poid


;
--------------------------------------------------------
--  DDL for View HNS_TRX_SUMMARY_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_TRX_SUMMARY_VW" ("PROVIDER_ID", "MEGABYTES") AS 
  SELECT v.provider_id , sum(v.bytes)/ 1048576 megabytes
FROM  hns_trx_tank_vw v
GROUP by provider_id


;
--------------------------------------------------------
--  DDL for View HNS_TRX_TANK_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."HNS_TRX_TANK_VW" ("PROVIDER_ID", "PACKAGE_ID", "PACKAGE_NAME", "PRIORITY", "START_T", "END_T", "BYTES") AS 
  SELECT provider_id , package_id , package_name, priority , min(start_t) start_t, min(end_t) end_t, max(bytes) bytes
FROM  hns_trx_tank_t
GROUP BY provider_id , package_id , package_name, priority


;
--------------------------------------------------------
--  DDL for View LAST_ADJUSTMENT_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."LAST_ADJUSTMENT_VW" ("ACCOUNT_ID", "PARENT_ACCOUNT_ID", "LAST_ADJUSTMENT_DATE", "ADJUSTMENT_TOTAL_AMOUNT") AS 
  select account_obj_id0 account_id, (select account_obj_id0 from billinfo_t where poid_id0 = i.ar_billinfo_obj_id0) parent_account_id,
max(created_t) last_adjustment_date , sum(item_total) adjustment_total_amount
from item_t i
where poid_type = '/item/adjustment'
group by account_obj_id0, ar_billinfo_obj_id0
;
--------------------------------------------------------
--  DDL for View LAST_PAYMENT_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."LAST_PAYMENT_VW" ("ACCOUNT_ID", "PARENT_ACCOUNT_ID", "LAST_PAYMENT_DATE", "PAYMENT_TOTAL_AMOUNT") AS 
  select account_obj_id0 account_id, (select account_obj_id0 from billinfo_t where poid_id0 = i.ar_billinfo_obj_id0) parent_account_id,
max(created_t) last_payment_date , sum(item_total) payment_total_amount
from item_t i
where poid_type = '/item/payment'
group by account_obj_id0, ar_billinfo_obj_id0
;
--------------------------------------------------------
--  DDL for View MOD_CORR_ITEMS_FIN
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."MOD_CORR_ITEMS_FIN" ("CORRECT_AR_OBJ_ID0", "CORRECT_DUE", "POID_DB", "POID_ID0", "POID_TYPE", "POID_REV", "CREATED_T", "MOD_T", "READ_ACCESS", "WRITE_ACCESS", "ACCOUNT_OBJ_DB", "ACCOUNT_OBJ_ID0", "ACCOUNT_OBJ_TYPE", "ACCOUNT_OBJ_REV", "ADJUSTED", "AR_ACCOUNT_OBJ_DB", "AR_ACCOUNT_OBJ_ID0", "AR_ACCOUNT_OBJ_TYPE", "AR_ACCOUNT_OBJ_REV", "AR_BILL_OBJ_DB", "AR_BILL_OBJ_ID0", "AR_BILL_OBJ_TYPE", "AR_BILL_OBJ_REV", "ARCHIVE_STATUS", "BILL_OBJ_DB", "BILL_OBJ_ID0", "BILL_OBJ_TYPE", "BILL_OBJ_REV", "CLOSED_T", "OPENED_T", "GL_SEGMENT", "CURRENCY", "CURRENCY_OPERATOR", "CURRENCY_RATE", "CURRENCY_SECONDARY", "DISPUTED", "DUE", "DUE_T", "EFFECTIVE_T", "ITEM_NO", "ITEM_TOTAL", "NAME", "RECVD", "STATUS", "TRANSFERED", "SERVICE_OBJ_DB", "SERVICE_OBJ_ID0", "SERVICE_OBJ_REV", "SERVICE_OBJ_TYPE", "EVENT_POID_LIST", "WRITEOFF") AS 
  select "CORRECT_AR_OBJ_ID0","CORRECT_DUE","POID_DB","POID_ID0","POID_TYPE","POID_REV","CREATED_T","MOD_T","READ_ACCESS","WRITE_ACCESS","ACCOUNT_OBJ_DB","ACCOUNT_OBJ_ID0","ACCOUNT_OBJ_TYPE","ACCOUNT_OBJ_REV","ADJUSTED","AR_ACCOUNT_OBJ_DB","AR_ACCOUNT_OBJ_ID0","AR_ACCOUNT_OBJ_TYPE","AR_ACCOUNT_OBJ_REV","AR_BILL_OBJ_DB","AR_BILL_OBJ_ID0","AR_BILL_OBJ_TYPE","AR_BILL_OBJ_REV","ARCHIVE_STATUS","BILL_OBJ_DB","BILL_OBJ_ID0","BILL_OBJ_TYPE","BILL_OBJ_REV","CLOSED_T","OPENED_T","GL_SEGMENT","CURRENCY","CURRENCY_OPERATOR","CURRENCY_RATE","CURRENCY_SECONDARY","DISPUTED","DUE","DUE_T","EFFECTIVE_T","ITEM_NO","ITEM_TOTAL","NAME","RECVD","STATUS","TRANSFERED","SERVICE_OBJ_DB","SERVICE_OBJ_ID0","SERVICE_OBJ_REV","SERVICE_OBJ_TYPE","EVENT_POID_LIST","WRITEOFF" from ALL_CORR_ITEMS_FIN 
where mod_t > 1080190800

;
--------------------------------------------------------
--  DDL for View NOT_FREE_PRODUCTS_IP_HW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."NOT_FREE_PRODUCTS_IP_HW" ("PRODUCT_ID", "PRODUCT_DESCRIPTION", "DEAL_NAME") AS 
  select p.poid_id0 PRODUCT_ID,p.descr PRODUCT_DESCRIPTION, d.name DEAL_NAME
from rate_bal_impacts_t rbi, rate_t r, rate_plan_t rp, product_t p, deal_t d, deal_products_t dp
where r.poid_id0 = rbi.obj_id0
and rbi.element_id = 840
and rp.poid_id0 = r.RATE_PLAN_OBJ_ID0
and p.poid_id0 = rp.PRODUCT_OBJ_ID0
and (p.permitted  = '/service/ip' or p.permitted  = '/service/hardware')
and d.poid_id0 = dp.obj_id0
and dp.product_obj_id0 = p.poid_id0
group by p.poid_id0,p.descr, d.name
having (sum(rbi.FIX_AMOUNT) != 0 or sum(rbi.scaled_AMOUNT) != 0)
;
--------------------------------------------------------
--  DDL for View PARENT_CHILD_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."PARENT_CHILD_VW" ("PARENT_ACCOUNT_ID", "PARENT_ACCOUNT_NO", "CHILD_ACCOUNT_ID", "CHILD_ACCOUNT_NO") AS 
  select a1.poid_id0 PARENT_ACCOUNT_ID, a1.account_no PARENT_ACCOUNT_NO, a2.poid_id0 CHILD_ACCOUNT_ID,
a2.account_no CHILD_ACCOUNT_NO
from group_billing_members_t gbm, group_t g, account_t a1, account_t a2
where g.poid_id0 = gbm.obj_id0
and g.account_obj_id0 = a1.poid_id0
and gbm.object_id0 = a2.poid_id0
;
--------------------------------------------------------
--  DDL for View PAYMENT_LAST_MODIFIED_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."PAYMENT_LAST_MODIFIED_VW" ("PAYMENT_TYPE", "ACCOUNT_ID", "PAYMENT_ID", "LAST_UPDATE") AS 
  SELECT
PAYINFO_T.POID_TYPE PAYMENT_TYPE, PAYINFO_T.ACCOUNT_OBJ_ID0  ACCOUNT_ID,
PAYINFO_T.POID_ID0 PAYMENT_ID,MAX(PAYINFO_T.MOD_T) LAST_UPDATE
FROM
PAYINFO_T
GROUP BY
PAYINFO_T.POID_ID0,PAYINFO_T.POID_TYPE,PAYINFO_T.ACCOUNT_OBJ_ID0
;
--------------------------------------------------------
--  DDL for View PIN_COMMAND
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."PIN_COMMAND" ("PAY_TYPE", "COUNTRY", "STATE", "CURRENCY", "AMOUNT", "DT", "STATUS") AS 
  SELECT   edate.pay_type, account_nameinfo_t.country, account_nameinfo_t.state,
         edate.currency, edate.amount, edate.dt, account_t.status
    FROM (account_t account_t INNER JOIN account_nameinfo_t account_nameinfo_t ON account_t.poid_id0 =
                                                                                    account_nameinfo_t.obj_id0)
         INNER JOIN (SELECT event_billing_payment_t.amount,
                            event_billing_payment_cash_t.effective_t AS dt,
                            event_t.account_obj_id0,
                            event_billing_payment_t.pay_type,
                            event_billing_payment_t.currency
                       FROM event_billing_payment_t,
                            event_billing_payment_cash_t,
                            event_t
                      WHERE event_billing_payment_t.obj_id0 =
                                          event_billing_payment_cash_t.obj_id0
                        AND event_t.poid_type = N'/event/billing/payment/cash'
                        AND event_t.poid_id0 = event_billing_payment_t.obj_id0
                     UNION ALL
                     SELECT event_billing_payment_t.amount,
                            event_billing_payment_check_t.effective_t AS dt,
                            event_t.account_obj_id0,
                            event_billing_payment_t.pay_type,
                            event_billing_payment_t.currency
                       FROM event_billing_payment_t,
                            event_billing_payment_check_t,
                            event_t
                      WHERE event_billing_payment_t.obj_id0 =
                                         event_billing_payment_check_t.obj_id0
                        AND event_t.poid_type =
                                               N'/event/billing/payment/check'
                        AND event_t.poid_id0 = event_billing_payment_t.obj_id0
                     UNION ALL
                     SELECT event_billing_payment_t.amount,
                            event_t.end_t AS dt, event_t.account_obj_id0,
                            event_billing_payment_t.pay_type,
                            event_billing_payment_t.currency
                       FROM event_billing_payment_t, event_t,event_billing_payment_cc_t
                      WHERE event_t.poid_type = N'/event/billing/payment/cc'
                        AND event_t.poid_id0 = event_billing_payment_t.obj_id0
						AND event_billing_payment_t.COMMAND <> 2.00
						AND event_billing_payment_cc_t.OBJ_ID0 = event_billing_payment_t.obj_id0
						AND event_billing_payment_cc_t.result =0
                     UNION ALL
                     SELECT event_billing_payment_t.amount,
                            event_t.end_t AS dt, event_t.account_obj_id0,
                            event_billing_payment_t.pay_type,
                            event_billing_payment_t.currency
                       FROM event_billing_payment_t,
                            event_billing_payment_dd_t,
                            event_t
                      WHERE event_billing_payment_t.obj_id0 =
                                            event_billing_payment_dd_t.obj_id0
                        AND event_t.poid_type = N'/event/billing/payment/dd'
                        AND event_t.poid_id0 = event_billing_payment_t.obj_id0
                     UNION ALL
                     SELECT event_billing_payment_t.amount,
                            event_billing_payment_payord_t.effective_t AS dt,
                            event_t.account_obj_id0,
                            event_billing_payment_t.pay_type,
                            event_billing_payment_t.currency
                       FROM event_billing_payment_t,
                            event_billing_payment_payord_t,
                            event_t
                      WHERE event_billing_payment_t.obj_id0 =
                                        event_billing_payment_payord_t.obj_id0
                        AND event_t.poid_type =
                                            N'/event/billing/payment/payorder'
                        AND event_t.poid_id0 = event_billing_payment_t.obj_id0
                     UNION ALL
                     SELECT event_billing_payment_t.amount,
                            event_billing_payment_post_t.effective_t AS dt,
                            event_t.account_obj_id0,
                            event_billing_payment_t.pay_type,
                            event_billing_payment_t.currency
                       FROM event_billing_payment_t,
                            event_billing_payment_post_t,
                            event_t
                      WHERE event_billing_payment_t.obj_id0 =
                                          event_billing_payment_post_t.obj_id0
                        AND event_t.poid_type =
                                         N'/event/billing/payment/postalorder'
                        AND event_t.poid_id0 = event_billing_payment_t.obj_id0
                     UNION ALL
                     SELECT event_billing_payment_t.amount,
                            event_billing_payment_wtran_t.effective_t AS dt,
                            event_t.account_obj_id0,
                            event_billing_payment_t.pay_type,
                            event_billing_payment_t.currency
                       FROM event_billing_payment_t,
                            event_billing_payment_wtran_t,
                            event_t
                      WHERE event_billing_payment_t.obj_id0 =
                                         event_billing_payment_wtran_t.obj_id0
                        AND event_t.poid_type =
                                           N'/event/billing/payment/wtransfer'
                        AND event_t.poid_id0 = event_billing_payment_t.obj_id0) edate ON edate.account_obj_id0 =
                                                                                           account_t.poid_id0
   WHERE account_t.poid_db > 0
     AND account_t.poid_id0 > 1
     AND account_nameinfo_t.rec_id = 1
ORDER BY edate.pay_type, account_nameinfo_t.country, edate.currency
;
--------------------------------------------------------
--  DDL for View PROCESSED_SATURDAY
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."PROCESSED_SATURDAY" ("RECORD_ID", "ACCOUNT_NUMBER", "INVOICE_NUMBER", "INVOICE_AMOUNT", "BATCH_ID", "CHECK_NUMBER", "CHECK_DATE", "CHECK_AMOUNT", "STATUS", "REASON_ID", "USER_LOGIN", "REMITTER_NAME", "ZIPCODE", "MICRRT", "AU_ACCOUNT_NUMBER", "AU_INVOICE_NUMBER", "AU_CHECK_NUMBER", "AU_CHECK_AMOUNT", "CREATION_T", "REPROCESSED_T") AS 
  select "RECORD_ID","ACCOUNT_NUMBER","INVOICE_NUMBER","INVOICE_AMOUNT","BATCH_ID","CHECK_NUMBER","CHECK_DATE","CHECK_AMOUNT","STATUS","REASON_ID","USER_LOGIN","REMITTER_NAME","ZIPCODE","MICRRT","AU_ACCOUNT_NUMBER","AU_INVOICE_NUMBER","AU_CHECK_NUMBER","AU_CHECK_AMOUNT","CREATION_T","REPROCESSED_T" from hns_check_payments_t 
where creation_t > (select sysdate -4 from dual) 
and creation_t < (select sysdate -3 from dual) 
and status not in ('P', 'PWE_ALL')
;
--------------------------------------------------------
--  DDL for View REP150
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REP150" ("ACCOUNT_ID", "ACCOUNT_NUMBER", "DEAL_NAME", "COUNT_OF_DEALS") AS 
  SELECT  e.account_obj_id0 ACCOUNT_ID,a.account_no ACCOUNT_NUMBER,d.name DEAL_NAME,COUNT(ebdi.deal_obj_id0) COUNT_OF_DEALS
FROM PRODUCT_T p, EVENT_BILLING_PRODUCT_T ebp, EVENT_BILLING_DEAL_INFO_T ebdi, DEAL_T d, EVENT_T e, ACCOUNT_T a
WHERE e.poid_id0 = ebp.obj_id0
AND p.poid_id0 = ebp.product_obj_id0
AND p.TYPE = 601
AND p.permitted = '/service/hardware'
AND p.name NOT LIKE '%Upgrade%'
AND e.poid_type = '/event/billing/product/fee/purchase'
AND ebdi.node_location = ebp.node_location
AND ebdi.DEAL_OBJ_ID0 = d.poid_id0
AND e.ACCOUNT_OBJ_ID0 = a.poid_id0
GROUP BY e.account_obj_id0,d.name,a.account_no
HAVING COUNT(ebdi.deal_obj_id0) > 1
;
--------------------------------------------------------
--  DDL for View REP150B
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REP150B" ("ACCOUNT_ID", "PARENT_ACCOUNT_ID", "LAST_ADJUSTMENT_DATE", "ADJUSTMENT_TOTAL_AMOUNT") AS 
  select account_obj_id0 account_id, (select account_obj_id0 from billinfo_t where poid_id0 = i.ar_billinfo_obj_id0) parent_account_id,
max(created_t) last_adjustment_date , sum(item_total) adjustment_total_amount
from item_t i
where poid_type = '/item/adjustment'
group by account_obj_id0, ar_billinfo_obj_id0
;
--------------------------------------------------------
--  DDL for View REP154
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REP154" ("BGSB_REC_ID2", "CURRENT_BAL", "LOGIN", "POID_TYPE", "ELEMENT_ID", "PERMITTED", "PRODUCT_STATUS", "NAME", "SERVICE_STATUS", "REC_ID", "STEP_MAX", "RBI_REC_ID2") AS 
  SELECT /*+ use_hash("SERVICE_T") */"BAL_GRP_SUB_BALS_T"."REC_ID2" "BGSB_REC_ID2", "BAL_GRP_SUB_BALS_T"."CURRENT_BAL", "SERVICE_T"."LOGIN", "SERVICE_T"."POID_TYPE", "RATE_BAL_IMPACTS_T"."ELEMENT_ID", "PRODUCT_T"."PERMITTED", "ACCOUNT_PRODUCTS_T"."STATUS" "PRODUCT_STATUS", "DEAL_T"."NAME", "SERVICE_T"."STATUS" "SERVICE_STATUS", "RATE_QUANTITY_TIERS_T"."REC_ID", "RATE_QUANTITY_TIERS_T"."STEP_MAX", "RATE_BAL_IMPACTS_T"."REC_ID2" "RBI_REC_ID2"
 FROM   "PIN"."DEAL_T" "DEAL_T", "PIN"."DEAL_PRODUCTS_T" "DEAL_PRODUCTS_T", "PIN"."PRODUCT_T" "PRODUCT_T", "PIN"."BAL_GRP_T" "BAL_GRP_T", "PIN"."SERVICE_T" "SERVICE_T", "PIN"."ACCOUNT_PRODUCTS_T" "ACCOUNT_PRODUCTS_T", "PIN"."BAL_GRP_SUB_BALS_T" "BAL_GRP_SUB_BALS_T", "PIN"."RATE_PLAN_T" "RATE_PLAN_T", "PIN"."RATE_T" "RATE_T", "PIN"."RATE_BAL_IMPACTS_T" "RATE_BAL_IMPACTS_T", "PIN"."RATE_QUANTITY_TIERS_T" "RATE_QUANTITY_TIERS_T"
 WHERE  ("DEAL_T"."POID_ID0"="DEAL_PRODUCTS_T"."OBJ_ID0") AND ("DEAL_PRODUCTS_T"."PRODUCT_OBJ_ID0"="PRODUCT_T"."POID_ID0") AND ("SERVICE_T"."ACCOUNT_OBJ_ID0"="ACCOUNT_PRODUCTS_T"."OBJ_ID0") AND ("BAL_GRP_T"."ACCOUNT_OBJ_ID0"="ACCOUNT_PRODUCTS_T"."OBJ_ID0") AND ("BAL_GRP_T"."POID_ID0"="BAL_GRP_SUB_BALS_T"."OBJ_ID0") AND ("PRODUCT_T"."POID_ID0"="ACCOUNT_PRODUCTS_T"."PRODUCT_OBJ_ID0") AND ("PRODUCT_T"."POID_ID0"="RATE_PLAN_T"."PRODUCT_OBJ_ID0") AND ("RATE_PLAN_T"."POID_ID0"="RATE_T"."RATE_PLAN_OBJ_ID0") AND (("RATE_T"."POID_ID0"="RATE_BAL_IMPACTS_T"."OBJ_ID0") AND ("BAL_GRP_SUB_BALS_T"."REC_ID2"="RATE_BAL_IMPACTS_T"."ELEMENT_ID")) AND ("RATE_T"."POID_ID0"="RATE_QUANTITY_TIERS_T"."OBJ_ID0") AND "RATE_BAL_IMPACTS_T"."ELEMENT_ID"<>840 AND "PRODUCT_T"."PERMITTED"='/service/hardware' AND "SERVICE_T"."STATUS"=10100 AND (("SERVICE_T"."LOGIN" LIKE 'T%' OR "SERVICE_T"."LOGIN" LIKE '%Q%') OR "SERVICE_T"."POID_TYPE"='/service/hardware') AND "ACCOUNT_PRODUCTS_T"."STATUS"<>1 AND "RATE_BAL_IMPACTS_T"."ELEMENT_ID"="BAL_GRP_SUB_BALS_T"."REC_ID2" AND "BAL_GRP_SUB_BALS_T"."CURRENT_BAL"<"RATE_QUANTITY_TIERS_T"."STEP_MAX" AND "RATE_QUANTITY_TIERS_T"."REC_ID"="RATE_BAL_IMPACTS_T"."REC_ID2" AND "DEAL_T"."NAME" LIKE '%12%' AND "SERVICE_T"."LOGIN" NOT  LIKE 'DUP%'
ORDER BY "SERVICE_T"."LOGIN", "SERVICE_T"."POID_TYPE"
;
--------------------------------------------------------
--  DDL for View REP236
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REP236" ("EDATE", "DAILY_ACCOUNT_CNT", "DAILY_ITEM_TOTAL") AS 
  SELECT TO_CHAR ( TO_DATE ('01-JAN-1970', 'DD-MON-YYYY')
                  + "ITEM_T"."EFFECTIVE_T" / (3600 * 24),
                  'YYYY/MM/DD'
                 ) edate,
         COUNT (DISTINCT "ACCOUNT_T"."ACCOUNT_NO") daily_account_cnt,
		 SUM ("ITEM_T"."DISPUTED") daily_item_total
		 FROM "PIN"."ACCOUNT_T" "ACCOUNT_T" INNER JOIN "PIN"."ITEM_T" "ITEM_T" ON "ACCOUNT_T"."POID_ID0" =
                                                                               "ITEM_T"."ACCOUNT_OBJ_ID0"
   WHERE "ITEM_T"."EFFECTIVE_T" >
              (TRUNC (SYSDATE) - TO_DATE ('01-JAN-1970', 'DD-MON-YYYY')) * 24 * 3600
            - (365 + 90) * 24 * 3600
     AND "ITEM_T"."ITEM_TOTAL" <> 0
	 AND "ITEM_T"."STATUS" = 4
	 AND "ITEM_T"."DISPUTED" <> 0
	GROUP BY TO_CHAR (  TO_DATE ('01-JAN-1970', 'DD-MON-YYYY')
                  + "ITEM_T"."EFFECTIVE_T" / (3600 * 24),
                  'YYYY/MM/DD'
                 )
;
--------------------------------------------------------
--  DDL for View REP276
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REP276" ("GROUP_ID") AS 
  select g.poid_id0 GROUP_ID
from group_t g, group_billing_members_t gbm
where g.account_obj_id0 = gbm.object_id0
;
--------------------------------------------------------
--  DDL for View REP277
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REP277" ("PARENT_ACCOUNT_ID", "PARENT_ACCOUNT_NO", "PARENT_STATUS", "CHILD_ACCOUNT_ID", "CHILD_ACCOUNT_NO", "CHILD_STATUS") AS 
  select a1.poid_id0 PARENT_ACCOUNT_ID, a1.account_no PARENT_ACCOUNT_NO,a1.status PARENT_STATUS, a2.poid_id0 CHILD_ACCOUNT_ID, a2.account_no CHILD_ACCOUNT_NO,a2.status CHILD_STATUS
from group_billing_members_t gbm, group_t g, account_t a1, account_t a2
where g.poid_id0 = gbm.obj_id0
and g.account_obj_id0 = a1.poid_id0
and gbm.object_id0 = a2.poid_id0
;
--------------------------------------------------------
--  DDL for View REP279A
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REP279A" ("PARENT_ACCOUNT_ID", "PARENT_ACCOUNT_NO", "CHILD_ACCOUNT_ID", "CHILD_ACCOUNT_NO", "TITLE") AS 
  select a1.poid_id0 PARENT_ACCOUNT_ID, a1.account_no PARENT_ACCOUNT_NO, a2.poid_id0 CHILD_ACCOUNT_ID, a2.account_no CHILD_ACCOUNT_NO, an.title
from group_billing_members_t gbm, group_t g, account_t a1, account_t a2, account_nameinfo_t an
where g.poid_id0 = gbm.obj_id0
and g.account_obj_id0 = a1.poid_id0
and gbm.object_id0 = a2.poid_id0
and a1.poid_id0 = an.obj_id0
;
--------------------------------------------------------
--  DDL for View REP298
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REP298" ("LAST_PURCHASE_DATE", "DESCR", "COUNTDESCR") AS 
  select i.effective_t Last_purchase_date, cg.descr DESCR, count(cg.descr) CountDescr
from item_t i, event_bal_impacts_t eb, config_glid_t cg
where eb.item_obj_id0 = i.poid_id0
AND substr(eb.GL_ID,6,8) = substr(cg.REC_ID,1,3)
AND cg.descr LIKE '%Upgrade%'
and i.EFFECTIVE_T >
              (TRUNC (SYSDATE) - TO_DATE ('01-JAN-1970', 'DD-MON-YYYY')) * 24 * 3600
            - (365 + 90) * 24 * 3600
group by i.effective_t, cg.descr

;
--------------------------------------------------------
--  DDL for View REP398
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REP398" ("CREATED_T", "CYCLE_START_T", "PRODUCT_DESCRIPTION", "DEAL_DESCRIPTION", "FIRST_NAME", "LAST_NAME", "EMAIL_ADDR", "ZIP", "LOGIN", "HNS_DISCOUNT_AUTHORIZER", "PAY_TYPE", "LAST_STATUS_T", "SERVICE_STATUS") AS 
  select a.created_t,ap.cycle_start_t,fp.product_description, fp.deal_description,an.first_name,an.last_name,an.email_addr,an.zip,
s.login,hpc.hns_discount_authorizer,bi.pay_type,s.last_status_t,s.status
from account_products_t ap, free_products fp,account_nameinfo_t an,account_t a,hns_profile_customer_t hpc, profile_t p,service_t s,billinfo_t bi
where
(fp.product_id = ap.product_obj_id0
or ap.cycle_discount = 1
or cycle_start_t > (select date_to_infranet(sysdate) from dual)
)
and a.poid_id0 = an.obj_id0
and a.poid_id0 = ap.obj_id0
and p.poid_id0 = hpc.obj_id0
and p.account_obj_id0 = a.poid_id0
and s.account_obj_id0 = a.poid_id0
and bi.account_obj_id0 = a.poid_id0
;
--------------------------------------------------------
--  DDL for View REP430
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REP430" ("EDATE", "DAILY_AMOUNT_TOTAL", "DAILY_ACOUNT_CNT") AS 
  SELECT   TO_CHAR (TO_DATE ('01-JAN-1970', 'DD-MON-YYYY') + ("EVENT_T"."END_T") / (3600 * 24),
                  'YYYY/MM/DD'
                 ) edate,
         SUM ("EVENT_BILLING_PAYMENT_T"."AMOUNT") daily_amount_total,
         COUNT (DISTINCT "EVENT_T"."ACCOUNT_OBJ_ID0") daily_acount_cnt
    FROM "PIN"."EVENT_BILLING_PAYMENT_T" "EVENT_BILLING_PAYMENT_T" INNER JOIN "PIN"."EVENT_T" "EVENT_T" ON "EVENT_BILLING_PAYMENT_T"."OBJ_ID0" = "EVENT_T"."POID_ID0"
   WHERE "EVENT_BILLING_PAYMENT_T"."COMMAND" <> 2
     AND "EVENT_T"."POID_TYPE" = '/event/billing/payment/cc'
     AND "EVENT_T"."END_T" >
              (TRUNC (SYSDATE) - TO_DATE ('01-JAN-1970', 'DD-MON-YYYY')) * 24 * 3600
            - (365 + 90) * 24 * 3600
GROUP BY TO_CHAR (TO_DATE ('01-JAN-1970', 'DD-MON-YYYY') + ("EVENT_T"."END_T") / (3600 * 24),
                  'YYYY/MM/DD'
                 )
;
--------------------------------------------------------
--  DDL for View REP454
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REP454" ("PARENT_ACCOUNT_ID", "PARENT_ACCOUNT_NO", "CHILD_ACCOUNT_ID", "CHILD_ACCOUNT_NO", "LAST_NAME", "FIRST_NAME", "COMPANY") AS 
  select a1.poid_id0 PARENT_ACCOUNT_ID, a1.account_no PARENT_ACCOUNT_NO, a2.poid_id0 CHILD_ACCOUNT_ID, a2.account_no CHILD_ACCOUNT_NO,
 an.last_name, an.first_name, an.company
from group_billing_members_t gbm, group_t g, account_t a1, account_t a2, account_nameinfo_t an
where g.poid_id0 = gbm.obj_id0
and g.account_obj_id0 = a1.poid_id0
and gbm.object_id0 = a2.poid_id0
and a2.poid_id0 = an.obj_id0

;
--------------------------------------------------------
--  DDL for View REP454B
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REP454B" ("OBJ_ID0", "CREATED_T", "CYCLE_DISCOUNT", "CYCLE_START_T", "PARENT_ACCOUNT_NO", "CHILD_ACCOUNT_NO", "END_T", "STATUS", "FIRST_NAME", "LAST_NAME", "DEAL_NAME") AS 
  SELECT ap.obj_id0,max(r.created_t) CREATED_T,ap.cycle_discount, ap.cycle_start_t,rep.PARENT_ACCOUNT_NO,rep.CHILD_ACCOUNT_NO,max(r.end_t) END_T,r.status,rep.FIRST_NAME,rep.LAST_NAME,r.NAME DEAL_NAME
  FROM account_products_t ap,
  REP454 rep,
       (SELECT q.account_id, q.service_id, d.poid_id0 deal_id, d.NAME, d.descr, q.status, q.created_t,q.end_t
          FROM deal_t d,
               (SELECT e.account_obj_id0 account_id,
                       e.service_obj_id0 service_id, t.deal_obj_id0 deal_id, s.status, e.created_t,e.end_t
                   FROM event_t e,
                       (SELECT obj_id0, deal_obj_id0
                          FROM event_billing_deal_info_t) t, service_t s
                 WHERE e.poid_id0 = t.obj_id0
				 and e.service_obj_id0 = s.poid_id0
				 and s.status <> 10103) q
         WHERE d.poid_id0 = q.deal_id
           AND d.permitted <> '/service/activation'
           AND d.permitted <> '/account'
           AND d.permitted <> '/service/email'
           AND d.permitted NOT LIKE '/service/promotion%') r
 WHERE ap.deal_obj_id0 = r.deal_id
   and rep.CHILD_ACCOUNT_ID = ap.obj_id0
   AND (   ap."CYCLE_DISCOUNT" > 0
        OR ap."CYCLE_START_T" > 1146258748
       )
and upper(rep.company) like '%TAG%'
group by ap.obj_id0, ap.cycle_discount, ap.cycle_start_t, r.status,rep.PARENT_ACCOUNT_NO,rep.CHILD_ACCOUNT_NO,r.status,rep.FIRST_NAME,rep.LAST_NAME,r.name
;
--------------------------------------------------------
--  DDL for View REP459
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REP459" ("BILL_DATE", "DAILY_ACCOUNT_CNT", "DAILY_AMOUNT_BILLED") AS 
  SELECT TO_CHAR (TO_DATE ('01-JAN-1970', 'DD-MON-YYYY') + ("BILL_T"."END_T") / (3600 * 24), 
                  'YYYY/MM/DD' 
                 ) bill_date, 
         COUNT (DISTINCT "BILL_T"."ACCOUNT_OBJ_ID0") daily_account_cnt, 
         SUM (  "BILL_T"."DUE" 
              - "BILL_T"."ADJUSTED" 
              - "BILL_T"."RECVD" 
              + "BILL_T"."TRANSFERRED" 
             ) daily_amount_billed 
    FROM "PIN"."BILL_T" "BILL_T" 
   WHERE "BILL_T"."PARENT_ID0" = 0 
     AND "BILL_T"."END_T" > 
              (TRUNC (SYSDATE) - TO_DATE ('01-JAN-1970', 'DD-MON-YYYY')) * 24 * 3600 
            - (365 + 90) * 24 * 3600 
GROUP BY TO_CHAR (TO_DATE ('01-JAN-1970', 'DD-MON-YYYY') + ("BILL_T"."END_T") / (3600 * 24), 
                  'YYYY/MM/DD' 
                 )
;
--------------------------------------------------------
--  DDL for View REP531
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REP531" ("PARENT_ACCOUNT_ID", "PARENT_ACCOUNT_NO", "PARENT_STATUS", "PARENT_LAST_STATUS_T", "PARENT_LOGIN", "PARENT_SERVICE_STATUS", "PARENT_SERVICE_STATUS_T", "CHILD_ACCOUNT_ID", "CHILD_ACCOUNT_NO", "CHILD_STATUS", "CHILD_LAST_STATUS_T", "CHILD_LOGIN", "CHILD_SERVICE_STATUS", "CHILD_SERVICE_STATUS_T") AS 
  select /*+ use_hash(e) use_hash(s1) use_hash(s2) */ a1.poid_id0 PARENT_ACCOUNT_ID, a1.account_no PARENT_ACCOUNT_NO, a1.status PARENT_STATUS, a1.last_status_t PARENT_LAST_STATUS_T, s1.login PARENT_LOGIN, s1.status PARENT_SERVICE_STATUS,s1.last_status_t PARENT_SERVICE_STATUS_T,
a2.poid_id0 CHILD_ACCOUNT_ID, a2.account_no CHILD_ACCOUNT_NO, a2.status CHILD_STATUS, a2.last_status_t CHILD_LAST_STATUS_T, s2.login CHILD_LOGIN, s2.status CHILD_SERVICE_STATUS,s2.last_status_t CHILD_SERVICE_STATUS_T
from group_billing_members_t gbm, group_t g, account_t a1, account_t a2,
event_customer_statuses_t ecs, event_t e,service_t s1,service_t s2
where
e.poid_id0 = ecs.obj_id0
and e.account_obj_id0 = a1.poid_id0
and g.poid_id0 = gbm.obj_id0
and g.account_obj_id0 = a1.poid_id0
and gbm.object_id0 = a2.poid_id0
and s1.account_obj_id0 = a1.poid_id0
and s2.account_obj_id0 = a2.poid_id0
and a1.status = 10100
and a2.status = 10100
and s2.poid_type = '/service/ip'
Group by a2.poid_id0,a2.account_no,a1.poid_id0,a1.account_no,a1.status,a1.last_status_t,s1.login,s1.status,s1.last_status_t,a2.status,a2.last_status_t,s2.login,s2.status,s2.last_status_t
;
--------------------------------------------------------
--  DDL for View REPREVENUESUMM
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REPREVENUESUMM" ("GL", "TYPE", "AR", "WBS", "SUMDEBITAMT", "SUMCREDITAMT", "SUMCREDITTAX", "SUMDEBITTAX", "NET", "START_T", "END_T", "REVTYPE", "NAME") AS 
  SELECT SUBSTR(la.GL_ID,6,3) GL, 
CASE WHEN (SUBSTR(la.GL_ID,6,3)>100 AND SUBSTR(la.GL_ID,6,3)<300) THEN 'Revenue HW' ELSE 
CASE WHEN (SUBSTR(la.GL_ID,6,3)>299 AND SUBSTR(la.GL_ID,6,3)<800) THEN 'Revenue Service' ELSE 
CASE WHEN (SUBSTR(la.GL_ID,6,3)>799 AND SUBSTR(la.GL_ID,6,3)<900) THEN 'Adjustments' ELSE 
CASE WHEN (SUBSTR(la.GL_ID,6,3)=900 OR SUBSTR(la.GL_ID,6,3)=910 OR SUBSTR(la.GL_ID,6,3)=920 OR SUBSTR(la.GL_ID,6,3)=930 OR SUBSTR(la.GL_ID,6,3)=940) THEN 'Payments' ELSE 
CASE WHEN (SUBSTR(la.GL_ID,6,3)=901 OR SUBSTR(la.GL_ID,6,3)=911 OR SUBSTR(la.GL_ID,6,3)=921 OR SUBSTR(la.GL_ID,6,3)=931 OR SUBSTR(la.GL_ID,6,3)=941) THEN 'Refunds' ELSE 
CASE WHEN (SUBSTR(la.GL_ID,6,3)=902 OR SUBSTR(la.GL_ID,6,3)=912 OR SUBSTR(la.GL_ID,6,3)=922 OR SUBSTR(la.GL_ID,6,3)=942) THEN 'Reversals' ELSE 
CASE WHEN (SUBSTR(la.GL_ID,6,3)=961 OR SUBSTR(la.GL_ID,6,3)=962) THEN 'Disputes' ELSE 
CASE WHEN (SUBSTR(la.GL_ID,6,3)=971 OR SUBSTR(la.GL_ID,6,3)=972) THEN 'Settlement' ELSE 
CASE WHEN (SUBSTR(la.GL_ID,6,3)>975 AND SUBSTR(la.GL_ID,6,3)<982) THEN 'Taxes' ELSE 
CASE WHEN (SUBSTR(la.GL_ID,6,3)=982 OR SUBSTR(la.GL_ID,6,3)=983) THEN 'Write-Off' ELSE 
'' 
END END END END END END END END END END TYPE, 
CASE WHEN (SUBSTR(la.GL_ID,6,3)>100 AND SUBSTR(la.GL_ID,6,3)<800) THEN '+' ELSE 
CASE WHEN (SUBSTR(la.GL_ID,6,3)>799 AND SUBSTR(la.GL_ID,6,3)<900) THEN '-' ELSE 
CASE WHEN (SUBSTR(la.GL_ID,6,3)=900 OR SUBSTR(la.GL_ID,6,3)=910 OR SUBSTR(la.GL_ID,6,3)=920 OR SUBSTR(la.GL_ID,6,3)=930 OR SUBSTR(la.GL_ID,6,3)=940) THEN '+' ELSE 
CASE WHEN (SUBSTR(la.GL_ID,6,3)=901 OR SUBSTR(la.GL_ID,6,3)=911 OR SUBSTR(la.GL_ID,6,3)=921 OR SUBSTR(la.GL_ID,6,3)=931 OR SUBSTR(la.GL_ID,6,3)=941) THEN '-' ELSE 
CASE WHEN (SUBSTR(la.GL_ID,6,3)=902 OR SUBSTR(la.GL_ID,6,3)=912 OR SUBSTR(la.GL_ID,6,3)=922 OR SUBSTR(la.GL_ID,6,3)=942) THEN '-' ELSE 
CASE WHEN (SUBSTR(la.GL_ID,6,3)>960 AND SUBSTR(la.GL_ID,6,3)<984) THEN '-' ELSE 
'' 
END END END END END END AR, 
SUBSTR(la.GL_ID,1,5) WBS, SUM(la.db_ar_net_amt) sumdebitamt,SUM(la.cr_ar_net_amt) sumcreditamt, 
SUM(la.CR_AR_TAX_AMT) sumcredittax,SUM(la.DB_AR_TAX_AMT) sumdebittax, 
((SUM(la.db_ar_net_amt) - SUM(la.cr_ar_net_amt))+(SUM(la.DB_AR_TAX_AMT) - SUM(la.CR_AR_TAX_AMT))) net, 
lr.START_T  START_T,lr.END_T  END_T,lr.TYPE REVTYPE,lr.NAME NAME 
FROM LEDGER_REPORT_ACCTS_T la,LEDGER_REPORT_T lr 
WHERE 
la.obj_id0=lr.poid_id0 AND 
lr.GL_SEGMENT = '.' AND 
lr.NAME LIKE 'P%' 
AND SUBSTR(la.GL_ID,6,3) != '00' 
AND SUBSTR(la.GL_ID,1,5) IS NOT NULL 
GROUP BY SUBSTR(la.GL_ID,6,3),SUBSTR(la.GL_ID,1,5),lr.START_T,lr.END_T,lr.TYPE,lr.NAME

;
--------------------------------------------------------
--  DDL for View REPVARREVENUE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."REPVARREVENUE" ("GL_SEGMENT", "TYPE", "START_T", "END_T", "DATE_T", "GL_ID", "SUMDEBITAMT", "SUMCREDITAMT", "SUMCREDITTAX", "SUMDEBITTAX", "NET") AS 
  SELECT DISTINCT lr.GL_SEGMENT,lr.TYPE TYPE,lr.START_T Start_t,lr.end_t End_t,MAX(lr.created_t) DATE_T,la.gl_id, SUM(la.db_ar_net_amt) SUMDEBITAMT,SUM(la.cr_ar_net_amt) SUMCREDITAMT, 
SUM(la.CR_AR_TAX_AMT) SUMCREDITTAX,SUM(la.DB_AR_TAX_AMT) SUMDEBITTAX,((SUM(la.db_ar_net_amt) - SUM(la.cr_ar_net_amt))+(SUM(la.DB_AR_TAX_AMT) - SUM(la.CR_AR_TAX_AMT))) net 
FROM LEDGER_REPORT_ACCTS_T la, LEDGER_REPORT_T lr 
WHERE 
lr.poid_id0 = la.obj_id0 
GROUP BY lr.GL_SEGMENT,lr.TYPE,lr.START_T,lr.end_t,la.gl_id

;
--------------------------------------------------------
--  DDL for View SPIN
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."SPIN" ("DEAL_POID", "NET_SPIN") AS 
  SELECT DECODE(Z.old_deal_poid, NULL, Z.new_deal_poid, Z.old_deal_poid) DEAL_POID, 
((DECODE(Z.spin_in,NULL,0, Z.spin_in))-(DECODE(Z.spin_out,NULL,0, Z.spin_out))) NET_SPIN 
FROM spin_view Z

;
--------------------------------------------------------
--  DDL for View SPIN_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."SPIN_VIEW" ("SPIN_OUT", "OLD_DEAL_POID", "SPIN_IN", "NEW_DEAL_POID") AS 
  (SELECT "SPIN_OUT","OLD_DEAL_POID","SPIN_IN","NEW_DEAL_POID" FROM 
(SELECT COUNT(*) SPIN_OUT, old_deal_poid 
FROM HNS_SPIN_REPORTS_DATA_T WHERE record_t=d2u(TO_CHAR(SYSDATE-1,'MM/DD/YYYY')) 
GROUP BY old_deal_poid) X, 
(SELECT COUNT(*) SPIN_IN, new_deal_poid 
FROM HNS_SPIN_REPORTS_DATA_T WHERE record_t=d2u(TO_CHAR(SYSDATE-1,'MM/DD/YYYY')) 
GROUP BY new_deal_poid) Y 
WHERE X.old_deal_poid(+)=y.new_deal_poid) 
UNION 
(SELECT "SPIN_OUT","OLD_DEAL_POID","SPIN_IN","NEW_DEAL_POID" FROM 
(SELECT COUNT(*) SPIN_OUT, old_deal_poid 
FROM HNS_SPIN_REPORTS_DATA_T WHERE record_t=d2u(TO_CHAR(SYSDATE-1,'MM/DD/YYYY')) 
GROUP BY old_deal_poid) X, 
(SELECT COUNT(*) SPIN_IN, new_deal_poid 
FROM HNS_SPIN_REPORTS_DATA_T WHERE record_t=d2u(TO_CHAR(SYSDATE-1,'MM/DD/YYYY')) 
GROUP BY new_deal_poid) Y 
WHERE X.old_deal_poid=y.new_deal_poid(+))

;
--------------------------------------------------------
--  DDL for View SPIN_VIEW_OM
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."SPIN_VIEW_OM" ("SPIN_OUT", "OLD_DEAL_POID", "SPIN_IN", "NEW_DEAL_POID") AS 
  (SELECT "SPIN_OUT","OLD_DEAL_POID","SPIN_IN","NEW_DEAL_POID" FROM 
( SELECT COUNT(*) SPIN_OUT, old_deal_poid 
  FROM HNS_SPIN_REPORTS_DATA_T 
  WHERE record_t=d2u(TO_CHAR(SYSDATE-1,'MM/DD/YYYY')) 
  GROUP BY old_deal_poid
 ) X
 FULL OUTER JOIN
( SELECT COUNT(*) SPIN_IN, new_deal_poid 
  FROM HNS_SPIN_REPORTS_DATA_T WHERE record_t=d2u(TO_CHAR(SYSDATE-1,'MM/DD/YYYY')) 
  GROUP BY new_deal_poid
) Y
ON X.old_deal_poid=y.new_deal_poid) 
;
--------------------------------------------------------
--  DDL for View TEST_LOGIN_VW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."TEST_LOGIN_VW" ("POID_ID0", "POID_TYPE", "LOGIN", "NOC", "ACCOUNT") AS 
  select 
a.poid_id0 , s.poid_type, s.login, t.login NOC , t.account 
from account_t a, test_login t, service_t s 
where a.poid_id0 = s.account_obj_id0 
and a.account_no = t.account 
and s.login != t.login

;
--------------------------------------------------------
--  DDL for View TOTAL_DUE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."TOTAL_DUE" ("ACCOUNT_POID", "ACCOUNT_NO", "CUR_BAL") AS 
  select a.poid_id0 account_poid, account_no, sum(current_bal) cur_bal
from bal_grp_t bg, bal_grp_sub_bals_t bgsb, account_t a
where
bg.poid_id0 = bgsb.obj_id0
and bgsb.rec_id2 = 840
and a.poid_id0 = bg.account_obj_id0
group by account_no, a.poid_id0
;
--------------------------------------------------------
--  DDL for View TOTAL_DUE_VB
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."TOTAL_DUE_VB" ("ACCOUNT_NO", "ACCOUNT_POID", "CUR_BAL", "ACCESS_CODE1", "STATUS", "LAST_STATUS_T") AS 
  select a.account_no, Y.account_obj_id0 account_poid, Y.cur_bal, a.access_code1, a.status, a.last_status_t
from account_t a, (select bg.account_obj_id0, sum(X.current_bal) cur_bal
from (select obj_id0, current_bal from bal_grp_sub_bals_t
where rec_id2=840) X, bal_grp_t bg
where bg.poid_id0 = X.obj_id0
group by account_obj_id0) Y
where a.poid_id0 = Y.account_obj_id0
;
--------------------------------------------------------
--  DDL for View TUM_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."TUM_VIEW" ("ACCOUNT_TYPE", "HNS_SERIAL_NUMBER", "DAYSINCOLLECTIONS", "LAST_STATE_CHANGE", "SCENARIO_NAME", "TUM_START_DAYS", "TUM_END_DAYS", "URL_PARENT", "URL_CHILD", "HITS", "ACCOUNT_NO") AS 
  Select distinct X.account_type,hpc.HNS_SERIAL_NUMBER,ceil(sysdate - u2d(hd.last_state_change_t)) as daysincollections,u2d(hd.LAST_STATE_CHANGE_T) as last_state_change,ccs.scenario_name,ht.tum_start_days,ht.tum_end_days,ht.url_parent,ht.url_child,ht.hits,a.account_no
         from (
            ( select poid_id0 PARENT_POID, poid_id0 SUBORD_POID,  '1' ACCOUNT_TYPE
                     from account_t a where account_no in (select account_no from hns_delinquency_t where collection_state = 1)
              and  exists ( select 1 from service_t s where account_obj_id0 = a.poid_id0 and poid_type = '/service/ip' and s.status = 10100 )
            )
            union
            ( select g.account_obj_id0 PARENT_POID,  gbm.object_id0 SUBORD_POID, '2' ACCOUNT_TYPE
              from account_t a, group_t g, group_billing_members_t gbm
              where a.poid_id0 = g.account_obj_id0
              and g.poid_id0 = gbm.obj_id0
              and a.account_no in
                ( select account_no
                from hns_delinquency_t
                where collection_state = 1)
              and exists ( select 1 from service_t s where s.account_obj_id0 = gbm.object_id0 and poid_type = '/service/ip' and s.status = 10100 )
                    )
                  ) X,
        profile_t p, hns_profile_customer_t hpc, account_t a , hns_delinquency_t hd, collections_scenario_t cs, config_collections_scenario_t ccs, hns_tum_t ht , billinfo_t bi
        where  a.poid_id0 = X.subord_poid
        and p.account_obj_id0 = a.poid_id0
        and p.poid_id0 = hpc.obj_id0
        and hd.ACCOUNT_OBJ_ID0 = X.parent_poid
        and a.status != '10103'  
        and X.parent_poid = bi.account_obj_id0       
        and bi.SCENARIO_OBJ_ID0 = cs.POID_ID0
        and cs.config_scenario_obj_id0 = ccs.obj_id0
        and ht.coll_scenario = ccs.scenario_name
        and ( a.gl_segment not like '%VAR%' and a.gl_segment not like '%GUEST%' and a.gl_segment not like '.NAD.KU.ENTERPRISE.GOVT.GSC' )
        --and a.account_no = 'DSS0045580'
        order by hpc.HNS_SERIAL_NUMBER 
;
--------------------------------------------------------
--  DDL for View TUM_VIEW_BAD_ADDRESS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."TUM_VIEW_BAD_ADDRESS" ("ACCOUNT_TYPE", "HNS_SERIAL_NUMBER", "DAYSINCOLLECTIONS", "LAST_STATE_CHANGE", "SCENARIO_NAME", "TUM_START_DAYS", "TUM_END_DAYS", "URL_PARENT", "URL_CHILD", "HITS", "ACCOUNT_NO", "BAD_ADDRESS") AS 
  Select distinct X.account_type,hpc.HNS_SERIAL_NUMBER,'NA' as daysincollections,'NA' as last_state_change,'NA' as scenario_name,ht.tum_start_days,ht.tum_end_days,ht.url_parent,ht.url_child,ht.hits,a.account_no
,(x.address) as bad_address
from   (( select a.poid_id0 PARENT_POID, a.poid_id0 SUBORD_POID,  '1' ACCOUNT_TYPE, address, PAYINFO_ADDRESS.payinfo_obj_id0
          from  ( ( SELECT p.poid_id0 as payinfo_obj_id0, p.account_obj_id0 as account_obj_id0, address, city, state, zip
                    FROM payinfo_t p, payinfo_cc_t pcc
                    WHERE p.poid_id0 = pcc.obj_id0
                    AND p.poid_type = '/payinfo/cc'
                    and pcc.address like '%BAD ADDRESS%')
                    UNION
                   ( SELECT p.poid_id0 as payinfo_obj_id0, p.account_obj_id0 as account_obj_id0, address, city, state, zip
                     FROM   payinfo_t p, payinfo_inv_t pinv
                     WHERE  p.poid_id0 = pinv.obj_id0
                     AND    p.poid_type = '/payinfo/invoice'
                     and    pinv.address like '%BAD ADDRESS%')
                     UNION
                   ( SELECT p.poid_id0 as payinfo_obj_id0, p.account_obj_id0 as account_obj_id0, address, city, state, zip
                     FROM   payinfo_t p, payinfo_dd_t pdd
                     WHERE  p.poid_id0 = pdd.obj_id0
                     AND    p.poid_type = '/payinfo/dd'
                     and    pdd.address like '%BAD ADDRESS%'))
                PAYINFO_ADDRESS, 
                account_t a,
                        billinfo_t bi
           where   PAYINFO_ADDRESS.payinfo_obj_id0 = bi.PAYINFO_OBJ_ID0
               and bi.ACCOUNT_OBJ_ID0 = a.poid_id0
           and     a.status = 10100
           and     instr(a.lineage, ':', 1, 2) =0
           and     exists ( select 1 from service_t s where account_obj_id0 = a.poid_id0 and poid_type = '/service/ip' and s.status = 10100 )))
        X,
        profile_t p, hns_profile_customer_t hpc,
        account_t a , hns_delinquency_t hd,
        hns_tum_t ht
where  a.poid_id0 = X.subord_poid
and p.account_obj_id0 = a.poid_id0
and p.poid_id0 = hpc.obj_id0
and X.parent_poid = hd.ACCOUNT_OBJ_ID0 (+)
and a.status != 10103
and hpc.HNS_SERIAL_NUMBER != '00000000'
and  a.gl_segment like '%KA%'
--Will have to be change to pull the correct URL once created--
and ht.ADDITIONAL_PARAMETER = 'BAD ADDRESS'
order by hpc.HNS_SERIAL_NUMBER 
;
--------------------------------------------------------
--  DDL for View TUM_VIEW_BAD_ADDRESS_KU
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."TUM_VIEW_BAD_ADDRESS_KU" ("ACCOUNT_TYPE", "HNS_SERIAL_NUMBER", "DAYSINCOLLECTIONS", "LAST_STATE_CHANGE", "SCENARIO_NAME", "TUM_START_DAYS", "TUM_END_DAYS", "URL_PARENT", "URL_CHILD", "HITS", "ACCOUNT_NO", "BAD_ADDRESS") AS 
  Select distinct X.account_type,hpc.HNS_SERIAL_NUMBER,'NA' as daysincollections,'NA' as last_state_change,'NA' as scenario_name,ht.tum_start_days,ht.tum_end_days,ht.url_parent,ht.url_child,ht.hits,a.account_no
,(x.address) as bad_address
from   (( select a.poid_id0 PARENT_POID, a.poid_id0 SUBORD_POID,  '1' ACCOUNT_TYPE, address, PAYINFO_ADDRESS.payinfo_obj_id0
          from  ( ( SELECT p.poid_id0 as payinfo_obj_id0, p.account_obj_id0 as account_obj_id0, address, city, state, zip
                    FROM payinfo_t p, payinfo_cc_t pcc
                    WHERE p.poid_id0 = pcc.obj_id0
                    AND p.poid_type = '/payinfo/cc'
                    and pcc.address like '%BAD ADDRESS%')
                    UNION
                   ( SELECT p.poid_id0 as payinfo_obj_id0, p.account_obj_id0 as account_obj_id0, address, city, state, zip
                     FROM   payinfo_t p, payinfo_inv_t pinv
                     WHERE  p.poid_id0 = pinv.obj_id0
                     AND    p.poid_type = '/payinfo/invoice'
                     and    pinv.address like '%BAD ADDRESS%')
                     UNION
                   ( SELECT p.poid_id0 as payinfo_obj_id0, p.account_obj_id0 as account_obj_id0, address, city, state, zip
                     FROM   payinfo_t p, payinfo_dd_t pdd
                     WHERE  p.poid_id0 = pdd.obj_id0
                     AND    p.poid_type = '/payinfo/dd'
                     and    pdd.address like '%BAD ADDRESS%'))
                PAYINFO_ADDRESS, 
                account_t a,
                        billinfo_t bi
           where   PAYINFO_ADDRESS.payinfo_obj_id0 = bi.PAYINFO_OBJ_ID0
               and bi.ACCOUNT_OBJ_ID0 = a.poid_id0
           and     a.status = 10100
           and     instr(a.lineage, ':', 1, 2) =0
           and     exists ( select 1 from service_t s where account_obj_id0 = a.poid_id0 and poid_type = '/service/ip' and s.status = 10100 )))
        X,
        profile_t p, hns_profile_customer_t hpc,
        account_t a , hns_delinquency_t hd,
        hns_tum_t ht
where  a.poid_id0 = X.subord_poid
and p.account_obj_id0 = a.poid_id0
and p.poid_id0 = hpc.obj_id0
and X.parent_poid = hd.ACCOUNT_OBJ_ID0 (+)
and a.status != 10103
and hpc.HNS_SERIAL_NUMBER != '00000000'
and  a.gl_segment like '%KU%'
--Will have to be change to pull the correct URL once created--
and ht.ADDITIONAL_PARAMETER = 'BAD ADDRESS'
order by hpc.HNS_SERIAL_NUMBER 
;
--------------------------------------------------------
--  DDL for View TUM_VIEW_BAD_ADDRESS_OM
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."TUM_VIEW_BAD_ADDRESS_OM" ("ACCOUNT_TYPE", "HNS_SERIAL_NUMBER", "DAYSINCOLLECTIONS", "LAST_STATE_CHANGE", "SCENARIO_NAME", "TUM_START_DAYS", "TUM_END_DAYS", "URL_PARENT", "URL_CHILD", "HITS", "ACCOUNT_NO", "BAD_ADDRESS") AS 
  Select distinct X.account_type,hpc.HNS_SERIAL_NUMBER,
      'NA' as daysincollections,'NA' as last_state_change,
      'NA' as scenario_name,ht.tum_start_days,ht.tum_end_days,
      ht.url_parent,ht.url_child,ht.hits,a.account_no,
      (x.address) as bad_address
FROM
(
     select bi.ACCOUNT_OBJ_ID0 PARENT_POID, 
            bi.ACCOUNT_OBJ_ID0 SUBORD_POID,
            '1' ACCOUNT_TYPE, 
            address, 
            PAYINFO_ADDRESS.payinfo_obj_id0
     from  
          (SELECT poid_id0 as payinfo_obj_id0, account_obj_id0, address, city, state, zip
          FROM
             (
              SELECT poid_id0, 
                     account_obj_id0 as account_obj_id0, 
                     address, city, state, zip
              FROM
                (SELECT poid_id0, account_obj_id0 as account_obj_id0
                  FROM payinfo_t 
                  WHERE poid_type = '/payinfo/cc'
                        or poid_type = '/payinfo/invoice'
                        or poid_type = '/payinfo/dd'
                 ) p,
                 ( select obj_id0,address, city, state, zip from payinfo_cc_t
                    WHERE address like '%BAD ADDRESS%'
                    UNION ALL
                    select obj_id0,address, city, state, zip from payinfo_inv_t
                    WHERE address like '%BAD ADDRESS%'
                     UNION ALL
                     select obj_id0,address, city, state, zip from payinfo_dd_t 
                     WHERE address like '%BAD ADDRESS%'
                   ) subtb
                   WHERE p.poid_id0=subtb.obj_id0
              )   
            ) PAYINFO_ADDRESS, 
          billinfo_t bi
         where   PAYINFO_ADDRESS.payinfo_obj_id0 = bi.PAYINFO_OBJ_ID0
) X,
profile_t p, hns_profile_customer_t hpc,
account_t a , hns_delinquency_t hd,
hns_tum_t ht
where  a.poid_id0 = X.subord_poid
          and a.status = 10100
          and a.status != 10103
          and instr(a.lineage, ':', 1, 2) =0
          and  exists ( select 1 from service_t s 
                          where account_obj_id0 = a.poid_id0 and 
                               poid_type = '/service/ip' and s.status = 10100 
                      )
and p.account_obj_id0 = a.poid_id0
and p.poid_id0 = hpc.obj_id0
and X.parent_poid = hd.ACCOUNT_OBJ_ID0 (+)
and a.status != 10103
and hpc.HNS_SERIAL_NUMBER != '00000000'
and ht.ADDITIONAL_PARAMETER = 'BAD ADDRESS'
order by hpc.HNS_SERIAL_NUMBER 
;
--------------------------------------------------------
--  DDL for View TUM_VIEW_CARD_DECLINE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."TUM_VIEW_CARD_DECLINE" ("ACCOUNT_TYPE", "HNS_SERIAL_NUMBER", "DAYSINCOLLECTIONS", "LAST_STATE_CHANGE", "SCENARIO_NAME", "TUM_START_DAYS", "TUM_END_DAYS", "URL_PARENT", "URL_CHILD", "HITS", "ACCOUNT_NO") AS 
  select '1' account_type, hpc.HNS_SERIAL_NUMBER,'NA' as daysincollections, accounts_payment_delined.collection_date last_state_change,
      'NA' as scenario_name,ht.tum_start_days,ht.tum_end_days,
      ht.url_parent,ht.url_child,ht.hits,a.account_no 
from ((select account_obj_id0, max(effective_t) collection_date
     from   item_t i
     where  i.effective_t > date_to_infranet(sysdate - 10)
     and    i.poid_type = '/item/payment'
     and    i.item_total = 0
     and    not exists ( select 1 
                         from item_t i2
                         where i.account_obj_id0 = i2.account_obj_id0 and i2.poid_type = '/item/payment'     
                         and i2.effective_t > i.effective_t and i2.item_total != 0 )
     and    not exists ( select 1 
                         from billinfo_t bi
                         where bi.poid_id0 = i.billinfo_obj_id0 
                         and (bi.scenario_obj_id0 != 0 or  bi.exempt_from_collections = 1)
                         )
--***For advance payment***--    
      and   exists     ( select 1
                         from  bill_t bil 
                         where bil.ACCOUNT_OBJ_ID0 = i.ACCOUNT_OBJ_ID0 and bil.DUE >0 and bil.CREATED_T < i.EFFECTIVE_T)
--******--
     group by account_obj_id0
    )) accounts_payment_delined,
    profile_t p, 
    hns_profile_customer_t hpc,
    account_t a,
    ( select * from hns_tum_t where collection_state = 8 ) ht
where  a.poid_id0 = accounts_payment_delined.account_obj_id0 
and    p.account_obj_id0 = a.poid_id0 
and    p.poid_id0 = hpc.obj_id0 
and    a.status != 10103
and    ( a.gl_segment not like '%GUEST%' )
and    ( a.gl_segment like '%KA%' )  
order  by hpc.HNS_SERIAL_NUMBER 
;
--------------------------------------------------------
--  DDL for View TUM_VIEW_CARD_DECLINE_KU
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."TUM_VIEW_CARD_DECLINE_KU" ("ACCOUNT_TYPE", "HNS_SERIAL_NUMBER", "DAYSINCOLLECTIONS", "LAST_STATE_CHANGE", "SCENARIO_NAME", "TUM_START_DAYS", "TUM_END_DAYS", "URL_PARENT", "URL_CHILD", "HITS", "ACCOUNT_NO") AS 
  select '1' account_type, hpc.HNS_SERIAL_NUMBER,'NA' as daysincollections, accounts_payment_delined.collection_date last_state_change,
      'NA' as scenario_name,ht.tum_start_days,ht.tum_end_days,
      ht.url_parent,ht.url_child,ht.hits,a.account_no 
from ((select account_obj_id0, max(effective_t) collection_date
     from   item_t i
     where  i.effective_t > date_to_infranet(sysdate - 10)
     and    i.poid_type = '/item/payment'
     and    i.item_total = 0
     and    not exists ( select 1 
                         from item_t i2
                         where i.account_obj_id0 = i2.account_obj_id0 and i2.poid_type = '/item/payment'     
                         and i2.effective_t > i.effective_t and i2.item_total != 0 )
     and    not exists ( select 1 
                         from billinfo_t bi
                         where bi.poid_id0 = i.billinfo_obj_id0 
                         and (bi.scenario_obj_id0 != 0 or  bi.exempt_from_collections = 1)
                         )
--***For advance payment***--    
      and   exists     ( select 1
                         from  bill_t bil 
                         where bil.ACCOUNT_OBJ_ID0 = i.ACCOUNT_OBJ_ID0 and bil.DUE >0 and bil.CREATED_T < i.EFFECTIVE_T)
--******--
     group by account_obj_id0
    )) accounts_payment_delined,
    profile_t p, 
    hns_profile_customer_t hpc,
    account_t a,
    ( select * from hns_tum_t where collection_state = 8 ) ht
where  a.poid_id0 = accounts_payment_delined.account_obj_id0 
and    p.account_obj_id0 = a.poid_id0 
and    p.poid_id0 = hpc.obj_id0 
and    a.status != 10103
and    ( a.gl_segment not like '%GUEST%' )
and    ( a.gl_segment like '%KU%' )  
order  by hpc.HNS_SERIAL_NUMBER 
;
--------------------------------------------------------
--  DDL for View TUM_VIEW_JU_BAD_ADDRESS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."TUM_VIEW_JU_BAD_ADDRESS" ("ACCOUNT_TYPE", "HNS_SERIAL_NUMBER", "DAYSINCOLLECTIONS", "LAST_STATE_CHANGE", "SCENARIO_NAME", "TUM_START_DAYS", "TUM_END_DAYS", "URL_PARENT", "URL_CHILD", "HITS", "ACCOUNT_NO", "BAD_ADDRESS") AS 
  Select distinct X.account_type,hpc.HNS_SERIAL_NUMBER,'NA' as daysincollections,'NA' as last_state_change,'NA' as scenario_name,ht.tum_start_days,ht.tum_end_days,ht.url_parent,ht.url_child,ht.hits,a.account_no
,(x.address) as bad_address
from   (( select a.poid_id0 PARENT_POID, a.poid_id0 SUBORD_POID,  '1' ACCOUNT_TYPE, address, PAYINFO_ADDRESS.payinfo_obj_id0
          from  ( ( SELECT p.poid_id0 as payinfo_obj_id0, p.account_obj_id0 as account_obj_id0, address, city, state, zip
                    FROM payinfo_t p, payinfo_cc_t pcc
                    WHERE p.poid_id0 = pcc.obj_id0
                    AND p.poid_type = '/payinfo/cc'
                    and pcc.address like '%BAD ADDRESS%')
                    UNION
                   ( SELECT p.poid_id0 as payinfo_obj_id0, p.account_obj_id0 as account_obj_id0, address, city, state, zip
                     FROM   payinfo_t p, payinfo_inv_t pinv
                     WHERE  p.poid_id0 = pinv.obj_id0
                     AND    p.poid_type = '/payinfo/invoice'
                     and    pinv.address like '%BAD ADDRESS%')
                     UNION
                   ( SELECT p.poid_id0 as payinfo_obj_id0, p.account_obj_id0 as account_obj_id0, address, city, state, zip
                     FROM   payinfo_t p, payinfo_dd_t pdd
                     WHERE  p.poid_id0 = pdd.obj_id0
                     AND    p.poid_type = '/payinfo/dd'
                     and    pdd.address like '%BAD ADDRESS%'))
                PAYINFO_ADDRESS, 
                account_t a,
                        billinfo_t bi
           where   PAYINFO_ADDRESS.payinfo_obj_id0 = bi.PAYINFO_OBJ_ID0
               and bi.ACCOUNT_OBJ_ID0 = a.poid_id0
           and     a.status = 10100
           and     instr(a.lineage, ':', 1, 2) =0
           and     exists ( select 1 from service_t s where account_obj_id0 = a.poid_id0 and poid_type = '/service/ip' and s.status = 10100 )))
        X,
        profile_t p, hns_profile_customer_t hpc,
        account_t a , hns_delinquency_t hd,
        hns_tum_t ht
where  a.poid_id0 = X.subord_poid
and p.account_obj_id0 = a.poid_id0
and p.poid_id0 = hpc.obj_id0
and X.parent_poid = hd.ACCOUNT_OBJ_ID0 (+)
and a.status != 10103
and hpc.HNS_SERIAL_NUMBER != '00000000'
and  a.gl_segment like '%.KE.%'
--Will have to be change to pull the correct URL once created--
and ht.ADDITIONAL_PARAMETER = 'BAD ADDRESS'
order by hpc.HNS_SERIAL_NUMBER 
;
--------------------------------------------------------
--  DDL for View TUM_VIEW_OM
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."TUM_VIEW_OM" ("ACCOUNT_TYPE", "HNS_SERIAL_NUMBER", "DAYSINCOLLECTIONS", "LAST_STATE_CHANGE", "SCENARIO_NAME", "TUM_START_DAYS", "TUM_END_DAYS", "URL_PARENT", "URL_CHILD", "HITS", "ACCOUNT_NO") AS 
  Select distinct X.account_type,hpc.HNS_SERIAL_NUMBER,ceil(sysdate - u2d(hd.last_state_change_t)) as daysincollections,u2d(hd.LAST_STATE_CHANGE_T) as last_state_change,ccs.scenario_name,ht.tum_start_days,ht.tum_end_days,ht.url_parent,ht.url_child,ht.hits,a.account_no
  FROM 
   ( Select PARENT_POID,SUBORD_POID,ACCOUNT_TYPE from 
    (select account_obj_id0 from service_t s 
       where poid_type = '/service/ip' and s.status = 10100) SV,
    ( 
      ( select poid_id0 PARENT_POID, poid_id0 SUBORD_POID,  '1' ACCOUNT_TYPE
       from account_t a where 
             a.status != '10103'  
             and a.gl_segment not like '%VAR%' 
               and a.gl_segment not like '%GUEST%' 
               and a.gl_segment != '.NAD.KU.ENTERPRISE.GOVT.GSC'
       and exists
          (select 1 from hns_delinquency_t hnd where collection_state = 1 and hnd.account_no=a.account_no)
      ) 
      UNION ALL
      ( select g.account_obj_id0 PARENT_POID,  gbm.object_id0 SUBORD_POID, '2' ACCOUNT_TYPE
        from account_t a, group_t g, group_billing_members_t gbm
        where exists 
          (select 1 from hns_delinquency_t hnd 
           where collection_state = 1
             and hnd.account_no=a.account_no
          )
        and a.poid_id0 = g.account_obj_id0
        and g.poid_id0 = gbm.obj_id0
        and a.status != '10103'   
        and a.gl_segment not like '%VAR%' 
        and a.gl_segment not like '%GUEST%' 
        and a.gl_segment != '.NAD.KU.ENTERPRISE.GOVT.GSC'
        )
     ) SUBQ
     Where SUBQ.SUBORD_POID=SV.account_obj_id0
   ) X,
    profile_t p, 
    hns_profile_customer_t hpc, 
    account_t a , 
    hns_delinquency_t hd, 
    collections_scenario_t cs, 
    config_collections_scenario_t ccs, 
    hns_tum_t ht , 
    billinfo_t bi

    where  a.poid_id0 = X.subord_poid
        and hd.collection_state = 1
        and p.account_obj_id0 = a.poid_id0
        and p.poid_id0 = hpc.obj_id0
        and hd.ACCOUNT_OBJ_ID0 = X.parent_poid
        and X.parent_poid = bi.account_obj_id0       
        and bi.SCENARIO_OBJ_ID0 = cs.POID_ID0
        and cs.config_scenario_obj_id0 = ccs.obj_id0
        and ht.coll_scenario = ccs.scenario_name
        and ( a.status != '10103'  
             and a.gl_segment not like '%VAR%' 
               and a.gl_segment not like '%GUEST%' 
               and a.gl_segment != '.NAD.KU.ENTERPRISE.GOVT.GSC' )
        order by hpc.HNS_SERIAL_NUMBER 
;
--------------------------------------------------------
--  DDL for View UNMOD_CORR_ITEMS_FIN
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIN"."UNMOD_CORR_ITEMS_FIN" ("CORRECT_AR_OBJ_ID0", "CORRECT_DUE", "POID_DB", "POID_ID0", "POID_TYPE", "POID_REV", "CREATED_T", "MOD_T", "READ_ACCESS", "WRITE_ACCESS", "ACCOUNT_OBJ_DB", "ACCOUNT_OBJ_ID0", "ACCOUNT_OBJ_TYPE", "ACCOUNT_OBJ_REV", "ADJUSTED", "AR_ACCOUNT_OBJ_DB", "AR_ACCOUNT_OBJ_ID0", "AR_ACCOUNT_OBJ_TYPE", "AR_ACCOUNT_OBJ_REV", "AR_BILL_OBJ_DB", "AR_BILL_OBJ_ID0", "AR_BILL_OBJ_TYPE", "AR_BILL_OBJ_REV", "ARCHIVE_STATUS", "BILL_OBJ_DB", "BILL_OBJ_ID0", "BILL_OBJ_TYPE", "BILL_OBJ_REV", "CLOSED_T", "OPENED_T", "GL_SEGMENT", "CURRENCY", "CURRENCY_OPERATOR", "CURRENCY_RATE", "CURRENCY_SECONDARY", "DISPUTED", "DUE", "DUE_T", "EFFECTIVE_T", "ITEM_NO", "ITEM_TOTAL", "NAME", "RECVD", "STATUS", "TRANSFERED", "SERVICE_OBJ_DB", "SERVICE_OBJ_ID0", "SERVICE_OBJ_REV", "SERVICE_OBJ_TYPE", "EVENT_POID_LIST", "WRITEOFF") AS 
  select "CORRECT_AR_OBJ_ID0","CORRECT_DUE","POID_DB","POID_ID0","POID_TYPE","POID_REV","CREATED_T","MOD_T","READ_ACCESS","WRITE_ACCESS","ACCOUNT_OBJ_DB","ACCOUNT_OBJ_ID0","ACCOUNT_OBJ_TYPE","ACCOUNT_OBJ_REV","ADJUSTED","AR_ACCOUNT_OBJ_DB","AR_ACCOUNT_OBJ_ID0","AR_ACCOUNT_OBJ_TYPE","AR_ACCOUNT_OBJ_REV","AR_BILL_OBJ_DB","AR_BILL_OBJ_ID0","AR_BILL_OBJ_TYPE","AR_BILL_OBJ_REV","ARCHIVE_STATUS","BILL_OBJ_DB","BILL_OBJ_ID0","BILL_OBJ_TYPE","BILL_OBJ_REV","CLOSED_T","OPENED_T","GL_SEGMENT","CURRENCY","CURRENCY_OPERATOR","CURRENCY_RATE","CURRENCY_SECONDARY","DISPUTED","DUE","DUE_T","EFFECTIVE_T","ITEM_NO","ITEM_TOTAL","NAME","RECVD","STATUS","TRANSFERED","SERVICE_OBJ_DB","SERVICE_OBJ_ID0","SERVICE_OBJ_REV","SERVICE_OBJ_TYPE","EVENT_POID_LIST","WRITEOFF" from ALL_CORR_ITEMS_FIN 
where mod_t <= 1080190800

;
