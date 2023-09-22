--------------------------------------------------------
--  File created - Friday-September-22-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger ACCOUNT_GROUPS_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PIN"."ACCOUNT_GROUPS_TRIGGER" 
	AFTER UPDATE OF grp_stat ON ledger_report_account_groups_t
	FOR EACH ROW
DECLARE
	v_new_row  ledger_report_account_groups_t%rowtype;
BEGIN
	v_new_row.obj_id0  := :new.obj_id0;
	v_new_row.beg_acct := :new.beg_acct;
	v_new_row.end_acct := :new.end_acct;

	initiate_ledger_for_acct_grps(v_new_row);

END account_groups_trigger;
/
ALTER TRIGGER "PIN"."ACCOUNT_GROUPS_TRIGGER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger EVT_RESRC_MAP_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PIN"."EVT_RESRC_MAP_TRIGGER" 
AFTER UPDATE OF version ON config_t
FOR EACH ROW
 WHEN (old.poid_type = '/config/event_resource_map') DECLARE
BEGIN
	evt_resrc_map(:old.poid_id0);
END;

/
ALTER TRIGGER "PIN"."EVT_RESRC_MAP_TRIGGER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger HNS_BILL_MONITOR_HST_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PIN"."HNS_BILL_MONITOR_HST_ID_TRG" 
BEFORE INSERT
ON HNS_BILL_MONITOR_HISTORY_T
REFERENCING NEW AS NEW
FOR EACH ROW
BEGIN
SELECT HNS_BILL_MONITOR_HST_ID_S.nextval INTO :NEW.HISTORY_ID FROM dual;
END;
/
ALTER TRIGGER "PIN"."HNS_BILL_MONITOR_HST_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger HNS_CPT_MICRRT_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PIN"."HNS_CPT_MICRRT_TRG" 
before insert or update
   on hns_check_payments_t
   for each row

 WHEN (new.micrrt is null or trim(new.micrrt) = '') begin
   -- update micrrt field to NA
   :new.micrrt := 'NA';
end;
/
ALTER TRIGGER "PIN"."HNS_CPT_MICRRT_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger HNS_CPT_REMITNAME_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PIN"."HNS_CPT_REMITNAME_TRG" 
before insert or update
   on hns_check_payments_t
   for each row

 WHEN (new.remitter_name is null or trim(new.remitter_name) = '') begin
   -- update remitter_name field to NA
   :new.remitter_name  := 'NA';
end;
/
ALTER TRIGGER "PIN"."HNS_CPT_REMITNAME_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger HNS_FAP_TOKEN_BEF_INS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PIN"."HNS_FAP_TOKEN_BEF_INS" 
BEFORE INSERT
   ON HNS_FAP_TOKEN_PURCHASE_T
   FOR EACH ROW

BEGIN

   if :new.deal_name = 'Token - 2GB Free' then
      :new.deal_name := 'Token  - 2GB Free';
   elsif :new.deal_name = 'Token - 1GB Free' then
      :new.deal_name := 'Token  - 1GB Free';
   elsif :new.deal_name = 'Token - 500MB Free' then
      :new.deal_name := 'Token  - 500MB Free';
   end if;

END;
/
ALTER TRIGGER "PIN"."HNS_FAP_TOKEN_BEF_INS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger HNS_REACTIVATE_TRIG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PIN"."HNS_REACTIVATE_TRIG" 
BEFORE INSERT
   ON HNS_REACTIVATE_CREDIT_ITEMS_T
   FOR EACH ROW
DECLARE
    account_obj number;
    main_rec_created_t number;
    amount_charged number;

BEGIN

   if :new.deal_obj_id0 = 661032563 or :new.deal_obj_id0 = 661030515 then
      BEGIN
        select account_obj_id0, created_t into account_obj,main_rec_created_t
            from HNS_REACTIVATE_CREDIT_T h where rec_id = :new.obj_id0;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
            return;
      END;

      BEGIN
          select amount into amount_charged from event_t e, event_bal_impacts_t ebi
            where e.account_obj_id0 = account_obj
            and   e.end_t >= main_rec_created_t
            and e.end_t <= :new.created_t
            and e.poid_id0 = ebi.obj_id0
            and e.descr = (select name from deal_t where poid_id0 = :new.deal_obj_id0)
            and ebi.resource_id = 840;
      EXCEPTION
        WHEN NO_DATA_FOUND THEN
            return;
        WHEN OTHERS THEN
            return;
      END;
      :new.value := amount_charged;
   end if;

END;
/
ALTER TRIGGER "PIN"."HNS_REACTIVATE_TRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LASTSTAT_FT_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PIN"."LASTSTAT_FT_TRIGGER" BEFORE UPDATE OF LASTSTAT_CMNT ON "PIN"."SERVICE_T"
  REFERENCING FOR EACH ROW
  WHEN (old.status = new.status) BEGIN

    :new.laststat_cmnt := :old.laststat_cmnt;
    :new.last_status_t := :old.last_status_t;

END;
/
ALTER TRIGGER "PIN"."LASTSTAT_FT_TRIGGER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LEDGER_REPORT_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PIN"."LEDGER_REPORT_TRIGGER" 
	AFTER INSERT ON ledger_report_t
	FOR EACH ROW
DECLARE
	v_new_row  ledger_report_t%rowtype;
BEGIN
	v_new_row.gl_report_type := :new.gl_report_type;
	v_new_row.currency_only  := :new.currency_only;
	v_new_row.poid_id0       := :new.poid_id0;
	v_new_row.gl_segment     := :new.gl_segment;
	v_new_row.accts_num_for_group:= :new.accts_num_for_group;
	v_new_row.start_t        := :new.start_t;
	v_new_row.end_t          := :new.end_t;
	v_new_row.type           := :new.type;

	initiate_ledger_for_rep_object(v_new_row);

END ledger_report_trigger;
/
ALTER TRIGGER "PIN"."LEDGER_REPORT_TRIGGER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TNM_DETAIL_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PIN"."TNM_DETAIL_TRG" 
BEFORE
  INSERT
ON hns_tnm_details_t
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
BEGIN
  if :new.cust_invoice_id is null then
    if :new.ben_id is not null then
      :new.cust_invoice_id := :new.BEN_ID;
    else
      :new.cust_invoice_id := 'XXX';
    end if;
  end if;
END;
/
ALTER TRIGGER "PIN"."TNM_DETAIL_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIG_CYCLE_DEFERRED_TAX
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PIN"."TRIG_CYCLE_DEFERRED_TAX" 
	AFTER
	INSERT OR UPDATE OF
		obj_id0,
		bill_vat,
		bill_obj_id0,
		currency,
		end_t,
		start_t ON event_billing_tax_cycles_t
	REFERENCING NEW AS new
	FOR EACH ROW
DECLARE
	account_obj		INTEGER;
	tax_supplier_obj	INTEGER;
	v_last_bill_t		INTEGER;
	v_actg_future_t		INTEGER;
	v_actg_last_t		INTEGER;
	v_actg_next_t		INTEGER;
	v_billinfo_obj          INTEGER;
	v_orig_billinfo_obj     INTEGER;
	v_num_supp_cycles	INTEGER;
	v_bill_name		varchar(225);
BEGIN
	SELECT account_obj_id0, tax_supplier, group_obj_id0
		INTO account_obj, tax_supplier_obj, v_orig_billinfo_obj
		FROM event_t WHERE poid_id0 = :new.obj_id0;
	SELECT bi.last_bill_t, bi.actg_future_t, bi.actg_last_t,
			bi.actg_next_t, b.billinfo_obj_id0,
			bi.num_suppressed_cycles, b.name
		INTO v_last_bill_t, v_actg_future_t,
			v_actg_last_t, v_actg_next_t, v_billinfo_obj,
			v_num_supp_cycles, v_bill_name
		FROM billinfo_t bi, bill_t b WHERE
		     b.poid_id0 = :new.bill_obj_id0 AND
		     b.billinfo_obj_id0 = bi.poid_id0;
	IF :new.bill_vat = 1
	THEN
		IF (v_bill_name != 'PIN Bill')  -- if this bill is for bill_now and On Demand Billing
		THEN
			proc_defer_c_tax_ar_acct_ond (
				:new.obj_id0, :new.start_t,
				:new.end_t, :new.currency, :new.bill_obj_id0,
				v_last_bill_t, v_actg_last_t,
				tax_supplier_obj,v_billinfo_obj, v_orig_billinfo_obj);
			proc_defer_mark_sp_items_taxed (:new.end_t, v_last_bill_t,
				v_billinfo_obj, v_orig_billinfo_obj);
		ELSE
			proc_defer_cycle_tax_ar_acct (
				:new.obj_id0, :new.start_t,
				:new.end_t, :new.currency, :new.bill_obj_id0,
				v_actg_next_t,
				tax_supplier_obj,v_billinfo_obj,
				v_num_supp_cycles);
		END IF;
	ELSE
		IF (v_bill_name != 'PIN Bill')  -- if this bill is for bill_now and On Demand Billing
		THEN
			proc_defer_c_tax_acct_ond (
				:new.obj_id0, :new.start_t,
				:new.end_t, :new.currency, :new.bill_obj_id0,
				v_last_bill_t, v_actg_last_t,
				tax_supplier_obj,v_billinfo_obj, v_orig_billinfo_obj);
			proc_defer_mark_sp_items_taxed (:new.end_t, v_last_bill_t,
                                v_billinfo_obj, v_orig_billinfo_obj);
		ELSE
			proc_defer_cycle_tax_acct (
				:new.obj_id0, :new.start_t,
				:new.end_t, :new.currency, :new.bill_obj_id0,
				v_actg_next_t,
				tax_supplier_obj,v_billinfo_obj);
		END IF;
	END IF;
END;
/
ALTER TRIGGER "PIN"."TRIG_CYCLE_DEFERRED_TAX" DISABLE;
--------------------------------------------------------
--  DDL for Trigger UPDATE_BAL_GRP_SUB_BALS_T
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PIN"."UPDATE_BAL_GRP_SUB_BALS_T" 
  BEFORE UPDATE OF VALID_TO ON BAL_GRP_SUB_BALS_T
    for each row
  BEGIN
    IF :new.VALID_TO != 0 THEN
      :new.VALID_TO := 0;
    END IF;
  END;
/
ALTER TRIGGER "PIN"."UPDATE_BAL_GRP_SUB_BALS_T" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VOIP_WO_ADDR_TRIGGER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PIN"."VOIP_WO_ADDR_TRIGGER" 
	BEFORE INSERT ON hns_voip_request_t
	FOR EACH ROW
     WHEN (new.ADDRESS1 like '%'||chr(10)||'%' or new.ADDRESS1 like '%'||chr(13)||'%') DECLARE
	v_new_address  hns_voip_request_t.address1%type;
BEGIN
	v_new_address := replace(replace(:new.address1, chr(13), ' '), chr(10), ' ');
	:new.address1 := v_new_address;
END VOIP_WO_ADDR_TRIGGER;
/
ALTER TRIGGER "PIN"."VOIP_WO_ADDR_TRIGGER" ENABLE;
