--------------------------------------------------------
--  File created - Friday-September-22-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure ABCONFIGTYPE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."ABCONFIGTYPE" 
(HnsLocationId IN VARCHAR2, InvNum in varchar2, ParentAccNo in varchar2)

IS

CURSOR service_category_name_cursor(hnslocId VARCHAR2, InvNo VARCHAR2, ParentAcc VARCHAR2)
IS
select * from ent_location_summary_temp_t where hns_location_id = HnsLocationId and invoice_no = InvNum and quantity > 1;

ser_cat_nam_cursor_rec service_category_name_cursor%ROWTYPE;

ServiceCategoryName VARCHAR2(60);
ABExists  integer;
SqlQuery VARCHAR2(1024);
HType VARCHAR2(60) := 'Active Bonding';

BEGIN
 DBMS_OUTPUT.PUT_LINE('HnsLocationId_for_AB:' || HnsLocationId);
      DBMS_OUTPUT.PUT_LINE('InvNum_for_AB:' || InvNum);

      DBMS_OUTPUT.PUT_LINE('ParentAccNo_for_AB:' || ParentAccNo);
                IF NOT service_category_name_cursor%ISOPEN
                THEN
                                DBMS_OUTPUT.PUT_LINE('Cursor service_category_name_cursor opened');
                                OPEN service_category_name_cursor(HnsLocationId,InvNum,ParentAccNo);
                END IF;

                LOOP
                                DBMS_OUTPUT.PUT_LINE('Summary record number_AB ' ||  TO_CHAR (service_category_name_cursor%ROWCOUNT));
                                FETCH service_category_name_cursor INTO ser_cat_nam_cursor_rec;
                                EXIT WHEN NOT service_category_name_cursor%FOUND;

                                ServiceCategoryName := ser_cat_nam_cursor_rec.service_category_name;
                                DBMS_OUTPUT.PUT_LINE('ServiceCategoryName_AB:' || ServiceCategoryName);

                                select Count(*) into ABExists from ENT_INVOICE_BUNDLE_SERVICES_T eibs, ENT_INVOICE_BUNDLE_T eib
                                where eibs.bundle_rec_id = eib.rec_id
                                and eib.status = 1
                                and eib.type= HType
                                and eib.account_no =ParentAccNo
                                and eibs.category_name =ServiceCategoryName;
                                DBMS_OUTPUT.PUT_LINE('ABExists_AB:' || ABExists);


                                DBMS_OUTPUT.PUT_LINE('Creating entry in TEMP');
                                if(ABExists != 0) THEN
                                  update  ent_location_summary_temp_t set ISAB = 1 where hns_location_id = HnsLocationId and invoice_no = InvNum and service_category_name = ServiceCategoryName;
                                end if;
END LOOP;

                IF service_category_name_cursor%ISOPEN
                THEN
                                CLOSE service_category_name_cursor;
                END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'No Data found - '||SQLCODE||' -ERROR- '||SQLERRM);
    WHEN OTHERS THEN
        raise_application_error(-20002,'Unknown Error - '||SQLCODE||' -ERROR- '||SQLERRM);

END ABCONFIGTYPE;

/
--------------------------------------------------------
--  DDL for Procedure ADD_DELTADUE_TO_BALGRP_SUBBALS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."ADD_DELTADUE_TO_BALGRP_SUBBALS" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
aa5 3ac
lYg4QwFrP5vrcBq6ul+iprOrbRowgzsrLscTfC/NlD+VM8j03ibGgS3iKKk8YXupTS/cECVX
hlmWWN6wofmq6ufn1DmGWfXmJSckGbxVbLdm5itaRnPuDigo0HL4atnWP/mMu/7QnbVzPa6W
/tKBNrax7ntdUtiCr1iLRz54J6N5F3gnnGsgGtOvoKz8RWiJv0H9XeIDPdMdRY+9/FqhTadq
XgL2iaV5vQMCuiwgMhQYw61Qk8Yl8DDDhXFa47zhcqjGBO+b1tg7AejpzmpTKf2o9N6gTqiW
8b1qVETslH1YO0hh8P+Njr24AvQr1zFVOb0tZ6NnxddLRgtGqwgNjuk57uKanGD1tn5CRbkj
M7NAiAbssGSz4hbD3GlpNNeTVqI8fnubgSPQ1mYLNxUbDjTnKhDBYl/8jYzlFcNgRmknu7ym
T0HGcwQeb9TryxgvGopdXIQOyuhxFjUoB0RsYBp+h6tNA2XkZ2hj6eGaOLxXAnVkyrWImshZ
+polRYOPWJHSZuQzbRjOY0P6SXKObU3VJv7MoU6rMUHDvK7ySvMsKM4Wjw+2fCZm37QSb+Qi
OLpJnIqbIYAmVuzvN/zivSGNIIywy8r3UmOCPit66Pm96uKOqjHym2zxqrqRe1pZaBnpXMP9
RIt8raFPmvL0KAMI3LPZWMR9lMaJsocJPDkJo7ODXyjaAAmrLE84GXL72fiMQoJKtZxND3I0
A2h4eTFhxqg/QajrZ7akNRrlNzpc2YIIcWroRcySzTOKxH0yAtEni69K41Qn4zZD9AcC0/Fu
jlJWYRYqr7Ywuf11MfrBMMSDieL5zOJmM/oamwxF+LgS9pOaCtiC1T2mapjSh0qLuwHgQaeH
TMCAgSl77fmrtYpyVcJAUO3UPwVpOrDmgIuCcEcV8k3TRLIg5SN8Q0vOpSw6Ysr9

/
--------------------------------------------------------
--  DDL for Procedure ADD_ITEM_DELTADUE_TO_BG_SUBBAL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."ADD_ITEM_DELTADUE_TO_BG_SUBBAL" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
a18 370
Idv385IkgAEt9piUA34llxZuIMUwgw0rLtATfC/NKuQYvtjffinFly3ey6lJk8Xdd3UarZP0
01yNYfxrMbWaf9RWqDcCXB4M4HoPP7vXZxsw49gv5/iGzHN6Tz8mhik6NCS8bnc6xHvkaaqH
ywdzglmQoRpm9PQYBImdm3+G84zNity5ZdKgNRVY8TNTaIkXj3s/uVnf8g4s1YhsTeY+DqO3
Fo1TYPtPnHy6VzMIYAI0WkM2ox4lRd+Wt550E7pCSc4rH2ef++KMd3XBBAsW7jUHBmRK1a+3
lyhhrlp1tJkV0/zZln7mttlGO0+yzl6RR5zn+6gtb1iXbWeztXH6g2aAvTioNugJLMwzi7le
TAjvalSSGJR9oDVlgU6PCmKaRbSgM4WuMY3H16ks63O9ZuZFscjhXktCgtAmV2iB+Ah5oxSl
RIuyZvbm6siqbSrWY8uXZl226NwXU6owaaEaR3oQuPAJxemfe43hwqbEV3OWNkwGJKv5NSE0
JX87uWRYuLKUTNScTLOIZdfMWtbNZ7SD9ieo0sUveudEwlrlWaVcjutUrPfVlbvos3o3w5o5
WJu2ECD+12l3fESLfM1m65gbhdYxpdM+3UdM9ewLlyMo9GocrNX6HvN5G/Xy75LvR5iUOCMG
4OgoHvDEg1Gtv5iS4JXpKvL4ohKEOHg5uecyXIz/CkCMvDwE9DH3/CqARbFQaONUIXNzpCYD
Xy/AUdWenvpElPqGdSBpFqzGv5D+2Q2VuaX8SH00knsEYzO6u3tkfh0oubsuePXU9u0RAdCb
BcIPyzyBcK+Hv+jNhW0zMhuQAR5l11s8JawpNIx0gMGBiIIsIWzYRsXeCUT2VXZdS86lH6N7
ntk=

/
--------------------------------------------------------
--  DDL for Procedure ALLOCATE_FAP_TOKENS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."ALLOCATE_FAP_TOKENS" IS
--
--
-- ---------   ------  -------------------------------------------
    md200 token_md5.md5%TYPE;
    rows INTEGER;
    last_bill_date INTEGER;
    next_bill_date INTEGER;
    account_obj    INTEGER;
    allocated_date INTEGER;
    account_no     account_t.account_no%TYPE;
    clear_token token_md5.token%TYPE;

    CURSOR list_account_cur IS
        select account_obj_id0 from service_t s
        where s.poid_type = '/service/ip'
        and   s.status = 10100
        and   exists (select 1 from account_t a
              where a.poid_id0 = s.account_obj_id0
              and   a.gl_segment like '%.KA.%');

BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');

    rows := 0;
    FOR account_rec in list_account_cur
    LOOP
     account_obj := account_rec.account_obj_id0;
     allocated_date := 0;

     select bi.actg_next_t, bi.actg_last_t, p2a(account_obj_id0)
            into next_bill_date, last_bill_date, account_no
       from   billinfo_t bi
       where  bi.account_obj_id0 = account_obj
       and    bi.bill_info_id = 'Account Billinfo'
       and    rownum < 2;

     if last_bill_date >= 1331870400 then
        allocated_date := last_bill_date;
     else
        allocated_date := next_bill_date;
     end if;

     INSERT INTO PIN.HNS_COURTESY_FAP_T (
        REC_ID, ACCOUNT_NO, ALLOCATED_DATE,
        REDEEMED_DATE, EXPIRATION_DATE)
     VALUES ( COURTESY_FAP_SEQ.nextval, account_no, allocated_date,null
        , d2i(add_months(u2d(allocated_date),24)));

     rows := rows+1;
     If rows >= 10000 Then
        Commit;
        rows := 0;
     End If;

   END LOOP; -- for each entry.
commit;

DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending procedure ' || sysdate);

END; -- Procedure TRIM_TOKEN_MD5

/
--------------------------------------------------------
--  DDL for Procedure ARCH_JOURNAL_T
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."ARCH_JOURNAL_T" (start_t date, end_t date) AS

  d_end_date        date;
  n_cntr            integer :=0;
  n_rows_archived   integer :=0;
  n_max_poid        number;
  n_del_limit       number := 100000;
  t_sql_text        varchar2(2000);


  CURSOR journal_cur IS
  Select * from journal_t
  where poid_id0 >= (select d2lp(start_t) from zonemap_t)
  and poid_id0 < (select d2lp(end_t) from zonemap_t)
  and (resource_id <> 840
      or (resource_id = 840
          and item_obj_type in ('/item/payment','/item/adjustment','/item/writeoff')
      )
  )
  FOR UPDATE;

  journal_rec  journal_cur%ROWTYPE;


BEGIN

    insert into J_TIMINGS values (sysdate, 'deletion started from ' || start_t || ' to ' || end_t);
    Commit;


    FOR journal_rec IN journal_cur LOOP

      DELETE FROM journal_t
      WHERE CURRENT OF journal_cur;

      n_cntr := n_cntr + 1;
      n_rows_archived := n_rows_archived + 1;

       If n_cntr >= n_del_limit Then
        Commit;
        n_cntr := 0;
      End If;


End Loop;

  Commit;

  insert into J_TIMINGS values (sysdate, 'finished deleting ' || n_rows_archived || ' rows');
    Commit;

  --- Rebuild Journal_T indexes online to defrag
  /*For C2 in (select index_name from all_indexes where table_name = 'JOURNAL_T')
    Loop
      t_sql_text := 'alter index ' || C2.index_name || ' rebuild online';
      Execute Immediate t_sql_text;
  End Loop;

  insert into J_TIMINGS values (sysdate, 'index rebuild finished');
    Commit;*/

  END;

/
--------------------------------------------------------
--  DDL for Procedure ASSIGN_COLLECTION_AGENCIES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."ASSIGN_COLLECTION_AGENCIES" (IN_PLACEMENT_NUMBER IN NUMBER, IN_BUSINESS_TYPE IN VARCHAR)
IS
  TOTAL_AGENCIES                    NUMBER(32);
  TOTAL_ACCOUNTS                    NUMBER(32);
  COUNT_UNASSIGNED_ACTS             NUMBER(32);
  COUNT_ALREADY_ASSIGNED_AGENCY     NUMBER(32);
  COUNT_ALREADY_ASSIGNED_ACTS       NUMBER(32);
  FIRST_AGENCY                      HNS_COLL_AGENCIES_DETAILS_T.COLLECTION_AGENCY_NAME%TYPE;
  TEMP_AGENCY                       HNS_COLL_AGENCIES_DETAILS_T.COLLECTION_AGENCY_NAME%TYPE;
  C_AGENCY_NAME                     HNS_COLL_AGENCIES_DETAILS_T.COLLECTION_AGENCY_NAME%TYPE;
  C_AGENCY_PERCENTAGE               HNS_COLL_AGENCIES_DETAILS_T.PERCENTAGE%TYPE;

  CURSOR C_AGENCY IS
  SELECT COLLECTION_AGENCY_NAME, PERCENTAGE  FROM HNS_COLL_AGENCIES_DETAILS_T WHERE BUSINESS_TYPE = IN_BUSINESS_TYPE;

/****************************************************************************************************************************************************************************
   PROCEDURE NAME      : ASSIGN_COLLECTION_AGENCIES (IN_PLACEMENT_NUMBER, IN_BUSINESS_TYPE)
   PURPOSE             : TO SPLIT COLLECTION AGENCY ASSIGNMENT ON FIRST PLACEMENT AND INTERCHANGE IT ON SECOND PLACEMENT

   REVISIONS:
   VER        DATE        AUTHOR           DESCRIPTION
   ---------  ----------  ---------------  ----------------------------------------------------------
   1.0        26/06/2019  MAYANK GUPTA        1. CREATED FOR SPLITTING COLLECTION AGENCY ASSIGNMENT

   NOTE :
   IN_PLACEMENT_NUMBER = 1 -> FIRST PLACEMENT
   IN_PLACEMENT_NUMBER = 2 -> SECOND PLACEMENT
****************************************************************************************************************************************************************************/

BEGIN
  IF IN_PLACEMENT_NUMBER = 1
  THEN
    BEGIN

        SELECT COUNT(HD.POID_ID0) INTO TOTAL_ACCOUNTS
        FROM HNS_DELINQUENCY_T HD , ACCOUNT_T A
        WHERE A.POID_ID0 = HD.ACCOUNT_OBJ_ID0
        AND HD.COLLECTION_STATE = 4
        AND HD.AGENCY_EMAIL_STAT = 'P'
        AND A.GL_SEGMENT IN ( SELECT VAL
        FROM HNS_COLL_AGENCY_RULES_T HCAR
        WHERE HCAR.RULE_TYPE = 'gl_segment'
        AND HCAR.AGENCY IN (SELECT COLLECTION_AGENCY_NAME FROM HNS_COLL_AGENCIES_DETAILS_T
        WHERE BUSINESS_TYPE = IN_BUSINESS_TYPE));

      SELECT COUNT(COLLECTION_AGENCY_NAME) INTO TOTAL_AGENCIES FROM HNS_COLL_AGENCIES_DETAILS_T WHERE BUSINESS_TYPE = IN_BUSINESS_TYPE;

      COUNT_ALREADY_ASSIGNED_AGENCY:= 0;
      COUNT_ALREADY_ASSIGNED_ACTS := 0;

      OPEN C_AGENCY;
        LOOP
          FETCH C_AGENCY INTO C_AGENCY_NAME, C_AGENCY_PERCENTAGE;
          EXIT WHEN C_AGENCY%NOTFOUND;

          /**************************************************************************************************/
          /*  CALCULATING TOTAL NUMBER OF ACCOUNTS TO BE ASSIGNED TO AGENCY                                 */
          /*  WHEN ASSIGNING TO THE LAST AGENCIES, ASSIGN ALL THE REMAINING ACCOUNTS TO IT.                 */
          /*  FOR EXAMPLE: IF 101 ACCOUNTS IS TO BE ASSGINED TO AGENCY1, AGENCY2 AND AGENCY3(20%, 20%, 60%) */
          /*  ASSIGN 20% OF 101 = 21(CEIL VALUE) ACCOUNTS TO AGENCY1,                                       */
          /*  ASSIGN 20% OF 101 = 21(CEIL VALUE) ACCOUNTS TO AGENCY2,                                       */
          /*  ASSGIN REMAINIG UNASSIGNED ACCOUNTS 100 - ( 21 + 21 ) = 58 TO LAST AGENCY i.e., AGENCY3       */
          /**************************************************************************************************/

          IF TOTAL_AGENCIES - COUNT_ALREADY_ASSIGNED_AGENCY = 1 THEN
            COUNT_UNASSIGNED_ACTS := TOTAL_ACCOUNTS - COUNT_ALREADY_ASSIGNED_ACTS;
          ELSE
            COUNT_UNASSIGNED_ACTS := (C_AGENCY_PERCENTAGE / 100) * (TOTAL_ACCOUNTS);
          END IF;

          UPDATE HNS_DELINQUENCY_T SET COLL_AGENCY = C_AGENCY_NAME
          WHERE POID_ID0 IN ( SELECT HD.POID_ID0
          FROM HNS_DELINQUENCY_T HD , ACCOUNT_T A
          WHERE A.POID_ID0 = HD.ACCOUNT_OBJ_ID0
          AND HD.COLLECTION_STATE = 4
          AND HD.AGENCY_EMAIL_STAT = 'P'
          AND COLL_AGENCY IS NULL
          AND A.GL_SEGMENT IN ( SELECT VAL
          FROM HNS_COLL_AGENCY_RULES_T HCAR
          WHERE HCAR.RULE_TYPE = 'gl_segment'
          AND HCAR.AGENCY = C_AGENCY_NAME))
          AND ROWNUM <= COUNT_UNASSIGNED_ACTS;

          /* INCREAMENTING COUNTER VARIABLES AFTER ASSIGNMENT OF ACCOUNTS TO AN AGENCY */
          COUNT_ALREADY_ASSIGNED_AGENCY := COUNT_ALREADY_ASSIGNED_AGENCY + 1;
          COUNT_ALREADY_ASSIGNED_ACTS := COUNT_ALREADY_ASSIGNED_ACTS + COUNT_UNASSIGNED_ACTS;

        END LOOP;
      CLOSE C_AGENCY;
    END;
  END IF;
  /* NOW STARTING 2ND PLACEMENT */
  IF IN_PLACEMENT_NUMBER = 2
  THEN
    BEGIN
      OPEN C_AGENCY;
        FETCH C_AGENCY INTO C_AGENCY_NAME, C_AGENCY_PERCENTAGE;
        FIRST_AGENCY:= C_AGENCY_NAME;
        TEMP_AGENCY:= C_AGENCY_NAME;
        LOOP
         FETCH C_AGENCY INTO C_AGENCY_NAME, C_AGENCY_PERCENTAGE;
          EXIT WHEN C_AGENCY%NOTFOUND;

          /**************************************************************************************************/
          /*  BELOW THREE UPDATE QUERIES WILL SWAP ASSIGNED AGENCIES IN CIRCULAR FASHION                    */
          /*  ACCOUNTS WITH AGENCY1 WILL NOW BE ASSIGNED AGENCY2                                            */
          /*  ACCOUNTS WITH AGENCY2 WILL NOW BE ASSIGNED AGENCY3                                            */
          /*  ACCOUNTS WITH AGENCY3 WILL NOW BE ASSIGNED AGENCY1                                            */
          /*  SO ON AND SO FORTH                                                                            */
          /**************************************************************************************************/
          UPDATE HNS_DELINQUENCY_T SET COLL_AGENCY = 'TEMP_' || TEMP_AGENCY WHERE POID_ID0 IN ( SELECT HD.POID_ID0
          FROM HNS_DELINQUENCY_T HD , ACCOUNT_T A
          WHERE A.POID_ID0 = HD.ACCOUNT_OBJ_ID0
          AND HD.COLLECTION_STATE = 7
          AND HD.AGENCY_EMAIL_STAT = 'N'
          AND A.GL_SEGMENT NOT LIKE '%.ENTERPRISE.%'
          AND HD.LAST_STATE_CHANGE_T <=D2I(TRUNC(SYSDATE-75))
          AND HD.LAST_STATE_CHANGE_T >= D2U('03/23/2015')) -- DATE AS TAKEN FROM BASE FILE
          AND COLL_AGENCY = C_AGENCY_NAME;

          TEMP_AGENCY:=C_AGENCY_NAME;
        END LOOP;
        CLOSE C_AGENCY;

        UPDATE HNS_DELINQUENCY_T SET COLL_AGENCY = 'TEMP_' || TEMP_AGENCY WHERE POID_ID0 IN ( SELECT HD.POID_ID0
        FROM HNS_DELINQUENCY_T HD , ACCOUNT_T A
        WHERE A.POID_ID0 = HD.ACCOUNT_OBJ_ID0
        AND HD.COLLECTION_STATE = 7
        AND HD.AGENCY_EMAIL_STAT = 'N'
        AND A.GL_SEGMENT NOT LIKE '%.ENTERPRISE.%'
        AND HD.LAST_STATE_CHANGE_T <=D2I(TRUNC(SYSDATE-75))
        AND HD.LAST_STATE_CHANGE_T >= D2U('03/23/2015') ) -- DATE AS TAKEN FROM BASE FILE
        AND COLL_AGENCY = FIRST_AGENCY;

        /*  REMOVING TEMP PREFIX NOW */
        UPDATE HNS_DELINQUENCY_T SET COLL_AGENCY = SUBSTR(COLL_AGENCY, 6) WHERE POID_ID0 IN ( SELECT HD.POID_ID0
        FROM HNS_DELINQUENCY_T HD , ACCOUNT_T A
        WHERE A.POID_ID0 = HD.ACCOUNT_OBJ_ID0
        AND HD.COLLECTION_STATE = 7
        AND HD.AGENCY_EMAIL_STAT = 'N'
        AND A.GL_SEGMENT NOT LIKE '%.ENTERPRISE.%'
        AND HD.LAST_STATE_CHANGE_T <=D2I(TRUNC(SYSDATE-75))
        AND HD.LAST_STATE_CHANGE_T >= D2U('03/23/2015') ); -- DATE AS TAKEN FROM BASE FILE

    END;
  END IF;
 EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('EXCEPTION OCCURED WHILE EXECUTIN STORED PROCEDURE ASSIGN_COLLECTION_AGENCIES');
END ASSIGN_COLLECTION_AGENCIES;

/
--------------------------------------------------------
--  DDL for Procedure ATESTING_VOIP2
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."ATESTING_VOIP2" (createOrder IN VARCHAR2) IS
  po_obj        JSON_OBJECT_T;
  li_arr        JSON_ARRAY_T;
  li_item       JSON_ELEMENT_T;
  li_obj        JSON_OBJECT_T;
  device_ID     VARCHAR2;
 
BEGIN
  po_obj := JSON_OBJECT_T.parse(createOrder);
  li_arr := po_obj.get_Array('voipDetail');
  FOR i IN 0 .. li_arr.get_size - 1 LOOP
    li_obj := JSON_OBJECT_T(li_arr.get(i));
    device_ID := li_obj.get_Varchar('deviceID');
    --unitPrice := li_obj.get_Object('Part').get_Number('UnitPrice');
    DBMS_OUTPUT.PUT_LINE(device_ID);
  END LOOP;

END;

/
--------------------------------------------------------
--  DDL for Procedure BILLING_UPDATES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."BILLING_UPDATES" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
2aa6 b68
hRNvWA32FG2nF97yXz3aJ4v4KjUwg82jeSAFYHQZsU5kj5yoZbjXcZakQBvLygwXgJBmvSUx
eSS9EKEHdHkJGs2p+3MIhu1aRXit3HsO6eqMTXmk+u9CXYQckOXRtqdIJzmWlpq87TSSA3PS
+YFt0B8sUb196jzRA3og67L2rQRk2H0ZrboD7EV0XFhjeUXSiBjXOsBfQSRkdQyd8B5dVuLB
OEpWkFXeB+x5/hpyGFwxp9lJQPMSZXQraMmEcmV1LcEc1qTRHbOL4pswVS+sHtu61QbHOWvr
djJh4NX+hoXsM6G+Jm1XIJM9kUKTimHY5ZPxKpOT3UHzK5wTZtcYMhKH6H4sQDJK0Tn+PX/1
l5uEof4DV2cMJCtko7w+VAV8/1KaqYY4nlKCWMhBedoG/P84s+SzjCktDLk6MahPyHn9sRhZ
REnM+CyY1QQJCwwVIgbnn1p8vFa5RmQFrACGYkmSQtIeuxhi0P3iBHMqXQUOCy7TB+aepO5I
MHHHX8vSNMTowjhiEc7ozLMZLAB6h91HoPpZIevRXywtZMZAFHkDJuXdCdQxrUFpmCYl3cUF
b32MRRErDZgYLbMtC3UtPcXdHEm9QN+/w83wYBunpX72Cy2hdwD2yOLYBQnb2KXgwVjKRNUl
szL5oDTprA60Pu7YycTeaxFWPre9LyuxU1SJNEz0X7HGjYlE8tUaIe5FW04xfjMvpBqFMp7e
HC2hyDg/aCDIlAVXxgYOrWr9doH9tF1mndZ00EayDGH/GL3MIBvS2GZkpZBuFa+WUS8sWTdP
f22HvPxX9lT96lxBbH+ANH5j5veAtO3my2uMd1vgIDCqEDpFc85y+JlT5Kac6mTiIEjRhxB6
BBeGgUCI90lhlMFT5k6EOQUBwsQ6m/zXgbGguoq1T4Pcpbcw6/MOrADGuFvzZaAdIw2sUl7s
lNZ7Q2fMO/ybdo4r/EmucgTfIBBJoLgS72upd/yTFcXurXLTiWln9EhkE2SGz5/HxxDW/0Ao
HyCzMbRGl8mO4g/5Ag/ustEcz/k0rlCHvGBbilFDAdXyh11X3iMeOtxf65TR1ysvrfDzOcIQ
yYRWtmWLasrkEXnnqFsxPZqWGVGTJdQKrruHh2h6QB3O5DHe2RGwFikVKFZsbFqyqxhk/lyu
NsF1rJYZTLT8oSeuxNE+cOBjlWWE5y6MZ5jp7qhB9xpV6SGaB30Re5FukpGN9Z4rsrArr9/C
fJVhYNRE7D3Bbwjx9LSyhOp9zWCvMCd+PAA9qBcftcZtWAUSgXJfSvIkHmq/Tyjndyu0cPJc
MCsMXJyXg5nlOIjgUhVrM6o3SX2pmNTpUa4sX6enrDGVq5qRC0rRSdt+wyazkAl8ceavuyQ+
BPlr5sOxHj3Y3lSDG3K3birDYat3KcZNSthpTqHBBJOi4b7I/GEpZktuM245540Ch5bcKmPe
fTzf1Xd+bbDivoTH1SuNWI8yQSFoOIypvOf65tGe84gm5snrYhUFluaRF4Go+I0c5jNNV+Nc
/lYh294oRcXvKHLiFuivXq77RNaiF6D0QMlA8rQ5/b1vuDZgM3XXGv9B5X5X1NFP0nhws9wE
42sfjp+VekjHp+AT8C1cjTDG/Dw9oQZhsrpPA6yWI5Vm7etL6EYyUmqQh5HuAsOW8nhZn1df
oqyZEnBsN28U5K31h5BbLmBGJf/WRmgbx1fsyE22E+Qi4O7cqYpoRo2R7/oNle/qBkRHLpQA
NSIR5y5OQAL6pHvEsw+CGfzVVQmROLaTZXp6wLc7WxT++fKQ+OVy/BnqJsckpMEEubB3mNDc
kJ+WadMNIMb5vYuFbvr6cNt7/Hr4zRHF/EnAhfX9cKNQrvh5pkvQ460dvS8wholXRs3wz0kl
EEt9pK2zkKvMHWgCKnKNgal9+TaxCaeJPm2KQH2oRHONRS6WrI/7jXOHTCLpMrBebLPizwn9
sATc3WNeAmpk90FnQnn1Pj3b/2yUhCWVWn9sxQxaICojXTXsKj05N4n/ffOQ9vZ+di3CcfMU
Qj6rW8s4k3yCnnmACgGclNV1x+CSoDnea0qeuuCeBEYnjhiTs9+hbgPnNkkqF+WOYCB4uVd3
QQrcJi/olC6TSukLJA02PdbIwAnE+ofsBPz4J9foZfORr/ODOD+kM1XGJiT4Cd4Cdjkx+hU1
jrMFxeUOoDjLYbrsYBM17C5sNPHCPe6TPMoyp6AWO+mRVkYMXgKmOBTzJbSCkfZLFCng5C9o
SH4xPTgQWgwiftAHrA8dtsyIUZt1UlW5aVt/HZsTcSilNIRt51SZbGUDFJfV5lRtcJpXXL8Y
hI07Bhyo2vo0OsBUAA04PTq7W5f5ZzGYDopduq+xlrHyah7+mUuXe6b2R6apv4AIjId3coxf
6VsXW/P/Vf5djuZQyc0YZNqvT2XrCYAKRYYw2tVAnxJoieKnGYA7EJMUStWOzWt2IaeC56il
keqAzWjIs82AairGnRgmOoS/NXT7NNT+LKU/STDEzBJMgvXeapDVggLgE4SRAFgyyblMyrxs
5J0fUD9V8qYP5TgPlLwFwo/L+Vka030yH00DyXcGWMxUI+1Hmk65Od3mNGm9Ym/vJgIA8eEL
ofW+xp4w+qk3HFOf1tGG6r2RkCjI8vGCp+Sz4kYKHgS9VPB32I/3cYHGVSOE5uHHu/cqKuQc
k3aj8r8hXSKNahyGMXzTwE/l+yh/OT/lq0K+ZqrtHDpMhL4RIe1oe4JgxAPOiiM+TbTHb49D
gc0GLnpFHRlT2vBI0iQ3trtDw3m7nPioVpCdYmmIZtTx82hvjUbYTmoqp52r1lBs9arneMV9
4owakrspXX7Dhlvb3oOXafcuzDHRhs9M6jDrhwawOWDE/D/zzDpJIvULfo1X1wiuteFNxLXT


/
--------------------------------------------------------
--  DDL for Procedure CANCEL_BRT_ACCOUNT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CANCEL_BRT_ACCOUNT" 
          ( ACCNO IN VARCHAR2,
          RETVAL OUT VARCHAR2 )
IS
          PRAGMA AUTONOMOUS_TRANSACTION;
          CUST_EX EXCEPTION;
          SERVICE_EXISTS NUMBER;
          UPD_T NUMBER;
          IS_ACTION_REQD NUMBER;
 BEGIN

      SELECT COUNT(*) INTO IS_ACTION_REQD  FROM HNS_VOIP_ACTIVATION_STATUS_T WHERE SAN=ACCNO AND STATUS IN ('H','D');

      SELECT COUNT(*) INTO SERVICE_EXISTS  FROM SERVICE_T S, ACCOUNT_T A WHERE A.ACCOUNT_NO=ACCNO
      AND A.POID_ID0=S.ACCOUNT_OBJ_ID0 AND S.POID_TYPE='/service/voip';

      IF IS_ACTION_REQD <> 0 AND SERVICE_EXISTS = 0 THEN

        --GET START TIME OF PROCEDURE FOR UPDATE PURPOSES
        SELECT D2I(SYSDATE) INTO UPD_T FROM PIN_VIRTUAL_TIME_T;

        --MAKE HNS_VOIP_REQUEST_T UPDATE
        UPDATE HNS_VOIP_REQUEST_T SET STATUS = 'X', MODIFIED_T = UPD_T
        WHERE SAN = ACCNO AND WORKORDERTYPE = 'A' AND CREATED_T < UPD_T;

        --MAKE HNS_VOIP_REQUEST_T INSET
        INSERT INTO HNS_VOIP_REQUEST_T( WORKORDERNO,CREATED_T,MODIFIED_T,SAN,WORKORDERTYPE,EFFECTIVEDATE,ACTIVATIONDATE,
        STATUS,SOURCE,NUM_ATTEMPTS )
        VALUES
        (HNS_VOIP_REQUEST_ID.NEXTVAL, D2I(sysdate), D2I(sysdate),ACCNO,'CAN', 0, 0, 'P', 'DSS', 0);


        --MAKE HNS_VOIP_ACTIVATION_STATUS_T UPDATE
        UPDATE HNS_VOIP_ACTIVATION_STATUS_T SET STATUS = 'X', ACTIVATION_T = 0, MODIFIED_T = UPD_T, NUM_ATTEMPTS = NUM_ATTEMPTS + 1
        WHERE SAN = ACCNO AND CREATED_T < UPD_T;

      END IF;

      --COMMIT CHANGES
      COMMIT;

      DBMS_OUTPUT.PUT_LINE('Successfully Executed');
      RETVAL := '0';

  EXCEPTION
      WHEN CUST_EX THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Failure While Execution');
      WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Failure While Execution');
        RETVAL := SUBSTR(SQLERRM, 1, 200);
END CANCEL_BRT_ACCOUNT;

/
--------------------------------------------------------
--  DDL for Procedure CBRM_TO_EBRM_SPIN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CBRM_TO_EBRM_SPIN" 
IS
    rec_id_upd                 HNS_EBRM_ACTIVATIONS_T.rec_id%TYPE;
    account_poid_upd        HNS_EBRM_ACTIVATIONS_T.ebrm_account_obj_id0%TYPE;
    churn_date_upd            HNS_EBRM_ACTIVATIONS_T.CBRM_CHURN_DATE%TYPE;
    cbrm_deal_obj            HNS_CBRM_CHURNS_T.DEAL_OBJ_ID0%TYPE;

    address_upd                 HNS_EBRM_ACTIVATIONS_T.address%TYPE;
    city_upd                 HNS_EBRM_ACTIVATIONS_T.city%TYPE;
    state_upd              HNS_EBRM_ACTIVATIONS_T.state%TYPE;
    zip_upd            HNS_EBRM_ACTIVATIONS_T.zip%TYPE;
    country_upd            HNS_EBRM_ACTIVATIONS_T.country%TYPE;
    last_name_upd                HNS_EBRM_ACTIVATIONS_T.last_name%TYPE;
    activation_date_upd          HNS_EBRM_ACTIVATIONS_T.activation_date%TYPE;
    total_rec               INTEGER;

  CURSOR get_churn_data_cur IS
  SELECT HEA.REC_ID rec_id, HEA.LAST_NAME, HEA.ADDRESS,HEA.CITY, HEA.STATE, substr(HEA.ZIP, 1, 5) ZIP, HEA.COUNTRY, HEA.ACTIVATION_DATE
  FROM HNS_EBRM_ACTIVATIONS_T HEA
    WHERE  HEA.ACTIVATION_DATE >= D2I(SYSDATE - 45)
    AND    HEA.CBRM_CHURN_DATE IS NULL;

BEGIN

  DBMS_OUTPUT.PUT_LINE('Starting loop');
  total_rec               := 0   ;
  FOR get_churn_data_rec IN get_churn_data_cur
      LOOP
      rec_id_upd            := get_churn_data_rec.rec_id;
      churn_date_upd        := 0;
      account_poid_upd      := 0;
      cbrm_deal_obj         := 0;
    address_upd                 := get_churn_data_rec.address;
    city_upd                 := get_churn_data_rec.city;
    state_upd              := get_churn_data_rec.state;
    zip_upd            := get_churn_data_rec.zip;
    country_upd            := get_churn_data_rec.country;
    last_name_upd                := get_churn_data_rec.last_name;
    activation_date_upd          := get_churn_data_rec.activation_date;

                BEGIN
                                SELECT HCC.CHURN_DATE, HCC.ACCOUNT_OBJ_ID0, HCC.deal_obj_id0
                                INTO churn_date_upd, account_poid_upd, cbrm_deal_obj
                                FROM HNS_CBRM_CHURNS_T HCC
                                                WHERE    last_name_upd = HCC.LAST_NAME
                                                AND    address_upd = HCC.ADDRESS
                                                AND    city_upd = HCC.CITY
                                                AND    state_upd = HCC.STATE
                                                AND    zip_upd = substr(HCC.ZIP,1,5)
                                                AND    country_upd = HCC.COUNTRY
                                                AND    HCC.CHURN_DATE <= activation_date_upd + 3888000
                                                AND    activation_date_upd > activation_date_upd - 3888000;
                                                --AND    HEA.REC_ID = rec_id_upd;

                                -- updating HNS_EBRM_ACTIVATIONS_T table with fetched fields

                                IF churn_date_upd > 0 THEN
                                                UPDATE HNS_EBRM_ACTIVATIONS_T
                                                SET cbrm_churn_date = churn_date_upd,
                                                                cbrm_account_obj_id0 = account_poid_upd,
                                                                cbrm_deal_obj_id0 = cbrm_deal_obj,
                                                                spin_detected_t = date_to_infranet(sysdate)
                                                WHERE rec_id = rec_id_upd;

                                                -- incrementing the counter value
                                                --total_rec := total_rec+1;

                                                --IF mod(total_rec, 100) = 0 THEN    -- Commit every 100 records
                                                                COMMIT;
                                                --END IF;
                                END IF;
                                EXCEPTION
                                WHEN no_data_found THEN
                                                   churn_date_upd        := 0;
                                WHEN TOO_MANY_ROWS THEN
                                        BEGIN
                                                    SELECT HCC1.CHURN_DATE, HCC1.ACCOUNT_OBJ_ID0, HCC1.deal_obj_id0
                                                    INTO churn_date_upd, account_poid_upd, cbrm_deal_obj FROM (
                                                           SELECT *
                                                           FROM HNS_CBRM_CHURNS_T HCC
                                                           WHERE    last_name_upd = HCC.LAST_NAME
                                                           AND    address_upd = HCC.ADDRESS
                                                           AND    city_upd = HCC.CITY
                                                           AND    state_upd = HCC.STATE
                                                           AND    zip_upd = substr(HCC.ZIP,1,5)
                                                           AND    country_upd = HCC.COUNTRY
                                                           AND    activation_date_upd >= HCC.CHURN_DATE-3888000
                                                           AND    activation_date_upd < HCC.CHURN_DATE+3888000
                                                           ORDER  BY churn_date desc) HCC1
                                                     WHERE ROWNUM < 2;

                                                     UPDATE HNS_EBRM_ACTIVATIONS_T
                                                     SET cbrm_churn_date = churn_date_upd,
                                                                    cbrm_account_obj_id0 = account_poid_upd,
                                                                    cbrm_deal_obj_id0 = cbrm_deal_obj,
                                                                    spin_detected_t = date_to_infranet(sysdate)
                                                     WHERE rec_id = rec_id_upd;

                                                     commit;
                                        END;
                                                --DBMS_OUTPUT.PUT_LINE('no data');
                END;

    END LOOP;

COMMIT;

DBMS_OUTPUT.PUT_LINE('Ending loop');
END cbrm_to_ebrm_spin;

/
--------------------------------------------------------
--  DDL for Procedure CC_DECLINE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CC_DECLINE" IS
--
--
-- ---------   ------  -------------------------------------------
    decline_obj event_t.poid_id0%TYPE;
    decline_t event_t.end_t%TYPE;
    account_obj event_t.account_obj_id0%TYPE;
    subords_obj event_t.account_obj_id0%TYPE;
    scenario_count INTEGER;
    service_count INTEGER;
    new_pymt_count INTEGER;
    scenario_name VARCHAR2 (255);
    tum_start hns_tum_t.tum_start_days%TYPE;
    tum_end hns_tum_t.tum_end_days%TYPE;
    url_p hns_tum_t.url_parent%TYPE;
    url_c hns_tum_t.url_child%TYPE;
    hit hns_tum_t.hits%TYPE;
    esn hns_profile_customer_t.hns_serial_number%TYPE;
    t_sql_text varchar2(100);
    last_state_change event_t.end_t%TYPE;
    days_in_coll INTEGER;

    --1. Create a cursor to get the list of event poids that declined
    --2. For each event poid, skip if
         -- a. there is a new payment poid after that
         -- b. the account is in collections
         -- c. if there is no bill that is still due and older than the payment attempt
    --3. Load the data corresponding to it in a table


    CURSOR cc_decline_cur IS
        select obj_id0
               ,(select end_t from event_t where poid_id0 = obj_id0) end_t
               ,(select account_obj_id0 from event_t where poid_id0 = obj_id0) account_obj_id0
        from  event_billing_payment_cc_t
        where result = 7
        and   obj_id0 >= d2lp(sysdate-7);

    CURSOR delinq_cur IS
        select account_obj_id0, ceil(sysdate - u2d(last_state_change_t)) coll_days, last_state_change_t
        from  hns_delinquency_t
        where collection_state = 1;

    CURSOR subords_cur (parent_account NUMBER) IS
        select object_id0
        from   group_t g, group_billing_members_t gbm
        where  g.poid_id0 = gbm.obj_id0
        and    g.account_obj_id0 = parent_account;

    CURSOR tum_rec_cur (parent_account NUMBER) IS
        select ccs.scenario_name,ht.tum_start_days,ht.tum_end_days,ht.url_parent,ht.url_child,ht.hits
        from   collections_scenario_t cs, config_collections_scenario_t ccs, hns_tum_t ht , billinfo_t bi
        where  bi.SCENARIO_OBJ_ID0 = cs.POID_ID0
        and    cs.config_scenario_obj_id0 = ccs.obj_id0
        and    ht.coll_scenario = ccs.scenario_name
        and    bi.account_obj_id0 = parent_account;

BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');

   t_sql_text := 'truncate table cc_decline_t';
   Execute Immediate t_sql_text;

   select tum_start_days, tum_end_days,url_parent,url_child,hits into
            tum_start, tum_end, url_p, url_c, hit
   from hns_tum_t
   where collection_state = 8;
   --rows_cnt := 0;


    FOR account_rec in cc_decline_cur
    LOOP
       decline_obj := account_rec.obj_id0;
       decline_t := account_rec.end_t;
       account_obj := account_rec.account_obj_id0;

       select count(*) into scenario_count
       from   billinfo_t bi
       where  bi.account_obj_id0 = account_obj
       and    (bi.scenario_obj_id0 <> 0 or bi.exempt_from_collections = 1);

       if scenario_count <> 0 then
           GOTO end_loop ;
           -- Account is in collections or it is exempt, no decline TUMS
       end if;

       select count(*) into new_pymt_count from event_billing_payment_t ebp, event_t e
       where  e.poid_id0 = ebp.obj_id0
       and    ebp.obj_id0 >= d2lp(sysdate-7)
       and    e.poid_id0 >= d2lp(sysdate-7)
       and    e.account_obj_id0 = account_obj
       and    ebp.command <> 5
       and    e.end_t > decline_t;

       if new_pymt_count > 0 then
           -- A new payment has happened on the account, no decline TUMS
           GOTO end_loop ;
       end if;

       select count(*) into new_pymt_count from bill_t b
       where  b.account_obj_id0 = account_obj
       and    b.due > 0
       and    b.end_t < decline_t;

       if new_pymt_count = 0 then
           -- No open bill older than payment attempt, no decline TUMS
           GOTO end_loop ;
       end if;

       select hns_serial_number into esn
       from   hns_profile_customer_t hpc, profile_t p
       where  p.poid_id0 = hpc.obj_id0
       and    p.account_obj_id0 = account_obj;

       INSERT INTO PIN.CC_DECLINE_T (
           ACCOUNT_TYPE, HNS_SERIAL_NUMBER, DAYSINCOLLECTIONS,
           LAST_STATE_CHANGE, SCENARIO_NAME, TUM_START_DAYS,
           TUM_END_DAYS, URL_PARENT, URL_CHILD,
           HITS, ACCOUNT_NO, GL_SEGMENT)
        VALUES ( '1',esn,'NA', decline_t,'NA',tum_start,tum_end,
                url_p,url_c,hit,p2a(account_obj), p2gl(account_obj) );
        commit;

        --rows_cnt := rows_cnt + 1;

        --if rows_cnt = 10000 then
       --     commit;
       --     rows_cnt := 0;
       -- end if;
    <<end_loop>>
    NULL;
   END LOOP;


   FOR delinq_rec in delinq_cur
    LOOP
       account_obj := delinq_rec.account_obj_id0;
       days_in_coll := delinq_rec.coll_days;
       last_state_change := delinq_rec.last_state_change_t;

       select count(*) into new_pymt_count from account_t a
       where  a.poid_id0 = account_obj
       and    a.gl_segment not like '%VAR%'
       and    a.gl_segment not like '%GUEST%'
       and    a.gl_segment not like '.NAD.KU.ENTERPRISE.GOVT.GSC';

       if new_pymt_count = 0 then
           -- No TUMS for VAR, gues or GSC accounts
           GOTO end_delinq_loop ;
       end if;

       -- Process subordinates first
       FOR subords_rec in subords_cur ( account_obj )
       LOOP
           subords_obj := subords_rec.object_id0;

           select count(*) into service_count
           from   service_t s
           where  s.account_obj_id0 = subords_obj
           and    poid_type = '/service/ip'
           and    s.status = 10100;

           if service_count <> 0 then
               -- service IP not active, no TUMS
               GOTO end_subords_delinq_loop ;
           end if;

           select hns_serial_number into esn
           from   hns_profile_customer_t hpc, profile_t p
           where  p.poid_id0 = hpc.obj_id0
           and    p.account_obj_id0 = subords_obj;

           FOR tum_rec in tum_rec_cur ( account_obj )
           LOOP
                scenario_name := tum_rec.scenario_name;
                tum_start := tum_rec.tum_start_days;
                tum_end := tum_rec.tum_end_days;
                url_p := tum_rec.url_parent;
                url_c := tum_rec.url_child;
                hit := tum_rec.hits;
                INSERT INTO PIN.CC_DECLINE_T (
                     ACCOUNT_TYPE, HNS_SERIAL_NUMBER, DAYSINCOLLECTIONS,
                     LAST_STATE_CHANGE, SCENARIO_NAME, TUM_START_DAYS,
                     TUM_END_DAYS, URL_PARENT, URL_CHILD,
                     HITS, ACCOUNT_NO, GL_SEGMENT)
                VALUES ( '2',esn,days_in_coll,last_state_change, scenario_name,tum_start,tum_end,
                     url_p,url_c,hit,p2a(account_obj), p2gl(account_obj) );

                commit;
           END LOOP;

           <<end_subords_delinq_loop>>
           NULL;
       END LOOP;

       select hns_serial_number into esn
       from   hns_profile_customer_t hpc, profile_t p
       where  p.poid_id0 = hpc.obj_id0
       and    p.account_obj_id0 = account_obj;

       FOR tum_rec in tum_rec_cur ( account_obj )
       LOOP
            scenario_name := tum_rec.scenario_name;
            tum_start := tum_rec.tum_start_days;
            tum_end := tum_rec.tum_end_days;
            url_p := tum_rec.url_parent;
            url_c := tum_rec.url_child;
            hit := tum_rec.hits;
            INSERT INTO PIN.CC_DECLINE_T (
                 ACCOUNT_TYPE, HNS_SERIAL_NUMBER, DAYSINCOLLECTIONS,
                 LAST_STATE_CHANGE, SCENARIO_NAME, TUM_START_DAYS,
                 TUM_END_DAYS, URL_PARENT, URL_CHILD,
                 HITS, ACCOUNT_NO, GL_SEGMENT)
            VALUES ( '2',esn,days_in_coll,last_state_change, scenario_name,tum_start,tum_end,
                 url_p,url_c,hit,p2a(account_obj), p2gl(account_obj) );

            commit;
       END LOOP;

        --rows_cnt := rows_cnt + 1;

        --if rows_cnt = 10000 then
       --     commit;
       --     rows_cnt := 0;
       -- end if;
       <<end_delinq_loop>>
       NULL;
   END LOOP;


DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending procedure ' || sysdate);
EXCEPTION  -- exception handlers begin

  WHEN OTHERS THEN  -- handles all other errors
      dbms_output.put_line('Some other kind of error occurred.' || account_obj);
      INSERT INTO PIN.CC_DECLINE_T (
           ACCOUNT_TYPE, HNS_SERIAL_NUMBER, DAYSINCOLLECTIONS,
           LAST_STATE_CHANGE, SCENARIO_NAME, TUM_START_DAYS,
           TUM_END_DAYS, URL_PARENT, URL_CHILD,
           HITS, ACCOUNT_NO, GL_SEGMENT)
        VALUES ( '4',esn,days_in_coll,last_state_change, scenario_name,tum_start,tum_end,
                url_p,url_c,hit,p2a(account_obj), '');
        commit;

END;

/
--------------------------------------------------------
--  DDL for Procedure CC_DECLINE1
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CC_DECLINE1" IS
--
--
-- ---------   ------  -------------------------------------------
    decline_obj event_t.poid_id0%TYPE;
    decline_t event_t.end_t%TYPE;
    account_obj event_t.account_obj_id0%TYPE;
    subords_obj event_t.account_obj_id0%TYPE;
    scenario_count INTEGER;
    service_count INTEGER;
    new_pymt_count INTEGER;
    scenario_name VARCHAR2 (255);
    tum_start hns_tum_t.tum_start_days%TYPE;
    tum_end hns_tum_t.tum_end_days%TYPE;
    url_p hns_tum_t.url_parent%TYPE;
    url_c hns_tum_t.url_child%TYPE;
    hit hns_tum_t.hits%TYPE;
    esn hns_profile_customer_t.hns_serial_number%TYPE;
    t_sql_text varchar2(100);
    last_state_change event_t.end_t%TYPE;
    days_in_coll INTEGER;

    --1. Create a cursor to get the list of event poids that declined
    --2. For each event poid, skip if
         -- a. there is a new payment poid after that
         -- b. the account is in collections
         -- c. if there is no bill that is still due and older than the payment attempt
    --3. Load the data corresponding to it in a table


    CURSOR cc_decline_cur IS
        select obj_id0
               ,(select end_t from event_t where poid_id0 = obj_id0) end_t
               ,(select account_obj_id0 from event_t where poid_id0 = obj_id0) account_obj_id0
        from  event_billing_payment_cc_t
        where result = 7
        and   obj_id0 >= d2lp(sysdate-10);

    CURSOR delinq_cur IS
        select account_obj_id0, ceil(sysdate - u2d(last_state_change_t)) coll_days, last_state_change_t
        from  hns_delinquency_t
        where collection_state = 1
        --and   account_no = 'DSS7359420'
        ;

    CURSOR subords_cur (parent_account NUMBER) IS
        select object_id0
        from   group_t g, group_billing_members_t gbm
        where  g.poid_id0 = gbm.obj_id0
        and    g.account_obj_id0 = parent_account;

    CURSOR tum_rec_cur (parent_account NUMBER, daysincoll NUMBER) IS
        select ccs.scenario_name,ht.tum_start_days,ht.tum_end_days,ht.url_parent,ht.url_child,ht.hits
        from   collections_scenario_t cs, config_collections_scenario_t ccs, hns_tum_t ht , billinfo_t bi
        where  bi.SCENARIO_OBJ_ID0 = cs.POID_ID0
        and    cs.config_scenario_obj_id0 = ccs.obj_id0
        and    ht.coll_scenario = ccs.scenario_name
        and    bi.account_obj_id0 = parent_account
        and    daysincoll >= ht.tum_start_days
        and    daysincoll < ht.tum_end_days;

BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');

   t_sql_text := 'truncate table cc_decline_t';
   Execute Immediate t_sql_text;


   --rows_cnt := 0;


   FOR delinq_rec in delinq_cur
    LOOP
       account_obj := delinq_rec.account_obj_id0;
       days_in_coll := delinq_rec.coll_days;
       last_state_change := delinq_rec.last_state_change_t;

       select count(*) into new_pymt_count from account_t a
       where  a.poid_id0 = account_obj
       and    a.gl_segment not like '%VAR%'
       and    a.gl_segment not like '%GUEST%'
       and    a.gl_segment not like '.NAD.KU.ENTERPRISE.GOVT.GSC';

       if new_pymt_count = 0 then
           -- No TUMS for VAR, gues or GSC accounts
           GOTO end_delinq_loop ;
       end if;

       -- Process subordinates first
       FOR subords_rec in subords_cur ( account_obj )
       LOOP
           subords_obj := subords_rec.object_id0;
           --DBMS_OUTPUT.PUT_LINE('Subord = ' || subords_obj);

           select count(*) into service_count
           from   service_t s
           where  s.account_obj_id0 = subords_obj
           and    poid_type = '/service/ip'
           and    s.status = 10100;
           --DBMS_OUTPUT.PUT_LINE('ip active count = ' || service_count);

           if service_count = 0 then
               -- service IP not active, no TUMS
               GOTO end_subords_delinq_loop ;
           end if;


           select hns_serial_number into esn
           from   hns_profile_customer_t hpc, profile_t p
           where  p.poid_id0 = hpc.obj_id0
           and    p.account_obj_id0 = subords_obj;

           if esn is null then
               --No ESN, no TUMS
               GOTO end_subords_delinq_loop ;
           end if;

           --DBMS_OUTPUT.PUT_LINE('hns_serial_number = ' || esn);

           FOR tum_rec in tum_rec_cur ( account_obj, days_in_coll  )
           LOOP
                scenario_name := tum_rec.scenario_name;
                tum_start := tum_rec.tum_start_days;
                tum_end := tum_rec.tum_end_days;
                url_p := tum_rec.url_parent;
                url_c := tum_rec.url_child;
                hit := tum_rec.hits;
                --DBMS_OUTPUT.PUT_LINE('tumrec = ' || scenario_name);
                INSERT INTO PIN.CC_DECLINE_T (
                     ACCOUNT_TYPE, HNS_SERIAL_NUMBER, DAYSINCOLLECTIONS,
                     LAST_STATE_CHANGE, SCENARIO_NAME, TUM_START_DAYS,
                     TUM_END_DAYS, URL_PARENT, URL_CHILD,
                     HITS, ACCOUNT_NO, GL_SEGMENT)
                VALUES ( '2',esn,days_in_coll,last_state_change, scenario_name,tum_start,tum_end,
                     url_c,url_c,hit,p2a(subords_obj), p2gl(subords_obj) );

                commit;
           END LOOP;

           <<end_subords_delinq_loop>>
           NULL;
       END LOOP;


       select count(*) into service_count
           from   service_t s
           where  s.account_obj_id0 = account_obj
           and    poid_type = '/service/ip'
           and    s.status = 10100;
          --DBMS_OUTPUT.PUT_LINE('ip active count = ' || service_count);
       if service_count = 0 then
           -- service IP not active, no TUMS
           GOTO end_delinq_loop ;
       end if;

       select hns_serial_number into esn
       from   hns_profile_customer_t hpc, profile_t p
       where  p.poid_id0 = hpc.obj_id0
       and    p.account_obj_id0 = account_obj;

       if esn is null then
           -- no ESN, no TUMS
           GOTO end_delinq_loop ;
       end if;

--DBMS_OUTPUT.PUT_LINE('ESN = ' || esn);
       FOR tum_rec in tum_rec_cur ( account_obj, days_in_coll )
       LOOP
            scenario_name := tum_rec.scenario_name;
            tum_start := tum_rec.tum_start_days;
            tum_end := tum_rec.tum_end_days;
            url_p := tum_rec.url_parent;
            url_c := tum_rec.url_child;
            hit := tum_rec.hits;
            --DBMS_OUTPUT.PUT_LINE('ESN = ' || esn);
            INSERT INTO PIN.CC_DECLINE_T (
                 ACCOUNT_TYPE, HNS_SERIAL_NUMBER, DAYSINCOLLECTIONS,
                 LAST_STATE_CHANGE, SCENARIO_NAME, TUM_START_DAYS,
                 TUM_END_DAYS, URL_PARENT, URL_CHILD,
                 HITS, ACCOUNT_NO, GL_SEGMENT)
            VALUES ( '1',esn,days_in_coll,last_state_change, scenario_name,tum_start,tum_end,
                 url_p,url_c,hit,p2a(account_obj), p2gl(account_obj) );

            commit;
       END LOOP;

        --rows_cnt := rows_cnt + 1;

        --if rows_cnt = 10000 then
       --     commit;
       --     rows_cnt := 0;
       -- end if;
       <<end_delinq_loop>>
       NULL;
   END LOOP;


   select tum_start_days, tum_end_days,url_parent,url_child,hits into
            tum_start, tum_end, url_p, url_c, hit
   from hns_tum_t
   where collection_state = 8;

    FOR account_rec in cc_decline_cur
    LOOP
       decline_obj := account_rec.obj_id0;
       decline_t := account_rec.end_t;
       account_obj := account_rec.account_obj_id0;

       select count(*) into scenario_count
       from   billinfo_t bi
       where  bi.account_obj_id0 = account_obj
       and    (bi.scenario_obj_id0 <> 0 or bi.exempt_from_collections = 1);

       if scenario_count <> 0 then
           GOTO end_loop ;
           -- Account is in collections or it is exempt, no decline TUMS
       end if;

       select count(*) into new_pymt_count from event_billing_payment_t ebp, event_t e
       where  e.poid_id0 = ebp.obj_id0
       and    ebp.obj_id0 >= d2lp(sysdate-10)
       and    e.poid_id0 >= d2lp(sysdate-10)
       and    e.account_obj_id0 = account_obj
       and    ebp.command <> 5
       and    e.end_t > decline_t;

       if new_pymt_count > 0 then
           -- A new payment has happened on the account, no decline TUMS
           GOTO end_loop ;
       end if;

       select count(*) into new_pymt_count from bill_t b
       where  b.account_obj_id0 = account_obj
       and    b.due > 0
       and    b.end_t < decline_t;

       if new_pymt_count = 0 then
           -- No open bill older than payment attempt, no decline TUMS
           GOTO end_loop ;
       end if;

       select hns_serial_number into esn
       from   hns_profile_customer_t hpc, profile_t p
       where  p.poid_id0 = hpc.obj_id0
       and    p.account_obj_id0 = account_obj;

       if esn is null then
           -- No ESN, no decline TUMS
           GOTO end_loop ;
       end if;

       INSERT INTO PIN.CC_DECLINE_T (
           ACCOUNT_TYPE, HNS_SERIAL_NUMBER, DAYSINCOLLECTIONS,
           LAST_STATE_CHANGE, SCENARIO_NAME, TUM_START_DAYS,
           TUM_END_DAYS, URL_PARENT, URL_CHILD,
           HITS, ACCOUNT_NO, GL_SEGMENT)
        VALUES ( '1',esn,'NA', decline_t,'NA',tum_start,tum_end,
                url_p,url_c,hit,p2a(account_obj), p2gl(account_obj) );
        commit;

        --rows_cnt := rows_cnt + 1;

        --if rows_cnt = 10000 then
       --     commit;
       --     rows_cnt := 0;
       -- end if;
    <<end_loop>>
    NULL;
   END LOOP;


DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending procedure ' || sysdate);
EXCEPTION  -- exception handlers begin

  WHEN OTHERS THEN  -- handles all other errors
      dbms_output.put_line('Some other kind of error occurred.' || account_obj);
      INSERT INTO PIN.CC_DECLINE_T (
           ACCOUNT_TYPE, HNS_SERIAL_NUMBER, DAYSINCOLLECTIONS,
           LAST_STATE_CHANGE, SCENARIO_NAME, TUM_START_DAYS,
           TUM_END_DAYS, URL_PARENT, URL_CHILD,
           HITS, ACCOUNT_NO, GL_SEGMENT)
        VALUES ( '4',esn,days_in_coll,last_state_change, scenario_name,tum_start,tum_end,
                url_p,url_c,hit,p2a(account_obj), '');
        commit;

END;

/
--------------------------------------------------------
--  DDL for Procedure CC_DEL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CC_DEL" IS
--
--
-- ---------   ------  -------------------------------------------
    md5 payinfo_cc_t.debit_num%TYPE;
    account_poid INTEGER;
    billinfo_poid INTEGER;
    payinfo_poid INTEGER;
    clear_token cc_del_t.passwd_clear%TYPE;

    CURSOR list_account_cur IS
        select a.poid_id0 ACCOUNT_OBJ_ID0, bi.poid_id0 BILLINFO_OBJ_ID0,
            debit_num,last_status_t, p.poid_id0 PAYINFO_OBJ_ID0, a.status ACCT_STATUS,
            tm.token token
        from payinfo_t p, payinfo_cc_t cc, billinfo_t bi, account_t a, token_md5 tm
    where p.poid_id0 = bi.payinfo_obj_id0
      and tm.md5 = cc.debit_num
    and bi.account_obj_id0 = a.poid_id0
    and a.status = 10103
    and a.last_status_t < d2u('01/01/2011')
    and p.poid_id0 = cc.obj_id0
    and bi.PENDING_RECV = 0
    and not exists (select 1 from account_t ac, payinfo_cc_t pcc, payinfo_t pi
                where pi.poid_id0 = pcc.obj_id0
                and  pi.account_obj_id0 = ac.poid_id0
                and (ac.status != 10103
                or  ac.last_status_t > d2u('01/01/2011'))
                and pcc.debit_num = cc.debit_num)
    and not exists (select 1 from event_billing_charge_cc_t charge
                where charge.obj_id0 > date_to_low_poid(sysdate - 5)
                and charge.debit_num = cc.debit_num);

BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');


    FOR account_rec in list_account_cur
    LOOP
     md5 := account_rec.debit_num;
     --DBMS_OUTPUT.PUT_LINE('**********************************');
     --DBMS_OUTPUT.PUT_LINE('Processing debit_num: ' || md5);
     account_poid := account_rec.ACCOUNT_OBJ_ID0;
     billinfo_poid := account_rec.BILLINFO_OBJ_ID0;
     payinfo_poid := account_rec.PAYINFO_OBJ_ID0;
     clear_token := account_rec.token;

        insert into cc_del_t (account_obj_id0, billinfo_obj_id0, debit_num, payinfo_obj_id0, mod_t, passwd_clear)
        values (account_poid, billinfo_poid, md5, payinfo_poid, date_to_infranet(sysdate), clear_token);

        commit;

   END LOOP; -- for each md5.

DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending procedure ' || sysdate);

END;

/
--------------------------------------------------------
--  DDL for Procedure CC_DEL1_19NOV
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CC_DEL1_19NOV" IS
--
--
-- ---------   ------  -------------------------------------------
    md5 payinfo_cc_t.debit_num%TYPE;
    address payinfo_cc_t.address%TYPE;
    city payinfo_cc_t.city%TYPE;
    country payinfo_cc_t.country%TYPE;
    name payinfo_cc_t.name%TYPE;
    state payinfo_cc_t.state%TYPE;
    zip payinfo_cc_t.zip%TYPE;
    account_poid INTEGER;
    billinfo_poid INTEGER;
    payinfo_poid INTEGER;
    clear_token cc_del_t.passwd_clear%TYPE;
    rows_cnt INTEGER;

    CURSOR list_account_cur IS
        select a.poid_id0 ACCOUNT_OBJ_ID0, bi.poid_id0 BILLINFO_OBJ_ID0,
            debit_num,last_status_t, p.poid_id0 PAYINFO_OBJ_ID0, a.status ACCT_STATUS,
            tm.token token, cc.address address, cc.city city,
            cc.country country, cc.name name, cc.state state, cc.zip zip
        from payinfo_t p, payinfo_cc_t cc, billinfo_t bi, account_t a, token_bin_t tm
    where p.poid_id0 = bi.payinfo_obj_id0
      and tm.md5 = cc.debit_num
    and bi.account_obj_id0 = a.poid_id0
    and a.status = 10103
    and a.last_status_t < d2u('05/01/2012')
    and p.poid_id0 = cc.obj_id0
    and bi.PENDING_RECV = 0
    and not exists (select 1 from account_t ac, payinfo_cc_t pcc, payinfo_t pi
                where pi.poid_id0 = pcc.obj_id0
                and  pi.account_obj_id0 = ac.poid_id0
                and (ac.status != 10103
                or  ac.last_status_t > d2u('05/01/2012'))
                and pcc.debit_num = cc.debit_num)
    and not exists (select 1 from event_billing_charge_cc_t charge
                where charge.obj_id0 > date_to_low_poid(sysdate - 5)
                and charge.debit_num = cc.debit_num);

BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');
   rows_cnt := 0;


    FOR account_rec in list_account_cur
    LOOP
     md5 := account_rec.debit_num;
     --DBMS_OUTPUT.PUT_LINE('**********************************');
     --DBMS_OUTPUT.PUT_LINE('Processing debit_num: ' || md5);
     account_poid := account_rec.ACCOUNT_OBJ_ID0;
     billinfo_poid := account_rec.BILLINFO_OBJ_ID0;
     payinfo_poid := account_rec.PAYINFO_OBJ_ID0;
     clear_token := account_rec.token;
     address := account_rec.address;
     city := account_rec.city;
     country := account_rec.country;
     name := account_rec.name;
     state := account_rec.state;
     zip := account_rec.zip;


        insert into cc_del_t (poid_db,account_obj_id0, billinfo_obj_id0, debit_num, payinfo_obj_id0, mod_t, passwd_clear, address, city, country, name, state,
 zip)
        values (102,account_poid, billinfo_poid, md5, payinfo_poid, date_to_infranet(sysdate), clear_token, address, city, country, name, state, zip);

        rows_cnt := rows_cnt + 1;

        if rows_cnt = 10000 then
            commit;
            rows_cnt := 0;
        end if;

   END LOOP; -- for each md5.
   commit;

DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending procedure ' || sysdate);

END;

/
--------------------------------------------------------
--  DDL for Procedure CC_DEL1_25AUG
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CC_DEL1_25AUG" IS
--
--
-- ---------   ------  -------------------------------------------
    md5 payinfo_cc_t.debit_num%TYPE;
    address payinfo_cc_t.address%TYPE;
    city payinfo_cc_t.city%TYPE;
    country payinfo_cc_t.country%TYPE;
    name payinfo_cc_t.name%TYPE;
    state payinfo_cc_t.state%TYPE;
    zip payinfo_cc_t.zip%TYPE;
    account_poid INTEGER;
    billinfo_poid INTEGER;
    payinfo_poid INTEGER;
    clear_token cc_del_t.passwd_clear%TYPE;
    rows_cnt INTEGER;

    CURSOR list_account_cur IS
        select a.poid_id0 ACCOUNT_OBJ_ID0, bi.poid_id0 BILLINFO_OBJ_ID0,
            debit_num,last_status_t, p.poid_id0 PAYINFO_OBJ_ID0, a.status ACCT_STATUS,
            --tm.token token,
            cc.address address, cc.city city,
            cc.country country, cc.name name, cc.state state, cc.zip zip
        from payinfo_t p, payinfo_cc_t cc, billinfo_t bi, account_t a--, token_bin_t tm
    where p.poid_id0 = bi.payinfo_obj_id0
      --and tm.md5 = cc.debit_num
    and bi.account_obj_id0 = a.poid_id0
    and a.status = 10103
    and a.last_status_t < (select d2u('02/25/2014') from dual)
    and p.poid_id0 = cc.obj_id0
    and bi.PENDING_RECV = 0
    and not exists (select 1 from account_t ac, payinfo_cc_t pcc, payinfo_t pi
                where pi.poid_id0 = pcc.obj_id0
                and  pi.account_obj_id0 = ac.poid_id0
                and (ac.status != 10103
                or  ac.last_status_t > (select d2u('02/25/2014') from dual))
                and pcc.debit_num = cc.debit_num)
    and not exists (select 1 from event_billing_charge_cc_t charge
                where charge.obj_id0 > date_to_low_poid(sysdate - 5)
                and charge.debit_num = cc.debit_num);

BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');
   rows_cnt := 0;


    FOR account_rec in list_account_cur
    LOOP
     md5 := account_rec.debit_num;
     --DBMS_OUTPUT.PUT_LINE('**********************************');
     --DBMS_OUTPUT.PUT_LINE('Processing debit_num: ' || md5);
     account_poid := account_rec.ACCOUNT_OBJ_ID0;
     billinfo_poid := account_rec.BILLINFO_OBJ_ID0;
     payinfo_poid := account_rec.PAYINFO_OBJ_ID0;
     --clear_token := account_rec.token;
     address := account_rec.address;
     city := account_rec.city;
     country := account_rec.country;
     name := account_rec.name;
     state := account_rec.state;
     zip := account_rec.zip;


        --insert into cc_del_t (poid_db,account_obj_id0, billinfo_obj_id0, debit_num, payinfo_obj_id0, mod_t, passwd_clear, address, city, country, name, state, zip)
        --values (102,account_poid, billinfo_poid, md5, payinfo_poid, date_to_infranet(sysdate), clear_token, address, city, country, name, state, zip);
        insert into cc_del_t (poid_db,account_obj_id0, billinfo_obj_id0, debit_num, payinfo_obj_id0, mod_t, address, city, country, name, state, zip)
        values (102,account_poid, billinfo_poid, md5, payinfo_poid, date_to_infranet(sysdate), address, city, country, name, state, zip);


        rows_cnt := rows_cnt + 1;

        if rows_cnt = 10000 then
            commit;
            rows_cnt := 0;
        end if;

   END LOOP; -- for each md5.
   commit;

DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending procedure ' || sysdate);

END;

/
--------------------------------------------------------
--  DDL for Procedure CHECK_FOR_TRANSFER_EVENT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CHECK_FOR_TRANSFER_EVENT" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
69a 34f
8IrAIuBIqgEtFHtKKItmzfVw7YMwg/DDBUgFfHRVCnOUz22yMN4lxr5iDoXSUdf3dKOfLUk4
2QlWVPeO3nxwqiSD12O8GqT3pt9CWreAB5f6Wlny5lT5o2KqmAfN/82/mnhyKAqQunOTeTM3
u1zcyBMmVsfJM5Vsgq7erpxtiAl3suWRm2B3P9kty+qsXXFQMihnVA0lmYk8yIKrTDhEk8vm
C4Tnd/S/83C719psJ9tn9C+i7vi4S5cmFVzxN+CnOMD1LHtArsR89BAo9Ec4xXnYDC4m/U0h
7BJQb461iPgII2VYcca8u/rxnoTKsC+pimUjfo3vTOb/XjDXW3ET0D+L9AfuUK1b5mlEd4qR
djnYabqc/Y1TWZRvCWWZaW8f/5IZc3aTNWiELyHjRcGYa0gC3Ozcrk0TBYdyqAQnZ9YN/3Od
kx582SY89mnioAx8pHJCy4QYKTz01Son3tNdiZwVVYKPButStRGH3Uyfda0iMMll2eCmqkBP
jSLeTXPU6CUOnUm4x1uMCiwexsbM559KO1/UWk3hkIVOWaE4jbPis0xQHRx5Wqez6dJN+d96
ebEkVfm76548cksZVsSYVSe+LEzcA8PgBJ3LsewJKTGVuwhCjBkwaT72qSgKCZEM963ewsBr
bVL2RNazXMeufwzEfO1nXL95Qv7oZKuXnuRPiaH2QMkbmgxCefQf7EPz0rkV50XVUJtw17XZ
i59DpDXq+lh/rdY66ov0S31WvUwaWuLMD2end2YOUoBtOMOWG7r+b9AOM8uV7NSWRPZ5h0qb
RBykc2L5Fc7IXoLq0NP4gbdujOSX8hr/IQgHquN+nFA=

/
--------------------------------------------------------
--  DDL for Procedure CONDELETEINVOICE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CONDELETEINVOICE" 
(InputInvoiceNo IN VARCHAR)

IS

BEGIN

    DBMS_OUTPUT.PUT_LINE('InvoiceNo: ' || InputInvoiceNo);

    DELETE FROM HNS_ADJUSTMENTS WHERE INVOICE_NUMBER = InputInvoiceNo;
    DELETE FROM HNS_ACCOUNT_CHARGES WHERE INVOICE_NUMBER = InputInvoiceNo;
    DELETE FROM HNS_SITE_DETAIL WHERE INVOICE_NUMBER = InputInvoiceNo;
    DELETE FROM HNS_SITE_DETAIL_CHARGES WHERE INVOICE_NUMBER = InputInvoiceNo;
    DELETE FROM HNS_SITE_DETAIL_TAXES WHERE INVOICE_NUMBER = InputInvoiceNo;
    DELETE FROM HNS_INVOICE_ERRORS WHERE INVOICE_NUMBER = InputInvoiceNo;
    DELETE FROM HNS_TNM_CHARGE_DETAILS WHERE INVOICE_NUMBER = InputInvoiceNo;
    DELETE FROM HNS_TNM_CHARGE WHERE INVOICE_NUMBER = InputInvoiceNo;
    DELETE FROM HNS_TNM_SITE_DETAILS WHERE INVOICE_NUMBER = InputInvoiceNo;
    DELETE FROM HNS_SPONSORED_CHARGES WHERE INVOICE_NUMBER = InputInvoiceNo;
    DELETE FROM HNS_INVOICE_SPECIAL_MESSAGE WHERE INVOICE_NUMBER = InputInvoiceNo;
    DELETE FROM HNS_INVOICES WHERE INVOICE_NUMBER = InputInvoiceNo;

    commit;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'No Data found - '||SQLCODE||' -ERROR- '||SQLERRM);
    WHEN OTHERS THEN
        raise_application_error(-20002,'Unknown Error - '||SQLCODE||' -ERROR- '||SQLERRM);

END ConDeleteInvoice;

/
--------------------------------------------------------
--  DDL for Procedure CONDELETELISTINVOICE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CONDELETELISTINVOICE" 

IS

BEGIN

    DELETE FROM HNS_ADJUSTMENTS WHERE INVOICE_NUMBER IN (SELECT INVOICE_NUMBER FROM HNS_INVOICE_CLEAN_T);
    DELETE FROM HNS_ACCOUNT_CHARGES WHERE INVOICE_NUMBER IN (SELECT INVOICE_NUMBER FROM HNS_INVOICE_CLEAN_T);
    DELETE FROM HNS_SITE_DETAIL WHERE INVOICE_NUMBER IN (SELECT INVOICE_NUMBER FROM HNS_INVOICE_CLEAN_T);
    DELETE FROM HNS_SITE_DETAIL_CHARGES WHERE INVOICE_NUMBER IN (SELECT INVOICE_NUMBER FROM HNS_INVOICE_CLEAN_T);
    DELETE FROM HNS_SITE_DETAIL_TAXES WHERE INVOICE_NUMBER IN (SELECT INVOICE_NUMBER FROM HNS_INVOICE_CLEAN_T);
    DELETE FROM HNS_INVOICE_ERRORS WHERE INVOICE_NUMBER IN (SELECT INVOICE_NUMBER FROM HNS_INVOICE_CLEAN_T);
    DELETE FROM HNS_TNM_CHARGE_DETAILS WHERE INVOICE_NUMBER IN (SELECT INVOICE_NUMBER FROM HNS_INVOICE_CLEAN_T);
    DELETE FROM HNS_TNM_CHARGE WHERE INVOICE_NUMBER IN (SELECT INVOICE_NUMBER FROM HNS_INVOICE_CLEAN_T);
    DELETE FROM HNS_TNM_SITE_DETAILS WHERE INVOICE_NUMBER IN (SELECT INVOICE_NUMBER FROM HNS_INVOICE_CLEAN_T);
    DELETE FROM HNS_SPONSORED_CHARGES WHERE INVOICE_NUMBER IN (SELECT INVOICE_NUMBER FROM HNS_INVOICE_CLEAN_T);
    DELETE FROM HNS_INVOICE_SPECIAL_MESSAGE WHERE INVOICE_NUMBER IN (SELECT INVOICE_NUMBER FROM HNS_INVOICE_CLEAN_T);
    DELETE FROM HNS_INVOICES WHERE INVOICE_NUMBER IN (SELECT INVOICE_NUMBER FROM HNS_INVOICE_CLEAN_T);

    DELETE FROM HNS_INVOICE_CLEAN_T;

    commit;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'No Data found - '||SQLCODE||' -ERROR- '||SQLERRM);
    WHEN OTHERS THEN
        raise_application_error(-20002,'Unknown Error - '||SQLCODE||' -ERROR- '||SQLERRM);

END ConDeleteListInvoice;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_ATA_SWAP_REQ
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CREATE_ATA_SWAP_REQ" (
          ACC_NO IN VARCHAR2,MAC IN VARCHAR2, RETVAL OUT VARCHAR2)
IS
BEGIN
    --Make the Insert
    INSERT INTO HNS_VOIP_REQUEST_T(WORKORDERNO, CREATED_T,MODIFIED_T,SAN,WORKORDERTYPE,SECURITYLABEL, STATUS,SOURCE,NUM_ATTEMPTS, MACADDRESS )
    VALUES(HNS_VOIP_REQUEST_ID.nextval, DATE_TO_INFRANET(sysdate) , DATE_TO_INFRANET(sysdate), ACC_NO, 'ATA', 'SECURITY', 'P', 'CRM', 0, MAC);
    --COMMIT;
    DBMS_OUTPUT.PUT_LINE('Successfully Executed');
    RETVAL := '0';
  EXCEPTION
      WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('Failure While Execution');
       RETVAL := SUBSTR(SQLERRM, 1, 200);
END CREATE_ATA_SWAP_REQ;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_A_VIEW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CREATE_A_VIEW" (
	tname IN VARCHAR2,
	p_schema IN VARCHAR2
)
AS
	cursor subquery_cur is
	SELECT column_name, table_name
	FROM user_tab_columns@md_primary
	WHERE table_name = UPPER(tname);

	t_name subquery_cur%ROWTYPE;
	cid int;
	view_count int;
	table_count int;
	snapshot_count int;
	curr_db_no varchar2(10);
	select_string varchar2(2048);
	col_str varchar2(1024);
	col_name varchar2(1024);
	view_column varchar2(1024);

BEGIN
        select TO_CHAR(POID_DB) into curr_db_no
	from account_t where poid_id0 = 1;



        select count(table_name) into snapshot_count
	from user_snapshots where table_name = UPPER(tname);
	if snapshot_count > 0 then
		cid := DBMS_SQL.OPEN_CURSOR;
                DBMS_SQL.PARSE (cid,
                        'DROP snapshot ' || tname,
                        dbms_sql.native);
                DBMS_SQL.CLOSE_CURSOR(cid);
        end if;

        select count(table_name) into table_count
	from user_tables where table_name = UPPER(tname);
	if table_count > 0 then
		cid := DBMS_SQL.OPEN_CURSOR;
                DBMS_SQL.PARSE (cid,
                        'DROP table ' || tname,
                        dbms_sql.native);
                DBMS_SQL.CLOSE_CURSOR(cid);
        end if;

	select count(view_name) into view_count
	from user_views where view_name = UPPER(tname);
        if view_count > 0 then
		cid := DBMS_SQL.OPEN_CURSOR;
                DBMS_SQL.PARSE (cid,
                        'DROP view ' || tname,
                        dbms_sql.native);
                DBMS_SQL.CLOSE_CURSOR(cid);
	end if;

	select_string := 'SELECT ';
	col_str := '';
	FOR t_name IN subquery_cur
	LOOP
		select_string := select_string || col_str ;
		col_name := t_name.column_name ;
		view_column := t_name.column_name ;

		if t_name.table_name like 'UNIQUENESS%' then
			view_column := t_name.column_name ; 	    --No fixup for UNIQUENESS
		else if col_name = 'ACCOUNT_OBJ_DB' then
			view_column := '( CASE ACCOUNT_OBJ_ID0 ' ||
			 	' WHEN 1 THEN ' || curr_db_no ||     --Fixup for root account
				' ELSE ACCOUNT_OBJ_DB ' ||	     --No fixup for non root acct
				' END ) ' ||
				' AS ' || t_name.column_name;
		else if col_name = 'REMIT_ACCOUNT_OBJ_DB' then
			view_column := '( CASE REMIT_ACCOUNT_OBJ_ID0 ' ||
			 	' WHEN 1 THEN ' || curr_db_no ||     --Fixup for root account
				' ELSE REMIT_ACCOUNT_OBJ_DB ' ||     --No fixup for non root acct
				' END ) ' ||
				' AS ' || t_name.column_name;
		else if col_name = 'POID_VAL_DB' and
			t_name.table_name = 'CONFIG_ACH_T' then
			view_column := t_name.column_name ;	    --no fixup ever
		else if (col_name like '%_DB' ) then
			view_column := 'CAST(( CASE ' || t_name.column_name ||
				' WHEN 0 THEN ' || t_name.column_name ||  --no fixup for null poid
				' ELSE ' || curr_db_no || 		  --fixup for non-null poid
				' END ) AS NUMBER(38))' ||
				' AS ' || t_name.column_name;
		end if;
		end if;
		end if;
		end if;
		end if;
		col_str := view_column || ',';
	END LOOP;

	select_string := select_string || view_column ||
                ' FROM ' || p_schema || '.' || tname ;

        cid := DBMS_SQL.OPEN_CURSOR;
        DBMS_SQL.PARSE (cid,
                'CREATE VIEW ' ||
		tname ||' AS ' ||
		select_string,
                dbms_sql.native);
        DBMS_SQL.CLOSE_CURSOR(cid);

END;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_BRT_WO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CREATE_BRT_WO" ( ACCNO IN VARCHAR2,
          WO_TYPE IN VARCHAR2,
          FNAME IN VARCHAR2,
          LNAME IN VARCHAR2,
          ADDR1 IN VARCHAR2,
          CITY IN VARCHAR2,
          STATE IN VARCHAR2,
          ZIP IN VARCHAR2,
          PHONE IN VARCHAR2,
          BILLING_DEAL IN VARCHAR2,
          GL_SEG IN VARCHAR2,
          RETVAL OUT VARCHAR2 )
IS

          PRAGMA AUTONOMOUS_TRANSACTION;
          CUST_EX EXCEPTION;
          BRT_PACKAGE VARCHAR2(64);
          PACKAGE_EXISTS NUMBER;
          ACCNAME VARCHAR2(90);
          UPD_T NUMBER;
--          IS_NEW_CUST NUMBER;
          IS_TAX_EXEMPT VARCHAR2(1);
          IS_ACTION_REQD NUMBER;
BEGIN

      ACCNAME := FNAME || ' ' || LNAME;
      BRT_PACKAGE := NULL;

      --Get Package from Billing deal
      SELECT DECODE(COUNT(*),1,1,0) INTO PACKAGE_EXISTS FROM HNS_VOIP_PACKAGE_MAPPING_T WHERE DEAL_NAME=BILLING_DEAL;

      IF PACKAGE_EXISTS=0 THEN
        RETVAL :='BILL-1: Billing Deal for A workorder is not a valid Billing Deal for BRT VOIP transaction';
        RAISE CUST_EX;
      ELSE
        SELECT PACKAGE_NAME INTO BRT_PACKAGE FROM HNS_VOIP_PACKAGE_MAPPING_T WHERE DEAL_NAME=BILLING_DEAL;
      END IF;

      SELECT COUNT(*) INTO IS_ACTION_REQD  FROM HNS_VOIP_ACTIVATION_STATUS_T WHERE SAN=ACCNO AND STATUS IN ('H','D');

      IF IS_ACTION_REQD=0 THEN

        --GET START TIME OF PROCEDURE FOR UPDATE PURPOSES
        SELECT D2I(SYSDATE) INTO UPD_T FROM PIN_VIRTUAL_TIME_T;

        --CHECK IF NEW OR EXISTING CUSTOMER
        --SELECT DECODE(COUNT(*),1,1,0) INTO IS_NEW_CUST FROM ACCOUNT_T WHERE ACCOUNT_NO = ACCNO;

        --CHECK IF TAX EXEMPT
        SELECT DECODE (COUNT(*),1,'Y','N') INTO IS_TAX_EXEMPT FROM HNS_VOIP_EXEMPT_GL_SEGMENTS_T WHERE GL_SEGMENT = GL_SEG;


        --MAKE HNS_VOIP_REQUEST_T UPDATE
        UPDATE HNS_VOIP_REQUEST_T SET STATUS = 'X' WHERE SAN = ACCNO AND WORKORDERTYPE = 'A' AND CREATED_T < UPD_T;

        --MAKE HNS_VOIP_REQUEST_T INSERT
        INSERT INTO HNS_VOIP_REQUEST_T(WORKORDERNO,CREATED_T,MODIFIED_T,SAN,WORKORDERTYPE,ACCOUNTNAME,FIRSTNAME,LASTNAME,ADDRESS1,
        CITY,STATE,ZIP,EFFECTIVEDATE,PHONENUMBER,PACKAGE,ACTIVATIONDATE,TAXEXEMPTIONFLAG,SECURITYLABEL,STATUS,SOURCE,NUM_ATTEMPTS )
        VALUES
        (HNS_VOIP_REQUEST_ID.NEXTVAL,D2I(sysdate),D2I(sysdate),ACCNO,'A',REPLACE(ACCNAME,',',' '),REPLACE(FNAME,',',' '),
        REPLACE(LNAME,',',' '),REPLACE(ADDR1,',',' '),CITY,STATE,ZIP,0,PHONE,BRT_PACKAGE,D2I(TRUNC(sysdate)),IS_TAX_EXEMPT,
        'SECURITY','P','DSS',0);


        --MAKE HNS_VOIP_ACTIVATION_STATUS_T UPDATE
        UPDATE HNS_VOIP_ACTIVATION_STATUS_T SET STATUS = 'X' WHERE SAN = ACCNO AND CREATED_T < UPD_T;

        --MAKE HNS_VOIP_REQUEST_T INSET
        INSERT INTO HNS_VOIP_ACTIVATION_STATUS_T (SAN, CREATED_T, MODIFIED_T,STATUS,NUM_ATTEMPTS,ORDER_TYPE) VALUES
        (ACCNO,D2I(SYSDATE),D2I(SYSDATE),'H',0,1);



      END IF;

      --COMMIT CHANGES
      COMMIT;

      DBMS_OUTPUT.PUT_LINE('Successfully Executed');
      RETVAL := '0';

  EXCEPTION
    
      WHEN CUST_EX THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Failure While Execution');
      WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Failure While Execution');
        RETVAL := SUBSTR(SQLERRM, 1, 200);
END CREATE_BRT_WO;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_DELINQ_MPL_CAP_TBL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CREATE_DELINQ_MPL_CAP_TBL" IS
--
--
-- ---------   ------  -------------------------------------------

    agency           HNS_DELINQUENCT_ACCT_TO_MCA_T.coll_agency%TYPE;
    acct_obj_id0     HNS_DELINQUENCT_ACCT_TO_MCA_T.account_obj_id0%TYPE;
    acct_no          HNS_DELINQUENCT_ACCT_TO_MCA_T.account_no%TYPE;
    tot_due          HNS_DELINQUENCT_ACCT_TO_MCA_T.total_due%TYPE;
    rows             INTEGER;

    CURSOR delin_recs IS
        select account_no, account_obj_id0, coll_agency from hns_delinquent_mpl_cap_accts_t;

BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');

   execute immediate 'TRUNCATE TABLE HNS_DELINQUENT_MPL_CAP_ACCTS_T';
   execute immediate 'TRUNCATE TABLE HNS_DELINQUENCT_ACCT_TO_MCA_T';

   INSERT INTO HNS_DELINQUENT_MPL_CAP_ACCTS_T (
        SELECT DISTINCT ACCOUNT_NO, ACCOUNT_OBJ_ID0, COLL_AGENCY FROM
        HNS_DELINQUENCY_T HD WHERE
        (HD.COLLECTION_STATE= 4 AND HD.AGENCY_EMAIL_STAT= 'F')
        OR HD.COLLECTION_STATE= 5);

   commit;

   INSERT INTO HNS_DELINQUENCT_ACCT_TO_MCA_T (
     select account_no, account_obj_id0,(select sum (due)
                        from item_t
                        where ar_billinfo_obj_id0 = (select poid_id0 from billinfo_t bi
                                  where bi.account_obj_id0 = hd.account_obj_id0
                                  and bill_info_id  = 'Account Billinfo'
                                  and rownum < 2)), coll_agency
    from HNS_DELINQUENT_MPL_CAP_ACCTS_T   hd);
     commit;


DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending procedure ' || sysdate);

END; -- Procedure CREATE_DELINQ_MPL_CAP_TBL

/
--------------------------------------------------------
--  DDL for Procedure CREATE_ITEM_SYNONYMN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CREATE_ITEM_SYNONYMN" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
114 117
kLc6TEgjXcv8xHw1T2MLxmN8/90wgyrQf5kVfC8CkPjVSB6KVsveTuX7x/ddUTKeZqR2ozWY
zrsueRK4uM80v9C/M+JAShzSML/+LQxyLR7rwdo0QCAkyJ5EYl5x06O2FC+Auq+7GFEVr6UU
dd+PRqMR2v10bYw9f4zU2gx/3bC4C8Z4mKUe860/OPSNRM0mIeETkY2nrbJ58AMExrfW9Ewl
8sMncZEu8bPSy2L8FsoLYqDMOsXB4Pamc5lK9uknbg9QJNaBSE4dgRYMEQ==

/
--------------------------------------------------------
--  DDL for Procedure CREATE_SME_BRT_WO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CREATE_SME_BRT_WO" ( 
	SAN IN VARCHAR2,
	CUST_LOC_ID  IN VARCHAR2,  
	WO_TYPE 		IN VARCHAR2,   --// ‘A’ Always
	ACCOUNT_NAME 			IN VARCHAR2,   --// First Name
	ADDR1 			IN VARCHAR2,   --// Address1
	ADDR2 			IN VARCHAR2,   --// Address2
	CITY 			IN VARCHAR2,   --// City
	STATE 			IN VARCHAR2,   --// State	
	ZIP 			IN VARCHAR2,   --// Zip
	POLYCOM_PRODUCT_CODE	IN VARCHAR2,   --// Product Code 
	DEVICE_TO_LINE	IN VARCHAR2,   --// Device to Line association 
	GL_SEG 			IN VARCHAR2,
  DEVICE_ID IN VARCHAR2,
  PRODUCT_CODE IN VARCHAR2,
	BILLING_DEAL 	IN VARCHAR2,   --// Deal name in Billing 	
	NUMBER_TO_BE_PORTED 			IN VARCHAR2,
	
  WO_NUMBER In NUMBER,
	RETVAL 	        OUT VARCHAR2 
	)
IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    CUST_EX EXCEPTION;
    BRT_PACKAGE VARCHAR2(64);
    PACKAGE_EXISTS NUMBER;
    UPD_T NUMBER;
    IS_ACTION_REQD NUMBER;
    IS_ACCT_ACTIVATION_PENDING NUMBER;
    LINE_ID VARCHAR2(10);
    BDOM NUMBER;

BEGIN

    BRT_PACKAGE := NULL;
    
	        select substr(SAN,instr(SAN,'_',1,1) + 1) into LINE_ID from dual;  
                 
		--Get Package from Billing deal
		SELECT DECODE(COUNT(*),1,1,0) INTO PACKAGE_EXISTS FROM HNS_SME_VOIP_PKG_MAPPING_T WHERE DEAL_NAME=BILLING_DEAL;

		IF PACKAGE_EXISTS=0 THEN
			RETVAL :='BILL-1: Billing Deal for A workorder is not a valid Billing Deal for BRT SME VOIP transaction';
			RAISE CUST_EX;
		ELSE
    		SELECT PACKAGE_NAME,LINE_ID INTO BRT_PACKAGE,LINE_ID FROM HNS_SME_VOIP_PKG_MAPPING_T WHERE DEAL_NAME=BILLING_DEAL;
		END IF;
		
		-- Check if line-level activation is pending/done.
		SELECT COUNT(*) INTO IS_ACTION_REQD  FROM HNS_SME_VOIP_ACTIVATION_STATUS_T WHERE SAN=SAN AND STATUS IN ('H','D') AND                 		LINE_ID=LINE_ID ;
	
		IF IS_ACTION_REQD=0 THEN
			
			--GET START TIME OF PRR UPDATE PURPOSES
			SELECT D2I(SYSDATE) INTO UPD_T FROM PIN_VIRTUAL_TIME_T;

			--GET BDOM OF ACCOUNT
			SELECT actg_cycle_dom INTO BDOM FROM BILLINFO_T WHERE ACCOUNT_OBJ_ID0 = A2P(SAN) AND BILL_INFO_ID = 'Account Billinfo';

			--MAKE HNS_SME_VOIP_REQUEST_T UPDATE
			UPDATE HNS_SME_VOIP_REQUEST_T SET STATUS = 'X' WHERE SAN = SAN AND WORKORDERTYPE = 'A' AND DEVICE_ID=DEVICE_ID AND CREATED_T < UPD_T;
	
			---SELECT HNS_SME_VOIP_REQUEST_ID.NEXTVAL INTO WO_SEQUENCE FROM DUAL;
			
			--MAKE HNS_SME_VOIP_REQUEST_T INSERT
			INSERT INTO HNS_SME_VOIP_REQUEST_T(WORKORDERNO,CREATED_T,MODIFIED_T,SAN,WORKORDERTYPE,ACCOUNTNAME,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,
			EFFECTIVEDATE,PHONENUMBER,PACKAGE,ACTIVATIONDATE,STATUS,SOURCE,NUM_ATTEMPTS,DEVICE_ID,
			PRODUCT_CODE)
			VALUES
			(WO_NUMBER,D2I(sysdate),D2I(sysdate),SAN,'A',REPLACE(ACCOUNT_NAME,',',' '),
			REPLACE(ADDR1,',',' '),REPLACE(ADDR2,',',' '),CITY,STATE,ZIP,BDOM,NUMBER_TO_BE_PORTED ,BRT_PACKAGE,D2I(TRUNC(sysdate)),'P','DSS',0, DEVICE_ID, PRODUCT_CODE);

			----MAKE POLYCOM DEVICE INSERT
			IF(DEVICE_TO_LINE != null) THEN
INSERT INTO HNS_SME_VOIP_REQUEST_T(WORKORDERNO,CREATED_T,MODIFIED_T,SAN,WORKORDERTYPE,ACCOUNTNAME,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,
			EFFECTIVEDATE,ACTIVATIONDATE,STATUS,SOURCE,NUM_ATTEMPTS,DEVICE_ID,
			PRODUCT_CODE,DEVICE_TO_LINE)
			VALUES
			(WO_NUMBER,D2I(sysdate),D2I(sysdate),SAN,'A',REPLACE(ACCOUNT_NAME,',',' '),
			REPLACE(ADDR1,',',' '),REPLACE(ADDR2,',',' '),CITY,STATE,ZIP,BDOM,D2I(TRUNC(sysdate)),'P','DSS',0, SAN, POLYCOM_PRODUCT_CODE,DEVICE_TO_LINE);

			END IF;

			--MAKE HNS_SME_VOIP_ACTIVATION_STATUS_T UPDATE
			UPDATE HNS_SME_VOIP_ACTIVATION_STATUS_T SET STATUS = 'X' WHERE SAN = SAN AND LINE_ID=LINE_ID AND CREATED_T < UPD_T;

			--MAKE HNS_SME_VOIP_ACTIVATION_STATUS_T INSERT
			INSERT INTO HNS_SME_VOIP_ACTIVATION_STATUS_T (SAN, CREATED_T, MODIFIED_T,STATUS,NUM_ATTEMPTS,ORDER_TYPE,LINE_ID) VALUES
			(SAN,D2I(SYSDATE),D2I(SYSDATE),'H',0,1,LINE_ID);

			---Queue WO=TNC if Phone numbere is not null
		        if(NUMBER_TO_BE_PORTED != null) THEN
			      INSERT INTO HNS_SME_VOIP_REQUEST_T	(WORKORDERNO,CREATED_T,MODIFIED_T,SAN,WORKORDERTYPE,PHONENUMBER,STATUS,SOURCE,NUM_ATTEMPTS,DEVICE_ID )
			VALUES
			(HNS_SME_VOIP_REQUEST_ID.NEXTVAL,D2I(sysdate),D2I(sysdate),SAN,'TNC',NUMBER_TO_BE_PORTED,'Q','DSS',0, DEVICE_ID);
			END IF ; ---if(PHONE_NUMBER != null)

		END IF; --IF IS_ACTION_REQD=0

    
	--COMMIT CHANGES
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Successfully Executed');
    RETVAL := '0';

  EXCEPTION
      WHEN CUST_EX THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Failure While Execution: Invalid Billing Deal');
      WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Failure While Execution');
        RETVAL := SUBSTR(SQLERRM, 1, 200);
END CREATE_SME_BRT_WO;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_SME_BRT_WO_LATEST
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CREATE_SME_BRT_WO_LATEST" (createOrderData IN VARCHAR2, RETVAL OUT VARCHAR2) IS
	co_obj        		JSON_OBJECT_T;

	ACCOUNT_NO 				 VARCHAR2(50);
	CUST_LOC_ID  		 VARCHAR2(50);  
	WO_TYPE 			 VARCHAR2(50);   --// ‘A’ Always
  WO_NUMBER 			VARCHAR2(50);
	ACCOUNT_NAME 		 VARCHAR2(50);   --// First Name
	GL_SEG 				 VARCHAR2(50);

	install_address_obj	JSON_OBJECT_T;
	ADDR1 			 	VARCHAR2(50);   --// Address1
	ADDR2 			 	VARCHAR2(50);   --// Address2
	CITY 			 	VARCHAR2(50);   --// City
	STATE 			 	VARCHAR2(50);   --// State	
	ZIP 			 	VARCHAR2(50);   --// Zip

	device_detail_obj 		 JSON_OBJECT_T;
	deviceToLine_arr         JSON_ARRAY_T;
	POLYCOM_PRODUCT_CODE	 VARCHAR2(50);   --// Product Code 
	DEVICE_TO_LINE	 		 VARCHAR2(250);   --// Device to Line association 
	
	vp_arr        			JSON_ARRAY_T;
	vp_obj        			JSON_OBJECT_T;
	BILLING_DEAL 	 		VARCHAR2(150);   --// Deal name in Billing 	
	PRODUCT_CODE 	 		VARCHAR2(150);
	NUMBER_TO_BE_PORTED 	VARCHAR2(50);
  
	
	BDOM 				NUMBER;
	BRT_PACKAGE 		VARCHAR2(64);
    PACKAGE_EXISTS 		NUMBER;
	LINE_ID_VAL 		NUMBER;
	IS_ACTION_REQD 		NUMBER;
	UPD_T 				NUMBER;
	Device_ID_VAL             VARCHAR2(64);
  DEVICE_ID_LINE VARCHAR2(64);
	CUST_EX 			EXCEPTION;
 
BEGIN
  co_obj := JSON_OBJECT_T.parse(createOrderData);
  
  ACCOUNT_NO := co_obj.get_String('SAN');
  CUST_LOC_ID := co_obj.get_String('customerLocationId');
  WO_TYPE := co_obj.get_String('workorderType');
  WO_NUMBER := co_obj.get_String('workorderNumber');
  ACCOUNT_NAME := co_obj.get_String('accountName');
  GL_SEG := co_obj.get_String('glSegment');
  
  install_address_obj := JSON_OBJECT_T(co_obj.get('installAddress'));
  ADDR1 := install_address_obj.get_String('address1');
  ADDR2 := install_address_obj.get_String('address2');
  CITY := install_address_obj.get_String('city');
  STATE := install_address_obj.get_String('state');
  ZIP := install_address_obj.get_String('zip');
  
  device_detail_obj := JSON_OBJECT_T(co_obj.get('deviceDetail'));
  POLYCOM_PRODUCT_CODE := device_detail_obj.get_String('productCode');
  deviceToLine_arr := device_detail_obj.get_Array('deviceToLine');
  FOR i IN 0 .. deviceToLine_arr.get_size - 1 LOOP
    IF i=0 THEN 
      DEVICE_TO_LINE := deviceToLine_arr.get(i).stringify;
    ELSE
      DEVICE_TO_LINE := DEVICE_TO_LINE  || '|' ||  deviceToLine_arr.get(i).stringify;
    END IF;
  END LOOP;
  

	----Get the new Workorder Number to queue all WO='A'
	----SELECT HNS_SME_VOIP_REQUEST_ID.NEXTVAL INTO WO_NUMBER FROM DUAL;
	
	--GET BDOM OF ACCOUNT
	SELECT actg_cycle_dom INTO BDOM FROM BILLINFO_T WHERE ACCOUNT_OBJ_ID0 = A2P(ACCOUNT_NO) AND BILL_INFO_ID = 'Account Billinfo';

	----MAKE POLYCOM DEVICE INSERT
	INSERT INTO HNS_SME_VOIP_REQUEST_T(WORKORDERNO,CREATED_T,MODIFIED_T,SAN,WORKORDERTYPE,ACCOUNTNAME,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,
	EFFECTIVEDATE,ACTIVATIONDATE,STATUS,SOURCE,NUM_ATTEMPTS,DEVICE_ID,
	PRODUCT_CODE,DEVICE_TO_LINE)
	VALUES
	(WO_NUMBER,D2I(sysdate),D2I(sysdate),ACCOUNT_NO,'A',REPLACE(ACCOUNT_NAME,',',' '),
	REPLACE(ADDR1,',',' '),REPLACE(ADDR2,',',' '),CITY,STATE,ZIP,BDOM,D2I(TRUNC(sysdate)),'P','DSS',0, ACCOUNT_NO, POLYCOM_PRODUCT_CODE,REPLACE(DEVICE_TO_LINE,'"',''));
	
	--GET START TIME OF PROCEDURE FOR UPDATE PURPOSES
	SELECT D2I(SYSDATE) INTO UPD_T FROM PIN_VIRTUAL_TIME_T;

	
	vp_arr := co_obj.get_Array('voipDetail');
	FOR i IN 0 .. vp_arr.get_size - 1 LOOP
		IS_ACTION_REQD := 0;
		vp_obj := JSON_OBJECT_T(vp_arr.get(i));
		Device_ID_VAL := vp_obj.get_String('deviceID');
		PRODUCT_CODE := vp_obj.get_String('productCode');
		BILLING_DEAL := vp_obj.get_String('billingDealName');
		NUMBER_TO_BE_PORTED := vp_obj.get_String('numberToBePorted');
    
    --Get the line_ID from device_ID
    Device_ID_LINE := Device_ID_VAL;              
		select substr(DEVICE_ID_LINE,instr(DEVICE_ID_LINE,'_',1,1) + 1) into LINE_ID_VAL from dual;  
   
		--Get Package from Billing deal
		SELECT DECODE(COUNT(*),1,1,0) INTO PACKAGE_EXISTS FROM HNS_SME_VOIP_PKG_MAPPING_T WHERE DEAL_NAME=BILLING_DEAL and LINE_ID=LINE_ID_VAL;

		IF PACKAGE_EXISTS=0 THEN
			RETVAL :='BILL-1: ' || BILLING_DEAL || ': Invalid Billing Deal';
			RAISE CUST_EX;
		ELSE
			SELECT PACKAGE_NAME INTO BRT_PACKAGE FROM HNS_SME_VOIP_PKG_MAPPING_T WHERE DEAL_NAME=BILLING_DEAL;
		END IF;
		
		-- Check if line-level activation is pending/done.
		SELECT count(*) INTO IS_ACTION_REQD  FROM HNS_SME_VOIP_ACTIVATION_STATUS_T WHERE SAN = ACCOUNT_NO AND STATUS IN ('H','D') AND LINE_ID=LINE_ID_VAL ;

		IF IS_ACTION_REQD=0 THEN
		
			--MAKE HNS_SME_VOIP_REQUEST_T UPDATE
			UPDATE HNS_SME_VOIP_REQUEST_T SET STATUS = 'X' WHERE SAN = ACCOUNT_NO AND WORKORDERTYPE = 'A' AND DEVICE_ID=Device_ID_VAL AND CREATED_T < UPD_T;
				
			--MAKE HNS_SME_VOIP_REQUEST_T INSERT
			INSERT INTO HNS_SME_VOIP_REQUEST_T(WORKORDERNO,CREATED_T,MODIFIED_T,SAN,WORKORDERTYPE,ACCOUNTNAME,ADDRESS1,ADDRESS2,CITY,STATE,ZIP,
			EFFECTIVEDATE,PHONENUMBER,PACKAGE,ACTIVATIONDATE,STATUS,SOURCE,NUM_ATTEMPTS,DEVICE_ID,
			PRODUCT_CODE)
			VALUES
			(WO_NUMBER,D2I(sysdate),D2I(sysdate),ACCOUNT_NO,'A',REPLACE(ACCOUNT_NAME,',',' '),
			REPLACE(ADDR1,',',' '),REPLACE(ADDR2,',',' '),CITY,STATE,ZIP,BDOM,NUMBER_TO_BE_PORTED ,BRT_PACKAGE,D2I(TRUNC(sysdate)),'P','DSS',0, Device_ID_VAL, PRODUCT_CODE);

			--MAKE HNS_SME_VOIP_ACTIVATION_STATUS_T UPDATE
			UPDATE HNS_SME_VOIP_ACTIVATION_STATUS_T SET STATUS = 'X' WHERE SAN = ACCOUNT_NO AND LINE_ID=LINE_ID_VAL AND CREATED_T < UPD_T;

			--MAKE HNS_SME_VOIP_ACTIVATION_STATUS_T INSERT
			INSERT INTO HNS_SME_VOIP_ACTIVATION_STATUS_T (SAN, CREATED_T, MODIFIED_T,STATUS,NUM_ATTEMPTS,ORDER_TYPE,LINE_ID) VALUES
			(ACCOUNT_NO,D2I(SYSDATE),D2I(SYSDATE),'H',0,1,LINE_ID_VAL);

			---Queue WO=TNC if Phone number is not null
		     if (NUMBER_TO_BE_PORTED is not  null) THEN
			      INSERT INTO HNS_SME_VOIP_REQUEST_T(WORKORDERNO,CREATED_T,MODIFIED_T,SAN,WORKORDERTYPE,PHONENUMBER,STATUS,SOURCE,NUM_ATTEMPTS,DEVICE_ID )
				  VALUES
				('B-' || HNS_SME_VOIP_REQUEST_ID.NEXTVAL,D2I(sysdate),D2I(sysdate),ACCOUNT_NO,'TNC',NUMBER_TO_BE_PORTED,'Q','DSS',0, Device_ID_VAL);
			END IF ; ---if(NUMBER_TO_BE_PORTED != null)

		END IF; --IF IS_ACTION_REQD=0

	END LOOP;
	  

COMMIT;

    DBMS_OUTPUT.PUT_LINE('Successfully Executed');
    RETVAL := '0';
    ---RETVAL := TRUE;

  EXCEPTION
      WHEN CUST_EX THEN
        ROLLBACK;
        --RETVAL := FALSE;
        DBMS_OUTPUT.PUT_LINE('Failure While Execution: Invalid Billing Deal');
      WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Failure While Execution');
        RETVAL := SUBSTR(SQLERRM, 1, 200);
        --RETVAL := FALSE;
END;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_TABLES_FOR_GL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CREATE_TABLES_FOR_GL" IS
--
--
-- ---------   ------  -------------------------------------------

    t_sql_text varchar2(4000);

    --1. Insert last 130 days worth of items
    --2. Insert any other items that are in journal_t but not in new item_t

    CURSOR journal_cur IS
        select distinct item_obj_id0 from item_journal_poids;



BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');


   /* truncate all temp tables */
   t_sql_text := 'truncate table item_t_gl';
   Execute Immediate t_sql_text;

   t_sql_text := 'truncate table journal_t_gl';
   Execute Immediate t_sql_text;

   t_sql_text := 'truncate table account_t_gl';
   Execute Immediate t_sql_text;

   t_sql_text := 'truncate table billinfo_t_gl';
   Execute Immediate t_sql_text;

   t_sql_text := 'truncate table annual_acct_objs';
   Execute Immediate t_sql_text;

   t_sql_text := 'truncate table item_journal_poids';
   Execute Immediate t_sql_text;

   t_sql_text := 'drop index I_HNS_JRNL_GL_ITEM_ID';
   begin
		Execute Immediate t_sql_text;
		exception when others then null;
	end;

   t_sql_text := 'drop index II_ITEM_POID';
   begin
		Execute Immediate t_sql_text;
		exception when others then null;
	end;

   Insert /*+ append */ into annual_acct_objs
   select distinct account_obj_id0 from purchased_product_t pp
                                where product_obj_id0 in (select product_obj_id0 from rate_plan_t where event_type like '%annual%')
                                and (cycle_end_t = 0 or cycle_end_t >= (select d2i(sysdate-400) from dual));
   commit;


   Insert /*+ append */ into journal_t_gl
        Select /*+ parallel (journal_t,6) */ * from journal_t
              where (created_t >= (select d2i(add_months(sysdate,-3)) from dual)
              and resource_id=840)
              or account_obj_id0 in (select account_obj_id0 from annual_acct_objs);
    commit;

   t_sql_text := 'CREATE INDEX I_HNS_JRNL_GL_ITEM_ID ON JOURNAL_T_GL
    (ITEM_OBJ_ID0)';
    Execute Immediate t_sql_text;

   Insert /*+ append */ into item_t_gl
       select /*+ parallel (item_t,4) */ * from item_t
        where created_t >= (select d2i(add_months(sysdate,-3)) from dual);
   commit;

   t_sql_text := 'CREATE INDEX II_ITEM_POID ON ITEM_T_GL
    (POID_ID0)';
    Execute Immediate t_sql_text;

    Insert /*+ append */ into item_journal_poids
       select item_obj_id0 from journal_t_gl j
        where not exists (select 1 from item_t_gl i
                          where j.item_obj_id0 = i.poid_id0);
   commit;


   FOR journal_rec in journal_cur
   LOOP
        INSERT INTO item_t_gl
            select * from item_t where poid_id0 = journal_rec.item_obj_id0;
   END LOOP;

   commit;

   Insert /*+ append */ into billinfo_t_gl
       select /*+ parallel (billinfo_t,4) */ * from billinfo_t b
        where poid_id0 in (select ar_billinfo_obj_id0 from item_t_gl);
   commit;

   Insert /*+ append */ into account_t_gl
       select /*+ parallel (account_t,4) */ * from account_t a
        where poid_id0 in (select account_obj_id0 from billinfo_t_gl);
   commit;

   DBMS_OUTPUT.PUT_LINE('Ending procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');



END;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_TAX_PROCEDURES_REV
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CREATE_TAX_PROCEDURES_REV" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
9c db
Dd3UPyUt991ZVRcCDvP0PdMQd2Mwg+lK2Z7WfC+mEv/qitczBigwCQOOa1z6jNJhNlWEZ9P0
LYk/EO2Jy0cydcyyYvIKL+jb0YIB/ugqlfTBAAhg9A9p9qirNJ/tL7jKE5jor+yz7JvISEzQ
weZkekLEzihyuCFxM3/dJDbRf0Z1r1u0eNFtDGw2M9OjAg01ZYG31JptGwLQ/NJE8DV/9A==


/
--------------------------------------------------------
--  DDL for Procedure CREATE_USER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CREATE_USER" (
       i_user_name        IN VARCHAR2,
       i_delim_role_list  IN VARCHAR2)
IS
   l_user_id app_user.user_id%TYPE;
BEGIN
DBMS_OUTPUT.PUT_LINE('Username');
DBMS_OUTPUT.PUT_LINE(i_user_name);
DBMS_OUTPUT.PUT_LINE('i_delim_role_list');
DBMS_OUTPUT.PUT_LINE(i_delim_role_list);
END;				 
				

/
--------------------------------------------------------
--  DDL for Procedure CREATE_VIEWS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."CREATE_VIEWS" (
parent_schema IN VARCHAR2
) AS
	cursor global_table_name_cur is
	SELECT distinct table_name FROM md_static_objects_t@md_primary;

	global_table_name global_table_name_cur%ROWTYPE;
	tname varchar2(64);
BEGIN
	dbms_output.enable();

	FOR global_table_name in global_table_name_cur
	LOOP
		tname := global_table_name.table_name;
		dbms_output.put_line('create view');
		dbms_output.put_line(tname);

		create_a_view(tname, parent_schema);
	END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure DD_ADJUST
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."DD_ADJUST" AS
    MAX_RESERVED_PORTAL_OBJ_ID CONSTANT PLS_INTEGER := 100000;
    v_this_release_max_obj_id PLS_INTEGER;
    v_next_obj_id0 PLS_INTEGER ;
    v_errmsg VARCHAR2(200);
    v_dummy CHAR(1);

    C_STEP_NAME upg_log_t.step_name%TYPE := 'dd_adjust';
BEGIN

     	/*
      	 * This program can be run only after completing pin_upg_obj.sql
       	 */

     	IF (NOT pin_upg_common.step_completed ('pin_upg_obj::populate_table')) THEN
             pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'E',
                                'This program cannot be started before completing pin_upg_obj.sql', null);
             RETURN;
     	END IF;

        pin_upg_common.delete_info (C_STEP_NAME);

        pin_upg_common.log_info (C_STEP_NAME, NULL, NULL, 'I',
                                 'Starting dd_adjust.',
                                 NULL);

    	/*
     	 * Object id values 1 .. 100000 (MAX_RESERVED_PORTAL_OBJ_ID)
     	 * are reserved for Portal use. If there are any customer
     	 * created objects in this forbidden range push them outside
     	 * the Portal range (above 100000)
     	 */

	BEGIN
        	/*
         	 * Portal objects have state 3,
         	 * customer created objects have state 1.
         	 */

        	/*
         	 * Here is the logic inside DECODE function
         	 * If the parent_element_id is 0, put 0
         	 * else add MAX_RESERVED_PORTAL_OBJ_ID to parent_element_id.
          	 */

        	UPDATE dd_objects_fields_t
		SET obj_id0 = obj_id0 + MAX_RESERVED_PORTAL_OBJ_ID,
            		parent_element_id = DECODE (parent_element_id, 0, 0, parent_element_id + MAX_RESERVED_PORTAL_OBJ_ID),
            		rec_id = DECODE (rec_id, 0, 0, rec_id + MAX_RESERVED_PORTAL_OBJ_ID)
		WHERE obj_id0 <= MAX_RESERVED_PORTAL_OBJ_ID
        	AND obj_id0 IN (SELECT obj_id0 FROM dd_objects_t WHERE state <> 3);

 		UPDATE dd_fields_t
                SET obj_id0 = obj_id0 + MAX_RESERVED_PORTAL_OBJ_ID,
            		rec_id = DECODE (rec_id, 0, 0, rec_id + MAX_RESERVED_PORTAL_OBJ_ID)
		WHERE obj_id0 <= MAX_RESERVED_PORTAL_OBJ_ID;

		UPDATE dd_objects_t
        	SET obj_id0 = obj_id0 + MAX_RESERVED_PORTAL_OBJ_ID
		WHERE obj_id0 <= MAX_RESERVED_PORTAL_OBJ_ID
        	AND STATE <> 3;

        	COMMIT;

	EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
                	pin_upg_common.log_info (C_STEP_NAME, NULL, NULL,
						'E', 'Unable to move custom objects outside Portal range.', sqlerrm);
			RETURN;
	END;

	/*
	 * Now delete the old portal objects from the dd.
	 * These will be repopulated by a subsequent script.
	 */

	BEGIN
		DELETE FROM dd_objects_fields_t
        	WHERE obj_id0 IN
        		(SELECT obj_id0
             		FROM dd_objects_t
             		WHERE name IN
             			(SELECT name FROM pin_upg_obj));

        	DELETE FROM dd_objects_t
        	WHERE name IN
             	(SELECT name FROM pin_upg_obj);

		COMMIT;
	EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
                	pin_upg_common.log_info (C_STEP_NAME,  NULL, NULL, 'E',
						'Unable to delete Portal data dictionary entries.', sqlerrm);
			RETURN;
	END;

    	/*
     	 * The previous delete did not address the obsolete objects.
     	 * We need to delete them too.
     	 */

	BEGIN
		DELETE FROM dd_objects_fields_t
        	WHERE obj_id0 IN
        		(SELECT obj_id0
            	 	FROM dd_objects_t
            	 	WHERE name IN (SELECT name from pin_obsolete_obj));

        	DELETE FROM dd_objects_t
        	WHERE name IN (SELECT name from pin_obsolete_obj);

		COMMIT;
	EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
                	pin_upg_common.log_info (C_STEP_NAME,  NULL, NULL, 'E',
						'Unable to delete obsolete Portal DD entries', sqlerrm);
			RETURN;
	END;

    	/*
     	 * This new release has more objects than the previous release.
     	 * So it is possible that some of the Portal objects from non core
     	 * modules, that is, optional modules (example ddebit, wireless etc)
     	 * are using the space needed for this release's core objects.
     	 * Push them up to create room for the objects for this release.
     	 */

	BEGIN
     		SELECT max(obj_id0)
     		INTO v_this_release_max_obj_id
     		FROM pin_upg_obj;

            	/*
             	 * add a safety margin of 128.
             	 */

            	v_this_release_max_obj_id := v_this_release_max_obj_id + 128;

        	UPDATE dd_objects_fields_t
		SET obj_id0 = obj_id0 + v_this_release_max_obj_id,
            		parent_element_id = DECODE (parent_element_id, 0, 0, parent_element_id + v_this_release_max_obj_id),
            		rec_id = DECODE (rec_id, 0, 0, rec_id + v_this_release_max_obj_id)
		WHERE obj_id0 <= v_this_release_max_obj_id
        	AND obj_id0 IN (SELECT obj_id0 FROM dd_objects_t WHERE state = 3);

		UPDATE dd_objects_t
        	SET obj_id0 = obj_id0 + v_this_release_max_obj_id
		WHERE obj_id0 <= v_this_release_max_obj_id
        	AND STATE = 3;

		COMMIT;
	EXCEPTION
		WHEN OTHERS THEN
			ROLLBACK;
                	pin_upg_common.log_info (C_STEP_NAME, NULL, NULL, 'E',
						'Unable to update Portal non core data dictionary entries.', sqlerrm);
			RETURN;
	END;

        -- Populate the newly added columns in the data dictionary.

        BEGIN
                -- Since all the Portal objects are already deleted these updates
                -- will affect only the custom objects created by the users
                -- Portal Objects will be loaded with the correct values later

		-- partition_mode values : 0 ==> This object will go to the historical partition.
		--                         1 ==> This object will not go to the historical partition.

		UPDATE dd_objects_t SET partition_mode = 1
		WHERE name like '/event/%';  -- matters only for the event objects. For other objects it can be NULL.
                COMMIT;

        EXCEPTION
                WHEN OTHERS THEN
                        ROLLBACK;
                	pin_upg_common.log_info (C_STEP_NAME, NULL, NULL, 'E',
						'Unable to update Portal non core data dictionary entries.', sqlerrm);
                        RETURN;
        END;

        pin_upg_common.log_info (C_STEP_NAME, NULL, NULL, 'C', null, NULL);

EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK;
                pin_upg_common.log_info (C_STEP_NAME, NULL, NULL, 'E', null, sqlerrm);
END dd_adjust;

/
--------------------------------------------------------
--  DDL for Procedure DEFAULT_VALUES_61
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."DEFAULT_VALUES_61" AS
        C_STEP_NAME upg_log_t.step_name%TYPE := 'default_values_61';

	v_rows_updated PLS_INTEGER := 0;
BEGIN

	--
	-- Populate the event_session_ipt_call_t.cos with zero.
	--

	DECLARE
	        C_STEP_NAME upg_log_t.step_name%TYPE := 'default_values_61::event_session_ipt_call_t.cos';
        	C_START_CREATED_T CONSTANT upg_log_t.start_created_t%TYPE := pin_upg_common.ora2inf_time(to_date ('01-JUL-2001', 'DD-MON-YYYY'));
        	C_END_CREATED_T CONSTANT upg_log_t.end_created_t%TYPE := pin_upg_common.ora2inf_time(to_date ('26-JUL-2003', 'DD-MON-YYYY'));
        	C_INTERVAL CONSTANT PLS_INTEGER := 30 * pin_upg_common.C_NO_OF_SECONDS_IN_A_DAY;

        	v_start_created_t upg_log_t.start_created_t%TYPE;
        	v_end_created_t upg_log_t.end_created_t%TYPE;

        	v_tot_rows_updated PLS_INTEGER := 0;
	BEGIN

            pin_upg_common.delete_error_info(C_STEP_NAME);
            pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'Starting ...', NULL);

            LOOP
                IF (NOT pin_upg_common.get_created_t_bounds(C_STEP_NAME, C_INTERVAL, C_START_CREATED_T, C_END_CREATED_T,
                                                                v_start_created_t, v_end_created_t)) THEN

            		pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I',
						'Done processing all the data in the given date range.', NULL);

                        EXIT;
                END IF;

                UPDATE event_session_ipt_call_t
                SET cos = 0
		WHERE obj_id0 IN
			(SELECT poid_id0 FROM event_t WHERE created_t >= v_start_created_t AND created_t <= v_end_created_t);

                v_rows_updated := SQL%ROWCOUNT;
                COMMIT;

                v_tot_rows_updated := v_tot_rows_updated + v_rows_updated;

                pin_upg_common.log_info(C_STEP_NAME,
                                        v_start_created_t,
                                        v_end_created_t,
                                        'I',
                                        to_char(v_rows_updated) ||' rows processed. (Total::' || to_char(v_tot_rows_updated) || ').',
                                        NULL);
            END LOOP;

	EXCEPTION
            WHEN OTHERS THEN
                ROLLBACK;
                pin_upg_common.log_info(C_STEP_NAME, v_start_created_t, v_end_created_t,
                                                'E', 'Error updating event_session_ipt_call_t table.', sqlerrm);
	END;

EXCEPTION
        WHEN OTHERS THEN
                ROLLBACK;
                pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'E', NULL, sqlerrm);
END default_values_61;

/
--------------------------------------------------------
--  DDL for Procedure DELETE_DELINQUENCY_OBJ
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."DELETE_DELINQUENCY_OBJ" IS
--
--
-- ---------   ------  -------------------------------------------
    rows      INTEGER;
    poid_id   INTEGER;

    CURSOR poids_to_be_deleted IS
        select poid_id0 from DELINQ_POIDS;

BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');

    rows := 0;
    FOR poid_rec in poids_to_be_deleted
    LOOP
     poid_id := poid_rec.poid_id0;

     DELETE FROM HNS_DELINQUENCY_T WHERE POID_ID0 = poid_id;
     DELETE FROM HNS_DELINQUENCY_STATE_T WHERE OBJ_ID0 = poid_id;
     DELETE FROM HNS_DELINQUENCY_DUNNING_T WHERE OBJ_ID0 = poid_id;
     DELETE FROM HNS_DELINQUENCY_CC_T WHERE OBJ_ID0 = poid_id;

     rows := rows+1;
     If rows >= 5000 Then
        Commit;
        rows := 0;
     End If;

   END LOOP; -- for each entry.
commit;

DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending procedure ' || sysdate);

END; -- Procedure DELETE_DELINQUENCY_OBJ

/
--------------------------------------------------------
--  DDL for Procedure DELETE_OLD_EVENT_CHARGE_OBJ
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."DELETE_OLD_EVENT_CHARGE_OBJ" IS
--
--
-- ---------   ------  -------------------------------------------
    rows      INTEGER;
    poid_id   INTEGER;

    CURSOR poids_to_be_deleted IS
        select obj_id0 from DELINQ_POIDS;

BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');

    rows := 0;
    FOR poid_rec in poids_to_be_deleted
    LOOP
     poid_id := poid_rec.obj_id0;

     DELETE FROM EVENT_T WHERE POID_ID0 = poid_id;

     rows := rows+1;
     If rows >= 100000 Then
        insert into delete_old_event_log values (sysdate, 'committing ');
        Commit;
        rows := 0;
     End If;

   END LOOP; -- for each entry.
commit;

DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending procedure ' || sysdate);

END; -- Procedure DELETE_OLD_EVENT_CHARGE_OBJ

/
--------------------------------------------------------
--  DDL for Procedure DET_GL_UNBILLED
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."DET_GL_UNBILLED" (
    start_t IN INTEGER,
    end_t IN INTEGER,
    gl_type IN INTEGER,
    poid_id0 IN INTEGER,
    gl_segment IN VARCHAR2,
    min_resource IN INTEGER,
    max_resource IN INTEGER,
    beg_ar_account IN INTEGER,
    end_ar_account IN INTEGER) AS

    rec_id        INTEGER;
    prev_row_count  INTEGER := 0;
    ledger_param_t     gl.ledger_ip_table_type;
    config_poid_id0    INTEGER;
    max_effective_t    INTEGER;

    CURSOR c1(c_start_t INTEGER, c_end_t INTEGER, c_poid_id0 INTEGER,
          c_min_resource INTEGER, c_max_resource INTEGER,
          c_beg_ar_account INTEGER, c_end_ar_account INTEGER,
          c_max_effective_t INTEGER) IS

        SELECT  --+ ORDERED
            SUM(gl.pin_round(db_gross, adjust, rounding)) DB_GROSS,
            SUM(gl.pin_round(cr_gross, adjust, rounding)) CR_GROSS,
            SUM(gl.pin_round(db_disc, adjust, rounding)) DB_DISC,
            SUM(gl.pin_round(cr_disc, adjust, rounding)) CR_DISC,
            SUM(gl.pin_round(db_tax, adjust, rounding)) DB_TAX,
            SUM(gl.pin_round(cr_tax, adjust, rounding)) CR_TAX,
            resource_id,
            gl_id,
            account_obj_id0,
            poid_id0
        FROM
        (
        SELECT /*+ ORDERED INDEX(i i_item_glseg_eff__id) use_nl(i,j)*/
            db_ar_net_amt + db_ar_disc_amt db_gross,
            cr_ar_net_amt + cr_ar_disc_amt cr_gross,
            db_ar_disc_amt db_disc,
            cr_ar_disc_amt cr_disc,
            db_ar_tax_amt db_tax,
            cr_ar_tax_amt cr_tax,
            i.account_obj_id0,
            i.poid_id0,
            resource_id,
            gl_id
        FROM
            ledger_report_gl_segments_t gs,
            item_t i, journal_t j
        WHERE
            gs.obj_id0 = c1.c_poid_id0 AND
            gs.gl_segment = i.gl_segment AND
            /*for performance purpose*/
            ((i.effective_t between 0 and 0) OR
                (i.effective_t >= c1.c_end_t
                and
                i.effective_t <= c1.c_max_effective_t)
            ) AND
            i.poid_db IS NOT NULL AND -- added for AMT
            j.item_obj_id0 = i.poid_id0 AND
            j.gl_id <> 0 AND
            ((j.resource_id + 0) between c1.c_min_resource
                and c1.c_max_resource) AND
            j.created_t < c1.c_end_t AND
            (    (c1.c_beg_ar_account IS NULL)
                OR
                (i.account_obj_id0
                    between c1.c_beg_ar_account
                    and    c1.c_end_ar_account)
            )
        ) item_info,
        (
        SELECT    rec_id2 rec_id,
            rounding,
            DECODE(rounding_mode,
            0, 0,        --round nearest
            1, 0.4/POWER(10, rounding), -- up
            2, -0.5/POWER(10, rounding),  --down
            3, 0, -- round even
            0) adjust
        FROM    config_beid_rules_t
        WHERE event_type = gl.NATURAL_SCALE_EVENT_TYPE AND
              processing_stage = gl.NATURAL_SCALE_PROCESSING_STAGE
        ) beid_info
        WHERE    item_info.resource_id = beid_info.rec_id
        GROUP BY
            account_obj_id0,
            poid_id0,
            gl_id,
            resource_id;

BEGIN
    ----------------------------------------------------
    -- Initialize the variables.
    ----------------------------------------------------
    rec_id         := gl.get_max_rec_id(poid_id0);
    config_poid_id0 := gl.get_poid_id0_for_gl_segment(gl_segment);

    SELECT    max(effective_t)
    INTO    max_effective_t
    FROM    item_t
    WHERE    effective_t > -1;

    ----------------------------------------------------
    -- Open the cursor
    ----------------------------------------------------
    OPEN c1(start_t, end_t, poid_id0, min_resource, max_resource,
            beg_ar_account, end_ar_account,    max_effective_t);

    LOOP
        FETCH c1 BULK COLLECT INTO  ledger_param_t LIMIT gl.insert_grouping;
        EXIT WHEN (prev_row_count >= c1%rowcount);

        gl.ledger_insert_rows (
            1,
            poid_id0,
            rec_id,
            gl_type,
            config_poid_id0,
            ledger_param_t,
            c1%rowcount - prev_row_count);

        rec_id := rec_id + (c1%rowcount - prev_row_count);
        prev_row_count := c1%rowcount;
    END LOOP;

    CLOSE c1;
END det_gl_unbilled;

/
--------------------------------------------------------
--  DDL for Procedure ENTCREATEINVOICESUMMARY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."ENTCREATEINVOICESUMMARY" 
(InvoiceNo IN VARCHAR2)

IS

CURSOR invoice_summary_cursor(InvNo VARCHAR2)
IS
SELECT SUM(EIT.EXTENDED_PRICE) AS TOTAL_AMOUNT,
SUM(EIT.QUANTITY) AS QUANTITY, EIT.INVOICE_DESCRIPTOR,
EIT.PRODUCT_NO, EIT.UOM, EIT.UNIT_PRICE
FROM ENT_INVOICE_ITEMS_T EIT,
( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID
FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV
WHERE EII.INVOICE_VERSION <= EIV.VERSION
AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID
AND EIV.INVOICE_NO = InvNo
GROUP BY BASE_ITEM_REC_ID ) X
WHERE X.BASE_ITEM_REC_ID=EIT.BASE_ITEM_REC_ID
AND X.VERSION=EIT.INVOICE_VERSION
AND EIT.SUPER_PARENT_ID IS NULL
AND EIT.ITEM_TYPE='S'
AND UOM != 'DR'
AND (UPPER(EIT.PRODUCT_NO) NOT LIKE '%USF%' AND UPPER(EIT.PRODUCT_NO) NOT LIKE '%UNIVERSAL SERVICE FEE%')
GROUP BY EIT.PRODUCT_NO, EIT.INVOICE_DESCRIPTOR , EIT.UOM, EIT.UNIT_PRICE
ORDER BY EIT.PRODUCT_NO, EIT.INVOICE_DESCRIPTOR ;

CURSOR inv_exxon_summary_cursor(InvNo VARCHAR2)
IS
SELECT SUM(EIT.EXTENDED_PRICE) AS TOTAL_AMOUNT,
SUM(EIT.QUANTITY) AS QUANTITY, EIT.INVOICE_DESCRIPTOR,
EIT.PRODUCT_NO
FROM ENT_INVOICE_ITEMS_T EIT,
( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID
FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV
WHERE EII.INVOICE_VERSION <= EIV.VERSION
AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID
AND EIV.INVOICE_NO = InvNo
GROUP BY BASE_ITEM_REC_ID ) X
WHERE X.BASE_ITEM_REC_ID=EIT.BASE_ITEM_REC_ID
AND X.VERSION=EIT.INVOICE_VERSION
AND EIT.SUPER_PARENT_ID IS NULL
AND EIT.ITEM_TYPE='S'
AND UOM != 'DR'
AND UNIT_PRICE != 0
AND (UPPER(EIT.PRODUCT_NO) NOT LIKE '%USF%' AND UPPER(EIT.PRODUCT_NO) NOT LIKE '%UNIVERSAL SERVICE FEE%')
GROUP BY EIT.PRODUCT_NO, EIT.INVOICE_DESCRIPTOR
ORDER BY EIT.PRODUCT_NO, EIT.INVOICE_DESCRIPTOR ;

CURSOR invoice_summary_dr_cursor(InvNo VARCHAR2)
IS
SELECT SUM(EIT.EXTENDED_PRICE) AS TOTAL_AMOUNT,
SUM(EIT.QUANTITY) AS QUANTITY, EIT.INVOICE_DESCRIPTOR,
EIT.PRODUCT_NO
FROM ENT_INVOICE_ITEMS_T EIT,
( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID
FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV
WHERE EII.INVOICE_VERSION <= EIV.VERSION
AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID
AND EIV.INVOICE_NO = InvNo
GROUP BY BASE_ITEM_REC_ID ) X
WHERE X.BASE_ITEM_REC_ID=EIT.BASE_ITEM_REC_ID
AND X.VERSION=EIT.INVOICE_VERSION
AND EIT.SUPER_PARENT_ID IS NULL
AND EIT.ITEM_TYPE='S'
AND UOM = 'DR'
AND (UPPER(EIT.PRODUCT_NO) NOT LIKE '%USF%' AND UPPER(EIT.PRODUCT_NO) NOT LIKE '%UNIVERSAL SERVICE FEE%')
GROUP BY EIT.PRODUCT_NO, EIT.INVOICE_DESCRIPTOR
ORDER BY EIT.PRODUCT_NO, EIT.INVOICE_DESCRIPTOR ;

CURSOR usf_summary_cursor(InvNo VARCHAR2)
IS
SELECT SUM(EIT.EXTENDED_PRICE) AS USF_AMOUNT,
EIT.INVOICE_DESCRIPTOR AS USF_DESCRIPTOR,
EIT.PRODUCT_NO AS USF_PRODUCT_NO,
EIT.ITEM_TYPE AS ITEM_TYPE
FROM ENT_INVOICE_ITEMS_T EIT,
( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID
FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV
WHERE EII.INVOICE_VERSION <= EIV.VERSION
AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID
AND EIV.INVOICE_NO = InvNo
GROUP BY BASE_ITEM_REC_ID ) X
WHERE X.BASE_ITEM_REC_ID=EIT.BASE_ITEM_REC_ID
AND X.VERSION=EIT.INVOICE_VERSION
AND EIT.ITEM_TYPE in ('S','ST')
AND (UPPER(EIT.PRODUCT_NO) LIKE '%USF%' OR UPPER(EIT.PRODUCT_NO) LIKE '%UNIVERSAL SERVICE FEE%')
GROUP BY EIT.PRODUCT_NO, EIT.INVOICE_DESCRIPTOR, EIT.ITEM_TYPE;

CURSOR spTax_summaryType_cursor
IS
SELECT ETSD.SUMMARY_GROUP AS SUMMARY_GROUP,
ETSD.PRODUCT_NO AS PRODUCT_NO,
ETSD.INVOICE_DESCRIPTOR AS INVOICE_DESCRIPTOR
FROM ENT_TAX_SUMMARY_DISPLAY_T ETSD ORDER BY ITEM_ORDER ASC;

TYPE cur_typ IS REF CURSOR;
TYPE rec_typ IS RECORD (ACCOUNT_NO VARCHAR2(60), HNS_LOCATION_ID VARCHAR2(15), CUST_LOCATION_ID VARCHAR2(20), HNS_CUST_SITE_ID VARCHAR2(20));

invoice_summary_cursor_rec invoice_summary_cursor%ROWTYPE;
inv_exxon_summary_cursor_rec inv_exxon_summary_cursor%ROWTYPE;
invoice_summary_dr_cursor_rec invoice_summary_dr_cursor%ROWTYPE;
usf_summary_cursor_rec usf_summary_cursor%ROWTYPE;
spTax_summaryType_cursor_rec spTax_summaryType_cursor%ROWTYPE;

inv_ex_summary_site_cursor cur_typ;
inv_summary_site_cursor cur_typ;
inv_sum_site_dr_cursor cur_typ;

inv_ex_summary_site_cursor_rec rec_typ;
inv_summary_site_cursor_rec rec_typ;
inv_sum_site_dr_cursor_rec rec_typ;

InvoiceDescriptor VARCHAR2(255);
ProductNo VARCHAR2(255);
UOM VARCHAR2(10);
UnitPrice DECIMAL(18,2) := 0;
TotalAmount DECIMAL(18,2) := 0;
TotalTax DECIMAL(18,2) :=0;
SiteAccountNo VARCHAR2(60);
HNSLocationID VARCHAR2(60);
CustomerLocationID VARCHAR2(60);
CustomerSiteID VARCHAR2(60);
Quantity NUMBER(18, 2);
InvSummaryRecId Integer;
SqlQuery VARCHAR2(1024);
UsfAmount DECIMAL(18,2) := 0;
UsfTaxAmount DECIMAL(18,2) := 0;
UsfDescriptor VARCHAR2(255);
UsfProductNo VARCHAR2(255);
SpecialTaxSummaryType VARCHAR2(10);
SpecialTaxProductNo VARCHAR2(255);
SpecialTaxInvDesc VARCHAR2(255);
SpecialTaxTotalAmount DECIMAL(18,2) := 0;
SalesTaxOnSpecialTax DECIMAL(18,2) := 0;
ItemType VARCHAR2(10);
isExxonFlag VARCHAR2(10);

BEGIN

	isExxonFlag := IS_EXXON_SPECIAL_INVOICE(InvoiceNo);

IF isExxonFlag = 'TRUE'
THEN
	DBMS_OUTPUT.PUT_LINE('Exxon flag is true');

	IF NOT inv_exxon_summary_cursor%ISOPEN
	THEN
		DBMS_OUTPUT.PUT_LINE('Cursor inv_exxon_summary_cursor opened');
		OPEN inv_exxon_summary_cursor(InvoiceNo);
	END IF;

	LOOP
		DBMS_OUTPUT.PUT_LINE('Summary record number ' ||  TO_CHAR (inv_exxon_summary_cursor%ROWCOUNT));
		FETCH inv_exxon_summary_cursor INTO inv_exxon_summary_cursor_rec;
		EXIT WHEN NOT inv_exxon_summary_cursor%FOUND;

		ProductNo := inv_exxon_summary_cursor_rec.PRODUCT_NO;
		DBMS_OUTPUT.PUT_LINE('ProductNo:' || ProductNo);

		InvoiceDescriptor := inv_exxon_summary_cursor_rec.INVOICE_DESCRIPTOR;
		DBMS_OUTPUT.PUT_LINE('InvoiceDescriptor:' || InvoiceDescriptor);

		Quantity := inv_exxon_summary_cursor_rec.QUANTITY;
		DBMS_OUTPUT.PUT_LINE('Quantity:' || quantity);

		TotalAmount := inv_exxon_summary_cursor_rec.TOTAL_AMOUNT;
		DBMS_OUTPUT.PUT_LINE('TotalAmount:' || TotalAmount);

		SqlQuery := 'SELECT SUM(EXTENDED_PRICE) AS TOTAL_TAX FROM ENT_INVOICE_ITEMS_T '
			|| 'WHERE PARENT_ID IN '
				|| '( SELECT EIT.ITEM_REC_ID '
			|| 'FROM ENT_INVOICE_ITEMS_T EIT, '
			|| '( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID '
			|| 'FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV '
			|| 'WHERE EII.INVOICE_VERSION <= EIV.VERSION '
				|| 'AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID '
				|| 'AND EIV.INVOICE_NO = :1 '
				|| 'GROUP BY BASE_ITEM_REC_ID ) X '
				|| 'WHERE X.BASE_ITEM_REC_ID = EIT.BASE_ITEM_REC_ID '
			|| 'AND X.VERSION = EIT.INVOICE_VERSION '
			|| 'AND INVOICE_DESCRIPTOR = :2 '
			|| 'AND PRODUCT_NO = :3 '
			|| ') AND ITEM_TYPE = :5 ';

		EXECUTE IMMEDIATE SqlQuery INTO TotalTax USING InvoiceNo, InvoiceDescriptor, ProductNo, 'ST';

		DBMS_OUTPUT.PUT_LINE('TotalTax:' || TotalTax);

		SELECT ENT_INVOICE_SUMMARY_T_SEQ.NEXTVAL INTO InvSummaryRecId FROM DUAL;
		DBMS_OUTPUT.PUT_LINE('InvoiceSummaryRecId:' || InvSummaryRecId);

		DBMS_OUTPUT.PUT_LINE('Creating entry in ENT_INVOICE_SUMMARY_T');
		INSERT INTO ENT_INVOICE_SUMMARY_T (INVOICE_NO, SUMMARY_REC_ID, PRODUCT_NO, INVOICE_DESCRIPTOR, QUANTITY, UNIT_PRICE, TAX_AMOUNT, EXTENDED_PRICE, SUMMARY_TYPE)
		VALUES (InvoiceNo, InvSummaryRecId, ProductNo, InvoiceDescriptor, Quantity, NULL, TotalTax, TotalAmount,'S');

		SqlQuery := 'SELECT A.ACCOUNT_NO as ACCOUNT_NO, '
			|| 'ESA.HNS_LOCATION_ID as HNS_LOCATION_ID, '
			|| 'ESA.CUST_LOCATION_ID as CUST_LOCATION_ID, '
			|| 'ESA.HNS_CUST_SITE_ID as HNS_CUST_SITE_ID '
			|| 'FROM ACCOUNT_T A, '
			|| 'ENT_SITE_ADDRESS_T ESA, '
			|| '( SELECT DISTINCT EIT.ACCOUNT_OBJ_ID0, EIT.SITE_ADDRESS_OBJ_ID0 '
			|| 'FROM ENT_INVOICE_ITEMS_T EIT, '
			|| '( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID '
			|| 'FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV '
			|| 'WHERE EII.INVOICE_VERSION <= EIV.VERSION '
			|| 'AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID '
			|| 'AND EIV.INVOICE_NO = :1 '
			|| 'GROUP BY BASE_ITEM_REC_ID ) X '
			|| 'WHERE X.BASE_ITEM_REC_ID = EIT.BASE_ITEM_REC_ID '
			|| 'AND X.VERSION = EIT.INVOICE_VERSION '
			|| 'AND INVOICE_DESCRIPTOR = :2 '
			|| 'AND PRODUCT_NO = :3 '
			|| 'AND UNIT_PRICE != 0) Y '
			|| 'WHERE A.POID_ID0 = Y.ACCOUNT_OBJ_ID0 '
			|| 'AND ESA.POID_ID0 = Y.SITE_ADDRESS_OBJ_ID0 '
			|| 'ORDER BY A.ACCOUNT_NO ASC ';


		IF NOT inv_ex_summary_site_cursor%ISOPEN
		THEN
			OPEN inv_ex_summary_site_cursor FOR SqlQuery USING InvoiceNo, InvoiceDescriptor, ProductNo;
		END IF;

		DBMS_OUTPUT.PUT_LINE('Create entry in ENT_INVOICE_SUMMARY_SITELIST_T');
		LOOP
			FETCH inv_ex_summary_site_cursor INTO inv_ex_summary_site_cursor_rec;
			EXIT WHEN inv_ex_summary_site_cursor%NOTFOUND;

			SiteAccountNo := inv_ex_summary_site_cursor_rec.ACCOUNT_NO;
			HNSLocationID := inv_ex_summary_site_cursor_rec.HNS_LOCATION_ID;
			CustomerLocationID := inv_ex_summary_site_cursor_rec.CUST_LOCATION_ID;
			CustomerSiteID := inv_ex_summary_site_cursor_rec.HNS_CUST_SITE_ID;

			DBMS_OUTPUT.PUT_LINE('Fetched Record :' || SiteAccountNo || ', ' || HNSLocationID || ', ' || CustomerLocationID || ', ' || CustomerSiteID);

			INSERT INTO ENT_INVOICE_SUMMARY_SITELIST_T (INVOICE_SUMMARY_REC_ID, ACCOUNT_NO,HNS_LOCATION_ID,CUST_LOCATION_ID,HNS_CUST_SITE_ID)
			VALUES (InvSummaryRecId, SiteAccountNo,HNSLocationID,CustomerLocationID,CustomerSiteID);
		END LOOP;

		IF inv_ex_summary_site_cursor%ISOPEN
		THEN
			CLOSE inv_ex_summary_site_cursor;
		END IF;

	END LOOP;

	IF inv_exxon_summary_cursor%ISOPEN
	THEN
		CLOSE inv_exxon_summary_cursor;
	END IF;

ELSE
	DBMS_OUTPUT.PUT_LINE('Exxon flag is false');

	IF NOT invoice_summary_cursor%ISOPEN
	THEN
		DBMS_OUTPUT.PUT_LINE('Cursor invoice_summary_cursor opened');
		OPEN invoice_summary_cursor(InvoiceNo);
	END IF;

	LOOP
		DBMS_OUTPUT.PUT_LINE('Summary record number ' ||  TO_CHAR (invoice_summary_cursor%ROWCOUNT));
		FETCH invoice_summary_cursor INTO invoice_summary_cursor_rec;
		EXIT WHEN NOT invoice_summary_cursor%FOUND;

		ProductNo := invoice_summary_cursor_rec.PRODUCT_NO;
		DBMS_OUTPUT.PUT_LINE('ProductNo:' || ProductNo);

		InvoiceDescriptor := invoice_summary_cursor_rec.INVOICE_DESCRIPTOR;
		DBMS_OUTPUT.PUT_LINE('InvoiceDescriptor:' || InvoiceDescriptor);

		UOM := invoice_summary_cursor_rec.UOM;
		DBMS_OUTPUT.PUT_LINE('UOM:' || UOM);

		UnitPrice := invoice_summary_cursor_rec.UNIT_PRICE;
		DBMS_OUTPUT.PUT_LINE('UnitPrice:' || UnitPrice);

		Quantity := invoice_summary_cursor_rec.QUANTITY;
		DBMS_OUTPUT.PUT_LINE('Quantity:' || quantity);

		TotalAmount := invoice_summary_cursor_rec.TOTAL_AMOUNT;
		DBMS_OUTPUT.PUT_LINE('TotalAmount:' || TotalAmount);

		SqlQuery := 'SELECT SUM(EXTENDED_PRICE) AS TOTAL_TAX FROM ENT_INVOICE_ITEMS_T '
			|| 'WHERE PARENT_ID IN '
				|| '( SELECT EIT.ITEM_REC_ID '
			|| 'FROM ENT_INVOICE_ITEMS_T EIT, '
			|| '( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID '
			|| 'FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV '
			|| 'WHERE EII.INVOICE_VERSION <= EIV.VERSION '
				|| 'AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID '
				|| 'AND EIV.INVOICE_NO = :1 '
				|| 'GROUP BY BASE_ITEM_REC_ID ) X '
				|| 'WHERE X.BASE_ITEM_REC_ID = EIT.BASE_ITEM_REC_ID '
			|| 'AND X.VERSION = EIT.INVOICE_VERSION '
			|| 'AND INVOICE_DESCRIPTOR = :2 '
			|| 'AND PRODUCT_NO = :3 ';

		IF UnitPrice IS NULL OR isExxonFlag = 'TRUE'
		THEN
			SqlQuery := SqlQuery || 'AND UNIT_PRICE IS NULL AND UOM = :4 ) AND ITEM_TYPE = :5';
			EXECUTE IMMEDIATE SqlQuery INTO TotalTax USING InvoiceNo, InvoiceDescriptor, ProductNo, UOM, 'ST';
		ELSE
			SqlQuery := SqlQuery || 'AND UNIT_PRICE = :4 AND UOM = :5 ) AND ITEM_TYPE = :6';
			EXECUTE IMMEDIATE SqlQuery INTO TotalTax USING InvoiceNo, InvoiceDescriptor, ProductNo, UnitPrice, UOM, 'ST';
		END IF;

		DBMS_OUTPUT.PUT_LINE('TotalTax:' || TotalTax);

		SELECT ENT_INVOICE_SUMMARY_T_SEQ.NEXTVAL INTO InvSummaryRecId FROM DUAL;
		DBMS_OUTPUT.PUT_LINE('InvoiceSummaryRecId:' || InvSummaryRecId);

		DBMS_OUTPUT.PUT_LINE('Creating entry in ENT_INVOICE_SUMMARY_T');
		INSERT INTO ENT_INVOICE_SUMMARY_T (INVOICE_NO, SUMMARY_REC_ID, PRODUCT_NO, INVOICE_DESCRIPTOR, QUANTITY, UNIT_PRICE, TAX_AMOUNT, EXTENDED_PRICE, SUMMARY_TYPE)
		VALUES (InvoiceNo, InvSummaryRecId, ProductNo, InvoiceDescriptor, Quantity, UnitPrice, TotalTax, TotalAmount,'S');

		SqlQuery := 'SELECT A.ACCOUNT_NO, '
			|| 'ESA.HNS_LOCATION_ID as HNS_LOCATION_ID, '
			|| 'ESA.CUST_LOCATION_ID as CUST_LOCATION_ID, '
			|| 'ESA.HNS_CUST_SITE_ID as HNS_CUST_SITE_ID '
			|| 'FROM ACCOUNT_T A, '
			|| 'ENT_SITE_ADDRESS_T ESA, '
			|| '( SELECT DISTINCT EIT.ACCOUNT_OBJ_ID0, EIT.SITE_ADDRESS_OBJ_ID0  '
			|| 'FROM ENT_INVOICE_ITEMS_T EIT, '
			|| '( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID '
			|| 'FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV '
			|| 'WHERE EII.INVOICE_VERSION <= EIV.VERSION '
			|| 'AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID '
			|| 'AND EIV.INVOICE_NO = :1 '
			|| 'GROUP BY BASE_ITEM_REC_ID ) X '
			|| 'WHERE X.BASE_ITEM_REC_ID = EIT.BASE_ITEM_REC_ID '
			|| 'AND X.VERSION = EIT.INVOICE_VERSION '
			|| 'AND INVOICE_DESCRIPTOR = :2 '
			|| 'AND PRODUCT_NO = :3 ';


		IF NOT inv_summary_site_cursor%ISOPEN
		THEN
			DBMS_OUTPUT.PUT_LINE('Open inv_summary_site_cursor');
			IF UnitPrice IS NULL OR isExxonFlag = 'TRUE'
			THEN
				SqlQuery := SqlQuery || 'AND UNIT_PRICE IS NULL AND UOM = :4 ) Y '
						     || 'WHERE A.POID_ID0 = Y.ACCOUNT_OBJ_ID0 '
						     || 'AND ESA.POID_ID0 = Y.SITE_ADDRESS_OBJ_ID0 '
						     || 'ORDER BY A.ACCOUNT_NO ASC ';
				OPEN inv_summary_site_cursor FOR SqlQuery USING InvoiceNo, InvoiceDescriptor, ProductNo, UOM;
			ELSE
			 	SqlQuery := SqlQuery || 'AND UNIT_PRICE = :4 AND UOM = :5 ) Y '
			 			     || 'WHERE A.POID_ID0 = Y.ACCOUNT_OBJ_ID0 '
			 			     || 'AND ESA.POID_ID0 = Y.SITE_ADDRESS_OBJ_ID0 '
			 			     || 'ORDER BY A.ACCOUNT_NO ASC ';
			 	OPEN inv_summary_site_cursor FOR SqlQuery USING  InvoiceNo, InvoiceDescriptor, ProductNo, UnitPrice ,UOM;
			END IF;
		END IF;

		DBMS_OUTPUT.PUT_LINE('Create entry in ENT_INVOICE_SUMMARY_SITELIST_T');
		LOOP
			FETCH inv_summary_site_cursor INTO inv_summary_site_cursor_rec;
			EXIT WHEN inv_summary_site_cursor%NOTFOUND;

			SiteAccountNo := inv_summary_site_cursor_rec.ACCOUNT_NO;
			HNSLocationID := inv_summary_site_cursor_rec.HNS_LOCATION_ID;
			CustomerLocationID := inv_summary_site_cursor_rec.CUST_LOCATION_ID;
			CustomerSiteID := inv_summary_site_cursor_rec.HNS_CUST_SITE_ID;

			DBMS_OUTPUT.PUT_LINE('Fetched Record :' || SiteAccountNo || ', ' || HNSLocationID || ', ' || CustomerLocationID || ', ' || CustomerSiteID);

			INSERT INTO ENT_INVOICE_SUMMARY_SITELIST_T (INVOICE_SUMMARY_REC_ID, ACCOUNT_NO,HNS_LOCATION_ID,CUST_LOCATION_ID,HNS_CUST_SITE_ID)
			VALUES (InvSummaryRecId, SiteAccountNo,HNSLocationID,CustomerLocationID,CustomerSiteID);
		END LOOP;

		IF inv_summary_site_cursor%ISOPEN
		THEN
		CLOSE inv_summary_site_cursor;
		END IF;

	END LOOP;

	IF invoice_summary_cursor%ISOPEN
	THEN
		CLOSE invoice_summary_cursor;
	END IF;

END IF;

-- DR Item Summary Start--

IF NOT invoice_summary_dr_cursor%ISOPEN
THEN
    DBMS_OUTPUT.PUT_LINE('Cursor invoice_summary_dr_cursor opened');
    OPEN invoice_summary_dr_cursor(InvoiceNo);
END IF;

LOOP
    DBMS_OUTPUT.PUT_LINE('Summary record number ' ||  TO_CHAR (invoice_summary_dr_cursor%ROWCOUNT));
    FETCH invoice_summary_dr_cursor INTO invoice_summary_dr_cursor_rec;
    EXIT WHEN NOT invoice_summary_dr_cursor%FOUND;

    ProductNo := invoice_summary_dr_cursor_rec.PRODUCT_NO;
    DBMS_OUTPUT.PUT_LINE('ProductNo:' || ProductNo);

    InvoiceDescriptor := invoice_summary_dr_cursor_rec.INVOICE_DESCRIPTOR;
    DBMS_OUTPUT.PUT_LINE('InvoiceDescriptor:' || InvoiceDescriptor);

    UOM := 'DR';
    DBMS_OUTPUT.PUT_LINE('UOM:' || UOM);

    UnitPrice := invoice_summary_dr_cursor_rec.TOTAL_AMOUNT;
    DBMS_OUTPUT.PUT_LINE('UnitPrice:' || UnitPrice);

    Quantity := 1;
    DBMS_OUTPUT.PUT_LINE('Quantity:' || quantity);

    TotalAmount := UnitPrice;
    DBMS_OUTPUT.PUT_LINE('TotalAmount:' || TotalAmount);

    SqlQuery := 'SELECT SUM(EXTENDED_PRICE) AS TOTAL_TAX FROM ENT_INVOICE_ITEMS_T '
        || 'WHERE PARENT_ID IN '
            || '( SELECT EIT.ITEM_REC_ID '
        || 'FROM ENT_INVOICE_ITEMS_T EIT, '
        || '( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID '
        || 'FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV '
        || 'WHERE EII.INVOICE_VERSION <= EIV.VERSION '
            || 'AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID '
            || 'AND EIV.INVOICE_NO = :1 '
            || 'GROUP BY BASE_ITEM_REC_ID ) X '
            || 'WHERE X.BASE_ITEM_REC_ID = EIT.BASE_ITEM_REC_ID '
        || 'AND X.VERSION = EIT.INVOICE_VERSION '
        || 'AND INVOICE_DESCRIPTOR = :2 '
        || 'AND PRODUCT_NO = :3 '
        || 'AND UOM = :4) '
        || 'AND ITEM_TYPE = :5';

    EXECUTE IMMEDIATE SqlQuery INTO TotalTax USING InvoiceNo, InvoiceDescriptor, ProductNo, UOM, 'ST';

    DBMS_OUTPUT.PUT_LINE('TotalTax:' || TotalTax);

    SELECT ENT_INVOICE_SUMMARY_T_SEQ.NEXTVAL INTO InvSummaryRecId FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('InvoiceSummaryRecId:' || InvSummaryRecId);

    DBMS_OUTPUT.PUT_LINE('Creating entry in ENT_INVOICE_SUMMARY_T');
    INSERT INTO ENT_INVOICE_SUMMARY_T (INVOICE_NO, SUMMARY_REC_ID, PRODUCT_NO, INVOICE_DESCRIPTOR, QUANTITY, UNIT_PRICE, TAX_AMOUNT, EXTENDED_PRICE, SUMMARY_TYPE)
    VALUES (InvoiceNo, InvSummaryRecId, ProductNo, InvoiceDescriptor, Quantity, UnitPrice, TotalTax, TotalAmount,'S');


    SqlQuery := 'SELECT A.ACCOUNT_NO, '
	     || 'ESA.HNS_LOCATION_ID as HNS_LOCATION_ID, '
	     || 'ESA.CUST_LOCATION_ID as CUST_LOCATION_ID, '
	     || 'ESA.HNS_CUST_SITE_ID as HNS_CUST_SITE_ID '
	     || 'FROM ACCOUNT_T A, '
	     || 'ENT_SITE_ADDRESS_T ESA, '
	     || '( SELECT DISTINCT EIT.ACCOUNT_OBJ_ID0, EIT.SITE_ADDRESS_OBJ_ID0 '
	     || 'FROM ENT_INVOICE_ITEMS_T EIT, '
	     || '( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID '
	     || 'FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV '
	     || 'WHERE EII.INVOICE_VERSION <= EIV.VERSION '
	     || 'AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID '
	     || 'AND EIV.INVOICE_NO = :1 '
	     || 'GROUP BY BASE_ITEM_REC_ID ) X '
	     || 'WHERE X.BASE_ITEM_REC_ID = EIT.BASE_ITEM_REC_ID '
      	     || 'AND X.VERSION = EIT.INVOICE_VERSION '
	     || 'AND INVOICE_DESCRIPTOR = :2 '
	     || 'AND PRODUCT_NO = :3 '
	     || 'AND UOM = :4 ) Y '
	     || 'WHERE A.POID_ID0 = Y.ACCOUNT_OBJ_ID0 '
	     || 'AND ESA.POID_ID0 = Y.SITE_ADDRESS_OBJ_ID0 '
	     || 'ORDER BY A.ACCOUNT_NO ASC ';


    IF NOT inv_sum_site_dr_cursor%ISOPEN
    THEN
        DBMS_OUTPUT.PUT_LINE('Open inv_sum_site_dr_cursor');
        OPEN inv_sum_site_dr_cursor FOR SqlQuery USING InvoiceNo, InvoiceDescriptor, ProductNo, UOM;
    END IF;

	DBMS_OUTPUT.PUT_LINE('Create entry in ENT_INVOICE_SUMMARY_SITELIST_T');
	LOOP
		FETCH inv_sum_site_dr_cursor INTO inv_sum_site_dr_cursor_rec;
		EXIT WHEN inv_sum_site_dr_cursor%NOTFOUND;

		SiteAccountNo := inv_sum_site_dr_cursor_rec.ACCOUNT_NO;
		HNSLocationID := inv_sum_site_dr_cursor_rec.HNS_LOCATION_ID;
		CustomerLocationID := inv_sum_site_dr_cursor_rec.CUST_LOCATION_ID;
		CustomerSiteID := inv_sum_site_dr_cursor_rec.HNS_CUST_SITE_ID;

		DBMS_OUTPUT.PUT_LINE('Fetched Record :' || SiteAccountNo || ', ' || HNSLocationID || ', ' || CustomerLocationID || ', ' || CustomerSiteID);

		INSERT INTO ENT_INVOICE_SUMMARY_SITELIST_T (INVOICE_SUMMARY_REC_ID, ACCOUNT_NO,HNS_LOCATION_ID,CUST_LOCATION_ID,HNS_CUST_SITE_ID)
		VALUES (InvSummaryRecId, SiteAccountNo,HNSLocationID,CustomerLocationID,CustomerSiteID);
	END LOOP;

    IF inv_sum_site_dr_cursor%ISOPEN
    THEN
    CLOSE inv_sum_site_dr_cursor;
    END IF;

END LOOP;

IF invoice_summary_dr_cursor%ISOPEN
THEN
    CLOSE invoice_summary_dr_cursor;
END IF;

-- DR Item Summary End --

IF NOT usf_summary_cursor%ISOPEN
THEN
    DBMS_OUTPUT.PUT_LINE('Cursor usf_summary_cursor opened');
    OPEN usf_summary_cursor(InvoiceNo);
END IF;

UsfAmount := 0;
UsfTaxAmount := 0;
LOOP
    FETCH usf_summary_cursor INTO usf_summary_cursor_rec;
    EXIT WHEN NOT usf_summary_cursor%FOUND;

    ItemType := usf_summary_cursor_rec.ITEM_TYPE;

    IF ItemType = 'S'
    THEN
        UsfDescriptor := usf_summary_cursor_rec.USF_DESCRIPTOR;
        UsfProductNo := usf_summary_cursor_rec.USF_PRODUCT_NO;
        UsfAmount := UsfAmount + usf_summary_cursor_rec.USF_AMOUNT;
    ELSE
        UsfTaxAmount := UsfTaxAmount + usf_summary_cursor_rec.USF_AMOUNT;
    END IF;

END LOOP;

DBMS_OUTPUT.PUT_LINE('UsfAmount:' || UsfAmount);
DBMS_OUTPUT.PUT_LINE('UsfTaxAmount:' || UsfTaxAmount);
DBMS_OUTPUT.PUT_LINE('UsfDescriptor:' || UsfDescriptor);
DBMS_OUTPUT.PUT_LINE('UsfProductNo:' || UsfProductNo);

IF UsfAmount != 0
THEN
    SELECT ENT_INVOICE_SUMMARY_T_SEQ.NEXTVAL INTO InvSummaryRecId FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('InvoiceSummaryRecId:' || InvSummaryRecId);
    INSERT INTO ENT_INVOICE_SUMMARY_T (INVOICE_NO, SUMMARY_REC_ID, PRODUCT_NO, INVOICE_DESCRIPTOR, EXTENDED_PRICE,TAX_AMOUNT, SUMMARY_TYPE)
    VALUES (InvoiceNo, InvSummaryRecId, UsfProductNo, UsfDescriptor, UsfAmount, UsfTaxAmount, 'T');
END IF;

IF usf_summary_cursor%ISOPEN
THEN
    CLOSE usf_summary_cursor;
END IF;

--Special Tax Summary
IF NOT spTax_SummaryType_cursor%ISOPEN
THEN
    DBMS_OUTPUT.PUT_LINE('Cursor specialTax_SummaryType_cursor opened');
    OPEN spTax_SummaryType_cursor();
END IF;

LOOP
    FETCH spTax_SummaryType_cursor INTO spTax_SummaryType_cursor_rec;
    EXIT WHEN NOT spTax_SummaryType_cursor%FOUND;

    SpecialTaxSummaryType := spTax_SummaryType_cursor_rec.SUMMARY_GROUP;
    DBMS_OUTPUT.PUT_LINE('SpecialTaxSummaryType:' || SpecialTaxSummaryType);
    SpecialTaxInvDesc := spTax_SummaryType_cursor_rec.INVOICE_DESCRIPTOR;
    DBMS_OUTPUT.PUT_LINE('SpecialTaxInvDesc:' || SpecialTaxInvDesc);
    SpecialTaxProductNo := spTax_SummaryType_cursor_rec.PRODUCT_NO;
    DBMS_OUTPUT.PUT_LINE('SpecialTaxProductNo:' || SpecialTaxProductNo);

    SqlQuery := 'SELECT DECODE(SUM(EIIT.EXTENDED_PRICE),NULL,0,SUM(EIIT.EXTENDED_PRICE)) AS TOTAL_AMOUNT '
        ||  'FROM ENT_INVOICE_ITEMS_T EIIT, '
        ||  '( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID '
        ||  'FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV '
        ||  'WHERE EII.INVOICE_VERSION <= EIV.VERSION '
        ||  'AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID '
        ||  'AND EIV.INVOICE_NO = :1 '
        ||  'GROUP BY BASE_ITEM_REC_ID ) X '
        ||    'WHERE X.BASE_ITEM_REC_ID = EIIT.BASE_ITEM_REC_ID '
        ||  'AND X.VERSION = EIIT.INVOICE_VERSION '
        ||    'AND EIIT.ITEM_TYPE IN '
        ||    '(SELECT ITEM_TYPE '
        ||    'FROM ENT_ALL_TAX_RATE_TAG_MAP_T '
        ||    'WHERE SUMMARY_GROUP = :2 '
        ||    'AND ITEM_TYPE NOT LIKE :3 ) ';

    EXECUTE IMMEDIATE SqlQuery INTO SpecialTaxTotalAmount USING InvoiceNo, SpecialTaxSummaryType, 'ST%';
    DBMS_OUTPUT.PUT_LINE('SpecialTaxTotalAmount:' || SpecialTaxTotalAmount);

    IF SpecialTaxTotalAmount != 0
    THEN
        SqlQuery := 'SELECT DECODE(SUM(EIIT.EXTENDED_PRICE),NULL,0,SUM(EIIT.EXTENDED_PRICE)) AS TOTAL_AMOUNT '
            ||  'FROM ENT_INVOICE_ITEMS_T EIIT, '
            ||  '( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID '
            ||  'FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV '
            ||  'WHERE EII.INVOICE_VERSION <= EIV.VERSION '
            ||  'AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID '
            ||  'AND EIV.INVOICE_NO = :1 '
            ||  'GROUP BY BASE_ITEM_REC_ID ) X '
            ||    'WHERE X.BASE_ITEM_REC_ID = EIIT.BASE_ITEM_REC_ID '
            ||  'AND X.VERSION = EIIT.INVOICE_VERSION '
            ||    'AND EIIT.ITEM_TYPE IN '
            ||    '(SELECT ITEM_TYPE '
            ||    'FROM ENT_ALL_TAX_RATE_TAG_MAP_T '
            ||    'WHERE SUMMARY_GROUP = :2 '
            ||    'AND ITEM_TYPE LIKE :3 ) ';

        EXECUTE IMMEDIATE SqlQuery INTO SalesTaxOnSpecialTax USING InvoiceNo, SpecialTaxSummaryType, 'ST%';
        DBMS_OUTPUT.PUT_LINE('SalesTaxOnSpecialTax:' || SalesTaxOnSpecialTax);

        SELECT ENT_INVOICE_SUMMARY_T_SEQ.NEXTVAL INTO InvSummaryRecId FROM DUAL;
        DBMS_OUTPUT.PUT_LINE('InvoiceSummaryRecId:' || InvSummaryRecId);

        INSERT INTO ENT_INVOICE_SUMMARY_T (INVOICE_NO, SUMMARY_REC_ID, PRODUCT_NO, INVOICE_DESCRIPTOR, EXTENDED_PRICE, TAX_AMOUNT,SUMMARY_TYPE)
        VALUES (InvoiceNo, InvSummaryRecId, SpecialTaxProductNo, SpecialTaxInvDesc,SpecialTaxTotalAmount,SalesTaxOnSpecialTax,'T');
    END IF;

END LOOP;

IF spTax_SummaryType_cursor%ISOPEN
THEN
    CLOSE spTax_SummaryType_cursor;
END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'No Data found - '||SQLCODE||' -ERROR- '||SQLERRM);
    WHEN OTHERS THEN
        raise_application_error(-20002,'Unknown Error - '||SQLCODE||' -ERROR- '||SQLERRM);

END EntCreateInvoiceSummary;

/
--------------------------------------------------------
--  DDL for Procedure ENTCREATELOCATIONSUMMARY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."ENTCREATELOCATIONSUMMARY" 
(InvoiceNo IN VARCHAR2)

IS

CURSOR location_summary_cursor(InvNo VARCHAR2)
IS
SELECT SUM(EIT.EXTENDED_PRICE) AS EXTENDED_PRICE,
SUM(EIT.QUANTITY) AS QUANTITY,EIT.service_category_name,
EIT.hns_location_id
FROM ENT_INVOICE_ITEMS_T EIT,
( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID
FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV
WHERE EII.INVOICE_VERSION <= EIV.VERSION
AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID
AND EIV.INVOICE_NO = InvNo
GROUP BY BASE_ITEM_REC_ID ) X
where  X.BASE_ITEM_REC_ID=EIT.BASE_ITEM_REC_ID
AND X.VERSION=EIT.INVOICE_VERSION
AND EIT.SUPER_PARENT_ID IS NULL
AND EIT.ITEM_TYPE='S'
AND (UPPER(EIT.PRODUCT_NO) NOT LIKE '%USF%' AND UPPER(EIT.PRODUCT_NO) NOT LIKE '%UNIVERSAL SERVICE FEE%')
GROUP BY EIT.hns_location_id,EIT.service_category_name
ORDER BY EIT.hns_location_id,EIT.service_category_name;


CURSOR loc_summary_temp_cur(InvNo VARCHAR2)
IS
SELECT distinct(hns_location_id) as HNS_LOCATION_ID from ent_location_summary_temp_t where invoice_no = InvNo;

CURSOR usf_summary_cursor(InvNo VARCHAR2)
IS
SELECT SUM(EIT.EXTENDED_PRICE) AS USF_AMOUNT,
EIT.hns_location_id AS USF_HNS_LOCATION_ID
FROM ENT_INVOICE_ITEMS_T EIT,
( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID
FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV
WHERE EII.INVOICE_VERSION <= EIV.VERSION
AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID
AND EIV.INVOICE_NO = InvNo
GROUP BY BASE_ITEM_REC_ID ) X
WHERE X.BASE_ITEM_REC_ID=EIT.BASE_ITEM_REC_ID
AND X.VERSION=EIT.INVOICE_VERSION
AND EIT.ITEM_TYPE = 'S'
AND (UPPER(EIT.PRODUCT_NO) LIKE '%USF%' OR UPPER(EIT.PRODUCT_NO) LIKE '%UNIVERSAL SERVICE FEE%')
group by EIT.hns_location_id;

CURSOR spTax_summaryType_cursor(InvNo VARCHAR2)
IS
SELECT DECODE(SUM(EIIT.EXTENDED_PRICE),NULL,0,SUM(EIIT.EXTENDED_PRICE)) AS TOTAL_AMOUNT, EIIT.HNS_LOCATION_ID AS SPTAX_HNS_LOCATION_ID
FROM ENT_INVOICE_ITEMS_T EIIT,
( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID
FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV
WHERE EII.INVOICE_VERSION <= EIV.VERSION
AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID
AND EIV.INVOICE_NO = InvNo
GROUP BY BASE_ITEM_REC_ID ) X
WHERE X.BASE_ITEM_REC_ID = EIIT.BASE_ITEM_REC_ID
AND X.VERSION = EIIT.INVOICE_VERSION
AND EIIT.ITEM_TYPE IN
(select item_type from ENT_ALL_TAX_RATE_TAG_MAP_T where summary_group in (
SELECT SUMMARY_GROUP FROM ENT_TAX_SUMMARY_DISPLAY_T)  and item_type not like 'ST%') group by EIIT.HNS_LOCATION_ID ;


--TYPE cur_typ IS REF CURSOR;
--TYPE rec_typ IS RECORD (ACCOUNT_NO VARCHAR2(60), HNS_LOCATION_ID VARCHAR2(15), CUST_LOCATION_ID VARCHAR2(20), HNS_CUST_SITE_ID VARCHAR2(20));

location_summary_cursor_rec location_summary_cursor%ROWTYPE;
loc_summary_temp_cur_rec loc_summary_temp_cur%ROWTYPE;
usf_summary_cursor_rec usf_summary_cursor%ROWTYPE;
spTax_summaryType_cursor_rec spTax_summaryType_cursor%ROWTYPE;

IsHANFlag varchar2(60);
ItemType VARCHAR2(10);
Quantity NUMBER(18, 2);
SqlQuery VARCHAR2(1024);
TotalAmount DECIMAL(18,2) := 0;
ExtendedPrice DECIMAL(18,2) := 0;
TotalTax DECIMAL(18,2) :=0;
AccountNo varchar2(255);
BundledFlag varchar2(60);
SiteAddressObjID number(38);
HNSLocationID VARCHAR2(60);
HNSLocationIDDistinct VARCHAR2(60);
ServiceCategoryName VARCHAR2(255);
UsfAmount DECIMAL(18,2) := 0;
UsfTaxAmount DECIMAL(18,2) := 0;
UsfTotalTaxAmount DECIMAL(18,2) := 0;
UsfHnsLocationId VARCHAR2(255);
SpecialTaxSummaryType VARCHAR2(10);
SpecialTaxHnsLocationId VARCHAR2(255);
SpecialTaxServiceCategoryName VARCHAR2(255);
SpecialTaxTotalAmount DECIMAL(18,2) := 0;
SalesTaxOnSpecialTax DECIMAL(18,2) := 0;
SpecialTaxTotalTaxAmount DECIMAL(18,2) := 0;

BEGIN
	AccountNo := GET_ACCNO_FROM_INVNO(InvoiceNo);
	BundledFlag := IS_BUNDLED(AccountNo);
	IF BundledFlag = 'FALSE'
	THEN
    IF NOT location_summary_cursor%ISOPEN
    THEN
      OPEN location_summary_cursor(InvoiceNo);
    END IF;

      LOOP
      FETCH location_summary_cursor INTO location_summary_cursor_rec;
      EXIT WHEN NOT location_summary_cursor%FOUND;

      HNSLocationID := location_summary_cursor_rec.HNS_LOCATION_ID;

      ServiceCategoryName := location_summary_cursor_rec.SERVICE_CATEGORY_NAME;
      Quantity := location_summary_cursor_rec.QUANTITY;

      ExtendedPrice := location_summary_cursor_rec.EXTENDED_PRICE;
      select eit.site_address_obj_id0 into SiteAddressObjID from ent_invoice_items_t eit, ( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID
      FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV
      WHERE EII.INVOICE_VERSION <= EIV.VERSION
      AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID
      AND EIV.INVOICE_NO = InvoiceNo
      GROUP BY BASE_ITEM_REC_ID ) X where eit.Base_Item_Rec_Id = X.Base_Item_Rec_Id and eit.hns_location_id=HNSLocationID and rownum <=1;




      SqlQuery := 'SELECT SUM(EXTENDED_PRICE) AS TOTAL_TAX FROM ENT_INVOICE_ITEMS_T '
              || 'WHERE PARENT_ID IN '
                      || '( SELECT EIT.ITEM_REC_ID '
              || 'FROM ENT_INVOICE_ITEMS_T EIT, '
              || '( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID '
              || 'FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV '
              || 'WHERE EII.INVOICE_VERSION <= EIV.VERSION '
                      || 'AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID '
                      || 'AND EIV.INVOICE_NO = :1 '
                      || 'AND (UPPER(EII.PRODUCT_NO) NOT LIKE :2 AND UPPER(EII.PRODUCT_NO) NOT LIKE :3)'
                      || 'GROUP BY BASE_ITEM_REC_ID ) X '
                      || 'WHERE X.BASE_ITEM_REC_ID = EIT.BASE_ITEM_REC_ID '
              || 'AND X.VERSION = EIT.INVOICE_VERSION '
              || 'AND SERVICE_CATEGORY_NAME = :4 '
              || 'AND HNS_LOCATION_ID = :5 )'
              ||  'AND ITEM_TYPE = :6 ';

      EXECUTE IMMEDIATE SqlQuery INTO TotalTax USING InvoiceNo, '%USF%','%UNIVERSAL SERVICE FEE%', ServiceCategoryName, HNSLocationID, 'ST';
      TotalAmount := ExtendedPrice+TotalTax;
      INSERT INTO ENT_LOCATION_SUMMARY_T (INVOICE_NO, HNS_LOCATION_ID,SERVICE_CATEGORY_NAME, SERVICE_CATEGORY_DESCRIPTOR, SITE_ADDRESS_OBJ_ID0, EXTENDED_PRICE, TAX_AMOUNT, TOTAL_PRICE, QUANTITY,SUMMARY_TYPE )
      VALUES (InvoiceNo,  HNSLocationID, ServiceCategoryName, ServiceCategoryName, SiteAddressObjID, ExtendedPrice, TotalTax, TotalAmount ,Quantity,'S');
    END LOOP;

    IF location_summary_cursor%ISOPEN
    THEN
            CLOSE location_summary_cursor;
    END IF;
  ELSE
    IF NOT location_summary_cursor%ISOPEN
    THEN
      OPEN location_summary_cursor(InvoiceNo);
    END IF;
  LOOP
   --   DBMS_OUTPUT.PUT_LINE('Summary record number ' ||  TO_CHAR (location_summary_cursor%ROWCOUNT));
      FETCH location_summary_cursor INTO location_summary_cursor_rec;
      EXIT WHEN NOT location_summary_cursor%FOUND;

      HNSLocationID := location_summary_cursor_rec.HNS_LOCATION_ID;
    --  DBMS_OUTPUT.PUT_LINE('HNSLocationID_True:' || HNSLocationID);

      ServiceCategoryName := location_summary_cursor_rec.SERVICE_CATEGORY_NAME;
    --  DBMS_OUTPUT.PUT_LINE('ServiceCategoryName_True:' || ServiceCategoryName);


      Quantity := location_summary_cursor_rec.QUANTITY;
   --   DBMS_OUTPUT.PUT_LINE('Quantity_True:' || quantity);

      ExtendedPrice := location_summary_cursor_rec.EXTENDED_PRICE;
   --   DBMS_OUTPUT.PUT_LINE('ExtendedPrice_True:' || ExtendedPrice);

      select eit.site_address_obj_id0 into SiteAddressObjID from ent_invoice_items_t eit, ( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID
      FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV
      WHERE EII.INVOICE_VERSION <= EIV.VERSION
      AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID
      AND EIV.INVOICE_NO = InvoiceNo
      GROUP BY BASE_ITEM_REC_ID ) X where eit.Base_Item_Rec_Id = X.Base_Item_Rec_Id and eit.hns_location_id=HNSLocationID and rownum <=1;

   --   DBMS_OUTPUT.PUT_LINE('SiteAddressObjID_True:' || SiteAddressObjID);


      SqlQuery := 'SELECT SUM(EXTENDED_PRICE) AS TOTAL_TAX FROM ENT_INVOICE_ITEMS_T '
              || 'WHERE PARENT_ID IN '
                      || '( SELECT EIT.ITEM_REC_ID '
              || 'FROM ENT_INVOICE_ITEMS_T EIT, '
              || '( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID '
              || 'FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV '
              || 'WHERE EII.INVOICE_VERSION <= EIV.VERSION '
                      || 'AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID '
                      || 'AND EIV.INVOICE_NO = :1 '
                        || 'AND (UPPER(EII.PRODUCT_NO) NOT LIKE :2 AND UPPER(EII.PRODUCT_NO) NOT LIKE :3)'
                      || 'GROUP BY BASE_ITEM_REC_ID ) X '
                      || 'WHERE X.BASE_ITEM_REC_ID = EIT.BASE_ITEM_REC_ID '
              || 'AND X.VERSION = EIT.INVOICE_VERSION '
              || 'AND SERVICE_CATEGORY_NAME = :4 '
              || 'AND HNS_LOCATION_ID = :5 )'
              ||  'AND ITEM_TYPE = :6 ';

      EXECUTE IMMEDIATE SqlQuery INTO TotalTax USING InvoiceNo,'%USF%','%UNIVERSAL SERVICE FEE%', ServiceCategoryName, HNSLocationID, 'ST';
 --     DBMS_OUTPUT.PUT_LINE('TotalTax_True:' || TotalTax);
     TotalAmount := ExtendedPrice+TotalTax;
      DBMS_OUTPUT.PUT_LINE('TotalAmount_True:' || TotalAmount);
      DBMS_OUTPUT.PUT_LINE('Creating entry in ENT_LOCATION_SUMMARY_TEMP_T');
      INSERT INTO ENT_LOCATION_SUMMARY_TEMP_T (INVOICE_NO, HNS_LOCATION_ID,SERVICE_CATEGORY_NAME, SERVICE_CATEGORY_DESCRIPTOR, SITE_ADDRESS_OBJ_ID0, EXTENDED_PRICE, TAX_AMOUNT, TOTAL_PRICE, QUANTITY,SUMMARY_TYPE,ISHAN, ISAB)
      VALUES (InvoiceNo,  HNSLocationID, ServiceCategoryName, ServiceCategoryName, SiteAddressObjID, ExtendedPrice, TotalTax, TotalAmount ,Quantity,'S',0,0);
    END LOOP;

   IF NOT loc_summary_temp_cur%ISOPEN
	 THEN
	--	 DBMS_OUTPUT.PUT_LINE('Cursor location_summary_temp_cur opened');
   OPEN loc_summary_temp_cur(InvoiceNo);
   END IF;
   LOOP
		--	DBMS_OUTPUT.PUT_LINE('Temporary Summary record number ' ||  TO_CHAR (loc_summary_temp_cur%ROWCOUNT));
			FETCH loc_summary_temp_cur INTO loc_summary_temp_cur_rec;
			EXIT WHEN NOT loc_summary_temp_cur%FOUND;

			Hnslocationiddistinct := Loc_Summary_Temp_Cur_Rec.Hns_Location_Id;
	--		DBMS_OUTPUT.PUT_LINE('HNSLocationID_Distinct:' || HNSLocationIDDistinct);

        	Hanconfigtype(Hnslocationiddistinct,Invoiceno,Accountno,Ishanflag);
		--		DBMS_OUTPUT.PUT_LINE('IsHANFlag_Distinct:' || IsHANFlag);


			IF IsHANFlag = 'FALSE'
			THEN
      			--	DBMS_OUTPUT.PUT_LINE('IsHANFlag_Distinct_AB:' || IsHANFlag);

				ABCONFIGTYPE(HNSLocationIDDistinct,InvoiceNo,AccountNo);
		END IF;

		END LOOP;
      IF loc_summary_temp_cur%ISOPEN
    THEN
            CLOSE loc_summary_temp_cur;
    END IF;
    IF location_summary_cursor%ISOPEN
    THEN
            CLOSE location_summary_cursor;
    END IF;
    -- Only HAN
insert into ENT_LOCATION_SUMMARY_T
( invoice_no,hns_location_id,service_category_name,service_category_descriptor,site_address_obj_id0,extended_price,tax_amount,total_price,SUMMARY_TYPE)
select t.invoice_no ,t.hns_location_id,X.service_category,X.service_category_desc,t.site_address_obj_id0,sum(t.extended_price) extended_price, sum(t.tax_amount) tax_amount, sum(t.total_price) total_price, t.SUMMARY_TYPE from ent_location_summary_temp_t t,
(select product_no as service_category, invoice_descriptor as service_category_desc from ENT_INVOICE_BUNDLE_T where account_no =AccountNo and type = 'HAN' and status =1 and rownum <= 1)X
where t.invoice_no = InvoiceNo
and t.ishan =1 group by t.invoice_no, t.hns_location_id, X.service_category, X.service_category_desc, t.site_address_obj_id0,t.SUMMARY_TYPE;

-- Only AB

insert into ENT_LOCATION_SUMMARY_T
( invoice_no,hns_location_id,service_category_name,service_category_descriptor,site_address_obj_id0,extended_price,tax_amount,total_price,SUMMARY_TYPE)
select t.invoice_no ,t.hns_location_id,X.service_category,X.service_category_desc,t.site_address_obj_id0,sum(t.extended_price) extended_price, sum(t.tax_amount) tax_amount, sum(t.total_price) total_price,t.SUMMARY_TYPE from ent_location_summary_temp_t t,
(select distinct eib.product_no as service_category, eib.invoice_descriptor as service_category_desc, eibs.category_name  category_name from ENT_INVOICE_BUNDLE_T eib,ENT_INVOICE_BUNDLE_SERVICES_T eibs
  where eib.rec_id = eibs.bundle_rec_id
  and eib.account_no =AccountNo and eib.type = 'Active Bonding' and eib.status =1 )X
where t.invoice_no = InvoiceNo
and t.isab =1
and t.service_category_name = X.category_name
group by t.invoice_no, t.hns_location_id, X.service_category, X.service_category_desc, t.site_address_obj_id0,t.SUMMARY_TYPE;


-- Neither HAN Nor AB

insert into ENT_LOCATION_SUMMARY_T
( invoice_no,hns_location_id,service_category_name,service_category_descriptor,site_address_obj_id0,extended_price,tax_amount,total_price,SUMMARY_TYPE)
select t.invoice_no ,t.hns_location_id,t.service_category_name,t.service_category_descriptor,t.site_address_obj_id0,t.extended_price, t.tax_amount, t.total_price,t.SUMMARY_TYPE from ent_location_summary_temp_t t
where t.invoice_no = InvoiceNo
and t.ishan !=1
And T.Isab != 1;
			--DBMS_OUTPUT.PUT_LINE('Going to Delete');

    -- truncating ENT_LOCATION_SUMMARY_TEMP_T
		DELETE FROM ENT_LOCATION_SUMMARY_TEMP_T WHERE INVOICE_NO = InvoiceNo;
 -- execute immediate 'delete  from ent_location_summary_temp_t where invoice_no=InvoiceNo;';
   		--DBMS_OUTPUT.PUT_LINE('Deleted successfully !!!');
  END IF;

  -- calculating usf

    IF NOT usf_summary_cursor%ISOPEN
    Then
        --DBMS_OUTPUT.PUT_LINE('Cursor usf_summary_cursor opened');
        OPEN usf_summary_cursor(InvoiceNo);
    END IF;

    UsfAmount := 0;
    UsfTaxAmount := 0;
    LOOP
        FETCH usf_summary_cursor INTO usf_summary_cursor_rec;
        EXIT WHEN NOT usf_summary_cursor%FOUND;

           UsfHnsLocationId := usf_summary_cursor_rec.USF_HNS_LOCATION_ID;
           UsfAmount := usf_summary_cursor_rec.USF_AMOUNT;
          SqlQuery := 'SELECT SUM(EXTENDED_PRICE) AS TOTAL_TAX FROM ENT_INVOICE_ITEMS_T '
              || 'WHERE PARENT_ID IN '
                      || '( SELECT EIT.ITEM_REC_ID '
              || 'FROM ENT_INVOICE_ITEMS_T EIT, '
              || '( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID '
              || 'FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV '
              || 'WHERE EII.INVOICE_VERSION <= EIV.VERSION '
                      || 'AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID '
                      || 'AND EIV.INVOICE_NO = :1 '
                      || 'AND (UPPER(EII.PRODUCT_NO) LIKE :2'
                      || ' OR UPPER(EII.PRODUCT_NO) LIKE :3 )'
                      || 'GROUP BY BASE_ITEM_REC_ID ) X '
                      || 'WHERE X.BASE_ITEM_REC_ID = EIT.BASE_ITEM_REC_ID '
              || 'AND X.VERSION = EIT.INVOICE_VERSION '
              || 'AND HNS_LOCATION_ID = :4 )'
              ||  'AND ITEM_TYPE = :5 ';

               EXECUTE IMMEDIATE SqlQuery INTO UsfTaxAmount USING InvoiceNo, '%USF%','%UNIVERSAL SERVICE FEE%', UsfHnsLocationId, 'ST';
        UsfTotalTaxAmount := UsfAmount+UsfTaxAmount;


    IF UsfAmount != 0
    THEN
        INSERT INTO ENT_LOCATION_SUMMARY_T (INVOICE_NO, HNS_LOCATION_ID, SERVICE_CATEGORY_NAME, SERVICE_CATEGORY_DESCRIPTOR,SITE_ADDRESS_OBJ_ID0,  EXTENDED_PRICE,TAX_AMOUNT,TOTAL_PRICE, SUMMARY_TYPE)
        VALUES (InvoiceNo, UsfHnsLocationId , 'Universal Service Fees','USF Charges',SiteAddressObjID,  UsfAmount, UsfTaxAmount,UsfTotalTaxAmount, 'T');
    END IF;

    END LOOP;



    IF usf_summary_cursor%ISOPEN
    THEN
        CLOSE usf_summary_cursor;
    END IF;

    --Special Tax Summary
    IF NOT spTax_SummaryType_cursor%ISOPEN
    THEN
        OPEN spTax_SummaryType_cursor(InvoiceNo);
    END IF;

    LOOP
        FETCH spTax_SummaryType_cursor INTO spTax_SummaryType_cursor_rec;
        EXIT WHEN NOT spTax_SummaryType_cursor%FOUND;

        Specialtaxtotalamount := Sptax_Summarytype_Cursor_Rec.Total_Amount;
        --DBMS_OUTPUT.PUT_LINE('SpecialTaxTotalAmount:' || SpecialTaxTotalAmount);
        Specialtaxhnslocationid := Sptax_Summarytype_Cursor_Rec.Sptax_Hns_Location_Id;
        --DBMS_OUTPUT.PUT_LINE('SpecialTaxHnsLocationId:' || SpecialTaxHnsLocationId);
    IF SpecialTaxTotalAmount != 0
        THEN

    SqlQuery :=  'SELECT DECODE(SUM(EIIT.EXTENDED_PRICE),NULL,0,SUM(EIIT.EXTENDED_PRICE)) AS TOTAL_AMOUNT '
                || 'FROM ENT_INVOICE_ITEMS_T EIIT, '
                || '( SELECT MAX(EII.INVOICE_VERSION) AS VERSION, BASE_ITEM_REC_ID  '
                || 'FROM ENT_INVOICE_ITEMS_T EII, ENT_INVOICE_VERSION_T EIV '
                || 'WHERE EII.INVOICE_VERSION <= EIV.VERSION  '
                || 'AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID '
                || 'AND EIV.INVOICE_NO =  :1 '
                || 'GROUP BY BASE_ITEM_REC_ID ) X  '
                || 'WHERE X.BASE_ITEM_REC_ID = EIIT.BASE_ITEM_REC_ID  '
                || 'AND X.VERSION = EIIT.INVOICE_VERSION '
                || 'AND EIIT.HNS_LOCATION_ID =  :2 '
                || 'AND EIIT.ITEM_TYPE IN '
                || '(select item_type from ENT_ALL_TAX_RATE_TAG_MAP_T where summary_group in ( '
                || 'SELECT SUMMARY_GROUP FROM ENT_TAX_SUMMARY_DISPLAY_T)  and item_type like :3)';

               EXECUTE IMMEDIATE SqlQuery INTO SalesTaxOnSpecialTax USING InvoiceNo, SpecialTaxHnsLocationId, 'ST%';
               SpecialTaxTotalTaxAmount := SpecialTaxTotalAmount+SalesTaxOnSpecialTax;

           INSERT INTO ENT_LOCATION_SUMMARY_T (INVOICE_NO, HNS_LOCATION_ID, SERVICE_CATEGORY_NAME, SERVICE_CATEGORY_DESCRIPTOR,SITE_ADDRESS_OBJ_ID0,  EXTENDED_PRICE,TAX_AMOUNT,TOTAL_PRICE, SUMMARY_TYPE)
            VALUES (InvoiceNo, SpecialTaxHnsLocationId, 'COMM TAXES &'||' FEES','County', SiteAddressObjID,SpecialTaxTotalAmount,SalesTaxOnSpecialTax,SpecialTaxTotalTaxAmount,'T');
        END IF;

    END LOOP;

    IF spTax_SummaryType_cursor%ISOPEN
    THEN
        CLOSE spTax_SummaryType_cursor;
    END IF;


    insert into ENT_SERVICE_CATEGORY_SUMMARY_T
    (INVOICE_NO,SERVICE_CATEGORY_NAME,SERVICE_CATEGORY_DESCRIPTOR,NO_OF_LOCATION ,SUMMARY_TYPE,EXTENDED_PRICE )
    select invoice_no,service_category_name, service_category_descriptor, count(*) as total_location, SUMMARY_TYPE, sum(extended_price) from ENT_LOCATION_SUMMARY_T where invoice_no = InvoiceNo group by service_category_name, service_category_descriptor,SUMMARY_TYPE,invoice_no;



EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'No Data found - '||SQLCODE||' -ERROR- '||SQLERRM);
    WHEN OTHERS THEN
        raise_application_error(-20002,'Unknown Error - '||SQLCODE||' -ERROR- '||SQLERRM);

END EntCreateLocationSummary;

/
--------------------------------------------------------
--  DDL for Procedure ENTEXTRACTEXCISETAX
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."ENTEXTRACTEXCISETAX" 
(RuntimeT IN VARCHAR2,
 StartExtractT IN INTEGER,
 EndExtractT IN INTEGER,
 GlSegment IN VARCHAR2)

IS

--------------------------------------------------------------------
-- build search for events.  It will make two searches,
-- the first time it searches for those amounts > 0 and then those
-- < 0 to get the refunds, adjustments, etc.  Otherwise it would
-- summarize/aggregate everything into a single value and while the
-- end result is the same, it may not be desirable.

-- In EVENT_T table, created_t and mod_t columns will have same values
-- when there is no rerating. Portal doesn't have rerating in Infranet6.2
-- but it is possible in Infranet7.0. But right now in our system we
-- don't have rerating. But in future if we use rerating concept, then we
-- need to review this query.
--------------------------------------------------------------------

CURSOR extract_excise_tax_cursor
IS
(SELECT SUM(X.AMOUNT) AS "AMOUNT", X.STATE AS "STATE"
FROM
(SELECT EII.EXTENDED_PRICE AMOUNT, ESA.STATE STATE
FROM ENT_INVOICE_ITEMS_T EII, ENT_SITE_ADDRESS_T ESA, ENT_INVOICE_VERSION_T EIV,
ACCOUNT_T A
WHERE ESA.POID_ID0 = EII.SITE_ADDRESS_OBJ_ID0
AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID
AND EII.ITEM_TYPE IN ('ETS','ETC','ETCY','USFETS','USFETC','USFETCY')
AND EII.EXTENDED_PRICE > 0
AND EII.INVOICE_VERSION = 1
AND EII.CREATED_T >= StartExtractT
AND EII.CREATED_T < EndExtractT
AND EIV.STATUS = 3 AND EIV.VERSION=1
AND ESA.ACCOUNT_OBJ_ID0 = A.POID_ID0
AND A.GL_SEGMENT LIKE GlSegment || '%'
UNION ALL
SELECT ECMI.AMOUNT AMOUNT, ESA.STATE  STATE
FROM
ENT_CREDIT_MEMO_T ECM, ENT_CREDIT_MEMO_ITEMS_T ECMI, ENT_INVOICE_ITEMS_T EII, ENT_SITE_ADDRESS_T ESA,
ACCOUNT_T A
WHERE ECM.CM_REC_ID = ECMI.CM_REC_ID
AND ECM.STATUS=3
AND EII.ITEM_REC_ID = ECMI.ITEM_REC_ID
AND EII.ITEM_TYPE IN ('ETS','ETC','ETCY','USFETS','USFETC','USFETCY')
AND ESA.POID_ID0 = EII.SITE_ADDRESS_OBJ_ID0
AND ECM.END_T >= StartExtractT
AND ECM.END_T < EndExtractT
AND ECMI.AMOUNT > 0
AND ESA.ACCOUNT_OBJ_ID0 = A.POID_ID0
AND A.GL_SEGMENT LIKE GlSegment || '%')X
GROUP BY X.STATE)
UNION ALL
(SELECT SUM(Y.AMOUNT) AS "AMOUNT", Y.STATE AS "STATE"
FROM
(SELECT EII.EXTENDED_PRICE AMOUNT, ESA.STATE STATE
FROM ENT_INVOICE_ITEMS_T EII, ENT_SITE_ADDRESS_T ESA, ENT_INVOICE_VERSION_T EIV,
ACCOUNT_T A
WHERE ESA.POID_ID0 = EII.SITE_ADDRESS_OBJ_ID0
AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID
AND EII.ITEM_TYPE IN ('ETS','ETC','ETCY','USFETS','USFETC','USFETCY')
AND EII.EXTENDED_PRICE < 0
AND EII.INVOICE_VERSION = 1
AND EII.CREATED_T >= StartExtractT
AND EII.CREATED_T < EndExtractT
AND EIV.STATUS = 3 AND EIV.VERSION=1
AND ESA.ACCOUNT_OBJ_ID0 = A.POID_ID0
AND A.GL_SEGMENT LIKE GlSegment || '%'
UNION ALL
SELECT ECMI.AMOUNT AMOUNT, ESA.STATE  STATE
FROM
ENT_CREDIT_MEMO_T ECM, ENT_CREDIT_MEMO_ITEMS_T ECMI, ENT_INVOICE_ITEMS_T EII, ENT_SITE_ADDRESS_T ESA,
ACCOUNT_T A
WHERE ECM.CM_REC_ID = ECMI.CM_REC_ID
AND ECM.STATUS=3
AND EII.ITEM_REC_ID = ECMI.ITEM_REC_ID
AND EII.ITEM_TYPE IN ('ETS','ETC','ETCY','USFETS','USFETC','USFETCY')
AND ESA.POID_ID0 = EII.SITE_ADDRESS_OBJ_ID0
AND ECM.END_T >= StartExtractT
AND ECM.END_T < EndExtractT
AND ECMI.AMOUNT < 0
AND ESA.ACCOUNT_OBJ_ID0 = A.POID_ID0
AND A.GL_SEGMENT LIKE GlSegment || '%')Y
GROUP BY Y.STATE);


extract_excise_tax_cursor_rec extract_excise_tax_cursor%ROWTYPE;
TaxUS_Total DECIMAL(12,2) := 0;
TotalAmount DECIMAL(12,2) := 0;
DocumentKey VARCHAR2(32);
StateValue VARCHAR2(255);

BEGIN

    DocumentKey := RuntimeT ;
    DBMS_OUTPUT.PUT_LINE('DocumentKey is ' || DocumentKey);
    DBMS_OUTPUT.PUT_LINE('StartT is ' || StartExtractT);
    DBMS_OUTPUT.PUT_LINE('EndT is ' || EndExtractT);
--------------------------------------------------------------------
-- Execute the search and walk through the fetched records
--------------------------------------------------------------------
    --Open the cursor
    IF NOT extract_excise_tax_cursor%ISOPEN
    THEN
        DBMS_OUTPUT.PUT_LINE('Cursor opened');
        OPEN extract_excise_tax_cursor;
    END IF;

    --Fetch row from cursor directly into an Oracle Forms item
       LOOP
              DBMS_OUTPUT.PUT_LINE('Just fetched record number ' ||  TO_CHAR (extract_excise_tax_cursor%ROWCOUNT));
              FETCH extract_excise_tax_cursor INTO extract_excise_tax_cursor_rec;
          EXIT WHEN NOT extract_excise_tax_cursor%FOUND;

        -- convert US; XX; to usable date field
        StateValue := extract_excise_tax_cursor_rec.state;
            DBMS_OUTPUT.PUT_LINE('StateValue is ' || StateValue);

        -- add to running total
        TaxUS_Total := TaxUS_Total + (extract_excise_tax_cursor_rec.amount * (1));
        DBMS_OUTPUT.PUT_LINE('Tax is ' || TaxUS_Total);

        TotalAmount := (extract_excise_tax_cursor_rec.amount * (-1));

        -- build the document record
        INSERT INTO ENT_TAX_LEDGER_DATA_T (REPORT_KEY, STATE, AMOUNT) VALUES (DocumentKey, StateValue, TotalAmount);
        END LOOP;

    --Close the cursor
        IF extract_excise_tax_cursor%ISOPEN
    THEN
           CLOSE extract_excise_tax_cursor;
    END IF;

--------------------------------------------------------------------
-- write TaxUS Offset entry
--------------------------------------------------------------------
    INSERT INTO ENT_TAX_LEDGER_DATA_T (REPORT_KEY, STATE, AMOUNT) VALUES (DocumentKey, 'US', TaxUS_Total);

--------------------------------------------------------------------
-- write audit record, finalize and close the program.
--------------------------------------------------------------------
    DBMS_OUTPUT.PUT_LINE('DocKey is ' || DocumentKey);
    DBMS_OUTPUT.PUT_LINE('StartExtract is ' || StartExtractT);
    DBMS_OUTPUT.PUT_LINE('EndExtract is ' || EndExtractT);

UPDATE ENT_TAX_LEDGER_REPORT_T SET STATUS='G' WHERE REPORT_KEY=DocumentKey;
COMMIT;

EXCEPTION
    WHEN OTHERS THEN
         BEGIN
             ROLLBACK;
             UPDATE ENT_TAX_LEDGER_REPORT_T SET STATUS='E' WHERE REPORT_KEY=DocumentKey;
             COMMIT;
         EXCEPTION
             WHEN OTHERS THEN
                  ROLLBACK;
                  raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
            END;

END EntExtractExciseTax;

/
--------------------------------------------------------
--  DDL for Procedure ENTEXTRACTTAX
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."ENTEXTRACTTAX" 
(RuntimeT IN VARCHAR2,
 StartExtractT IN INTEGER,
 EndExtractT IN INTEGER,
 GlSegment IN VARCHAR2)

IS

--------------------------------------------------------------------
-- build search for events.  It will make two searches,
-- the first time it searches for those amounts > 0 and then those
-- < 0 to get the refunds, adjustments, etc.  Otherwise it would
-- summarize/aggregate everything into a single value and while the
-- end result is the same, it may not be desirable.

-- In EVENT_T table, created_t and mod_t columns will have same values
-- when there is no rerating. Portal doesn't have rerating in Infranet6.2
-- but it is possible in Infranet7.0. But right now in our system we
-- don't have rerating. But in future if we use rerating concept, then we
-- need to review this query.
--------------------------------------------------------------------

CURSOR extract_tax_cursor
IS
(SELECT SUM(X.AMOUNT) AS "AMOUNT", X.STATE AS "STATE"
FROM
(SELECT EII.EXTENDED_PRICE AMOUNT, ESA.STATE STATE
FROM ENT_INVOICE_ITEMS_T EII, ENT_SITE_ADDRESS_T ESA, ENT_INVOICE_VERSION_T EIV,
ACCOUNT_T A
WHERE ESA.POID_ID0 = EII.SITE_ADDRESS_OBJ_ID0
AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID
AND EII.ITEM_TYPE LIKE '%ST%'
AND EII.EXTENDED_PRICE > 0
AND EII.INVOICE_VERSION = 1
AND EII.CREATED_T >= StartExtractT
AND EII.CREATED_T < EndExtractT
AND EIV.STATUS = 3 AND EIV.VERSION=1
AND ESA.ACCOUNT_OBJ_ID0 = A.POID_ID0
AND A.GL_SEGMENT LIKE GlSegment || '%'
UNION ALL
SELECT ECMI.AMOUNT AMOUNT, ESA.STATE  STATE
FROM
ENT_CREDIT_MEMO_T ECM, ENT_CREDIT_MEMO_ITEMS_T ECMI, ENT_INVOICE_ITEMS_T EII, ENT_SITE_ADDRESS_T ESA,
ACCOUNT_T A
WHERE ECM.CM_REC_ID = ECMI.CM_REC_ID
AND ECM.STATUS=3
AND EII.ITEM_REC_ID = ECMI.ITEM_REC_ID
AND EII.ITEM_TYPE LIKE '%ST%'
AND ESA.POID_ID0 = EII.SITE_ADDRESS_OBJ_ID0
AND ECM.END_T >= StartExtractT
AND ECM.END_T < EndExtractT
AND ECMI.AMOUNT > 0
AND ESA.ACCOUNT_OBJ_ID0 = A.POID_ID0
AND A.GL_SEGMENT LIKE GlSegment || '%')X
GROUP BY X.STATE)
UNION ALL
(SELECT SUM(Y.AMOUNT) AS "AMOUNT", Y.STATE AS "STATE"
FROM
(SELECT EII.EXTENDED_PRICE AMOUNT, ESA.STATE STATE
FROM ENT_INVOICE_ITEMS_T EII, ENT_SITE_ADDRESS_T ESA, ENT_INVOICE_VERSION_T EIV,
ACCOUNT_T A
WHERE ESA.POID_ID0 = EII.SITE_ADDRESS_OBJ_ID0
AND EIV.INVOICE_REC_ID = EII.INVOICE_REC_ID
AND EII.ITEM_TYPE LIKE '%ST%'
AND EII.EXTENDED_PRICE < 0
AND EII.INVOICE_VERSION = 1
AND EII.CREATED_T >= StartExtractT
AND EII.CREATED_T < EndExtractT
AND EIV.STATUS = 3 AND EIV.VERSION=1
AND ESA.ACCOUNT_OBJ_ID0 = A.POID_ID0
AND A.GL_SEGMENT LIKE GlSegment || '%'
UNION ALL
SELECT ECMI.AMOUNT AMOUNT, ESA.STATE  STATE
FROM
ENT_CREDIT_MEMO_T ECM, ENT_CREDIT_MEMO_ITEMS_T ECMI, ENT_INVOICE_ITEMS_T EII, ENT_SITE_ADDRESS_T ESA,
ACCOUNT_T A
WHERE ECM.CM_REC_ID = ECMI.CM_REC_ID
AND ECM.STATUS=3
AND EII.ITEM_REC_ID = ECMI.ITEM_REC_ID
AND EII.ITEM_TYPE LIKE '%ST%'
AND ESA.POID_ID0 = EII.SITE_ADDRESS_OBJ_ID0
AND ECM.END_T >= StartExtractT
AND ECM.END_T < EndExtractT
AND ECMI.AMOUNT < 0
AND ESA.ACCOUNT_OBJ_ID0 = A.POID_ID0
AND A.GL_SEGMENT LIKE GlSegment || '%')Y
GROUP BY Y.STATE);


extract_tax_cursor_rec extract_tax_cursor%ROWTYPE;
TaxUS_Total DECIMAL(12,2) := 0;
TotalAmount DECIMAL(12,2) := 0;
DocumentKey VARCHAR2(32);
StateValue VARCHAR2(255);

BEGIN

    DocumentKey := RuntimeT ;
    DBMS_OUTPUT.PUT_LINE('DocumentKey is ' || DocumentKey);
    DBMS_OUTPUT.PUT_LINE('StartT is ' || StartExtractT);
    DBMS_OUTPUT.PUT_LINE('EndT is ' || EndExtractT);
--------------------------------------------------------------------
-- Execute the search and walk through the fetched records
--------------------------------------------------------------------
    --Open the cursor
    IF NOT extract_tax_cursor%ISOPEN
    THEN
        DBMS_OUTPUT.PUT_LINE('Cursor opened');
        OPEN extract_tax_cursor;
    END IF;

    --Fetch row from cursor directly into an Oracle Forms item
       LOOP
              DBMS_OUTPUT.PUT_LINE('Just fetched record number ' ||  TO_CHAR (extract_tax_cursor%ROWCOUNT));
              FETCH extract_tax_cursor INTO extract_tax_cursor_rec;
          EXIT WHEN NOT extract_tax_cursor%FOUND;


        StateValue := extract_tax_cursor_rec.state;
            DBMS_OUTPUT.PUT_LINE('StateValue is ' || StateValue);

        -- add to running total
        TaxUS_Total := TaxUS_Total + (extract_tax_cursor_rec.amount * (1));
        DBMS_OUTPUT.PUT_LINE('Tax is ' || TaxUS_Total);

        TotalAmount := (extract_tax_cursor_rec.amount * (-1));

        -- build the document record
        INSERT INTO ENT_TAX_LEDGER_DATA_T (REPORT_KEY, STATE, AMOUNT) VALUES (DocumentKey, StateValue, TotalAmount);
        END LOOP;

    --Close the cursor
        IF extract_tax_cursor%ISOPEN
    THEN
           CLOSE extract_tax_cursor;
    END IF;

--------------------------------------------------------------------
-- write TaxUS Offset entry
--------------------------------------------------------------------
    INSERT INTO ENT_TAX_LEDGER_DATA_T (REPORT_KEY, STATE, AMOUNT) VALUES (DocumentKey, 'US', TaxUS_Total);

--------------------------------------------------------------------
-- write audit record, finalize and close the program.
--------------------------------------------------------------------
    DBMS_OUTPUT.PUT_LINE('DocKey is ' || DocumentKey);
    DBMS_OUTPUT.PUT_LINE('StartExtract is ' || StartExtractT);
    DBMS_OUTPUT.PUT_LINE('EndExtract is ' || EndExtractT);

UPDATE ENT_TAX_LEDGER_REPORT_T SET STATUS='G' WHERE REPORT_KEY=DocumentKey;
COMMIT;

EXCEPTION
    WHEN OTHERS THEN
         BEGIN
             ROLLBACK;
             UPDATE ENT_TAX_LEDGER_REPORT_T SET STATUS='E' WHERE REPORT_KEY=DocumentKey;
             COMMIT;
         EXCEPTION
             WHEN OTHERS THEN
                  ROLLBACK;
                  raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
            END;

END EntExtractTax;

/
--------------------------------------------------------
--  DDL for Procedure ENTEXXONINVOICEITEMCORRECTION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."ENTEXXONINVOICEITEMCORRECTION" 
(InvoiceNo IN VARCHAR2)

IS

CURSOR invoice_item_cursor(InvRecId Integer, TotalAmount Decimal)
IS
SELECT X.ITEM_REC_ID AS ITEM_REC_ID, EIP.EVENT_OBJ_ID0 AS EVENT_OBJ_ID0, X.AMOUNT AS ITEM_AMOUNT
FROM
(SELECT DECODE(EII.SUPER_PARENT_ID, NULL, EII.ITEM_REC_ID, EII.SUPER_PARENT_ID) ITEM_REC_ID
, SUM(EII.EXTENDED_PRICE) AMOUNT FROM ENT_INVOICE_ITEMS_T EII
WHERE INVOICE_REC_ID = InvRecId
GROUP BY DECODE(EII.SUPER_PARENT_ID, NULL, EII.ITEM_REC_ID, EII.SUPER_PARENT_ID))X,
ENT_ITEM_PORTAL_T EIP
WHERE X.AMOUNT != TotalAmount
AND X.AMOUNT > 0
AND EIP.BASE_ITEM_REC_ID = X.ITEM_REC_ID;

invoice_item_cursor_rec invoice_item_cursor%ROWTYPE;
TotalAmount DECIMAL(18,2) := 0;
InvItemAmount DECIMAL(18,2) := 0;
InvRecId Integer;
InvItemRecId Integer;
InvEventObjId0 INTEGER;
PortalRecId INTEGER;
RecordCount INTEGER;
DeltaAmount DECIMAL(18,2) := 0;
isExxonFlag VARCHAR2(10);
ExxInvStartT Integer;
ExxInvEndT Integer;

BEGIN

	isExxonFlag := IS_EXXON_SPECIAL_INVOICE(InvoiceNo);
	IF isExxonFlag = 'TRUE'
	THEN
		SELECT TO_NUMBER(VALUE,'9999.99') INTO TotalAmount
		FROM ENT_CONFIG_T WHERE PARAMETER='EXXON_SPECIAL_DEAL_PRICE';
		DBMS_OUTPUT.PUT_LINE('Total Price: ' || TotalAmount);

		SELECT EIV.INVOICE_REC_ID INTO InvRecId
		FROM ENT_INVOICE_VERSION_T EIV, ENT_INVOICE_T EI WHERE EIV.INVOICE_NO = InvoiceNo
		AND EIV.INVOICE_REC_ID = EI.INVOICE_REC_ID;
		DBMS_OUTPUT.PUT_LINE('Invoice Rec Id: ' || InvRecId);

		IF NOT invoice_item_cursor%ISOPEN
		THEN
		    DBMS_OUTPUT.PUT_LINE('Cursor invoice_item_cursor opened');
			OPEN invoice_item_cursor(InvRecId, TotalAmount);
		END IF;

		LOOP
    		DBMS_OUTPUT.PUT_LINE('Cursor record number ' ||  TO_CHAR (invoice_item_cursor%ROWCOUNT));
    		FETCH invoice_item_cursor INTO invoice_item_cursor_rec;
    		EXIT WHEN NOT invoice_item_cursor%FOUND;

			InvItemRecId := invoice_item_cursor_rec.ITEM_REC_ID;
			DBMS_OUTPUT.PUT_LINE('InvItemRecId:' || InvItemRecId);

			InvEventObjId0 := invoice_item_cursor_rec.EVENT_OBJ_ID0;
			DBMS_OUTPUT.PUT_LINE('InvEventObjId0:' || InvEventObjId0);

			InvItemAmount :=	invoice_item_cursor_rec.ITEM_AMOUNT;
			DBMS_OUTPUT.PUT_LINE('InvItemAmount:' || InvItemAmount);

			SELECT COUNT(*) INTO RecordCount FROM ENT_EXXON_PRICE_CORRECTION_T EEPC
			WHERE EEPC.EVENT_OBJ_ID0 = InvEventObjId0;

			DeltaAmount := TotalAmount - InvItemAmount;
			DBMS_OUTPUT.PUT_LINE('DeltaAmount:' || DeltaAmount);

			UPDATE ENT_INVOICE_ITEMS_T SET EXTENDED_PRICE = EXTENDED_PRICE + DeltaAmount, DUE = DUE + DeltaAmount, UNIT_PRICE = UNIT_PRICE + DeltaAmount
			WHERE ITEM_REC_ID =  InvItemRecId;

			UPDATE ENT_ITEM_PORTAL_T SET TOTAL_AMOUNT = TOTAL_AMOUNT + DeltaAmount, DUE = DUE + DeltaAmount
			WHERE BASE_ITEM_REC_ID =  InvItemRecId AND EVENT_OBJ_ID0 = InvEventObjId0;

			IF RecordCount > 0
			THEN
			   DBMS_OUTPUT.PUT_LINE('Entry already exists. Update records');
			   DBMS_OUTPUT.PUT_LINE('Updating  ENT_PORTAL_OPERATIONS_QUEUE_T table');
			   UPDATE ENT_PORTAL_OPERATIONS_QUEUE_T SET ITEM_REC_ID = InvItemRecId
			   WHERE QUEUE_REC_ID = (SELECT PORTAL_OPERATION_REC_ID FROM ENT_EXXON_PRICE_CORRECTION_T EEPC
			   WHERE EEPC.EVENT_OBJ_ID0 = InvEventObjId0);

			   DBMS_OUTPUT.PUT_LINE('Updating  ENT_EXXON_PRICE_CORRECTION_T');
			   UPDATE ENT_EXXON_PRICE_CORRECTION_T SET ITEM_REC_ID = InvItemRecId
			   WHERE EVENT_OBJ_ID0 = InvEventObjId0;
			ELSE
				DBMS_OUTPUT.PUT_LINE('Entry does not exist.');
				SELECT ENT_PORTAL_OPERATIONS_T_SEQ.NEXTVAL INTO PortalRecId FROM DUAL;

				DBMS_OUTPUT.PUT_LINE('Insert into ENT_PORTAL_OPERATIONS_QUEUE_T');
				INSERT INTO ENT_PORTAL_OPERATIONS_QUEUE_T
   				(QUEUE_REC_ID, INVOICE_OPERATION_ID, ITEM_REC_ID, OPERATION, AMOUNT, ACTION_ITEM_POID_ID0, INVOICE_NO,
				CREATED_T, END_T, STATUS, RETRY_COUNT, INVOICE_OPERATION)
 				VALUES
   				(PortalRecId, InvRecId, InvItemRecId, 'TaxReversalInVertex', DeltaAmount, 0, InvoiceNo,
				DATE_TO_INFRANET(PIN_VIRTUAL_TIME), 0, 0, 0, 'InvoiceGeneration');

				DBMS_OUTPUT.PUT_LINE('Insert into ENT_EXXON_PRICE_CORRECTION_T');
				INSERT INTO ENT_EXXON_PRICE_CORRECTION_T
				(ITEM_REC_ID, PORTAL_OPERATION_REC_ID, EVENT_OBJ_ID0, CORRECTION_AMOUNT, PAID, WRITEOFF)
				VALUES
				(InvItemRecId, PortalRecId, InvEventObjId0, DeltaAmount,0,0);
			END IF;
		END LOOP;

		IF invoice_item_cursor%ISOPEN
		THEN
    		CLOSE invoice_item_cursor;
		END IF;

		SELECT START_T, END_T into ExxInvStartT, ExxInvEndT FROM ENT_INVOICE_T WHERE INVOICE_REC_ID = InvRecId;
		DBMS_OUTPUT.PUT_LINE('Invoice StartT:' || ExxInvStartT);
		DBMS_OUTPUT.PUT_LINE('Invoice EndT:' || ExxInvEndT);

		UPDATE ENT_INVOICE_ITEMS_T SET START_T = ExxInvStartT, END_T = ExxInvEndT-1
		WHERE INVOICE_REC_ID = InvRecId;

	ELSE
	    DBMS_OUTPUT.PUT_LINE('Not an exxon Invoice. No correction required');
	END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'No Data found - '||SQLCODE||' -ERROR- '||SQLERRM);
    WHEN OTHERS THEN
        raise_application_error(-20002,'Unknown Error - '||SQLCODE||' -ERROR- '||SQLERRM);

END EntExxonInvoiceItemCorrection;

/
--------------------------------------------------------
--  DDL for Procedure ENTMERGEINVOICE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."ENTMERGEINVOICE" 
(InvoiceNo1 IN VARCHAR2,
InvoiceNo2 IN VARCHAR2,
UserLogin IN VARCHAR2)

IS

InvRecId1 INTEGER;
InvRecId2 INTEGER;
InvLatestVersion INTEGER;
CurrTimeStamp INTEGER;
RecordCount INTEGER;
ShipToSAN VARCHAR2(60);
PoOrderNo VARCHAR2(60);
JobNo VARCHAR2(60);
SalesOrderNo VARCHAR2(60);
InvStartT INTEGER;
InvEndT INTEGER;
BaseInvNo VARCHAR2(255);
TempInvNo VARCHAR2(255);
SecondaryInvBalance DECIMAL(18,2) := 0;
PrimaryInvBalance DECIMAL(18,2) := 0;
NewInvBalance DECIMAL(18,2) := 0;
SecondaryInvOpCount INTEGER;
InvLocSummary1 INTEGER;
InvLocSummary2 INTEGER;

BEGIN

    DBMS_OUTPUT.PUT_LINE('InvoiceNo 1: ' || InvoiceNo1);
    DBMS_OUTPUT.PUT_LINE('InvoiceNo 2: ' || InvoiceNo2);
    DBMS_OUTPUT.PUT_LINE('User Login: ' || UserLogin);

    SELECT EIV.INVOICE_REC_ID INTO InvRecId1
    FROM ENT_INVOICE_VERSION_T EIV, ENT_INVOICE_T EI WHERE EIV.INVOICE_NO = InvoiceNo1
    AND EIV.STATUS=3 AND EIV.INVOICE_REC_ID = EI.INVOICE_REC_ID
    AND EIV.VERSION = EI.LATEST_VERSION;
    DBMS_OUTPUT.PUT_LINE('InvRecId 1: ' || InvRecId1);

    SELECT INVOICE_REC_ID INTO InvRecId2 FROM ENT_INVOICE_VERSION_T WHERE INVOICE_NO = InvoiceNo2 AND VERSION=1 AND STATUS=3;
    DBMS_OUTPUT.PUT_LINE('InvRecId 2: ' || InvRecId2);

    SELECT COUNT(*) INTO SecondaryInvOpCount FROM ENT_INVOICE_HISTORY_T WHERE INVOICE_NO = InvoiceNo2 AND OPERATION NOT IN ('Invoice', 'Make Invoice Final');
    DBMS_OUTPUT.PUT_LINE('Invoice2 operations count: ' || SecondaryInvOpCount);

    IF SecondaryInvOpCount > 0
    THEN
        raise_application_error(-20002,'Invoice2 is not a freash Invoice');
    END IF;


    SELECT TRUNC(DATE_TO_INFRANET(PIN_VIRTUAL_TIME)) INTO CurrTimeStamp FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('Current TimeStamp: ' || CurrTimeStamp);

    SELECT AMOUNT INTO PrimaryInvBalance FROM ENT_INVOICE_VERSION_T WHERE INVOICE_NO=InvoiceNo1;
    DBMS_OUTPUT.PUT_LINE('Invoice1 Balance:' || PrimaryInvBalance);

    SELECT AMOUNT INTO SecondaryInvBalance FROM ENT_INVOICE_VERSION_T WHERE INVOICE_REC_ID=InvRecId2;
    DBMS_OUTPUT.PUT_LINE('Invoice2 Balance:' || SecondaryInvBalance);

    DBMS_OUTPUT.PUT_LINE('Updating ENT_INVOICE_ITEMS_T');
    UPDATE ENT_INVOICE_ITEMS_T SET INVOICE_REC_ID = InvRecId1 WHERE INVOICE_REC_ID = InvRecId2;

    SELECT LATEST_VERSION INTO InvLatestVersion FROM ENT_INVOICE_T WHERE INVOICE_REC_ID = InvRecId1;
    DBMS_OUTPUT.PUT_LINE('Invoice1 latest Version:' || InvLatestVersion);

    SELECT SUBSTR(InvoiceNo1,1,INSTR(InvoiceNo1,'-',-1)-1) INTO BaseInvNo FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('Invoice1 BaseInvoiceNo:' || BaseInvNo);

    SELECT COUNT(*) INTO InvLocSummary1 FROM ENT_LOCATION_SUMMARY_T WHERE INVOICE_NO = InvoiceNo1;
	DBMS_OUTPUT.PUT_LINE('InvLocSummary1:' || InvLocSummary1);

    SELECT COUNT(*) INTO InvLocSummary2 FROM ENT_LOCATION_SUMMARY_T WHERE INVOICE_NO = InvoiceNo2;
    DBMS_OUTPUT.PUT_LINE('InvLocSummary2:' || InvLocSummary2);

    DBMS_OUTPUT.PUT_LINE('Process each version one by one');

    FOR i IN 1..InvLatestVersion LOOP

        TempInvNo := BaseInvNo || '-' || i;
        DBMS_OUTPUT.PUT_LINE('Processing Invoice:' || TempInvNo);

        DELETE FROM ENT_INVOICE_SUMMARY_SITELIST_T
        WHERE INVOICE_SUMMARY_REC_ID IN (
        SELECT SUMMARY_REC_ID FROM ENT_INVOICE_SUMMARY_T
        WHERE INVOICE_NO = TempInvNo );

        DELETE FROM ENT_INVOICE_SUMMARY_T
        WHERE INVOICE_NO = TempInvNo;

		DBMS_OUTPUT.PUT_LINE('Delete entry from ENT_LOCATION_SUMMARY_T TempInvNo');
        DELETE FROM ENT_LOCATION_SUMMARY_T WHERE INVOICE_NO = TempInvNo;

        DBMS_OUTPUT.PUT_LINE('Delete entry from ENT_SERVICE_CATEGORY_SUMMARY_T TempInvNo');
        DELETE FROM ENT_SERVICE_CATEGORY_SUMMARY_T WHERE INVOICE_NO = TempInvNo;

        ENTCREATEINVOICESUMMARY ( TempInvNo );

        IF InvLocSummary1>0 and InvLocSummary2>0
        THEN
         DBMS_OUTPUT.PUT_LINE('Going to create Location Summary');
         ENTCREATELOCATIONSUMMARY ( TempInvNo );
        END IF;

    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Updating ENT_INVOICE_VERSION_T');
    UPDATE ENT_INVOICE_VERSION_T SET AMOUNT =  AMOUNT + SecondaryInvBalance, DUE = DUE + SecondaryInvBalance
    WHERE INVOICE_REC_ID = InvRecId1;

    NewInvBalance := PrimaryInvBalance + SecondaryInvBalance;

    DBMS_OUTPUT.PUT_LINE('Creating entry in ENT_INVOICE_HISTORY_T');
    INSERT INTO
    ENT_INVOICE_HISTORY_T( AR_HISTORY_REC_ID, OPERATION, AMOUNT, CREATED_T, END_T, STATUS,
    INVOICE_NO, INVOICE_REC_ID, USER_LOGIN, DOCUMENT_NO, REMARKS, INVOICE_BALANCE,
    VERSION, EMAIL_ID)
    VALUES (ENT_INVOICE_HISTORY_T_SEQ.NEXTVAL, 'InvoiceMerge', SecondaryInvBalance, CurrTimeStamp, CurrTimeStamp, 3,
    InvoiceNo1, InvRecId1, UserLogin, InvoiceNo1, 'Merged with ' || InvoiceNo2, NewInvBalance,
    InvLatestVersion, '');

    SELECT START_T, END_T INTO InvStartT, InvEndT
    FROM ENT_INVOICE_T
    WHERE INVOICE_REC_ID = InvRecId1;

    DBMS_OUTPUT.PUT_LINE('Invoice StartT:' || InvStartT);
    DBMS_OUTPUT.PUT_LINE('Invoice EndT:' || InvEndT);

    UPDATE ENT_INVOICE_ITEMS_T
    SET START_T= InvStartT, END_T = InvEndT
    WHERE ITEM_REC_ID IN
    (SELECT ITEM_REC_ID
    FROM ENT_INVOICE_ITEMS_T EI
    WHERE EI.INVOICE_REC_ID = InvRecId1
    AND (UPPER(PRODUCT_NO) LIKE '%USF%' OR UPPER(PRODUCT_NO) LIKE '%UNIVERSAL SERVICE%')
    AND UOM = 'EA' AND SUPER_PARENT_ID IS NULL
    UNION ALL
    SELECT ITEM_REC_ID
    FROM  ENT_INVOICE_ITEMS_T EI
    WHERE PARENT_ID IN
    (SELECT ITEM_REC_ID FROM ENT_INVOICE_ITEMS_T EI
    WHERE EI.INVOICE_REC_ID = InvRecId1
    AND (UPPER(PRODUCT_NO) LIKE '%USF%' OR UPPER(PRODUCT_NO) LIKE '%UNIVERSAL SERVICE%')
    AND UOM = 'EA'
    AND SUPER_PARENT_ID IS NULL));


    DBMS_OUTPUT.PUT_LINE('Delete entry from ENT_INVOICE_SUMMARY_SITELIST_T');
    DELETE FROM ENT_INVOICE_SUMMARY_SITELIST_T
    WHERE INVOICE_SUMMARY_REC_ID IN (
    SELECT SUMMARY_REC_ID FROM ENT_INVOICE_SUMMARY_T
    WHERE INVOICE_NO = InvoiceNo2 );

   DBMS_OUTPUT.PUT_LINE('Delete entry from ENT_INVOICE_SUMMARY_T');
    DELETE FROM ENT_INVOICE_SUMMARY_T
    WHERE INVOICE_NO = InvoiceNo2;

    DBMS_OUTPUT.PUT_LINE('Delete entry from ENT_DOWNLOAD_QUEUE_T');
    DELETE ENT_DOWNLOAD_QUEUE_T WHERE DOCUMENT_NO = InvoiceNo2;

    DBMS_OUTPUT.PUT_LINE('Delete entry from ENT_PRINT_QUEUE_T');
    DELETE ENT_PRINT_QUEUE_T WHERE DOCUMENT_NO = InvoiceNo2;


    DBMS_OUTPUT.PUT_LINE('Delete entry from ENT_LOCATION_SUMMARY_T InvoiceNo2');
    DELETE FROM ENT_LOCATION_SUMMARY_T WHERE INVOICE_NO=InvoiceNo2;

    DBMS_OUTPUT.PUT_LINE('Delete entry from ENT_SERVICE_CATEGORY_SUMMARY_T InvoiceNo2');
    DELETE FROM ENT_SERVICE_CATEGORY_SUMMARY_T WHERE INVOICE_NO=InvoiceNo2;

    DBMS_OUTPUT.PUT_LINE('Update ENT_INVOICE_HISTORY_T');
    UPDATE ENT_INVOICE_HISTORY_T SET AMOUNT=0, INVOICE_BALANCE=0 WHERE INVOICE_REC_ID = InvRecId2;

    DBMS_OUTPUT.PUT_LINE('Update ENT_INVOICE_VERSION_T');
    UPDATE ENT_INVOICE_VERSION_T SET AMOUNT=0, DUE=0, ADJUSTED=0, PAID=0, WRITEOFF=0, STATUS=0
    WHERE INVOICE_REC_ID = InvRecId2;


EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'No Data found - '||SQLCODE||' -ERROR- '||SQLERRM);
    WHEN OTHERS THEN
        raise_application_error(-20002,'Unknown Error - '||SQLCODE||' -ERROR- '||SQLERRM);

END EntMergeInvoice;

/
--------------------------------------------------------
--  DDL for Procedure ENTSPLITINVOICE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."ENTSPLITINVOICE" 
(InvoiceNo IN VARCHAR2,
 SplitParam IN VARCHAR2
)

IS

TYPE cur_typ IS REF CURSOR;
split_param_cursor cur_typ;


SqlQuery VARCHAR2(1024);
BaseInvNo VARCHAR2(60);
NewInvNo VARCHAR2(60);
InvRecId INTEGER;
NewInvRecId INTEGER;
ParamValue VARCHAR2(255);
RecCount Integer;
invCount Integer := 0;
CurrTimeStamp Integer;
InvRow ENT_INVOICE_T%ROWTYPE;
InvVerRow ENT_INVOICE_VERSION_T%ROWTYPE;
InvIdRow ENT_INVOICE_IDENTIFIER_T%ROWTYPE;
EITCOUNT INTEGER;
InvAmount DECIMAL(18,2) := 0;
InvHistoryRecId INTEGER;
ShipToSAN VARCHAR2(60);
PoOrderNo VARCHAR2(60);
JobNo VARCHAR2(60);
SalesOrderNo VARCHAR2(60);
PrintId Integer;
DownloadId Integer;
StyleSheetId Integer;
InvStatus  Integer;

InvDue DECIMAL(18,2) := 0;
InvAdjusted DECIMAL(18,2) := 0;
InvPaid DECIMAL(18,2) := 0;
InvWriteOff DECIMAL(18,2) := 0;

BEGIN

    DBMS_OUTPUT.PUT_LINE('Input Parameters');
    DBMS_OUTPUT.PUT_LINE('InvoiceNo: ' || InvoiceNo);
    DBMS_OUTPUT.PUT_LINE('SplitParam: ' || SplitParam);

    SELECT EIV.INVOICE_REC_ID INTO InvRecId
    FROM ENT_INVOICE_VERSION_T EIV
    WHERE EIV.INVOICE_NO = InvoiceNo
    AND STATUS = 8
    AND VERSION = 1;

    DBMS_OUTPUT.PUT_LINE('InvoiceRecId: ' || InvRecId);

    SELECT SUBSTR(InvoiceNo, 1, LENGTH(InvoiceNo) - 2 ) INTO BaseInvNo FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('BaseInvNo: ' || BaseInvNo);

    SqlQuery :=    'SELECT COUNT(DISTINCT ' || SplitParam || ') FROM ENT_INVOICE_ITEMS_T '
                 || 'WHERE INVOICE_REC_ID = :1 ';

    DBMS_OUTPUT.PUT_LINE('SQL Query: ' || SqlQuery);

    EXECUTE IMMEDIATE SqlQuery  INTO RecCount USING InvRecId;

    IF RecCount <= 1
    THEN
        DBMS_OUTPUT.PUT_LINE('No need to split the invoice');
        UPDATE ENT_INVOICE_VERSION_T SET STATUS = 3 WHERE INVOICE_NO = InvoiceNo;
        RETURN;
    END IF;

    SELECT TRUNC(DATE_TO_INFRANET(PIN_VIRTUAL_TIME)) INTO CurrTimeStamp FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('Current TimeStamp: ' || CurrTimeStamp);

    SqlQuery :=    'SELECT DISTINCT ' || SplitParam || ' FROM ENT_INVOICE_ITEMS_T '
                 || 'WHERE INVOICE_REC_ID = :1 ';

    DBMS_OUTPUT.PUT_LINE('SQL Query: ' || SqlQuery);

    IF NOT split_param_cursor%ISOPEN
    THEN
        DBMS_OUTPUT.PUT_LINE('Open split_param_cusrsor');
        OPEN split_param_cursor FOR SqlQuery USING InvRecId;
    END IF;

    SELECT * INTO InvRow FROM ENT_INVOICE_T WHERE INVOICE_REC_ID = InvRecId ;

    SELECT * INTO InvVerRow FROM ENT_INVOICE_VERSION_T WHERE INVOICE_REC_ID = InvRecId AND VERSION = 1;

    SELECT distinct STYLE_SHEET_REC_ID INTO StyleSheetId FROM ENT_INVOICE_IDENTIFIER_T EI,BILLINFO_T B WHERE INVOICE_ID = InvRow.INVOICE_ID and EI.BILLINFO_OBJ_ID0 = B.POID_ID0 and B.ACCOUNT_OBJ_ID0=InvRow.ACCOUNT_OBJ_ID0;


    LOOP
        FETCH split_param_cursor INTO ParamValue;
        EXIT WHEN split_param_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Record number: ' ||  TO_CHAR (split_param_cursor%ROWCOUNT));
        DBMS_OUTPUT.PUT_LINE('ParamValue: ' || ParamValue);
        NewInvNo := BaseInvNo || '-S' || InvCount || '-1';
        DBMS_OUTPUT.PUT_LINE('NewInvNo: ' || NewInvNo);

        SELECT ENT_INVOICE_T_SEQ.NEXTVAL INTO NewinvRecId FROM DUAL;
        DBMS_OUTPUT.PUT_LINE('NewInvRecId: ' || NewInvRecId);

        DBMS_OUTPUT.PUT_LINE('Create entry in ENT_INVOICE_T');
        INSERT INTO
        ENT_INVOICE_T(BILL_NO, INVOICE_REC_ID, ACCOUNT_OBJ_ID0, START_T, END_T,
        LATEST_VERSION, BILL_OBJ_ID0, STYLE_SHEET_ID, SUPRESS_ZERO_ITEMS,
        INVOICE_RULE_ID, AUTO_PRINT, PAYMENT_TERM, JOB_NO,
        BILL_TO,BILL_TO_NAME,BILL_TO_ADDRESS, BILL_TO_CITY,
        BILL_TO_STATE, BILL_TO_ZIP, BILL_TO_COUNTRY, BILL_TO_EMAIL,
        BILL_TO_PHONE, SALES_ORDER_NO, SHIP_TO, PO_ORDER_NO,
        PAYKEY_CODE, SHIPMENT_NO, CONTRACT_ID, INVOICE_ID,
        BILL_TO_DESCR, AUTO_DOWNLOAD, INVOICE_SCHEDULE,
        INVOICE_SCHEDULE_SPECIFIC_DAY, INVOICE_CHARGES_TYPE, INVOICE_CYCLE_TYPE, TNM_INVOICE)
        VALUES (InvRow.BILL_NO, NewInvRecId, InvRow.ACCOUNT_OBJ_ID0, InvRow.START_T, InvRow.END_T,
        InvRow.LATEST_VERSION, InvRow.BILL_OBJ_ID0, InvRow.STYLE_SHEET_ID, InvRow.SUPRESS_ZERO_ITEMS,
        InvRow.INVOICE_RULE_ID, InvRow.AUTO_PRINT, InvRow.PAYMENT_TERM, InvRow.JOB_NO,
        InvRow.BILL_TO, InvRow.BILL_TO_NAME, InvRow.BILL_TO_ADDRESS, InvRow.BILL_TO_CITY,
        InvRow.BILL_TO_STATE, InvRow.BILL_TO_ZIP, InvRow.BILL_TO_COUNTRY, InvRow.BILL_TO_EMAIL,
        InvRow.BILL_TO_PHONE, InvRow.SALES_ORDER_NO, InvRow.SHIP_TO, InvRow.PO_ORDER_NO,
        InvRow.PAYKEY_CODE, InvRow.SHIPMENT_NO, InvRow.CONTRACT_ID, InvRow.INVOICE_ID,
        InvRow.BILL_TO_DESCR, InvRow.AUTO_DOWNLOAD, InvRow.INVOICE_SCHEDULE,
        InvRow.INVOICE_SCHEDULE_SPECIFIC_DAY, InvRow.INVOICE_CHARGES_TYPE, InvRow.INVOICE_CYCLE_TYPE, InvRow.TNM_INVOICE);

        DBMS_OUTPUT.PUT_LINE('Create entry in ENT_INVOICE_VERSION_T');
        INSERT INTO
        ENT_INVOICE_VERSION_T(VERSION, DESCR, INVOICE_NO, AMOUNT, DUE,
        ADJUSTED, PAID, WRITEOFF, CREATED_T,
        INVOICE_REC_ID, STATUS, HEADER_NOTES,PRE_INVOICE,INVOICE_AR_T,PRE_INVOICE_T)
        VALUES (InvVerRow.VERSION, InvVerRow.DESCR, NewInvNo, InvVerRow.AMOUNT, InvVerRow.DUE,
        InvVerRow.ADJUSTED, InvVerRow.PAID, InvVerRow.WRITEOFF, InvVerRow.CREATED_T,
        NewInvRecId, InvVerRow.STATUS, InvVerRow.HEADER_NOTES,InvVerRow.PRE_INVOICE,InvVerRow.INVOICE_AR_T,InvVerRow.PRE_INVOICE_T);

        IF paramvalue IS NULL THEN

        DBMS_OUTPUT.PUT_LINE('Update ENT_INVOICE_ITEMS_T param value is null');
        DBMS_OUTPUT.PUT_LINE('InvoiceRecId: ' || InvRecId);
        SqlQuery :=    'UPDATE ENT_INVOICE_ITEMS_T SET INVOICE_REC_ID = :1 '
                     || 'WHERE INVOICE_REC_ID = :2 AND ' || SplitParam || ' IS NULL';

        DBMS_OUTPUT.PUT_LINE('SQL Query: ' || SqlQuery);
        EXECUTE IMMEDIATE SqlQuery USING NewInvRecId, InvRecId;

        DBMS_OUTPUT.PUT_LINE('query executed');

        ELSE
        DBMS_OUTPUT.PUT_LINE('Update ENT_INVOICE_ITEMS_T');
        SqlQuery :=    'UPDATE ENT_INVOICE_ITEMS_T SET INVOICE_REC_ID = :1 '
                     || 'WHERE INVOICE_REC_ID = :2 AND ' || SplitParam || ' = :3';

        DBMS_OUTPUT.PUT_LINE('SQL Query: ' || SqlQuery);
        EXECUTE IMMEDIATE SqlQuery USING NewInvRecId, InvRecId, ParamValue;


       END IF;


	DBMS_OUTPUT.PUT_LINE('Update ENT_INVOICE_T For GROUP_BY_LOCATION_ID');

	IF InvRow.GROUP_BY_LOCATION_ID = 1 THEN
		SqlQuery :=    'UPDATE ENT_INVOICE_T SET GROUP_BY_LOCATION_ID = 1 '
			       || 'WHERE INVOICE_REC_ID = :1' ;

		DBMS_OUTPUT.PUT_LINE('SqL Query: ' || SqlQuery);
    EXECUTE IMMEDIATE SqlQuery USING NewInvRecId;
       	ELSE
			SqlQuery :=    'UPDATE ENT_INVOICE_T SET GROUP_BY_LOCATION_ID = 0 '
				      || 'WHERE INVOICE_REC_ID = :1' ;

		        DBMS_OUTPUT.PUT_LINE('SQL Query: ' || SqlQuery);
			EXECUTE IMMEDIATE SqlQuery USING NewInvRecId;

	END IF;

	IF InvRow.GROUP_BY_SERVICE_CATEGORY = 1 THEN
		SqlQuery :=    'UPDATE ENT_INVOICE_T SET GROUP_BY_SERVICE_CATEGORY = 1 '
			       || 'WHERE INVOICE_REC_ID = :1' ;

		DBMS_OUTPUT.PUT_LINE('SqL Query: ' || SqlQuery);
    EXECUTE IMMEDIATE SqlQuery USING NewInvRecId;
       	ELSE
			SqlQuery :=    'UPDATE ENT_INVOICE_T SET GROUP_BY_SERVICE_CATEGORY = 0 '
				      || 'WHERE INVOICE_REC_ID = :1' ;

		        DBMS_OUTPUT.PUT_LINE('SQL Query: ' || SqlQuery);
			EXECUTE IMMEDIATE SqlQuery USING NewInvRecId;

	END IF;

        ENTCREATEINVOICESUMMARY ( NewInvNo );
        IF InvRow.GROUP_BY_SERVICE_CATEGORY = 1 and  InvRow.GROUP_BY_SERVICE_CATEGORY = 1 THEN
          ENTCREATELOCATIONSUMMARY (NewInvNo);
        END IF;

        SELECT SUM(EXTENDED_PRICE), SUM(DUE),SUM(ADJUSTED), SUM(PAID), SUM(WRITEOFF)
        INTO InvAmount, InvDue, InvAdjusted, InvPaid, InvWriteOff
        FROM ENT_INVOICE_ITEMS_T EIT
        WHERE EIT.INVOICE_REC_ID = NewInvRecId
        AND EIT.INVOICE_VERSION = 1;

        DBMS_OUTPUT.PUT_LINE('InvoiceAmount: ' || InvAmount);
        DBMS_OUTPUT.PUT_LINE('InvDue: ' || InvDue);
        DBMS_OUTPUT.PUT_LINE('InvAdjusted: ' || InvAdjusted);
        DBMS_OUTPUT.PUT_LINE('InvPaid: ' || InvPaid);
        DBMS_OUTPUT.PUT_LINE('InvWriteOff: ' || InvWriteOff);


       DBMS_OUTPUT.PUT_LINE('Suppress $0 invoice');

       IF InvIdRow.ZERO_DOLLAR_INVOICE = 0 AND InvAmount = 0 THEN
	InvStatus:=0;
       ELSE
	InvStatus:=3;
       END IF;


        DBMS_OUTPUT.PUT_LINE('Updating ENT_INVOICE_VERSION_T');
        UPDATE ENT_INVOICE_VERSION_T SET AMOUNT = InvAmount, DUE = InvDue, PAID = InvPaid, ADJUSTED = InvAdjusted, WRITEOFF = InvWriteOff,STATUS = InvStatus
        WHERE INVOICE_NO = NewInvNo;

        SELECT ENT_INVOICE_HISTORY_T_SEQ.NEXTVAL INTO InvHistoryRecId FROM DUAL;
        DBMS_OUTPUT.PUT_LINE('InvoiceHistoryRecId: ' || InvHistoryRecId);


        IF InvVerRow.PRE_INVOICE = 1 THEN

	INSERT INTO
	ENT_INVOICE_HISTORY_T( AR_HISTORY_REC_ID, OPERATION, AMOUNT, CREATED_T, END_T, STATUS,
	INVOICE_NO, INVOICE_REC_ID, USER_LOGIN, DOCUMENT_NO, REMARKS, INVOICE_BALANCE,
	VERSION, EMAIL_ID)
	VALUES (InvHistoryRecId, 'Invoice', 0, CurrTimeStamp, CurrTimeStamp, 3,
	NewInvNo, NewInvRecId, '', NewInvNo, 'Pre-Invoice Generation', InvAmount,
        1, '');

        ELSE

	INSERT INTO
	ENT_INVOICE_HISTORY_T( AR_HISTORY_REC_ID, OPERATION, AMOUNT, CREATED_T, END_T, STATUS,
	INVOICE_NO, INVOICE_REC_ID, USER_LOGIN, DOCUMENT_NO, REMARKS, INVOICE_BALANCE,
	VERSION, EMAIL_ID)
	VALUES (InvHistoryRecId, 'Invoice', 0, CurrTimeStamp, CurrTimeStamp, 3,
	NewInvNo, NewInvRecId, '', NewInvNo, 'Invoice Generation', InvAmount,
        1, '');

        END IF;

        SELECT COUNT(DISTINCT EIT.ACCOUNT_OBJ_ID0) INTO RecCount
        FROM ENT_INVOICE_ITEMS_T EIT
        WHERE EIT.INVOICE_REC_ID = NewInvRecId;

          DBMS_OUTPUT.PUT_LINE('RecCount'|| RecCount);

        IF RecCount > 1 THEN
             ShipToSAN := 'MULTIPLE';
        ELSE
             SELECT DISTINCT P2A(EIT.ACCOUNT_OBJ_ID0) INTO ShipToSAN
             FROM ENT_INVOICE_ITEMS_T EIT
             WHERE EIT.INVOICE_REC_ID = NewInvRecId;


        END IF;
        DBMS_OUTPUT.PUT_LINE('ShipTo:' || ShipToSAN);

        SELECT COUNT(DISTINCT EIT.WBS_NUM) INTO RecCount
        FROM ENT_INVOICE_ITEMS_T EIT
        WHERE EIT.INVOICE_REC_ID = NewInvRecId
        AND UPPER(EIT.PRODUCT_NO) NOT LIKE '%USF%'
        AND UPPER(EIT.PRODUCT_NO) NOT LIKE '%UNIVERSAL SERVICE%';

        IF RecCount > 1 THEN
            JobNo := 'MULTIPLE';
        ELSE
            SELECT DISTINCT EIT.WBS_NUM INTO JobNo
            FROM ENT_INVOICE_ITEMS_T EIT
            WHERE EIT.INVOICE_REC_ID = NewInvRecId
            AND UPPER(EIT.PRODUCT_NO) NOT LIKE '%USF%'
            AND UPPER(EIT.PRODUCT_NO) NOT LIKE '%UNIVERSAL SERVICE%';
        END IF;
        DBMS_OUTPUT.PUT_LINE('JobNo:' || JobNo);

        SELECT COUNT(DISTINCT EIT.PO_ORDER_NO) INTO RecCount
        FROM ENT_INVOICE_ITEMS_T EIT
        WHERE EIT.INVOICE_REC_ID = NewInvRecId;

        IF RecCount = 0 THEN
            PoOrderNo := '';
        ELSIF RecCount > 1 THEN
            PoOrderNo := 'MULTIPLE';
        ELSE
            SELECT DISTINCT EIT.PO_ORDER_NO INTO PoOrderNo
            FROM ENT_INVOICE_ITEMS_T EIT
            WHERE EIT.INVOICE_REC_ID = NewInvRecId
            AND EIT.PO_ORDER_NO IS NOT NULL;
        END IF;
        DBMS_OUTPUT.PUT_LINE('PoOrderNo:' || PoOrderNo);



        SELECT COUNT(DISTINCT EDM.ORDER_ID) INTO RecCount
        FROM ENT_INVOICE_ITEMS_T EIT, ENT_DESCRIPTOR_MAPPING_T EDM
        WHERE EIT.DESCRIPTOR_ID = EDM.DESCRIPTOR_ID
        AND EIT.INVOICE_REC_ID = NewInvRecId;

        IF RecCount = 0 THEN
            SalesOrderNo := '';
        ELSIF RecCount > 1 THEN
            SalesOrderNo := 'MULTIPLE';
        ELSE
            SELECT DISTINCT EDM.ORDER_ID INTO SalesOrderNo
            FROM ENT_INVOICE_ITEMS_T EIT, ENT_DESCRIPTOR_MAPPING_T EDM
            WHERE EIT.DESCRIPTOR_ID = EDM.DESCRIPTOR_ID
            AND EIT.INVOICE_REC_ID = NewInvRecId
            AND EDM.ORDER_ID IS NOT NULL;
        END IF;
        DBMS_OUTPUT.PUT_LINE('SalesOrderNo:' || SalesOrderNo);

        DBMS_OUTPUT.PUT_LINE('Update ENT_INVOICE_T');
        UPDATE ENT_INVOICE_T EI
        SET EI.PO_ORDER_NO = PoOrderNo, EI.SALES_ORDER_NO = SalesOrderNo,
        EI.JOB_NO = JobNo, EI.SHIP_TO = ShipToSAN
        WHERE EI.INVOICE_REC_ID = NewInvRecId;

        InvCount := InvCount + 1;

    END LOOP;

    IF split_param_cursor%ISOPEN
    THEN
        CLOSE split_param_cursor;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Delete entry from ENT_INVOICE_SUMMARY_SITELIST_T');
    DELETE FROM ENT_INVOICE_SUMMARY_SITELIST_T
    WHERE INVOICE_SUMMARY_REC_ID IN (
    SELECT SUMMARY_REC_ID FROM ENT_INVOICE_SUMMARY_T
    WHERE INVOICE_NO = InvoiceNo );

    DBMS_OUTPUT.PUT_LINE('Delete entry from ENT_INVOICE_SUMMARY_T');
    DELETE FROM ENT_INVOICE_SUMMARY_T
    WHERE INVOICE_NO = InvoiceNo;

    DBMS_OUTPUT.PUT_LINE('Delete ENT_INVOICE_HISTORY_T');
    DELETE ENT_INVOICE_HISTORY_T WHERE INVOICE_REC_ID = InvRecId;

    DBMS_OUTPUT.PUT_LINE('Delete ENT_INVOICE_VERSION_T');
    DELETE ENT_INVOICE_VERSION_T WHERE INVOICE_REC_ID = InvRecId;

    DBMS_OUTPUT.PUT_LINE('Delete ENT_INVOICE_T');
    DELETE ENT_INVOICE_T WHERE INVOICE_REC_ID = InvRecId;
    DBMS_OUTPUT.PUT_LINE('Delete entry from ENT_LOCATION_SUMMARY_T');
    DELETE FROM ENT_LOCATION_SUMMARY_T
    WHERE INVOICE_NO = InvoiceNo;

    DBMS_OUTPUT.PUT_LINE('Delete entry from ENT_SERVICE_CATEGORY_SUMMARY_T');
    DELETE FROM ENT_SERVICE_CATEGORY_SUMMARY_T
    WHERE INVOICE_NO = InvoiceNo;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'No Data found - '||SQLCODE||' -ERROR- '||SQLERRM);
    WHEN OTHERS THEN
        raise_application_error(-20002,'Unknown Error - '||SQLCODE||' -ERROR- '||SQLERRM);



END EntSplitInvoice;

/
--------------------------------------------------------
--  DDL for Procedure EVT_RESRC_MAP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."EVT_RESRC_MAP" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
38e 248
i0WfiGubFy2XecSjXXweEdA+064wg/AJLvZofC/NPfmUx20uR/HRXQl4+5Mcu+W0wgTeTMDT
bPpSqBR5a7W8gjPUM+jeJtxqE9D+i/B2gaseHah6+eQcTywPQbuGCAVepxuE9e0mjCZk3RxF
nj6uCUOAbnwGqd/buMEv3CBpGv4YYTEzknsHrni4CKWGMOQyzBslhE1Cd97xkWSXIS7SN8+u
qWohGAp6KYUWBMny09Bi/KZp/SxfPTVLRmjJlbxGlYk7R0CYezVYuL1sBWma9CsJ+4z2jfD7
hZCrRJl8JKOvjSeMKW4lrwyAAVeBMtAU2QNuMU39DtdlmGS8X03C774WEgIapQ1txwA9ivIy
WxeYjd4C2gte30uLAOEVTQ94mBZKLskyl5Vp+QrmwrKYR0mmC5qCmM0SxsVZHYgfO1Vzz5kg
u5CEtIyNAosKm63BztMip/EhPO9EG3RzEhio2pPM3XdU2NFY0P8o5QAOB34645VZgp87RotD
FH3XsZE4wTIJQGE561rSv/Cq/AXR5hMrzeRNCCQU/7VkqTtNjp8ImFlse8dj5KX9XiqLHw==


/
--------------------------------------------------------
--  DDL for Procedure EXEC_DDL_STATEMENT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."EXEC_DDL_STATEMENT" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
da f3
5mQaldC4TDVzHZ1GcOKBI3dh85Uwgy5KLcsVfHSiWHOUHDgB15HTCg2i8ZehL7pGEXhwax1P
rhgOBui3uZC5OfCnTMzUKSpMHlcZ/Me8R+sQI0e63WQae7/Y3yOur2s2eveDQfWdhA7xElIR
bcUHcQzgRPKm1gnBvbp2hNItGuyN5mYTbDnWuI/cFUXdF2Fsghj+ikZv/p3eK6WwbMh+plMA
o4MsekMrgc0HMTT7oWxXiA==

/
--------------------------------------------------------
--  DDL for Procedure EXTRACTTAX
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."EXTRACTTAX" 
(RuntimeT IN VARCHAR2,
 StartExtractT IN VARCHAR2,
 EndExtractT IN VARCHAR2)

IS

--------------------------------------------------------------------
-- Assumption: the date validity has already been checked.
-- specifically that the end date is correct.
--------------------------------------------------------------------



--------------------------------------------------------------------
-- build search for events.  It will make two searches,
-- the first time it searches for those amounts > 0 and then those
-- < 0 to get the refunds, adjustments, etc.  Otherwise it would
-- summarize/aggregate everything into a single value and while the
-- end result is the same, it may not be desirable.

-- In EVENT_T table, created_t and mod_t columns will have same values
-- when there is no rerating. Portal doesn't have rerating in Infranet6.2
-- but it is possible in Infranet7.0. But right now in our system we
-- don't have rerating. But in future if we use rerating concept, then we
-- need to review this query.
--------------------------------------------------------------------

CURSOR extract_tax_cursor(InfStartT Integer, InfEndT Integer)
IS
SELECT SUBSTR(EVENT_TAX_JURISDICTIONS_T.NAME,1,6) as "STATE",
    SUM(EVENT_TAX_JURISDICTIONS_T.AMOUNT) as "AMOUNT"
FROM
    EVENT_T,
    EVENT_TAX_JURISDICTIONS_T
WHERE
    EVENT_T.POID_DB > 0
    and EVENT_T.POID_ID0 = EVENT_TAX_JURISDICTIONS_T.OBJ_ID0
    and EVENT_T.MOD_T >= InfStartT
    and EVENT_T.MOD_T < InfEndT
    and EVENT_TAX_JURISDICTIONS_T.AMOUNT > 0
GROUP BY
    SUBSTR(EVENT_TAX_JURISDICTIONS_T.NAME,1,6)

UNION

SELECT
    SUBSTR(EVENT_TAX_JURISDICTIONS_T.NAME,1,6) as "STATE",
    SUM(EVENT_TAX_JURISDICTIONS_T.AMOUNT) as "AMOUNT"
FROM
    EVENT_T,
    EVENT_TAX_JURISDICTIONS_T
WHERE
    EVENT_T.POID_DB > 0
    and EVENT_T.POID_ID0 = EVENT_TAX_JURISDICTIONS_T.OBJ_ID0
    and EVENT_T.MOD_T >= InfStartT
    and EVENT_T.MOD_T < InfEndT
    and EVENT_TAX_JURISDICTIONS_T.AMOUNT < 0
GROUP BY
    SUBSTR(EVENT_TAX_JURISDICTIONS_T.NAME,1,6);


extract_tax_cursor_rec extract_tax_cursor%ROWTYPE;
InfStartT INTEGER;
InfEndT INTEGER;
SuccessFlag NUMBER :=0;
TaxUS_Total DECIMAL(12,2) := 0;
TotalAmount DECIMAL(12,2) := 0;
DocumentKey VARCHAR2(32);
FileName VARCHAR2(255);
UTL_DIR VARCHAR2(255);
FileHandle UTL_FILE.FILE_TYPE;
TotalRecords NUMBER := 0;
DocumentRecord VARCHAR2(255);
StateValue VARCHAR2(255);


BEGIN


     DocumentKey := RuntimeT || StartExtractT || EndExtractT;

---------------------------------------------------------------------------
-- convert the dates to Infranet dates.  Infranet dates use the number
-- of seconds offset since 1970.  These are needed for the event query
---------------------------------------------------------------------------

    Select date_to_infranet(to_date(StartExtractT, 'YYYYMMDD')) INTO InfStartT from dual;
    DBMS_OUTPUT.PUT_LINE('InfStart is ' || InfStartT);
    Select date_to_infranet(to_date(EndExtractT, 'YYYYMMDD')) INTO InfEndT from dual;
    DBMS_OUTPUT.PUT_LINE('InfEndt is ' || InfEndT);
----------------------------------------------------------------------------
-- Build the rest of the dates I need for the output record.  We only
-- need to initialize them once, might as well do it here
----------------------------------------------------------------------------


--------------------------------------------------------------------
-- a slight change should be noted here.  There will be no weekly
-- output from this program so the only filename needed is the monthly
-------------------------------------------------------------------

    FileName := 'dss_sap_tax_mon_' || RuntimeT || '.txt';
    UTL_DIR := '/opt/portal/hns/hns_apps/GL_Reporting/report_generator';

--------------------------------------------------------------------
-- open file for output
--------------------------------------------------------------------
    DBMS_OUTPUT.PUT_LINE(UTL_DIR);
    FileHandle := utl_file.fopen(UTL_DIR, FileName, 'W');

    IF UTL_FILE.IS_OPEN(FileHandle)
    THEN
      DBMS_OUTPUT.PUT_LINE('File Handle is opened');
        END IF;

--------------------------------------------------------------------
-- Build the document header record.  There is only one header record
-- per file.
--------------------------------------------------------------------
    DocumentRecord:= 'HD:MonthlyTX' || StartExtractT || EndExtractT || RuntimeT;
    utl_file.put_line(FileHandle, DocumentRecord);


--------------------------------------------------------------------
-- Execute the search and walk through the fetched records and
-- start writing both to the file.  s
--------------------------------------------------------------------
    --Open the cursor
    IF NOT extract_tax_cursor%ISOPEN
       THEN
             DBMS_OUTPUT.PUT_LINE('Cursor opened');
          OPEN extract_tax_cursor(InfStartT, InfEndT);
    END IF;

    --Fetch row from cursor directly into an Oracle Forms item


   LOOP
      DBMS_OUTPUT.PUT_LINE('Just fetched record number ' ||  TO_CHAR (extract_tax_cursor%ROWCOUNT));
      FETCH extract_tax_cursor INTO extract_tax_cursor_rec;
      EXIT WHEN NOT extract_tax_cursor%FOUND;



    -- convert US; XX; to usable date field
        StateValue := 'TAX' ||  SUBSTR(extract_tax_cursor_rec.state,INSTR(extract_tax_cursor_rec.state, ';',1,1)+2,3);
            DBMS_OUTPUT.PUT_LINE('StateValue is ' || StateValue);

    -- add to running total
        TaxUS_Total := TaxUS_Total + (extract_tax_cursor_rec.amount * (1));
        DBMS_OUTPUT.PUT_LINE('Tax is ' || TaxUS_Total);
        TotalRecords := TotalRecords + 1;

        TotalAmount := (extract_tax_cursor_rec.amount * (-1));

    -- build the document record

        IF TotalAmount >= 0 THEN
            DocumentRecord := 'IT:' || StateValue || '   ' || '   ' ||
                '     ' ||TRIM(to_char(TotalAmount, '0000000000D00'));
        ELSE
            DocumentRecord := 'IT:' || StateValue || '   ' || '   ' ||
                '     ' ||TRIM(to_char(TotalAmount, '0000000000D00S'));
        END IF;

    -- write the record to the file
        utl_file.put_line(FileHandle, DocumentRecord);


    END LOOP;



    --Close the cursor
    IF extract_tax_cursor%ISOPEN
         THEN
               CLOSE extract_tax_cursor;
    END IF;








--------------------------------------------------------------------
-- write TaxUS Offset entry
--------------------------------------------------------------------
    IF TaxUS_Total >=0 THEN
        DocumentRecord := 'IT:TAXUS   ' || '   ' ||
            '     ' ||TRIM(to_char(TaxUS_Total,'0000000000D00'));
    ELSE
        DocumentRecord := 'IT:TAXUS   ' || '   ' ||
            '     ' ||TRIM(to_char(TaxUS_Total, '0000000000D00S'));
    END IF;

    utl_file.put_line(FileHandle, DocumentRecord);

    TotalRecords := TotalRecords + 1;

--------------------------------------------------------------------
-- write Trailer record
--------------------------------------------------------------------
    DocumentRecord := 'TR:' || TRIM(to_char(TotalRecords,'0000000000'));
    utl_file.put_line(FileHandle, DocumentRecord);

--------------------------------------------------------------------
-- write audit record, finalize and close the program.
--------------------------------------------------------------------
--On error    SuccessFlag := 1


    DBMS_OUTPUT.PUT_LINE('DocKey is ' || DocumentKey);
    DBMS_OUTPUT.PUT_LINE('Runtime is ' || RuntimeT);
    DBMS_OUTPUT.PUT_LINE('StartExtract is ' || StartExtractT);
    DBMS_OUTPUT.PUT_LINE('EndExtract is ' || EndExtractT);
    DBMS_OUTPUT.PUT_LINE('SuccesFlag is ' || SuccessFlag);

INSERT INTO    hns_tax_ledger_t VALUES    (DocumentKey, RuntimeT, StartExtractT, EndExtractT, SuccessFlag, '-p');

utl_file.fclose(FileHandle);



EXCEPTION
    WHEN OTHERS THEN
         BEGIN
             INSERT INTO    hns_tax_ledger_t VALUES    (DocumentKey, RuntimeT, StartExtractT, EndExtractT, '1', '-p');
         EXCEPTION
             WHEN OTHERS THEN
                      raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
            END;

END ExtractTax;

/
--------------------------------------------------------
--  DDL for Procedure FIRST_PARTY_COLLECTION_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."FIRST_PARTY_COLLECTION_PROC" 
(
  FROMDAY IN NUMBER
, TODAY IN NUMBER
,AMOUNTDUE_LIMIT IN NUMBER
) AS
CURSOR COLLECTION_REPORT_CUR IS
SELECT HD.ACCOUNT_NO, HD.ACCOUNT_OBJ_ID0, BI.PAY_TYPE, BI.PAYINFO_OBJ_ID0, BI.SCENARIO_OBJ_ID0, U2D(ACTG_NEXT_T) AS NEXT_BILLING_DATE, HD.POID_ID0 AS DELIQUENCYPOID_ID0, BI.POID_ID0 AS BILL_POID_ID0
FROM   HNS_DELINQUENCY_T HD, BILLINFO_T BI,ACCOUNT_T AC
WHERE  HD.COLLECTION_STATE IN (1,2)
AND    BI.ACCOUNT_OBJ_ID0 = HD.ACCOUNT_OBJ_ID0
AND    AC.POID_ID0 = HD.ACCOUNT_OBJ_ID0
AND    (AC.GL_SEGMENT LIKE '.NAD.K%.CONSUMER.D%' OR (AC.GL_SEGMENT LIKE '.NAD.K%SME' AND AC.GL_SEGMENT NOT LIKE '%.GOVT.%'))
AND    (SELECT TRUNC(SYSDATE)- TRUNC(U2D(CREATED_T)) FROM COLLECTIONS_SCENARIO_T WHERE POID_ID0 = BI.SCENARIO_OBJ_ID0) BETWEEN FROMDAY AND TODAY ;




V_COUNTER NUMBER := 0;
T_SQL_TEXT VARCHAR2(100);
BILLING_NAME VARCHAR2(255);
SITE_NAME VARCHAR2(255);
DAY_PHONE VARCHAR2(255);
NIGHT_PHONE VARCHAR2(255);
EMAIL_ADDRESS VARCHAR2(1023);
SITE_ADDRESS VARCHAR2(255);
BILLING_ADDRESS VARCHAR2(255);
COLLECTIONS_ENTRY_AMOUNT NUMBER;
COLLECTIONS_ENTRY_DATE DATE;
DAYS_IN_COLLECTIONS NUMBER;
OVERDUE_AMOUNT NUMBER;
SERVICE_STATUS VARCHAR2(60);
NO_OF_TIMES_IN_COLLECTIONS NUMBER;
NO_OF_TIMEOUTOF_COLLECTIONLOCK NUMBER;
AVG_DAYS_FOR_AN_ITEM_TO_CLOSE NUMBER;
NUMBER_OF_MONTHS_AS_CUSTOMER NUMBER;
TOTAL_AMOUNT_DUE NUMBER;
ACCOUNT_OBJ ACCOUNT_T.POID_ID0%TYPE;

BEGIN
  DBMS_OUTPUT.PUT_LINE('START  COLLECTION_REPORT_PROC ' || SYSDATE);


  FOR COLLECTION_REPORT_REC IN COLLECTION_REPORT_CUR

    LOOP

    V_COUNTER := V_COUNTER + 1;
    ACCOUNT_OBJ := COLLECTION_REPORT_REC.ACCOUNT_OBJ_ID0;

    SELECT SUM(DUE) INTO TOTAL_AMOUNT_DUE FROM ITEM_T WHERE AR_BILLINFO_OBJ_ID0=COLLECTION_REPORT_REC.BILL_POID_ID0;

    IF TOTAL_AMOUNT_DUE <= AMOUNTDUE_LIMIT
    then
        continue;
    END IF;


    SELECT DECODE(BI.PAY_TYPE,10001,(SELECT NAME FROM PAYINFO_INV_T WHERE OBJ_ID0 = BI.PAYINFO_OBJ_ID0)
                           ,10003,(SELECT NAME FROM PAYINFO_CC_T WHERE OBJ_ID0 = BI.PAYINFO_OBJ_ID0)
                           ,10005,(SELECT NAME FROM PAYINFO_DD_T WHERE OBJ_ID0 = BI.PAYINFO_OBJ_ID0)
               ),DECODE(BI.PAY_TYPE,10001,(SELECT REPLACE(REPLACE(ADDRESS,CHR(10),' '),CHR(13), ' ') || ', ' || CITY || ', ' || STATE || ', ' || ZIP FROM PAYINFO_INV_T WHERE OBJ_ID0 = BI.PAYINFO_OBJ_ID0)
                           ,10003,(SELECT REPLACE(REPLACE(ADDRESS,CHR(10),' '),CHR(13), ' ') || ', ' || CITY || ', ' || STATE || ', ' || ZIP FROM PAYINFO_CC_T WHERE OBJ_ID0 = BI.PAYINFO_OBJ_ID0)
                           ,10005,(SELECT REPLACE(REPLACE(ADDRESS,CHR(10),' '),CHR(13), ' ') || ', ' || CITY || ', ' || STATE || ', ' || ZIP FROM PAYINFO_DD_T WHERE OBJ_ID0 = BI.PAYINFO_OBJ_ID0)
          ) INTO BILLING_NAME,BILLING_ADDRESS FROM BILLINFO_T BI WHERE BI.POID_ID0=COLLECTION_REPORT_REC.BILL_POID_ID0;


    SELECT FIRST_NAME || ' ' || LAST_NAME INTO SITE_NAME FROM ACCOUNT_NAMEINFO_T WHERE OBJ_ID0 = COLLECTION_REPORT_REC.ACCOUNT_OBJ_ID0;

    BEGIN
      SELECT PHONE INTO DAY_PHONE FROM ACCOUNT_PHONES_T WHERE OBJ_ID0 = COLLECTION_REPORT_REC.ACCOUNT_OBJ_ID0 AND TYPE = 2 AND ROWNUM < 2 ;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
           DAY_PHONE:=NULL;
    END;

    BEGIN
      SELECT PHONE INTO NIGHT_PHONE FROM ACCOUNT_PHONES_T WHERE OBJ_ID0 = COLLECTION_REPORT_REC.ACCOUNT_OBJ_ID0 AND TYPE = 1 AND ROWNUM < 2 ;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
           NIGHT_PHONE:=NULL;
    END;

    SELECT NVL(EMAIL_ADDR,''),REPLACE(REPLACE(ADDRESS,CHR(10),' '),CHR(13), ' ') || ', ' || CITY || ', ' || STATE || ', ' || ZIP INTO EMAIL_ADDRESS,SITE_ADDRESS FROM ACCOUNT_NAMEINFO_T WHERE OBJ_ID0 = COLLECTION_REPORT_REC.ACCOUNT_OBJ_ID0 ;

    SELECT ENTRY_AMOUNT,TRUNC(U2D(CREATED_T)),TRUNC(SYSDATE)- TRUNC(U2D(CREATED_T)),OVERDUE_AMOUNT INTO COLLECTIONS_ENTRY_AMOUNT,COLLECTIONS_ENTRY_DATE,DAYS_IN_COLLECTIONS,OVERDUE_AMOUNT FROM COLLECTIONS_SCENARIO_T WHERE POID_ID0 = COLLECTION_REPORT_REC.SCENARIO_OBJ_ID0 ;


    BEGIN
      SELECT DECODE(S.STATUS,10100,'Active',10102,'Inactive',10103,'Closed') INTO SERVICE_STATUS FROM SERVICE_T S WHERE S.ACCOUNT_OBJ_ID0 = COLLECTION_REPORT_REC.ACCOUNT_OBJ_ID0 AND S.POID_TYPE = '/service/ip' and login not like 'DUP%';
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
           SERVICE_STATUS:=NULL;
    END;

    SELECT COUNT(*) INTO NO_OF_TIMES_IN_COLLECTIONS FROM HNS_DELINQUENCY_STATE_T HDS WHERE HDS.OBJ_ID0 = COLLECTION_REPORT_REC.DELIQUENCYPOID_ID0 AND HDS.COLLECTION_STATE = 1;

    SELECT COUNT(*) INTO NO_OF_TIMEOUTOF_COLLECTIONLOCK FROM HNS_DELINQUENCY_STATE_T HDS WHERE HDS.OBJ_ID0 = COLLECTION_REPORT_REC.DELIQUENCYPOID_ID0 AND HDS.COLLECTION_STATE = 3;


    BEGIN
      SELECT ROUND((SUM(CLOSED_T - EFFECTIVE_T)/COUNT(*))/86400,2) INTO AVG_DAYS_FOR_AN_ITEM_TO_CLOSE FROM ITEM_T I WHERE AR_BILLINFO_OBJ_ID0 = COLLECTION_REPORT_REC.BILL_POID_ID0 AND AR_BILL_OBJ_ID0 <> 0 AND STATUS = 4 AND ITEM_TOTAL <> 0;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
           AVG_DAYS_FOR_AN_ITEM_TO_CLOSE:=NULL;
    END;



    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE,U2D(CREATED_T))) INTO NUMBER_OF_MONTHS_AS_CUSTOMER FROM ACCOUNT_T A WHERE A.POID_ID0 = COLLECTION_REPORT_REC.ACCOUNT_OBJ_ID0;


    INSERT INTO HNS_FIRST_PARTY_COLLECTIONS_T (

           ACCOUNT_NO, BILLING_NAME, SITE_NAME,

           DAY_PHONE, NIGHT_PHONE,EMAIL_ADDRESS, SITE_ADDRESS,

           BILLING_ADDRESS, TOTAL_AMOUNT_DUE, COLLECTIONS_ENTRY_AMOUNT,

           COLLECTIONS_ENTRY_DATE, DAYS_IN_COLLECTIONS, OVERDUE_AMOUNT,

           NEXT_BILLING_DATE,SERVICE_STATUS,NO_OF_TIMES_IN_COLLECTIONS,

           NO_OF_TIMEOUTOF_COLLECTIONLOCK,AVG_DAYS_FOR_AN_ITEM_TO_CLOSE,

           NUMBER_OF_MONTHS_AS_CUSTOMER)

        VALUES ( COLLECTION_REPORT_REC.ACCOUNT_NO,BILLING_NAME,SITE_NAME,

        DAY_PHONE,NIGHT_PHONE,EMAIL_ADDRESS,SITE_ADDRESS,

        BILLING_ADDRESS,TOTAL_AMOUNT_DUE,COLLECTIONS_ENTRY_AMOUNT,

        COLLECTIONS_ENTRY_DATE,DAYS_IN_COLLECTIONS,OVERDUE_AMOUNT,

        COLLECTION_REPORT_REC.NEXT_BILLING_DATE,SERVICE_STATUS,NO_OF_TIMES_IN_COLLECTIONS,

        NO_OF_TIMEOUTOF_COLLECTIONLOCK,AVG_DAYS_FOR_AN_ITEM_TO_CLOSE,NUMBER_OF_MONTHS_AS_CUSTOMER );

           IF V_COUNTER = 1000 THEN
             COMMIT;
             V_COUNTER :=0;
           END IF;


    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('---------------------------------');
    DBMS_OUTPUT.PUT_LINE('END COLLECTION_REPORT_PROC ' || SYSDATE);

    EXCEPTION

       WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('account_obj is: ' || ACCOUNT_OBJ);
       raise_application_error(-20002,'Unknown Error - '||SQLCODE||' -ERROR- '||SQLERRM);
END FIRST_PARTY_COLLECTION_PROC;

/
--------------------------------------------------------
--  DDL for Procedure GENERATE_ETF_VOUCHER_DATA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."GENERATE_ETF_VOUCHER_DATA" 
AS 
  
  REMARKS                           HNS_ETF_VOUCHER_DATA_T.REMARKS%TYPE;
  STATUS                            HNS_ETF_VOUCHER_DATA_T.STATUS%TYPE;
  C_CREATED_T                       HNS_ETF_VOUCHER_DATA_T.CREATED_T%TYPE;
  C_MOD_T                           HNS_ETF_VOUCHER_DATA_T.MOD_T%TYPE;
  C_ACCOUNT_OBJ_ID0                 ITEM_T.ACCOUNT_OBJ_ID0%TYPE;
  C_BILLINFO_OBJ_ID0                HNS_ETF_VOUCHER_DATA_T.BILLINFO_OBJ_ID0%TYPE;
  C_ITEM_OBJ_ID0                    HNS_ETF_VOUCHER_DATA_T.ITEM_OBJ_ID0%TYPE;
  C_SERVICE_OBJ_TYPE                HNS_ETF_VOUCHER_DATA_T.SERVICE_OBJ_TYPE%TYPE;
  C_AMOUNT                          HNS_ETF_VOUCHER_DATA_T.AMOUNT%TYPE;
  C_ACCOUNT_ID                      ITEM_T.ACCOUNT_OBJ_ID0%TYPE;
  C_REC_ID                          HNS_ETF_VOUCHER_DATA_T.REC_ID%TYPE;
  C_EVENT_CREATED_T                 EVENT_T.CREATED_T%TYPE;

  CURSOR C_ETF_VOUCHER_DATA IS
    SELECT DISTINCT ITM.ACCOUNT_OBJ_ID0, ITM.BILLINFO_OBJ_ID0, ITM.POID_ID0, E.SERVICE_OBJ_TYPE, EBI.AMOUNT, E.CREATED_T 
    FROM ITEM_T ITM, EVENT_T E, EVENT_BAL_IMPACTS_T EBI
	  WHERE E.ITEM_OBJ_ID0 = ITM.POID_ID0  
    AND E.POID_ID0 = EBI.OBJ_ID0
	  AND ( 
	  ITM.STATUS = 1 OR 
	  (
	  ITM.STATUS !=1 AND   NOT EXISTS   (select 1  from HNS_ETF_VOUCHER_DATA_T where service_obj_type='/service/commitment' and ITEM_OBJ_ID0=ITM.poid_id0) 
	  AND EXISTS    (SELECT 1  FROM HNS_SCHEDULED_TERMINATION_T 
                                           WHERE STATUS='P' and TERMINATIONDATE >=D2I(TRUNC(PIN_VIRTUAL_TIME))-86400 and A2P(ACCOUNT_NO)=ITM.ACCOUNT_OBJ_ID0)
	  )
	  ) 
    AND EBI.AMOUNT != 0 
    AND EBI.RESOURCE_ID=10100020
    AND ITM.ACCOUNT_OBJ_ID0 NOT IN (select a2p(ACCOUNT_NO) from HNS_SCHEDULED_TERMINATION_T where status = 'R' and  ACCOUNT_NO=p2a(ITM.ACCOUNT_OBJ_ID0))
	  AND E.POID_TYPE = '/event/billing/product/fee/cancel'
AND E.SERVICE_OBJ_TYPE = '/service/commitment'
	  --AND E.CREATED_T > (SELECT LAST_RUN_T FROM HNS_MONITOR_LAST_RUN_T WHERE NAME = 'ETFVoucherGenerationMonitor')
AND E.CREATED_T > D2I(TRUNC(PIN_VIRTUAL_TIME))-86400
ORDER BY E.CREATED_T;

  BEGIN
  C_CREATED_T := DATE_TO_INFRANET(PIN_VIRTUAL_TIME);
  REMARKS := 'Feed collected to generate Voucher for ETF.';  /* Default remarks */
  STATUS := 'P';  /* Inserting with status P */

  OPEN C_ETF_VOUCHER_DATA;
    LOOP
      FETCH C_ETF_VOUCHER_DATA INTO  C_ACCOUNT_OBJ_ID0, C_BILLINFO_OBJ_ID0, C_ITEM_OBJ_ID0, C_SERVICE_OBJ_TYPE, C_AMOUNT, C_EVENT_CREATED_T;
      EXIT WHEN C_ETF_VOUCHER_DATA%NOTFOUND;
        IF (C_ACCOUNT_ID = C_ACCOUNT_OBJ_ID0) THEN
					/*  INSERT FEED IN HNS_ETF_VOUCHER_DATA_T */
					INSERT INTO HNS_ETF_VOUCHER_DATA_T (CREATED_T, MOD_T, REC_ID, ACCOUNT_NO, BILLINFO_OBJ_ID0, ITEM_OBJ_ID0, SERVICE_OBJ_TYPE, AMOUNT, STATUS, REMARKS)
					VALUES (C_CREATED_T, C_CREATED_T, C_REC_ID, p2a(C_ACCOUNT_OBJ_ID0), C_BILLINFO_OBJ_ID0, C_ITEM_OBJ_ID0, C_SERVICE_OBJ_TYPE, C_AMOUNT, STATUS, REMARKS);
			  ELSE
					 C_REC_ID := ETF_VOUCHER_SEQ.NEXTVAL;
					 C_ACCOUNT_ID := C_ACCOUNT_OBJ_ID0;
					/*  INSERT FEED IN HNS_ETF_VOUCHER_DATA_T */
					INSERT INTO HNS_ETF_VOUCHER_DATA_T (CREATED_T, MOD_T, REC_ID, ACCOUNT_NO, BILLINFO_OBJ_ID0, ITEM_OBJ_ID0, SERVICE_OBJ_TYPE, AMOUNT, STATUS, REMARKS)
					VALUES (C_CREATED_T, C_CREATED_T, C_REC_ID, p2a(C_ACCOUNT_OBJ_ID0), C_BILLINFO_OBJ_ID0, C_ITEM_OBJ_ID0, C_SERVICE_OBJ_TYPE, C_AMOUNT, STATUS, REMARKS);

        END IF;
    END LOOP;
  CLOSE C_ETF_VOUCHER_DATA;


      /* UPDATE THE LAST_RUN_T of table HNS_MONITOR_LAST_RUN_T */
      UPDATE HNS_MONITOR_LAST_RUN_T SET LAST_RUN_T = C_CREATED_T WHERE NAME = 'ETFVoucherGenerationMonitor';

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('EXCEPTION OCCURED WHILE EXECUTING STORED PROCEDURE VOUCHER_DATA');

END GENERATE_ETF_VOUCHER_DATA;

/*=============================================================================*/
/* Add the version for BILLING DB R 15.0 Build 1 Patch 169 in Billing_DB_INFO */
/*=============================================================================*/

Insert INTO BILLING_DB_INFO
VALUES (sysdate, 'BILLING DB 15.0', 'Build 1 Patch169' , 'BFW 12.0 Build 001 Patch 412');

COMMIT;

/
--------------------------------------------------------
--  DDL for Procedure GEN_DST_MAPPING_ENTRIES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."GEN_DST_MAPPING_ENTRIES" (
	p_start_year IN INTEGER,
	p_open_start_t IN INTEGER,
	p_open_end_t IN INTEGER,
	p_close_start_t IN INTEGER,
	p_close_end_t IN INTEGER)
IS
BEGIN
	INSERT INTO dst_mapping_t VALUES(p_start_year, p_open_start_t,
		p_open_end_t, p_close_start_t, p_close_end_t);
	COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure GET_FIELDS_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."GET_FIELDS_PROC" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
4c3 213
tKVMMQ0eA22SXnn/OSD3IgaEI30wgzvD2dxqfC9d7M+VGezyzD3AO1cUCOgEKmEB2lEAOqZE
qKg3qbUfP4noSGieFDPxML/JAEEuVhQgyNLT7kL+AUGHn2TQT4tzhs1rhcdLN9h/YpUqfy6W
N/6rNgHJAnuRPUfhXSt9+xpTbuZjm6vqiTocSXQtVJIhH4XcksRxkvGZAvZ+IS/gMBAXmomz
gisyVBwv0UUYwlhEBPKL9PIREEBvGCPV3Bg2/dx88pRR8YWgLex7/hoaRkK9t9fJgvT6HHOM
VXjFSqJZbh87TK37vejQUJQ5g46j+pgL1ayNYMGTiz7+xBaz0WX08JRbeO5G7z3LCX/hEsY/
uPhDWv8hl1SIw6sF63hZU5Kq1MxjPv12dLBF2/VSkVRFP9SiaRAQkJEwuu6P3tNeGgdXz6/v
W9EugtpZm3iM5NlWxk5ZLlQxLoy9wcFo6wElDLCo0HNOwjP+olxks8VMogVFXqK1QpJa2XZi
uFOhX0ucsZv8/XfMdMU=

/
--------------------------------------------------------
--  DDL for Procedure GET_MIN_MAX_RESOURCES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."GET_MIN_MAX_RESOURCES" (
	currency_only	    INTEGER,
	min_resource	    OUT INTEGER,
	max_resource	    OUT INTEGER ) AS
BEGIN
	IF currency_only = 1
	THEN
		min_resource := 1;
		max_resource := 1000;
	ELSE
		-- only for non-currency resources
		min_resource := 1001;

		SELECT
			max(rec_id)
		INTO
			max_resource
		FROM
			config_beid_balances_t;
	END IF;
END get_min_max_resources;

/
--------------------------------------------------------
--  DDL for Procedure GET_PREPAID_PARTITION_SET
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."GET_PREPAID_PARTITION_SET" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
44d 284
BOiu58eI0Bz7NVT1bcsj6Va0L8Ewg5DxDCATZ44CmAIPUkVmpxGNIu8xgeB0HxcUEjmyyJ94
UX9hyNN++ynFJCKCZ36WX5Fcyhzsx/+QOrnwjXQWR4446qCSaR8HNGh9hIfEAbq51VWOzfAe
WqTVGIgoMkfDl17RAtwWAkcJ437tyir7DHHB7sL/KSp1/1Laxx+gXRUyQJwLSBzuG4vmB44Q
h/wCCMKBWpWtIhBYyu1J9jLTo8zIUXh6S1xgj2aNBDEHDaLy4vNa81JePgxTDhSzTGdR2q+7
EmUhklqvPJHyIx++MILvSfOsgIKxP/m9FmFjQI77qDKFCejvWIgx+OjGFoEwuPUMC2n6+ugE
rloDV4cIqTIbCfLl7765rv5aU1SSkPoITeL+KuwGJjB+2ScHbRevYRkkamoeHo8jaOoFwLC1
vCEBXCHwXMFy8EgALCaXEWXH+7TrBYwFHqoSERALZz/XUlvJUPC9Iv9S37Lqp3h1gJtFQOLT
wGTo1wJYe7br14euaB4r6I89neQmaN16D55+Lig5m1fxB2y1Ss6imh5wH3nMrlKns8pkmWiS
zvyGE9C7Ij/OzvQ0g4//HvYoO63wQzHPl1J2sTeCqN95oSmFkgd4gGDR4w==

/
--------------------------------------------------------
--  DDL for Procedure GET_SECTOR_BOUNDS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."GET_SECTOR_BOUNDS" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
67d 237
qFGMU+v2wdHPPXC3tNr8uACPJe4wgw3DTK4VfI6BMnOU/vCot1l/elchiAWkIbOfn5CSPKJs
vKFmzrV5MQT41FsRp+LtLMFuBRPfb3rdfJTnDwo7g9giYR4sgbz5c/lotNvC0ymZJhRp6CT0
mY5KYWaZ/WHKlOGTgt+vZ8BrV4QNHR1Bl8udQM2ll+oZE3nkADEMN3OKk6KyNZgHpj/m513v
UdDT6UqJgK9VAIqu+tVmE216sbiJZQO3dq/bAgxTvj3rkfxFHKg8bRhE1CKyXNivJhpuJjbV
oBtISpmX4+nYRJczdJgd3hFUETYza8coj6xkRKdibFWEyAx3kSv66AGOsxwtn0PpOVh3UfKY
zA0lC6vJPcdkCoXYpHtKM4yF4opkcKP2hSLX4ztG/93XlDV5d4jyFpV/geeKkyG5iWDQJin8
xxhW3S1BMOPFi0UpIaDwltsR5Bq1Ptlu7hkew0Z7fKk3jPabg7Sbh/lt2aoe7iVnVVkHBT+b
ReIFMf9p6v1eKaR7QgFVxDRclYjFuUIXdBNCDsC9x0HCfAjR+ab4pG5w

/
--------------------------------------------------------
--  DDL for Procedure GROUP_AR_ACCOUNTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."GROUP_AR_ACCOUNTS" (
	p_poid_id0		INTEGER,
	revenue_type		INTEGER,
	start_t			INTEGER,
	end_t			INTEGER,
	accts_num_for_group 	INTEGER) AS

	TYPE t_AR_ACCOUNT IS RECORD(
		ar_account_obj_id0	item_t.ar_account_obj_id0%TYPE);

	TYPE GL_CUR_TYPE IS REF CURSOR RETURN t_AR_ACCOUNT;

	v_gl_cur		GL_CUR_TYPE;
	v_ar_account		t_AR_ACCOUNT;

	--v_grp_status		INTEGER := 1;
	v_beg_ar_account	INTEGER := -1;
	v_last_ar_account	INTEGER := 0;
	v_total_rows		INTEGER := 0;
	v_rec_id		INTEGER := 0;
	v_max_effective_t	INTEGER;
BEGIN

	IF revenue_type = 1 OR revenue_type = 4 OR revenue_type = 16
	THEN

		-- unbilled, unbilled_earned, and unbilled_unearned

		SELECT	max(effective_t)
		INTO	v_max_effective_t
		FROM	item_t;

		OPEN	v_gl_cur
		FOR
			SELECT	/*+ USE_CONCAT ORDERED INDEX(item_t i_item_glseg_eff__id)*/
				distinct ar_account_obj_id0
			FROM	item_t i,
				ledger_report_gl_segments_t gs
			WHERE	(effective_t = 0 OR
					(effective_t >= end_t
					and
					effective_t <= v_max_effective_t)
				) AND
				gs.obj_id0 = p_poid_id0 and
				i.gl_segment = gs.gl_segment and
				i.poid_db IS NOT NULL
			ORDER BY ar_account_obj_id0;

	ELSIF revenue_type = 2 OR revenue_type = 8
	THEN
		-- billed, and billed_earned

		OPEN	v_gl_cur
		FOR
			SELECT	/*+ ORDERED index(item_t i_item_glseg_eff__id)*/
				distinct ar_account_obj_id0
			FROM	item_t i,
				ledger_report_gl_segments_t gs
			WHERE	effective_t >= start_t AND
				effective_t < end_t AND
				gs.obj_id0 = p_poid_id0 and
				i.gl_segment = gs.gl_segment and
				i.poid_db IS NOT NULL
			ORDER BY ar_account_obj_id0;

	ELSIF revenue_type = 32
	THEN
		-- billed_unearned
		-- not a good estimation, may need to limit effective_t later

		OPEN	v_gl_cur
		FOR
			SELECT	/*+ ORDERED index(item_t i_item_glseg_eff__id)*/
				distinct ar_account_obj_id0
			FROM	item_t i,
				ledger_report_gl_segments_t gs
			WHERE	(effective_t > 0 AND effective_t < end_t) AND
                        	(i.poid_type = '/item/misc' OR
                         	 i.poid_type in (select obj_type
                                           from config_items_t ci, config_events_t ce
                                          where ci.obj_id0 = ce.obj_id0 AND
                                                ci.rec_id = ce.rec_id2 AND
                                                ce.event_type like '/event/billing/product/fee/cycle/cycle_forward%')) AND
				gs.obj_id0 = p_poid_id0 and
				i.gl_segment = gs.gl_segment and
				i.poid_db IS NOT NULL
			ORDER BY ar_account_obj_id0;
	ELSIF revenue_type = 64
	THEN
		-- prev_billed_earned
		-- not a good estimation, may need to limit effective_t later
		OPEN	v_gl_cur
		FOR
			SELECT	/*+ ORDERED index(item_t i_item_glseg_eff__id)*/
				distinct ar_account_obj_id0
			FROM	item_t i,
				ledger_report_gl_segments_t gs
			WHERE	(effective_t > 0 AND effective_t < start_t) AND
                        	(i.poid_type = '/item/misc' OR
                         	 i.poid_type in (select obj_type
                                           from config_items_t ci, config_events_t ce
                                          where ci.obj_id0 = ce.obj_id0 AND
                                                ci.rec_id = ce.rec_id2 AND
                                                ce.event_type like '/event/billing/product/fee/cycle/cycle_forward%')) AND
				gs.obj_id0 = p_poid_id0 and
				i.gl_segment = gs.gl_segment and
				i.poid_db IS NOT NULL
			ORDER BY ar_account_obj_id0;
	END IF;

	FETCH v_gl_cur INTO v_ar_account;

	WHILE v_gl_cur%FOUND LOOP

		v_total_rows := v_total_rows + 1 ;

		v_last_ar_account := v_ar_account.ar_account_obj_id0;

		if v_beg_ar_account = -1 then
			v_beg_ar_account := v_last_ar_account;
		end if;

		if v_total_rows = accts_num_for_group then
			v_rec_id := v_rec_id + 1;
		   	insert_group(p_poid_id0, v_rec_id, v_beg_ar_account,
				v_last_ar_account, 0); --v_grp_status);
		   	--v_grp_status := 0;
		   	v_beg_ar_account := -1;
		   	v_total_rows := 0;
		end if;

		FETCH v_gl_cur INTO v_ar_account;
	END LOOP;

	CLOSE	v_gl_cur;

	if v_beg_ar_account <> -1 then
		--need to store a separate entry
		v_rec_id := v_rec_id + 1;
		insert_group(p_poid_id0, v_rec_id, v_beg_ar_account,
			v_last_ar_account, 0); --v_grp_status);
	end if;

	IF v_rec_id > 0 THEN
		INSERT	INTO ledger_report_total_groups_t (
			obj_id0, rec_id, total_groups, updated_groups)
		VALUES (p_poid_id0, 1, v_rec_id, 0);
	END IF;

END group_ar_accounts;

/
--------------------------------------------------------
--  DDL for Procedure HANCONFIGTYPE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HANCONFIGTYPE" 
(HnsLocationId IN VARCHAR2, InvNum in varchar2, ParentAccNo in varchar2, flag out varchar2 )
IS
	CURSOR service_category_name_cursor(HnsLocationId VARCHAR2, InvNum VARCHAR2, ParentAccNo VARCHAR2)
	IS

	select * from ent_location_summary_temp_t where hns_location_id = HnsLocationId and invoice_no = InvNum;

	ser_cat_nam_cursor_rec service_category_name_cursor%ROWTYPE;

		ServiceCategoryName VARCHAR2(60);
		COUNT_T integer;
		HANService integer := 0;
		HANExists  integer;
		SqlQuery VARCHAR2(1024);
    updateQuery VARCHAR2(1024);
		HType VARCHAR2(60) := 'HAN';


	BEGIN
  flag := 'FALSE';
  -- DBMS_OUTPUT.PUT_LINE('HnsLocationId_for_HAN:' || HnsLocationId);
   --   DBMS_OUTPUT.PUT_LINE('InvNum_for_HAN:' || InvNum);
		IF NOT service_category_name_cursor%ISOPEN
		THEN
				--		DBMS_OUTPUT.PUT_LINE('Cursor service_category_name_cursor_for_HAN opened');
						OPEN service_category_name_cursor(HnsLocationId,InvNum,ParentAccNo);
		END IF;

		LOOP
		--	DBMS_OUTPUT.PUT_LINE('Summary record number_FOR_HAN ' ||  TO_CHAR (service_category_name_cursor%ROWCOUNT));
			FETCH service_category_name_cursor INTO ser_cat_nam_cursor_rec;
			EXIT WHEN NOT service_category_name_cursor%FOUND;

			ServiceCategoryName := ser_cat_nam_cursor_rec.service_category_name;
		--	DBMS_OUTPUT.PUT_LINE('ServiceCategoryName_FOR_HAN:' || ServiceCategoryName);
	--DBMS_OUTPUT.PUT_LINE('HType_for_HAN:' || HType || 'ParentAccNo_for_HAN:' || ParentAccNo ||'ServiceCategoryName_for_HAN:' || ServiceCategoryName );
			SqlQuery := 'select Count(*) from ENT_INVOICE_BUNDLE_SERVICES_T eibs, ENT_INVOICE_BUNDLE_T eib'
							|| ' where eibs.bundle_rec_id = eib.rec_id '
              || ' and eib.status = 1'
							|| ' and eib.type= :1 '
							|| ' and eib.account_no = :2 '
							|| ' and eibs.category_name = :3 ';

			EXECUTE IMMEDIATE SqlQuery INTO COUNT_T USING HType, ParentAccNo, ServiceCategoryName;
  --    DBMS_OUTPUT.PUT_LINE('SqlQuery_for_HAN:' || SqlQuery);
  --   	DBMS_OUTPUT.PUT_LINE('COUNT_for_HAN:' || COUNT_T);

			if(COUNT_T > 0) THEN
				HANService := HANService+1;
				if(updateQuery IS NULL ) THEN
          updateQuery := 'update  ent_location_summary_temp_t set ISHAN = 1'
                || 'where hns_location_id = :1 '
                || ' and invoice_no = :2 '
                || ' and service_category_name IN (';
					updateQuery := updateQuery || '''' || ServiceCategoryName || '''';

				ELSE
					updateQuery := updateQuery || ',' || '''' || ServiceCategoryName || '''';

				END IF;

			END IF;
		END LOOP;


		if(HANService>1) THEN
			flag := 'TRUE';

      updateQuery := updateQuery || ')';
      EXECUTE IMMEDIATE updateQuery USING HnsLocationId,InvNum;

		END IF;

		IF service_category_name_cursor%ISOPEN
		THEN
			CLOSE service_category_name_cursor;
		END IF;

	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			raise_application_error(-20001,'No Data found - '||SQLCODE||' -ERROR- '||SQLERRM);
		WHEN OTHERS THEN
			raise_application_error(-20002,'Unknown Error - '||SQLCODE||' -ERROR- '||SQLERRM);

END HANCONFIGTYPE;

/
--------------------------------------------------------
--  DDL for Procedure HNS_ADD_PRODUCTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_ADD_PRODUCTS" 

   IS
--
-- To modify this template, edit file PROC.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the procedure
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------

   	    -- GLobal variable for Migration date
		-- To be used by discounted products
	m_migration_date 	    DATE := TO_DATE('03/01/2001','MM/DD/YYYY');

        billto_input_rec            hns_input_billto_data_t%ROWTYPE;

        site_input_rec              hns_input_site_data_t%ROWTYPE;

        prod_input_rec              input_product_data_t%ROWTYPE;

        prod_custxref_t_rec			prod_custxref_t%ROWTYPE;

        b_account_type              VARCHAR2(255);

        -- Variables from plan_t
 		--	m_plan_poid                 plan_t.poid_id0%TYPE;
		m_plan_poid		    NUMBER;
        m_plan_name                 plan_t.name%TYPE;

        -- Variables from plan_services_t
        m_service_type              plan_services_t.service_obj_type%TYPE;
        m_deal_poid                 plan_services_t.deal_obj_id0%TYPE;

        -- Variables from deal_products_t
        m_product_poid              deal_products_t.product_obj_id0%TYPE;

        -- Parent variables
        m_parent_srv_status         VARCHAR2(255);
        m_parent_srv_status_date    DATE;
        m_parent_srv_status_code    VARCHAR2(255) := '';

		n_commit_count		    NUMBER;
        b_rec_found                 NUMBER;
        b_plan_poid_found           NUMBER;
        b_deal_poid_found           NUMBER;

        a_date                      VARCHAR2(25);
        b_date                      VARCHAR2(25);

	m_rate_plan		    VARCHAR2(255);
    m_rec_id                        NUMBER;

      -- Declare the cursors
       	CURSOR prod_custxref_t_cursor IS
	SELECT * FROM prod_custxref_t;

	CURSOR get_plan_cursor IS
        SELECT max(poid_id0) FROM plan_t WHERE name LIKE '(' || m_rate_plan || ')%';

        CURSOR get_deals_cursor IS
        SELECT deal_obj_id0 FROM plan_services_t WHERE obj_id0 = m_plan_poid;

        CURSOR get_products_cursor IS
        SELECT product_obj_id0 FROM deal_products_t WHERE obj_id0 = m_deal_poid;

	CURSOR get_provider_id IS
        SELECT hns_provider_id FROM hns_profile_customer_t WHERE obj_id0 = (SELECT poid_id0 FROM profile_t WHERE poid_type = '/profile/customer' and account_obj_id0 = prod_custxref_t_rec.infranet_acct_id);

        CURSOR billto_input_rec_cur IS
        SELECT * FROM hns_input_billto_data_t WHERE legacy_acct_id = prod_custxref_t_rec.legacy_acct_id;

	CURSOR m_plan_poid_cur IS
	SELECT poid_id0 FROM plan_t WHERE name = 'Default';

	CURSOR site_input_rec_cur IS
	SELECT * FROM hns_input_site_data_t WHERE site_id = prod_custxref_t_rec.site_id;


-- Procedure to input the data into the staging table
PROCEDURE insert_input_products_t (prod_input_rec IN OUT input_product_data_t%ROWTYPE) IS

BEGIN

     INSERT INTO input_product_data_t
	       values (
            	prod_input_rec.infranet_acct_id,           -- infranet_acct_id			NUMBER,
	            prod_input_rec.product_poid,               -- product_poid			    NUMBER,
        	    prod_input_rec.deal_poid,                  -- deal poid				    NUMBER,
				m_plan_poid,							   -- plan_poid 				NUMBER,
	            1,                                         -- product_quantity			NUMBER,
	            prod_input_rec.purchase_start_date,        -- purchase_start_date		VARCHAR2(8),
                prod_input_rec.purchase_disc_pct,	       -- purchase_disc_pct			NUMBER,
	            0,                                         -- purchase_disc_amt			NUMBER,
	            0,                                         -- purchase_fee_amt			NUMBER,
            	prod_input_rec.cycle_start_date,           -- cycle_start_date			VARCHAR2(8),
	            prod_input_rec.cycle_end_date,             -- cycle_end_date			VARCHAR2(8),
            	prod_input_rec.purchase_disc_pct,          -- cycle_disc_pct			NUMBER,
	            0,                                         -- cycle_disc_amt			NUMBER,
	            0,                                         -- cycle_fee_amt			    NUMBER,
	            prod_input_rec.usage_start_date,           -- usage_start_date			VARCHAR2(8),
	            prod_input_rec.usage_end_date,             -- usage_end_date			VARCHAR2(8),
	            prod_input_rec.usage_disc_pct,             -- usage_disc_pct			NUMBER,
	            0,                                         -- usage_disc_amt			NUMBER,
                prod_input_rec.free_months,                -- free_months             NUMBER,
                '',                                        -- mmc_start_date			VARCHAR2(8),
	            '',                                        -- mmc_end_date			VARCHAR2(8),
	            0,                                         -- mmc_type				NUMBER,
	            'Migration',               				   -- descr             VARCHAR2(255),
	            prod_input_rec.service_type,               -- service_type			VARCHAR2(255),
            	prod_input_rec.service_status,             -- service_status			VARCHAR2(8),
	            prod_input_rec.service_status_date,        -- service_status_date		VARCHAR2(8),
		    	prod_input_rec.service_status_code,	       -- service status_code		VARCHAR2(8),
	            prod_input_rec.user_id,                     -- user_id				VARCHAR2(255),
        	    prod_input_rec.provider_id,                 -- provider id           VARCHAR2(255)
                prod_input_rec.rec_id                       -- rec id; added another field per sarit
            	);

		commit;

END insert_input_products_t;

-- Procedure to get the status for services
-- Used by parents only
PROCEDURE status_type (billto_input_rec IN OUT hns_input_billto_data_t%ROWTYPE) IS

BEGIN

    	m_parent_srv_status_date := GREATEST(billto_input_rec.account_creation_date, billto_input_rec.recommission_date);
	m_parent_srv_status_code := '';

	IF billto_input_rec.status_flag = 'AA'
	THEN
		m_parent_srv_status := 'Active';
	ELSIF billto_input_rec.status_flag = 'TA'
	THEN
		m_parent_srv_status := 'Inactive';
		m_parent_srv_status_date := billto_input_rec.decommission_date;
		m_parent_srv_status_code := billto_input_rec.decommission_code;
	ELSIF billto_input_rec.status_flag = 'TT'
	THEN
		m_parent_srv_status := 'Inactive';
		m_parent_srv_status_date := billto_input_rec.decommission_date;
		m_parent_srv_status_code := billto_input_rec.decommission_code;
	ELSIF billto_input_rec.status_flag = 'NA'
	THEN
		m_parent_srv_status := 'Active';
	ELSIF billto_input_rec.status_flag = 'NB'
	THEN
		m_parent_srv_status := 'Active';
	ELSIF billto_input_rec.status_flag = 'NP'
	THEN
		m_parent_srv_status := 'Active';
	ELSIF billto_input_rec.status_flag = 'CA'
	THEN
		m_parent_srv_status := 'Active';
	ELSE
		m_parent_srv_status := 'Active';
	END IF;


        IF (billto_input_rec.recommission_date is not NULL) and
           (billto_input_rec.decommission_date is not NULL) and
           (billto_input_rec.decommission_date > billto_input_rec.recommission_date)
        THEN
                site_input_rec.account_status := 'Inactive';
                site_input_rec.account_status_date := billto_input_rec.decommission_date;
                site_input_rec.decommission_code     := billto_input_rec.decommission_code;
        END IF;

        IF (billto_input_rec.recommission_date is NULL) and
           (billto_input_rec.decommission_date is not NULL) and
           (billto_input_rec.decommission_date > billto_input_rec.recommission_date)
        THEN
                site_input_rec.account_status := 'Inactive';
                site_input_rec.account_status_date := billto_input_rec.decommission_date;
                site_input_rec.decommission_code     := billto_input_rec.decommission_code;
        END IF;

	IF (SUBSTR(billto_input_rec.decommission_code, 1, 1) = '5')
	THEN
		m_parent_srv_status := 'Inactive';
		m_parent_srv_status_date := billto_input_rec.decommission_date;
		m_parent_srv_status_code := billto_input_rec.decommission_code;
    	END IF;

	IF (billto_input_rec.recommission_date is not NULL) and
           (billto_input_rec.decommission_date is not NULL) and
           (billto_input_rec.recommission_date >= billto_input_rec.decommission_date)
        THEN
                m_parent_srv_status := 'Active';
		m_parent_srv_status_code := '';
		m_parent_srv_status_date := billto_input_rec.recommission_date;
        END IF;

	--IF billto_input_rec.account_status != 'Active'
	--THEN
        --     m_parent_srv_status := billto_input_rec.account_status;
	--END IF;

END;


   -- Declare program variables as shown above
BEGIN


    prod_input_rec.service_type := 'ip';

    OPEN prod_custxref_t_cursor;

    LOOP <<find_accounts>>

	FETCH prod_custxref_t_cursor INTO prod_custxref_t_rec;

	EXIT WHEN prod_custxref_t_cursor%NOTFOUND;

    m_rec_id := 0;

    IF prod_custxref_t_rec.legacy_acct_id is not NULL
    THEN
        -- it is a parent account
        b_account_type := 'Parent';


        OPEN billto_input_rec_cur;
        FETCH billto_input_rec_cur INTO billto_input_rec;
        CLOSE billto_input_rec_cur;

--        SELECT * INTO billto_input_rec FROM hns_input_billto_data_t
--        WHERE legacy_acct_id = prod_custxref_t_rec.legacy_acct_id;

        -- Get the plan poid from the database based on the rateplan name
        IF billto_input_rec.rate_plan is not NULL
        THEN

	m_rate_plan := billto_input_rec.rate_plan;


    	OPEN get_plan_cursor;

        FETCH get_plan_cursor INTO m_plan_poid;

        IF get_plan_cursor%NOTFOUND
        THEN
           OPEN m_plan_poid_cur;
           FETCH m_plan_poid_cur INTO m_plan_poid;
           CLOSE m_plan_poid_cur;

--    	   SELECT poid_id0 INTO m_plan_poid FROM plan_t
--	   WHERE name = 'Default';
	END IF;

	CLOSE get_plan_cursor;

              -- Assign the Infranet account poid
             prod_input_rec.infranet_acct_id  := prod_custxref_t_rec.infranet_acct_id;

             -- Get the site id
             prod_input_rec.user_id := billto_input_rec.site_id;

              -- Get the service status and service status date
             status_type (billto_input_rec);
             prod_input_rec.service_status := m_parent_srv_status;
             prod_input_rec.service_status_date := to_char(m_parent_srv_status_date, 'YYYYMMDD');
	     prod_input_rec.service_status_code := m_parent_srv_status_code;

              -- Set all the dates
             prod_input_rec.purchase_start_date := to_char(billto_input_rec.account_creation_date,'YYYYMMDD');
             prod_input_rec.cycle_start_date := to_char(billto_input_rec.account_creation_date, 'YYYYMMDD');
             prod_input_rec.usage_start_date := to_char(billto_input_rec.account_creation_date, 'YYYYMMDD');

             -- Set the discounts
             IF billto_input_rec.free_monthly_access = 'Y'
             THEN
                prod_input_rec.cycle_disc_pct := 1;
             ELSE
                prod_input_rec.cycle_disc_pct := 0;
             END IF;

             IF billto_input_rec.free_plan_fee = 'Y'
             THEN
                prod_input_rec.purchase_disc_pct := 1;
             ELSE
                prod_input_rec.purchase_disc_pct := 0;
             END IF;

             IF billto_input_rec.free_usage = 'Y'
             THEN
                prod_input_rec.usage_disc_pct := 1;
             ELSE
                prod_input_rec.usage_disc_pct := 0;
             END IF;

	    IF prod_input_rec.free_months is NOT NULL
	    THEN
             prod_input_rec.free_months := billto_input_rec.months_remaining;
	    ELSE
             prod_input_rec.free_months := 0;
	    END IF;

             IF billto_input_rec.status_flag = 'NB'
             THEN
                prod_input_rec.cycle_disc_pct := 1;
                prod_input_rec.purchase_disc_pct := 1;
                prod_input_rec.usage_disc_pct := 1;
                prod_input_rec.free_months := -1;
             END IF;

        prod_input_rec.provider_id := '';
            -- Get the provider id from the database
--            IF SUBSTR(billto_input_rec.rate_plan,1,1) = 'P' --Commented out SDD 1/15/01
  --           THEN
    --    	OPEN get_provider_id;

--        	FETCH get_provider_id INTO prod_input_rec.provider_id;

--        	IF get_provider_id%NOTFOUND
--	 	THEN
  --     			prod_input_rec.provider_id := '';
	--	END IF;

--		CLOSE get_provider_id;

		/************ Commented out
                select count(*) into b_rec_found from hns_profile_customer_t where obj_id0 =
                    (select poid_id0 from profile_t where poid_type = '/profile/customer' and
                        account_obj_id0 = prod_custxref_t_rec.infranet_acct_id);

                IF b_rec_found > 0
                THEN
                    select hns_provider_id into prod_input_rec.provider_id
                    from hns_profile_customer_t where obj_id0 =
                    (select poid_id0 from profile_t where poid_type = '/profile/customer' and
                        account_obj_id0 = prod_custxref_t_rec.infranet_acct_id);
                ELSE
                    prod_input_rec.provider_id := '';
                END IF;
		***************************/

--            ELSE
--                prod_input_rec.provider_id := '';
  --          END IF;
        ELSE
            goto find_accounts;
        END IF;

    ELSE
        -- it is a child account
        b_account_type := 'Child';

        OPEN site_input_rec_cur;
        FETCH site_input_rec_cur INTO site_input_rec;
        CLOSE site_input_rec_cur;

--        SELECT * INTO site_input_rec FROM hns_input_site_data_t
--        WHERE site_id = prod_custxref_t_rec.site_id;

        -- Get the plan poid from the database based on the rateplan name
        IF site_input_rec.rate_plan is not NULL
        THEN

	m_rate_plan := site_input_rec.rate_plan;


        OPEN get_plan_cursor;

        FETCH get_plan_cursor INTO m_plan_poid;

        IF get_plan_cursor%NOTFOUND
        THEN
           OPEN m_plan_poid_cur;
	   FETCH m_plan_poid_cur INTO m_plan_poid;
           CLOSE m_plan_poid_cur;

--           SELECT poid_id0 INTO m_plan_poid FROM plan_t
--           WHERE name = 'Default';
        END IF;

        CLOSE get_plan_cursor;

             -- Assign the Infranet account poid
             prod_input_rec.infranet_acct_id  := prod_custxref_t_rec.infranet_acct_id;

             -- Get the site id
             prod_input_rec.user_id := site_input_rec.site_id;

             -- Get the service status and service status date
             prod_input_rec.service_status := site_input_rec.account_status;
             prod_input_rec.service_status_date := to_char(site_input_rec.account_status_date, 'YYYYMMDD');

	     IF site_input_rec.account_status != 'Active'
	     THEN
	     	prod_input_rec.service_status_code := site_input_rec.decommission_code;
	     ELSE
		prod_input_rec.service_status_code := '';
	     END IF;

              -- Set all the dates
             prod_input_rec.purchase_start_date := to_char(site_input_rec.account_creation_date,'YYYYMMDD');
             prod_input_rec.cycle_start_date := to_char(site_input_rec.account_creation_date, 'YYYYMMDD');
             prod_input_rec.usage_start_date := to_char(site_input_rec.account_creation_date, 'YYYYMMDD');

             -- Set the discounts

             IF site_input_rec.free_monthly_access = 'Y'
             THEN
                prod_input_rec.cycle_disc_pct := 1;
             ELSE
                prod_input_rec.cycle_disc_pct := 0;
             END IF;

             IF site_input_rec.free_plan_fee = 'Y'
             THEN
                prod_input_rec.purchase_disc_pct := 1;
             ELSE
                prod_input_rec.purchase_disc_pct := 0;
             END IF;

             IF site_input_rec.free_usage = 'Y'
             THEN
                prod_input_rec.usage_disc_pct := 1;
             ELSE
                prod_input_rec.usage_disc_pct := 0;
             END IF;

	    IF prod_input_rec.free_months is NOT NULL
	    THEN
             prod_input_rec.free_months := site_input_rec.months_remaining;
	    ELSE
             prod_input_rec.free_months := 0;
	    END IF;

             IF site_input_rec.status_flag = 'NB'
             THEN
                prod_input_rec.cycle_disc_pct := 1;
                prod_input_rec.purchase_disc_pct := 1;
                prod_input_rec.usage_disc_pct := 1;
                prod_input_rec.free_months := -1;
             END IF;

             prod_input_rec.provider_id := '';
         ELSE
            goto find_accounts;
        END IF;

     END IF;

-- Loop thru all the deals under the plan
    OPEN get_deals_cursor;


	   FETCH get_deals_cursor INTO m_deal_poid;

	   IF get_deals_cursor%NOTFOUND
	   THEN
        	CLOSE get_deals_cursor;
          	goto find_accounts;
       	   END IF;

	   CLOSE get_deals_cursor;

/*
       IF m_plan_poid > 0
       THEN
       SELECT count(*) into b_deal_poid_found from plan_services_t
       WHERE obj_id0 = m_plan_poid;
       ELSE
	goto find_accounts;
       END IF;

       IF b_deal_poid_found = 1
       THEN
       	SELECT deal_obj_id0 into m_deal_poid from plan_services_t
       	WHERE obj_id0 = m_plan_poid;
       ELSE
	goto find_accounts;
       END IF;
*/
       -- Assign the deal poid
       prod_input_rec.deal_poid := m_deal_poid;

        -- Loop thru all the products under the deal
       OPEN get_products_cursor;

       LOOP <<find_products>>

	   FETCH get_products_cursor INTO m_product_poid;

	   IF get_products_cursor%NOTFOUND
	   THEN
            CLOSE get_products_cursor;
--          goto find_deals;
		--DBMS_OUTPUT.PUT_LINE('Step 3');
            goto find_accounts;
           END IF;

    prod_input_rec.product_poid := m_product_poid;

    IF prod_input_rec.free_months > 0
    THEN

        a_date := prod_input_rec.cycle_start_date;
        b_date := prod_input_rec.usage_start_date;

        prod_input_rec.cycle_end_date := TO_CHAR(ADD_MONTHS(m_migration_date, prod_input_rec.free_months), 'YYYYMMDD');
        prod_input_rec.usage_end_date := TO_CHAR(ADD_MONTHS(m_migration_date, prod_input_rec.free_months), 'YYYYMMDD');

        m_rec_id := m_rec_id + 1;
        prod_input_rec.rec_id := m_rec_id;

	-- Add the discount products
        insert_input_products_t(prod_input_rec);

        prod_input_rec.cycle_start_date := prod_input_rec.cycle_end_date;
        prod_input_rec.cycle_end_date := 0;

        prod_input_rec.usage_start_date := prod_input_rec.usage_end_date;
        prod_input_rec.usage_end_date := 0;

        prod_input_rec.purchase_start_date := prod_input_rec.cycle_start_date;

        prod_input_rec.cycle_disc_pct := 0;
        prod_input_rec.purchase_disc_pct := 0;
        prod_input_rec.usage_disc_pct := 0;

	-- Insert another record
        m_rec_id := m_rec_id + 1;
        prod_input_rec.rec_id := m_rec_id;

		insert_input_products_t(prod_input_rec);
		-- Set the product cycle/usage start dates back to original dates
		-- Else subsequent products will have wrong dates
		-- SB - 04/19
        prod_input_rec.cycle_start_date := a_date;
        prod_input_rec.usage_start_date := b_date;

    ELSE
        -- insert the product into the staging table
        m_rec_id := m_rec_id + 1;
        prod_input_rec.rec_id := m_rec_id;
        insert_input_products_t(prod_input_rec);
    END IF;

      END LOOP find_products;
      CLOSE get_products_cursor;

/*
      IF n_commit_count > 999
      THEN

                DBMS_OUTPUT.PUT_LINE('Commit point reached: ' || n_commit_count);
                n_commit_count := 0;
      END IF;
*/

END LOOP find_accounts;

CLOSE prod_custxref_t_cursor;


END; -- Procedure HNS_ADD_PRODUCTS

/
--------------------------------------------------------
--  DDL for Procedure HNS_ADD_PRODUCT_TO_ACCOUNT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_ADD_PRODUCT_TO_ACCOUNT" 
   IS
--
-- To modify this template, edit file PROC.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the procedure
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
  prod_site_id		VARCHAR2(255);
  prod_account_id       VARCHAR2(255);

TYPE staging_data IS RECORD
  (
        decommission_date               DATE,
        recommission_date               DATE,
        decommission_code               VARCHAR2(255),
        status_flag                     VARCHAR2(255),
        first_commissioned_by           VARCHAR2(255),
        customer_type                   VARCHAR2(255),
        discount_authorizer             VARCHAR2(255),
        serial_no                       VARCHAR2(255),
        tax_definitions                 VARCHAR2(255),
        site_id                         VARCHAR2(255),
        rate_plan                       VARCHAR2(255),
        free_monthly_access             CHAR(1),
        months_remaining                NUMBER,
        free_plan_fee                   CHAR(1),
        free_usage                      CHAR(1),
        csr_defined                     VARCHAR2(255),
        ch_price                        NUMBER,
        notes                           VARCHAR2(255)
 	);

  prod_site_staging_rec  staging_data;

  CURSOR read_account_id IS
  SELECT legacy_acct_id FROM hns_input_billto_data_t;

  CURSOR read_site_id IS
  SELECT site_id FROM HNS_INPUT_SITE_DATA_T WHERE legacy_acct_id = prod_account_id AND account_creation_date = (SELECT min(account_creation_date) FROM hns_input_site_data_t WHERE legacy_acct_id = prod_account_id) AND RowNum < 2;

  CURSOR read_site_data IS
  SELECT decommission_date, recommission_date, decommission_code, status_flag, first_commissioned_by, customer_type, discount_authorizer, serial_no, tax_definitions, site_id, rate_plan, free_monthly_access, months_remaining, free_plan_fee, free_usage, csr_defined, ch_price, notes FROM HNS_INPUT_SITE_DATA_T WHERE site_id = prod_site_id AND legacy_acct_id = prod_account_id;

   -- Declare program variables as shown above
BEGIN

 OPEN read_account_id;

 LOOP <<main_loop>>

    FETCH read_account_id INTO prod_account_id;

    EXIT WHEN read_account_id%NOTFOUND;

       OPEN read_site_id;

       FETCH read_site_id INTO prod_site_id;

       IF read_site_id%FOUND
       THEN

         OPEN read_site_data;

         FETCH read_site_data INTO prod_site_staging_rec;

         DELETE hns_input_site_data_t
         WHERE site_id = prod_site_id and
               legacy_acct_id = prod_account_id;

         UPDATE hns_input_billto_data_t
         SET
	   decommission_date = prod_site_staging_rec.decommission_date,
	   recommission_date = prod_site_staging_rec.recommission_date,
	   decommission_code = prod_site_staging_rec.decommission_code,
	   status_flag = prod_site_staging_rec.status_flag,
	   first_commissioned_by = prod_site_staging_rec.first_commissioned_by,
	   customer_type = prod_site_staging_rec.customer_type,
	   discount_authorizer = prod_site_staging_rec.discount_authorizer,
	   serial_no = prod_site_staging_rec.serial_no,
	   tax_definitions = prod_site_staging_rec.tax_definitions,
	   site_id = prod_site_staging_rec.site_id,
	   rate_plan = prod_site_staging_rec.rate_plan,
	   free_monthly_access = prod_site_staging_rec.free_monthly_access,
	   months_remaining = prod_site_staging_rec.months_remaining,
	   free_plan_fee = prod_site_staging_rec.free_plan_fee,
	   free_usage = prod_site_staging_rec.free_usage,
	   csr_defined = prod_site_staging_rec.csr_defined,
	   ch_price = prod_site_staging_rec.ch_price,
	   notes = notes || ' ' || prod_site_staging_rec.notes
         WHERE legacy_acct_id = prod_account_id;

-- Need to set auto commit on

         CLOSE read_site_data;

       END IF;

       CLOSE read_site_id;

 END LOOP main_loop;

 CLOSE read_account_id;

 DELETE hns_input_site_data_t
  WHERE legacy_parent_id='AMR-XXX-XXXX';

END; -- Procedure HNS_ADD_PRODUCT_TO_ACCOUNT

/
--------------------------------------------------------
--  DDL for Procedure HNS_BILL_MONITOR_CLOB_INSERT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_BILL_MONITOR_CLOB_INSERT" (P_ACT in VARCHAR2, P_RAND in NUMBER,P_DATA in VARCHAR2,P_FLAG in NUMBER,P_COMP in NUMBER) as
g_clob clob;
begin
if P_FLAG=0 then
insert into HNS_BILL_MONITOR_DATA_T values (P_ACT, empty_clob(), P_RAND,P_COMP) returning MON_DATA into g_clob;
dbms_lob.write(g_clob,length(P_DATA), 1,P_DATA);
else
select MON_DATA into g_clob from HNS_BILL_MONITOR_DATA_T where MON_RAND=P_RAND for update;
dbms_lob.writeappend( g_clob, length(P_DATA), P_DATA);
	if P_COMP=1 then
		update HNS_BILL_MONITOR_DATA_T set MON_COMP=P_COMP where MON_RAND=P_RAND;
	end if;
end if;
end;

/
--------------------------------------------------------
--  DDL for Procedure HNS_BUS_POLICY_SITE_MAIN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_BUS_POLICY_SITE_MAIN" IS


TYPE input_file_layout is RECORD
 (
   	amr_account			VARCHAR2(12),
	amr_siteid			VARCHAR2(10),
	amr_serialnumber		VARCHAR2(10),
	amr_customername		VARCHAR2(25),
	amr_contactname			VARCHAR2(29),
	amr_businessorindividual	CHAR(1),
	amr_address1			VARCHAR2(25),
	amr_address2			VARCHAR2(25),
	amr_city			VARCHAR2(25),
	amr_state			VARCHAR2(2),
	amr_zipcode			VARCHAR2(10),
	amr_phone			VARCHAR2(12),
	amr_extension			VARCHAR2(4),
	amr_fax				VARCHAR2(255),
	amr_email			VARCHAR2(255),
	amr_rateplan			VARCHAR2(255),
	amr_commission_date		DATE,
	amr_decommission_date		DATE,
	amr_decommission_code		NUMBER(4),
	amr_recommission_date		DATE,
	amr_statuscode			CHAR(2),
	amr_taxdefinition		VARCHAR2(9),
	amr_freemonthlyaccess		CHAR(1),
	amr_freeplanfee			CHAR(1),
	amr_freeusage			CHAR(1),
	amr_monthsremaining		NUMBER(4),
	amr_csrdefined			VARCHAR2(255),
	amr_firstcommissionbynotes1	VARCHAR2(255),
	amr_notes2			VARCHAR2(255)
 );

 TYPE staging_data IS RECORD
  (
	legacy_acct_id			VARCHAR2(255),
	legacy_parent_id		VARCHAR2(255),
	brand_name			VARCHAR2(255),
	account_status			VARCHAR2(255),
	account_status_date		DATE,
	bill_to_salutation		VARCHAR2(255),
	bill_to_title			VARCHAR2(255),
	bill_to_company			VARCHAR2(255),
	bill_to_first_name		VARCHAR2(255),
	bill_to_middle_name		VARCHAR2(255),
	bill_to_last_name		VARCHAR2(255),
	bill_to_address			VARCHAR2(255),
	bill_to_city			VARCHAR2(255),
	bill_to_state			VARCHAR2(255),
	bill_to_zip			VARCHAR2(255),
	bill_to_country			VARCHAR2(255),
	bill_to_home_phone		VARCHAR2(255),
	bill_to_work_phone		VARCHAR2(255),
	bill_to_fax			VARCHAR2(255),
	bill_to_pager			VARCHAR2(255),
	bill_to_portable_phone		VARCHAR2(255),
	bill_to_pop			VARCHAR2(255),
	bill_to_support_phone		VARCHAR2(255),
	access_code_1			VARCHAR2(255),
	access_code_2			VARCHAR2(255),
	email_address			VARCHAR2(1023),
	cc_number			VARCHAR2(255),
	cc_exp_date			VARCHAR2(255),
	dd_bank_no			VARCHAR2(255),
	dd_debit_num			VARCHAR2(255),
	dd_type				NUMBER(38),
	payment_name			VARCHAR2(255),
	payment_address			VARCHAR2(255),
	payment_city			VARCHAR2(255),
	payment_state			VARCHAR2(255),
	payment_zip			VARCHAR2(255),
	payment_country			VARCHAR2(255),
	payment_method			VARCHAR2(255),
	account_creation_date		DATE,
	last_billed_date		DATE,
	bill_cycle_months		NUMBER,
	currency			NUMBER,
	credit_limit			NUMBER,
	bal_fwd_amt_current		NUMBER,
	po_number			VARCHAR2(255),
	decommission_date		DATE,
	recommission_date		DATE,
	decommission_code		VARCHAR2(255),
	status_flag			VARCHAR2(255),
	buss_ind_flag			VARCHAR2(255),
	ccn_num				VARCHAR2(255),
	first_commissioned_by		VARCHAR2(255),
	customer_type			VARCHAR2(255),
	discount_authorizer		VARCHAR2(255),
	serial_no			VARCHAR2(255),
	notes				VARCHAR2(255),
	tax_definitions			VARCHAR2(255),
	site_id				VARCHAR2(255),
	rate_plan			VARCHAR2(255),
	free_monthly_access		CHAR(1),
	months_remaining		NUMBER,
	free_plan_fee			CHAR(1),
	free_usage			CHAR(1),
	csr_defined			VARCHAR2(255),
	ch_price			NUMBER,
	flag				VARCHAR2(255)
 );

 staging_input_rec   staging_data;
 input_file_t_rec   input_file_layout;


 invalid_cc_account_no   	VARCHAR2(255);
 m_a     			NUMBER:=0;
 debit_exp_mon  		NUMBER(38);
 debit_exp_yr   		NUMBER(38);
 address2    			VARCHAR2(30);


--Cursor Declaration

CURSOR read_input_records IS
SELECT * FROM hns_input_feed_site_data_t;

CURSOR invalid_cc_account_no_cur IS
SELECT account_no FROM account_t WHERE poid_id0 = (SELECT obj_id0 FROM account_nameinfo_t WHERE first_name = 'Invalid'); -- into :invalid_cc_account_no;

CURSOR temp_zip_cur IS
SELECT TRANSLATE(RTRIM(LTRIM(input_file_t_rec.amr_zipcode)), '1234567890-\/().,=_-= ', '1234567890') FROM dual;

-- --------------------------------------------------------------------------------------------------------

PROCEDURE format_fields (staging_input_rec IN OUT staging_data, input_file_t_rec IN input_file_layout) IS

	space_one     		NUMBER := 0;
	space_two     		NUMBER := 0;
	space_one1    		NUMBER := 0;
	space_two2     		NUMBER := 0;
	m_contact_first_name	VARCHAR2(29);
  	m_contact_middle_name 	VARCHAR2(29);
  	m_contact_last_name 	VARCHAR2(29);
	m_customer_first_name	VARCHAR2(29);
  	m_customer_middle_name 	VARCHAR2(29);
  	m_customer_last_name 	VARCHAR2(29);
	temp_phone_number       VARCHAR2(23);
	temp_phone_number_new      VARCHAR2(23);
	zip_length		NUMBER := 0;
	temp_zip		VARCHAR2(15);

BEGIN

-- Need to Copy all other input fields to the staging data


	staging_input_rec.legacy_acct_id	:= input_file_t_rec.amr_account;
	staging_input_rec.legacy_parent_id	:= NULL;
	staging_input_rec.brand_name		:= NULL;
	staging_input_rec.account_status	:= '';
	staging_input_rec.account_status_date   := GREATEST(input_file_t_rec.amr_commission_date, input_file_t_rec.amr_recommission_date);
	staging_input_rec.bill_to_salutation	:= '';
	staging_input_rec.bill_to_title		:= '';
	staging_input_rec.bill_to_company	:= NULL;
	staging_input_rec.bill_to_first_name	:= input_file_t_rec.amr_customername;
	staging_input_rec.bill_to_middle_name	:= input_file_t_rec.amr_customername;
	staging_input_rec.bill_to_last_name	:= input_file_t_rec.amr_customername;
	staging_input_rec.bill_to_address	:= input_file_t_rec.amr_address1;
	staging_input_rec.bill_to_city		:= input_file_t_rec.amr_city;
	staging_input_rec.bill_to_state		:= input_file_t_rec.amr_state;
	staging_input_rec.bill_to_zip		:= RTRIM(input_file_t_rec.amr_zipcode, '- ');
	staging_input_rec.bill_to_country	:= 'USA';
	staging_input_rec.bill_to_home_phone	:= '';
	staging_input_rec.bill_to_work_phone	:= '';
	staging_input_rec.bill_to_fax		:= '';
	staging_input_rec.bill_to_pager		:= '';
	staging_input_rec.bill_to_portable_phone := '';
	staging_input_rec.bill_to_pop		:= '';
	staging_input_rec.bill_to_support_phone	:= '';
	staging_input_rec.access_code_1		:= '';
	staging_input_rec.access_code_2		:= '';
	staging_input_rec.email_address		:= input_file_t_rec.amr_email;
	staging_input_rec.cc_number		:= NULL;
	staging_input_rec.cc_exp_date		:= NULL;
	staging_input_rec.dd_bank_no		:= NULL;
	staging_input_rec.dd_debit_num		:= NULL;
	staging_input_rec.dd_type		:= NULL;
	staging_input_rec.payment_name		:= input_file_t_rec.amr_customername;
	staging_input_rec.payment_address	:= input_file_t_rec.amr_address1;
	staging_input_rec.payment_city		:= input_file_t_rec.amr_city;
	staging_input_rec.payment_state		:= input_file_t_rec.amr_state;
	staging_input_rec.payment_zip		:= RTRIM(input_file_t_rec.amr_zipcode, '- ');
	staging_input_rec.payment_country	:= 'USA';
	staging_input_rec.payment_method	:= '';
	staging_input_rec.account_creation_date	:= input_file_t_rec.amr_commission_date;
	staging_input_rec.last_billed_date	:= to_date('07/01/2001');
	staging_input_rec.bill_cycle_months	:= 1;
	staging_input_rec.currency		:= 840;
	staging_input_rec.credit_limit		:= NULL;
	staging_input_rec.bal_fwd_amt_current	:= NULL;
	staging_input_rec.po_number		:= NULL;
	staging_input_rec.decommission_date	:= input_file_t_rec.amr_decommission_date;
	staging_input_rec.recommission_date	:= input_file_t_rec.amr_recommission_date;
	staging_input_rec.decommission_code	:= '';
	staging_input_rec.status_flag		:= input_file_t_rec.amr_statuscode;
	staging_input_rec.buss_ind_flag		:= input_file_t_rec.amr_businessorindividual;
	staging_input_rec.ccn_num		:= NULL;
	staging_input_rec.first_commissioned_by	:= input_file_t_rec.amr_firstcommissionbynotes1;
	staging_input_rec.customer_type		:= '';
	staging_input_rec.discount_authorizer	:= '';
	staging_input_rec.serial_no		:= input_file_t_rec.amr_serialnumber;
	staging_input_rec.notes			:= input_file_t_rec.amr_notes2;
	staging_input_rec.tax_definitions	:= input_file_t_rec.amr_taxdefinition;
	staging_input_rec.site_id		:= input_file_t_rec.amr_siteid;
	staging_input_rec.rate_plan		:= input_file_t_rec.amr_rateplan;
	staging_input_rec.free_monthly_access	:= input_file_t_rec.amr_freemonthlyaccess;
	-- Changed by SB for taking care of free months - 1 rule - 04/19
	if input_file_t_rec.amr_monthsremaining >= 1 then
	   	staging_input_rec.months_remaining	:= input_file_t_rec.amr_monthsremaining - 1 ;
	else
		staging_input_rec.months_remaining	:= input_file_t_rec.amr_monthsremaining;
	end if;
	staging_input_rec.free_plan_fee		:= input_file_t_rec.amr_freeplanfee;
	staging_input_rec.free_usage		:= input_file_t_rec.amr_freeusage;
	staging_input_rec.csr_defined		:= input_file_t_rec.amr_csrdefined;
	staging_input_rec.ch_price		:= '';
	staging_input_rec.flag			:= '';

--Format Fields


 	staging_input_rec.account_status := 'Active';

-- 	IF LENGTH(input_file_t_rec.siteid) < 10 THEN
-- 		staging_input_rec.site_id := LPAD(input_file_t_rec.siteid, 10, '0');
-- 	END IF;


	space_one     			:= 0;
	space_two     			:= 0;
	space_one1    			:= 0;
	space_two2     			:= 0;


-- Parse CUSTOMER NAME field into  FIRST NAME, MIDDLE NAME, LAST NAME
-- position of first space and second space

 	space_one  := INSTR(input_file_t_rec.amr_customername, ' ', 1, 1);
 	space_two  := INSTR(input_file_t_rec.amr_customername, ' ', 1, 2);

  	--m_customer_first_name   := input_file_t_rec.amr_customername;
	IF (space_one = NULL) or (space_one = 0) THEN
  		m_customer_first_name   := NULL;
  		m_customer_middle_name  := NULL;
  		m_customer_last_name    := input_file_t_rec.amr_customername;
 	ELSIF (space_two != NULL) or (space_two != 0) THEN
  		m_customer_first_name    := SUBSTR(input_file_t_rec.amr_customername, 1, space_one);
  		m_customer_middle_name   := SUBSTR(input_file_t_rec.amr_customername, space_one+1, space_two-space_one-1);
  		m_customer_last_name     := SUBSTR(input_file_t_rec.amr_customername, space_two+1);
 	ELSE
  		m_customer_first_name    := SUBSTR(input_file_t_rec.amr_customername, 1, space_one);
  		m_customer_middle_name   := '';
  		m_customer_last_name     := SUBSTR(input_file_t_rec.amr_customername, space_one+1);
 	END IF;

-- Parse CONTACT NAME field into  FIRST NAME, MIDDLE NAME, LAST NAME
-- position of first space and second space

 	space_one1 := INSTR(input_file_t_rec.amr_contactname, ' ', 1, 1);
 	space_two2 := INSTR(input_file_t_rec.amr_contactname, ' ', 1, 2);

  	--m_contact_first_name   := input_file_t_rec.amr_contactname;

	IF (space_one1 = NULL) or (space_one1 = 0) THEN
		m_contact_first_name  := NULL;
  		m_contact_middle_name := NULL;
  		m_contact_last_name   := input_file_t_rec.amr_contactname;
 	ELSIF (space_two2 != NULL) or (space_two2 != 0) THEN
  		m_contact_first_name  := SUBSTR(input_file_t_rec.amr_contactname, 1, space_one1);
  		m_contact_middle_name := SUBSTR(input_file_t_rec.amr_contactname, space_one1+1, space_two2-space_one1-1);
  		m_contact_last_name   := SUBSTR(input_file_t_rec.amr_contactname, space_two2+1);
 	ELSE
  		m_contact_first_name  := SUBSTR(input_file_t_rec.amr_contactname, 1, space_one1);
  		m_contact_middle_name := '';
  		m_contact_last_name   := SUBSTR(input_file_t_rec.amr_contactname, space_one1+1);
 	END IF;


        IF (m_customer_first_name is NULL) AND (m_customer_last_name is not NULL) AND (input_file_t_rec.amr_contactname is NULL)
        THEN

                staging_input_rec.bill_to_company       := input_file_t_rec.amr_customername;
                staging_input_rec.payment_name          := input_file_t_rec.amr_customername;
                staging_input_rec.bill_to_first_name    := NULL;
                staging_input_rec.bill_to_middle_name   := NULL;
                staging_input_rec.bill_to_last_name     := NULL;
                staging_input_rec.buss_ind_flag         := 'B';
        ELSIF (m_customer_first_name is NULL) AND (m_customer_last_name is not NULL) AND (m_contact_first_name is NULL) AND (m_contact_last_name is not NULL)
	THEN
                IF m_customer_last_name = m_contact_last_name
                THEN
                        staging_input_rec.bill_to_company       := input_file_t_rec.amr_contactname;
                        staging_input_rec.payment_name          := input_file_t_rec.amr_customername;
                        staging_input_rec.bill_to_first_name    := NULL;
                        staging_input_rec.bill_to_middle_name   := NULL;
                        staging_input_rec.bill_to_last_name     := NULL;
                        staging_input_rec.buss_ind_flag         := 'B';
                ELSE
                        staging_input_rec.bill_to_company       := input_file_t_rec.amr_customername;
                        staging_input_rec.payment_name          := input_file_t_rec.amr_customername;
                        staging_input_rec.bill_to_first_name    := NULL;
                        staging_input_rec.bill_to_middle_name   := NULL;
                        staging_input_rec.bill_to_last_name     := m_contact_last_name;
                        staging_input_rec.buss_ind_flag         := 'B';
                END IF;
        ELSIF (input_file_t_rec.amr_contactname is NOT NULL) AND (input_file_t_rec.amr_contactname != input_file_t_rec.amr_customername)
	--IF (input_file_t_rec.amr_contactname is NOT NULL) AND (input_file_t_rec.amr_contactname != input_file_t_rec.amr_customername)
	THEN
		staging_input_rec.bill_to_company 	:= input_file_t_rec.amr_customername;
 		staging_input_rec.payment_name		:= input_file_t_rec.amr_customername;
		staging_input_rec.bill_to_first_name 	:= m_contact_first_name;
  		staging_input_rec.bill_to_middle_name 	:= m_contact_middle_name;
  		staging_input_rec.bill_to_last_name   	:= m_contact_last_name;
		staging_input_rec.buss_ind_flag 	:= 'B';
 	ELSE
		staging_input_rec.bill_to_first_name  	:= m_customer_first_name;
  		staging_input_rec.bill_to_middle_name 	:= m_customer_middle_name;
  		staging_input_rec.bill_to_last_name   	:= m_customer_last_name;
		staging_input_rec.payment_name		:= input_file_t_rec.amr_customername;
		staging_input_rec.bill_to_company 	:= NULL;
		staging_input_rec.buss_ind_flag 	:= 'I';
 	END IF;

-- Address Concatenation

	IF input_file_t_rec.amr_address2 IS NOT NULL
	THEN
		staging_input_rec.bill_to_address := input_file_t_rec.amr_address1 || CHR(10) || input_file_t_rec.amr_address2;
		staging_input_rec.payment_address := input_file_t_rec.amr_address1 || CHR(10) || input_file_t_rec.amr_address2;
	ELSE
		staging_input_rec.bill_to_address := input_file_t_rec.amr_address1;
		staging_input_rec.payment_address := input_file_t_rec.amr_address1;
	END IF;

--Phone Concatenation

	temp_phone_number := '';
        -- Clean up the phone field
        temp_phone_number := RTRIM(LTRIM(input_file_t_rec.amr_phone));

        temp_phone_number_new := temp_phone_number;

        IF LENGTH(temp_phone_number) >= 10
        THEN
                temp_phone_number_new := SUBSTR(temp_phone_number, 1, 3) || '-' || SUBSTR(temp_phone_number,4,3) || '-' || SUBSTR(temp_phone_number,7,4);
                -- temp_phone_number_new := LTRIM(temp_phone_number, '1');

        END IF;

-- extension prefix changed from ' ' to 'x' by MXW on 02/22
        IF staging_input_rec.buss_ind_flag      = 'I'
        THEN
--              staging_input_rec.bill_to_home_phone := input_file_t_rec.amr_phone || 'x' || input_file_t_rec.amr_extension;
                staging_input_rec.bill_to_home_phone := temp_phone_number_new || 'x' || input_file_t_rec.amr_extension
;
        ELSE
--              staging_input_rec.bill_to_work_phone := input_file_t_rec.amr_phone || 'x' || input_file_t_rec.amr_extension;
                staging_input_rec.bill_to_work_phone := temp_phone_number_new || 'x' || input_file_t_rec.amr_extension
;
        END IF;

	temp_phone_number := '';
	-- Clean up the phone field
        temp_phone_number := RTRIM(LTRIM(input_file_t_rec.amr_fax));

        temp_phone_number_new := temp_phone_number;

        IF LENGTH(temp_phone_number) >= 10
        THEN
                temp_phone_number_new := SUBSTR(temp_phone_number, 1, 3) || '-' || SUBSTR(temp_phone_number,4,3) || '-' || SUBSTR(temp_phone_number,7,4);
        END IF;

        staging_input_rec.bill_to_fax := temp_phone_number_new;

	-- Added logic to mask zip codes 1/2/2001 SDD
	OPEN temp_zip_cur;
	FETCH temp_zip_cur INTO temp_zip;
	CLOSE temp_zip_cur;

--	select TRANSLATE(RTRIM(LTRIM(input_file_t_rec.amr_zipcode)), '1234567890-\/().,=_-= ', '1234567890') into temp_zip from dual;

        zip_length := LENGTH(temp_zip);

        IF zip_length < 5
        THEN
                staging_input_rec.bill_to_zip := LPAD(temp_zip, 5, '0');
        ELSIF zip_length = 5
        THEN
                staging_input_rec.bill_to_zip := temp_zip;
        ELSIF zip_length = 9
        THEN
                staging_input_rec.bill_to_zip := SUBSTR(temp_zip, 1, 5) || '-' || SUBSTR(temp_zip, 6, 4);
        ELSE
                staging_input_rec.bill_to_zip := SUBSTR(temp_zip, 1, 5);
        END IF;
END;
-- ------------------------------------------------------------------------------------

PROCEDURE payment_type (staging_input_rec IN OUT staging_data, input_file_t_rec IN input_file_layout) IS

BEGIN
--	IF  LENGTH(input_file_t_rec.amr_creditcardnumber) = 8 AND SUBSTR(input_file_t_rec.amr_creditcardnumber, 1, 1) = '2'
-- 	THEN
--   		staging_input_rec.payment_method := 'Invoice';
--		staging_input_rec.ccn_num	 := input_file_t_rec.amr_creditcardnumber;
-- 	ELSIF LENGTH(input_file_t_rec.amr_creditcardnumber) = 4 AND SUBSTR(input_file_t_rec.amr_creditcardnumber, 1, 4) = '8888'
--	THEN
--   		staging_input_rec.payment_method := 'Internal';
--		staging_input_rec.ccn_num	 := input_file_t_rec.amr_creditcardnumber;
-- 	ELSIF LENGTH(input_file_t_rec.amr_creditcardnumber) = 4
--	THEN
--   		staging_input_rec.payment_method := 'Guest';
--		staging_input_rec.ccn_num	 := input_file_t_rec.amr_creditcardnumber;
-- 	ELSIF   (LENGTH(input_file_t_rec.amr_creditcardnumber) = 15) OR (LENGTH(input_file_t_rec.amr_creditcardnumber) = 16)
--	THEN
--   		staging_input_rec.payment_method := 'Subord';
--	ELSIF   (LENGTH(input_file_t_rec.amr_creditcardnumber) = 4) AND SUBSTR(input_file_t_rec.amr_creditcardnumber, 1, 4) != '8888'
--	THEN
--   		staging_input_rec.payment_method := 'Subord';
--		staging_input_rec.ccn_num	 := input_file_t_rec.amr_creditcardnumber;
--	ELSE
--     		staging_input_rec.legacy_parent_id := invalid_cc_account_no;
--     		staging_input_rec.account_status   := 'Inactive';
--     		staging_input_rec.payment_method  := 'Subord';
--     		staging_input_rec.cc_number  := '9999999999999999';
-- 	END IF;

-- Status Code Insert

/****************************** Commented out SDD *********************************************
	IF (input_file_t_rec.amr_decommission_date > input_file_t_rec.amr_recommission_date) AND
		(input_file_t_rec.amr_decommission_code IS NOT NULL) AND
		(SUBSTR(TO_CHAR(input_file_t_rec.amr_decommission_code), 1, 1) = '5')
	THEN
		staging_input_rec.account_status := 'Inactive';
		staging_input_rec.account_status_date := input_file_t_rec.amr_decommission_date;
	ELSIF (input_file_t_rec.amr_decommission_code IS NOT NULL) AND
		(input_file_t_rec.amr_recommission_date IS NULL) AND
		(SUBSTR(TO_CHAR(input_file_t_rec.amr_decommission_code), 1, 1) != '5')
	THEN
		staging_input_rec.account_status := 'Inactive';
		staging_input_rec.account_status_date := input_file_t_rec.amr_decommission_date;
	ELSIF (input_file_t_rec.amr_decommission_date > input_file_t_rec.amr_recommission_date) AND
		(input_file_t_rec.amr_decommission_code IS NOT NULL) AND
		(SUBSTR(TO_CHAR(input_file_t_rec.amr_decommission_code), 1, 1) != '5')
	THEN
		staging_input_rec.account_status := 'Inactive';
		staging_input_rec.account_status_date := input_file_t_rec.amr_decommission_date;
****************************** Commented out SDD *********************************************/

	IF input_file_t_rec.amr_statuscode = 'AA'
	THEN
		staging_input_rec.account_status := 'Active';
	ELSIF input_file_t_rec.amr_statuscode = 'TA'
	THEN
		staging_input_rec.account_status := 'Inactive';
		staging_input_rec.account_status_date := input_file_t_rec.amr_decommission_date;
		staging_input_rec.decommission_code	:= input_file_t_rec.amr_decommission_code;
	ELSIF input_file_t_rec.amr_statuscode = 'TT'
	THEN
		staging_input_rec.account_status := 'Inactive';
		staging_input_rec.account_status_date := input_file_t_rec.amr_decommission_date;
		staging_input_rec.decommission_code	:= input_file_t_rec.amr_decommission_code;
	ELSIF input_file_t_rec.amr_statuscode = 'NA'
	THEN
		staging_input_rec.account_status := 'Active';
	ELSIF input_file_t_rec.amr_statuscode = 'NB'
	THEN
		staging_input_rec.account_status := 'Active';
	ELSIF input_file_t_rec.amr_statuscode = 'NP'
		THEN
		staging_input_rec.account_status := 'Active';
	ELSIF input_file_t_rec.amr_statuscode = 'CA'
	THEN
		staging_input_rec.account_status := 'Active';
	ELSE
		staging_input_rec.account_status := 'Active';
	END IF;

	IF (input_file_t_rec.amr_recommission_date is not NULL) and
	   (input_file_t_rec.amr_decommission_date is not NULL) and
	   (input_file_t_rec.amr_decommission_date > input_file_t_rec.amr_recommission_date)
	THEN
		staging_input_rec.account_status := 'Inactive';
		staging_input_rec.account_status_date := input_file_t_rec.amr_decommission_date;
		staging_input_rec.decommission_code	:= input_file_t_rec.amr_decommission_code;
	END IF;

	IF (input_file_t_rec.amr_recommission_date is NULL) and
	   (input_file_t_rec.amr_decommission_date is not NULL) and
	   (input_file_t_rec.amr_decommission_date > input_file_t_rec.amr_recommission_date)
	THEN
		staging_input_rec.account_status := 'Inactive';
		staging_input_rec.account_status_date := input_file_t_rec.amr_decommission_date;
		staging_input_rec.decommission_code	:= input_file_t_rec.amr_decommission_code;
	END IF;

	IF (SUBSTR(TO_CHAR(input_file_t_rec.amr_decommission_code), 1, 1) = '5')
	THEN
		staging_input_rec.account_status := 'Inactive';
		staging_input_rec.account_status_date := input_file_t_rec.amr_decommission_date;
		staging_input_rec.decommission_code	:= input_file_t_rec.amr_decommission_code;
	END IF;


	IF (input_file_t_rec.amr_recommission_date is not NULL) and
	   (input_file_t_rec.amr_decommission_date is not NULL) and
	   (input_file_t_rec.amr_recommission_date >= input_file_t_rec.amr_decommission_date)
	THEN
		staging_input_rec.account_status := 'Active';
		staging_input_rec.account_status_date := input_file_t_rec.amr_recommission_date;
		staging_input_rec.decommission_code	:= '';
	END IF;


END;

-- --------------------------------------------------------------------------------------------

FUNCTION GET_PARENT_ACCOUNT_NO (input_file_t_rec IN input_file_layout) RETURN VARCHAR2 IS

	rvalue          VARCHAR2(16);
 	tempccnum 	VARCHAR2(16);

BEGIN
        rvalue := NULL;

--       	IF LENGTH(input_file_t_rec.amr_creditcardnumber) = 8
--	THEN
----		SELECT p.ccn_num FROM profile_customer_t p
----               WHERE input_file_t_rec.amr_creditcardnumber = p.ccn_num into :tempccnum;
--
--        	IF input_file_t_rec.amr_creditcardnumber != NULL
--		THEN
--                        select a.poid_id0 from account_t a where a.parent_id0 = 0 and a.poid_id0
--                        in (select b.account_obj_id0 from profile_t b
--                        where b.poid_id0 in (select c.obj_id0 from hns_profile_customer_t c
--                        where c.hns_ccn_number = input_file_t_rec.amr_creditcardnumber));
--
--                        rvalue := a.poid_id0;
--                END IF;
--

--	IF (LENGTH(input_file_t_rec.amr_creditcardnumber) = 15) OR (LENGTH(input_file_t_rec.amr_creditcardnumber) = 16)
--      THEN
--	        SELECT debit_num FROM payinfo_cc_t
--              WHERE input_file_t_rec.input_file_t_rec.amr_creditcardnumber = debit_num;
--
--              	IF input_file_t_rec.amr_creditcardnumber != NULL
--		THEN
--                        select a.poid_id0 from account_t a where a.parent_id0 = 0 and a.poid_id0
--                        in (select d.account_obj_id0 from payinfo_t d
--                        where d.poid_id0 in (select e.obj_id0 from payinfo_cc_t e
--                        where e.debit_num = hns_input_file_t.amr_creditcardnumber));
--
--                        rvalue := a.poid_id0;
--                END IF;
--	ELSE
----		SELECT p.ccn_num FROM profile_customer_t creditcardnumber));
--
--                        rvalue := a.poid_id0;
--                END IF;
--	ELSE
----		SELECT p.ccn_num FROM profile_customer_t p
----              WHERE input_file_t_rec.amr_creditcardnumber = p.ccn_num into :tempccnum;
--
--        	IF input_file_t_rec.amr_creditcardnumber != NULL
--		THEN
--                        select a.poid_id0 from account_t a where a.parent_id0 = 0 and a.poid_id0
--                        in (select b.account_obj_id0 from profile_t b
--                        where b.poid_id0 in (select c.obj_id0 from hns_profile_customer_t c
--                        where c.hns_ccn_number = input_file_t_rec.amr_creditcardnumber));
--
--                        rvalue := a.poid_id0;
--                END IF;
--        END IF;


--	IF  SUBSTR(input_file_t_rec.amr_rateplan, 1, 1) = 'P'
--	THEN
--		select a.account_no into rvalue from account_t a where a.poid_id0
--               in (select b.account_obj_id0 from profile_t b
--                where b.poid_id0 in (select c.obj_id0 from hns_profile_customer_t c
--                where c.hns_provider_id in (select d.hns_siteid from hns_rateplan_siteid_t d
--		where d.hns_rateplan = input_file_t_rec.amr_rateplan)));
-- SDD added changes for provider child
--	ELSE
--		rvalue := input_file_t_rec.amr_account
--	END IF;

     	RETURN rvalue;
END;

-- ---------------------------------------------------------------------------------------

PROCEDURE account_hierarchy (staging_input_rec IN OUT staging_data, input_file_t_rec IN input_file_layout) IS

BEGIN
--	staging_input_rec.legacy_parent_id 	:= GET_PARENT_ACCOUNT_NO(input_file_t_rec);

--
-- Should always be "Subord' payment method for child provider accounts.
--

--	IF staging_input_rec.legacy_parent_id IS NOT NULL
--	THEN
--		staging_input_rec.payment_method := 'Subord';
--		staging_input_rec.legacy_acct_id	:= staging_input_rec.legacy_parent_id;
--	ELSE
--		staging_input_rec.legacy_parent_id 	:= input_file_t_rec.amr_account;
--		staging_input_rec.legacy_acct_id	:= input_file_t_rec.amr_account;
--	END IF;

	staging_input_rec.legacy_parent_id 	:= input_file_t_rec.amr_account;
	staging_input_rec.payment_method := 'Subord';


END;

BEGIN

-- Get the invalid account no from the database;

OPEN invalid_cc_account_no_cur;
FETCH invalid_cc_account_no_cur INTO invalid_cc_account_no;
CLOSE invalid_cc_account_no_cur;

-- SELECT account_no INTO invalid_cc_account_no
--   FROM account_t
--   WHERE poid_id0 =
--        (SELECT obj_id0
--         FROM account_nameinfo_t
--         WHERE first_name = 'Invalid'); -- into :invalid_cc_account_no;

 OPEN read_input_records;

 LOOP <<main_loop>>

  FETCH read_input_records INTO input_file_t_rec;

  EXIT WHEN read_input_records%NOTFOUND;

  format_fields(staging_input_rec, input_file_t_rec);

  payment_type(staging_input_rec, input_file_t_rec);

  account_hierarchy(staging_input_rec, input_file_t_rec);

  INSERT INTO hns_input_site_data_t
   VALUES(
    	staging_input_rec.legacy_acct_id,
	staging_input_rec.legacy_parent_id,
	staging_input_rec.brand_name,
	staging_input_rec.account_status,
	staging_input_rec.account_status_date,
	staging_input_rec.bill_to_salutation,
	staging_input_rec.bill_to_title,
	initcap(staging_input_rec.bill_to_company),
	initcap(staging_input_rec.bill_to_first_name),
	initcap(staging_input_rec.bill_to_middle_name),
	initcap(staging_input_rec.bill_to_last_name),
	initcap(staging_input_rec.bill_to_address),
	initcap(staging_input_rec.bill_to_city),
	staging_input_rec.bill_to_state,
	staging_input_rec.bill_to_zip,
	staging_input_rec.bill_to_country,
	staging_input_rec.bill_to_home_phone,
	staging_input_rec.bill_to_work_phone,
	staging_input_rec.bill_to_fax,
	staging_input_rec.bill_to_pager,
	staging_input_rec.bill_to_portable_phone,
	staging_input_rec.bill_to_pop,
	staging_input_rec.bill_to_support_phone,
	staging_input_rec.access_code_1,
	staging_input_rec.access_code_2,
	lower(staging_input_rec.email_address),
	staging_input_rec.cc_number,
	staging_input_rec.cc_exp_date,
	staging_input_rec.dd_bank_no,
	staging_input_rec.dd_debit_num,
	staging_input_rec.dd_type,
	initcap(staging_input_rec.payment_name),
	initcap(staging_input_rec.payment_address),
	initcap(staging_input_rec.payment_city),
	staging_input_rec.payment_state,
	staging_input_rec.payment_zip,
	staging_input_rec.payment_country,
	staging_input_rec.payment_method,
	staging_input_rec.account_creation_date,
	staging_input_rec.last_billed_date,
	staging_input_rec.bill_cycle_months,
	staging_input_rec.currency,
	staging_input_rec.credit_limit,
	staging_input_rec.bal_fwd_amt_current,
	staging_input_rec.po_number,
	staging_input_rec.decommission_date,
	staging_input_rec.recommission_date,
	staging_input_rec.decommission_code,
	staging_input_rec.status_flag,
	staging_input_rec.buss_ind_flag,
	staging_input_rec.ccn_num,
	staging_input_rec.first_commissioned_by,
	staging_input_rec.customer_type,
	staging_input_rec.discount_authorizer,
	staging_input_rec.serial_no,
	staging_input_rec.notes,

	staging_input_rec.tax_definitions,
	staging_input_rec.site_id,
	staging_input_rec.rate_plan,
	staging_input_rec.free_monthly_access,
	staging_input_rec.months_remaining,
	staging_input_rec.free_plan_fee,
	staging_input_rec.free_usage,
	staging_input_rec.csr_defined,
	staging_input_rec.ch_price,
	staging_input_rec.flag
       );



 END LOOP main_loop;

 CLOSE read_input_records;


END hns_bus_policy_site_main;

/
--------------------------------------------------------
--  DDL for Procedure HNS_CALC_NEWTAB_VAR_RESIDUAL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_CALC_NEWTAB_VAR_RESIDUAL" IS
--
-- This procedure should be run after the sub-ordinate billing.
-- It calaculates the residual amount for all var for which rules are
-- configured through BWS.
-- ---------   ------  -------------------------------------------
    var_account  account_t.account_no%TYPE;
    bucket_start_t  INTEGER;
    bucket_end_t INTEGER;
    site_count INTEGER;
    percentage_discount hns_var_contract_thresholds_t.percentage_discount%TYPE;
    total_service_charges NUMBER;
    exempt_amount NUMBER;
    total_adjustment NUMBER;
    amount NUMBER;
    residual_amount NUMBER;
    billing_t INTEGER;
    bill_start_t INTEGER;
    ar_bill_poid INTEGER;
    coll_status INTEGER;
    record_status VARCHAR2(1);
    err_code NUMBER;
    err_msg VARCHAR2(250);

    CURSOR var_accounts_cur IS
        select distinct a.account_no
        from  hns_var_contract_t hv,
              account_t a,
              billinfo_t bi
        where hv.account_no = a.account_no
        and   a.poid_id0 = bi.account_obj_id0
        and   bi.ACTG_NEXT_T = d2u(to_char(sysdate, 'mm/dd/yyyy'))
        and exists (select 1
                    from   hns_var_contract_thresholds_t hvct
                    where  hvct.var_contract_id = hv.var_contract_id
                    and    status = 'A');

    CURSOR bucket_cur (var_account VARCHAR2) IS
        select start_t, end_t
        from   hns_var_contract_thresholds_t hvct, hns_var_contract_t hvc
        where  hvc.var_contract_id = hvct.var_contract_id
        and    hvc.account_no = var_account
        and    status = 'A'
        group  by start_t, end_t;


BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting var residual procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');


-- 1. Get the list of all VARs for which the residual rules are configured

    FOR var_account_list in var_accounts_cur
    LOOP
     var_account := var_account_list.account_no;
     DBMS_OUTPUT.PUT_LINE('**********************************');
     DBMS_OUTPUT.PUT_LINE('Processing account: ' || var_account);


-- 2. For each var do the following
-- 2a0. Get the actg_next_t to insert as BILLING_T
       select bi.actg_next_t, bi.scenario_obj_id0 into billing_t, coll_status
       from   billinfo_t bi, account_t a
       where  a.account_no = var_account
       and    a.poid_id0 = bi.account_obj_id0;

-- 2a. Get all distinct buckets based on start and end date

    FOR bucket_list in bucket_cur (var_account)
    LOOP

    DBMS_OUTPUT.PUT_LINE('###################################');

     bucket_start_t := bucket_list.start_t;
     bucket_end_t := bucket_list.end_t;

     DBMS_OUTPUT.PUT_LINE('Start time for the current bucket is: ' || bucket_start_t);
     DBMS_OUTPUT.PUT_LINE('Start time for the current bucket is: ' || bucket_end_t);

     BEGIN --Exception handling

-- Get the parent bill poid
     select poid_id0 into ar_bill_poid  from bill_t where account_obj_id0 = a2p(var_account) and end_t = 0 and bill_no is null;


-- 2b. For each bucket do the following

-- 2ba. Get the number of sites in the bucket

        select count(*) into site_count
        from   account_t a, group_t g, group_billing_members_t gbm
        where  a.account_no = var_account
        and    g.ACCOUNT_OBJ_ID0 = a.poid_id0
        and    g.POID_ID0 = gbm.obj_id0
        and    exists ( select 1
                        from   service_t s
                        where  s.created_t >= bucket_start_t
                        and    s.created_t <= bucket_end_t
                        and    s.account_obj_id0 = gbm.object_id0
                        and    s.poid_type = '/service/ip'
                        and    s.status = 10100 );

        DBMS_OUTPUT.PUT_LINE('Subordinate accounts with active service IP created in the bucket ' || site_count);

-- 2bb. Get the residual percentage based on where number of sites lie in the
--      threshold range.

       select decode(sum(percentage_discount), NULL, 0, sum(percentage_discount)) into percentage_discount
       from   hns_var_contract_thresholds_t hvct, hns_var_contract_t hvc
       where  hvc.var_contract_id = hvct.var_contract_id
       and    hvc.account_no = var_account
       and    status = 'A'
       and    start_t =  bucket_start_t
       and    end_t = bucket_end_t
       and    threshold_start <= site_count
       and    ( threshold_end >= site_count or threshold_end = -1 );

       DBMS_OUTPUT.PUT_LINE('Percentage discount to be given ' || percentage_discount);

-- 2bc. Get the total service charge for the sites in the bucket.

       select decode(sum(item_total), NULL, 0, sum(item_total)) into total_service_charges
       from   item_t i
       where  i.bill_obj_id0 in  (select b.poid_id0
                                from bill_t b, group_billing_members_t gbm, group_t g
                                where g.poid_id0 = gbm.obj_id0
                                and   g.account_obj_id0 = a2p(var_account)
                                and   gbm.object_id0 = b.account_obj_id0
                                and   b.bill_no is null
                                and   b.end_t  = billing_t
                                )
       and    i.SERVICE_OBJ_TYPE not in ('/service/lease','/service/tax')
       and i.account_obj_id0 <> a2p(var_account)
       and    exists ( select 1
                        from   account_t a2
                        where  a2.created_t >= bucket_start_t
                        and    a2.created_t <= bucket_end_t
                        and    a2.poid_id0 = i.account_obj_id0 );

       select decode(sum(ebi.amount), NULL, 0, sum(ebi.amount)) into exempt_amount
       from   event_bal_impacts_t ebi, deal_products_t dp, purchased_product_t pp,
                (select distinct deal_obj_id0
                from   hns_var_contract_exemptions_t hvce, hns_var_contract_t hvc
                where  hvc.var_contract_id = hvce.var_contract_id
                and    ((hvc.account_no = var_account
                         and    hvc.start_t =  bucket_start_t
                         and    hvc.end_t = bucket_end_t
                         and exists (select 1
                                     from   hns_var_contract_thresholds_t hvct
                                     where  hvct.var_contract_id = hvc.var_contract_id
                                     and    status = 'A')
                         )
                        or hvc.var_contract_id = -1
                       )
                and    hvce.status = 'A') hved
       where  ebi.obj_id0 > date_to_low_poid(to_date(to_char(add_months(sysdate,-1))))
       and    ebi.obj_id0 <= date_to_high_poid(to_date(to_char(sysdate)))
       and    exists ( select 1
                       from   item_t i
                       where  i.bill_obj_id0 in  (select b.poid_id0
                                from bill_t b, group_billing_members_t gbm, group_t g
                                where g.poid_id0 = gbm.obj_id0
                                and   g.account_obj_id0 = a2p(var_account)
                                and   gbm.object_id0 = b.account_obj_id0
                                and   b.bill_no is null
                                and   b.end_t  = billing_t
                                )
            and    i.poid_id0 = ebi.item_obj_id0
            and    i.account_obj_id0 <> a2p(var_account)
            )
       and     hved.deal_obj_id0 = dp.obj_id0
       and     dp.product_obj_id0 = ebi.product_obj_id0
       and     dp.product_obj_id0 =pp.product_obj_id0
       and     pp.account_obj_id0 = ebi.account_obj_id0
       and     pp.DEAL_OBJ_ID0 = dp.obj_id0
       and     ebi.resource_id = 840
       and     pp.poid_id0  = ebi.offering_obj_id0
       and    exists ( select 1
                        from   account_t a2
                        where  a2.created_t >= bucket_start_t
                        and    a2.created_t <= bucket_end_t
                        and    a2.poid_id0 = ebi.account_obj_id0 );

       DBMS_OUTPUT.PUT_LINE('Total service charges in bucket ' || total_service_charges);
       DBMS_OUTPUT.PUT_LINE('Total exempt amount in bucket ' || exempt_amount);

-- Get the bill start_t to get the adjustments only after that date.
       select actg_last_t into bill_start_t
       from   billinfo_t bi
       where  bi.account_obj_id0 = a2p(var_account);
-- 2bd. Get all the adjustment with the reason code not like RESIDUAL or AGREEMENT

       select decode(sum(item_total), NULL, 0, sum(item_total)) into total_adjustment
       from   item_t i, event_t e
       where  i.ar_billinfo_obj_id0 = (select a2arbi(var_account) from dual)
       and    i.effective_t > bill_start_t
       and    i.effective_t >= bucket_start_t
       and    i.effective_t <= bucket_end_t
       and    i.effective_t < billing_t
       and    e.item_obj_id0 = i.poid_id0
       and    upper(e.descr) not like '%RESIDUAL%'
       and    upper(e.descr) not like '%AGREEMENT%'
       and    upper(e.descr) not like '%REVERSE SERVICE TERMINATION FEE%'
       and    upper(e.descr) not like '%TAX%'
	   and    upper(e.descr) not like '%CONVERTED TO LONG TERM NOTE%'
	   and    upper(e.descr) not like '%SETTLEMENT%'
       and    i.POID_TYPE = '/item/adjustment'
       and    e.poid_type like '/event/billing/adjustment/%';

       DBMS_OUTPUT.PUT_LINE('Total adjustment not including RESIDUAL and AGREEMENT ' || total_adjustment);

-- 2be. Calculate total Amount

        amount := total_service_charges - exempt_amount + total_adjustment;
        DBMS_OUTPUT.PUT_LINE('Total amount ' || amount);

-- 2bf1. calculate residual_amount

        residual_amount := (amount * percentage_discount) / 100;
        DBMS_OUTPUT.PUT_LINE('Total residual ' || residual_amount);

-- 2bf2. Insert STATUS as 'C' if coll_status > 0
    IF coll_status > 0 THEN
        record_status := 'C';
    ELSE
		IF residual_amount < 0 THEN
			--SPR 55046 (If the residual amount is going to create a debit, don't post it to the account)
			record_status := 'N';
		ELSE
			record_status := 'R';
		END IF;
    END IF;

-- 2bg. Insert following information in the table HNS_CALCULATED_VAR_RESIDUAL_T
--      CREATED_T, ACOUNT_NUMBER, START_T, END_T, NO_OF_SITES, SERVICE_AMOUNT, ADJUSTMENTS,
--      PERCENTAGE, RESIDUAL, STATUS, DESCR

        DBMS_OUTPUT.PUT_LINE('Inserting residual data into HNS_CALCULATED_VAR_RESIDUAL_T');
        INSERT INTO PIN.HNS_CALCULATED_VAR_RESIDUAL_T
                        ( CREATED_T, ACCOUNT_NO, START_T,
                          END_T, NO_OF_SITES, SERVICE_CHARGES,
                          ADJUSTMENTS, PERCENTAGE, RESIDUAL,
                          STATUS, DESCR, BILLING_T, EXEMPT_AMOUNT)
                 VALUES ( DATE_TO_infranet(sysdate), var_account, bucket_start_t,
                          bucket_end_t, site_count, total_service_charges,
                          total_adjustment, percentage_discount, residual_amount,
                          record_status, ' ', billing_t, exempt_amount);

        commit;

    EXCEPTION
    WHEN OTHERS THEN
        err_code := SQLCODE;
        err_msg := SUBSTR(SQLERRM, 1, 250);
        INSERT INTO hns_audit_var_residual_t (error_var, error_t, error_num, error_msg) VALUES (var_account, d2i(sysdate),err_code, err_msg);
        commit;
    END; --Exception handling

     END LOOP; -- for each bucket.

   END LOOP; -- for each var_account.

DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending var residual procedure ' || sysdate);

END; -- Procedure HNS_CALC_NEWTAB_VAR_RESIDUAL

/
--------------------------------------------------------
--  DDL for Procedure HNS_COMMITMENT_INFO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_COMMITMENT_INFO" AS
AccountNo VARCHAR2(255);
CreatedT  INTEGER;
Commitment_Type INTEGER;
Commitment_End_Date VARCHAR2(255);

  CURSOR comm_deal_pur_prev_day IS
SELECT distinct X.accountNo SAN,
         X.service_obj_type,(select case when poid_type = '/service/ip' then '1' when poid_type = '/service/dsl' then '2' end
from service_t where account_obj_id0 = a2p(X.accountNo)
and poid_type in ('/service/ip', '/service/dsl') and rownum < 2) as Commitment_Type,
               (select (created_t) from account_t where poid_id0=a2p(X.accountNo)) as account_created,
X.product, X.deal, X.product_purchased, X.cycle_start, X.cycle_end,
                ADD_MONTHS (next_bill_date,
                            DECODE (SIGN (term - current_balance),
                                    -1, term - current_balance,
                                    term - current_balance
                                   )
                           ) term_date,
                ADD_MONTHS (next_bill_date,
                           -current_balance) term_start_date,
         X.current_balance, term
           FROM (SELECT u2d(A.CREATED_T) account_created, u2d(ap.created_t) as purchased_date, a.account_no AS accountNo,
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
                        (SELECT u2d (bi.next_bill_t)
                           FROM billinfo_t bi
                          WHERE a.poid_id0 =
                                            bi.account_obj_id0
                            AND bi.bill_info_id = 'Account Billinfo')
                                                               next_bill_date,
                        r.step_resource,
                 RBI.ELEMENT_ID , u2d(AP.CYCLE_START_T) cycle_start, u2d(AP.CYCLE_END_T) cycle_end,
                 u2d(AP.CREATED_T) product_purchased, p2pr(AP.PRODUCT_OBJ_ID0) product, AP.QUANTITY, RP.TAX_CODE, AP.STATUS,
                 RP.EVENT_TYPE, AP.DEAL_OBJ_ID0, AP.PRODUCT_OBJ_ID0, AP.PACKAGE_ID, a.poid_id0 account_obj_id0, e.poid_type
                   FROM purchased_product_t ap,
                        account_t a,
                        deal_t d,
                      rate_plan_t rp,
                        rate_t r,
                        rate_bal_impacts_t rbi,
                        rate_tiers_t rt,
                        rate_quantity_tiers_t rqt,event_t e
                  WHERE ap.account_obj_id0 = a.poid_id0
                  and e.account_obj_id0=ap.account_obj_id0
                  and ap.service_obj_id0=e.service_obj_id0
                    AND ap.deal_obj_id0 = d.poid_id0
                    AND ap.product_obj_id0 = rp.product_obj_id0
                    AND rp.poid_id0 = r.rate_plan_obj_id0
                    AND rbi.obj_id0 = r.poid_id0
                    AND rqt.obj_id0 = r.poid_id0
                    AND r.rate_plan_obj_id0 = rt.obj_id0
                    AND rqt.obj_id0 = r.poid_id0
                    and RBI.REC_ID2 = RQT.REC_ID
                 -- and e.poid_id0 >= (select d2lp(trunc(sysdate-1)) from dual)
               --   and e.poid_id0 < (select d2lp(trunc(sysdate)) from dual)
                and AP.CREATED_T >= (select d2i(trunc(sysdate-1)) from dual)
                 and AP.CREATED_T < (select d2i(trunc(sysdate)) from dual)
                                     and ap.service_obj_type ='/service/commitment'
                                     and e.poid_type = '/event/billing/product/fee/purchase'
                                     and e.poid_type = rp.event_type
                ) X
;

  CURSOR comm_deal_can_prev_day IS
SELECT distinct X.accountNo SAN,
         X.service_obj_type,
(select case when poid_type = '/service/ip' then '1' when poid_type = '/service/dsl' then '2' end
from service_t where account_obj_id0 = a2p(X.accountNo)
and poid_type in ('/service/ip', '/service/dsl') and rownum < 2) as Commitment_Type,
               (select (created_t) from account_t where poid_id0=a2p(X.accountNo)) as account_created,
         X.product, X.deal, X.product_purchased, X.cycle_start, X.cycle_end,
                ADD_MONTHS (next_bill_date,
                            DECODE (SIGN (term - current_balance),
                                    -1, term - current_balance,
                                    term - current_balance
                                   )
                           ) term_date,
                ADD_MONTHS (next_bill_date,
                           -current_balance) term_start_date,
         X.current_balance, term
           FROM (SELECT u2d(A.CREATED_T) account_created, u2d(ap.created_t) as purchased_date, a.account_no AS accountNo,
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
                        (SELECT u2d (bi.next_bill_t)
                           FROM billinfo_t bi
                          WHERE a.poid_id0 =
                                            bi.account_obj_id0
                            AND bi.bill_info_id = 'Account Billinfo')
                                                               next_bill_date,
                        r.step_resource,
                 RBI.ELEMENT_ID , u2d(AP.CYCLE_START_T) cycle_start, u2d(AP.CYCLE_END_T) cycle_end,
                 u2d(AP.CREATED_T) product_purchased, p2pr(AP.PRODUCT_OBJ_ID0) product, AP.QUANTITY, RP.TAX_CODE, AP.STATUS,
                 RP.EVENT_TYPE, AP.DEAL_OBJ_ID0, AP.PRODUCT_OBJ_ID0, AP.PACKAGE_ID, a.poid_id0 account_obj_id0, e.poid_type
                   FROM purchased_product_t ap,
                        account_t a,
                        deal_t d,
                        rate_plan_t rp,
                        rate_t r,
                        rate_bal_impacts_t rbi,
                        rate_tiers_t rt,
                        rate_quantity_tiers_t rqt,event_t e
                  WHERE ap.account_obj_id0 = a.poid_id0
                  and e.account_obj_id0=ap.account_obj_id0
                  and ap.service_obj_id0=e.service_obj_id0
                    AND ap.deal_obj_id0 = d.poid_id0
                    AND ap.product_obj_id0 = rp.product_obj_id0
                    AND rp.poid_id0 = r.rate_plan_obj_id0
                    AND rbi.obj_id0 = r.poid_id0
                    AND rqt.obj_id0 = r.poid_id0
                    AND r.rate_plan_obj_id0 = rt.obj_id0
                    AND rqt.obj_id0 = r.poid_id0
                    and RBI.REC_ID2 = RQT.REC_ID
                 -- and e.poid_id0 >= (select d2lp(trunc(sysdate-1)) from dual)
               --   and e.poid_id0 < (select d2lp(trunc(sysdate)) from dual)
                and AP.CREATED_T >= (select d2i(trunc(sysdate-1)) from dual)
                 and AP.CREATED_T < (select d2i(trunc(sysdate)) from dual)
                                     and ap.service_obj_type ='/service/commitment'
                                     and e.poid_type = '/event/billing/product/fee/cancel'
                                     and e.poid_type = rp.event_type
                ) X
;
    CURSOR act_serv_activate_prev_day IS
select (select (created_t) from account_t where poid_id0=a2p(SAN)) as account_created,Y.SAN,Y.Commitment_Type,Y.term_date from (SELECT  X.accountNo SAN,ROW_NUMBER() OVER (PARTITION BY X.accountNo ORDER BY X.EVENT_CREATION_DATE desc) AS rule,
         X.service_obj_type,(select case when poid_type = '/service/ip' then '1' when poid_type = '/service/dsl' then '2' end
from service_t where account_obj_id0 = a2p(X.accountNo)
and poid_type in ('/service/ip', '/service/dsl')) as Commitment_Type, X.product, X.deal, X.product_purchased, X.cycle_start,X.cycle_end,
                ADD_MONTHS (next_bill_date,
                            DECODE (SIGN (term - current_balance),
                                    -1, term - current_balance,
                                    term - current_balance
                                   )
                           ) term_date,
                ADD_MONTHS (next_bill_date,
                           -current_balance) term_start_date,
         X.current_balance, term , Descr
           FROM (select e.created_t EVENT_CREATION_DATE, e.descr as Descr,u2d(A.CREATED_T) account_created, u2d(ap.created_t) as purchased_date, a.account_no AS accountNo,u2d(AP.CYCLE_START_T) cycle_start, u2d(AP.CYCLE_END_T) cycle_end,
           u2d(AP.CREATED_T) product_purchased,p2pr(AP.PRODUCT_OBJ_ID0) product,
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
                        (SELECT u2d (bi.next_bill_t)
                           FROM billinfo_t bi
                          WHERE a.poid_id0 =
                                            bi.account_obj_id0
                            AND bi.bill_info_id = 'Account Billinfo')
                                                               next_bill_date
from purchased_product_t ap, event_t e, account_t a, deal_t d,rate_t r, rate_plan_t rp
where ap.account_obj_id0=a.poid_id0
and ap.deal_obj_id0=d.poid_id0
and e.poid_type='/event/customer/status'
and e.service_obj_type='/service/commitment'
and e.service_obj_id0=ap.service_obj_id0
and e.account_obj_id0=ap.account_obj_id0
and ap.status=1
AND ap.product_obj_id0 = rp.product_obj_id0
AND rp.poid_id0 = r.rate_plan_obj_id0
and rp.event_type='/event/billing/product/fee/purchase'
and e.poid_id0 >= (select d2lp(trunc(sysdate-1)) from dual)
and e.poid_id0 < (select d2lp(trunc(sysdate)) from dual))X

)Y
where rule = 1
;

      account_rec  comm_deal_pur_prev_day%ROWTYPE;

      account_canc_rec  comm_deal_can_prev_day%ROWTYPE;

 account_serv_activate_prev_day  act_serv_activate_prev_day%ROWTYPE;

BEGIN
DBMS_OUTPUT.PUT_LINE ('account_rec');
  FOR account_rec in comm_deal_pur_prev_day
    LOOP
--DBMS_OUTPUT.PUT_LINE ('Account is a parent account');
     AccountNo := account_rec.SAN;
     CreatedT  := account_rec.account_created;
     Commitment_Type  := account_rec.Commitment_Type;
     Commitment_End_Date  := account_rec.TERM_DATE;

  --   DBMS_OUTPUT.PUT_LINE ('Account:' || AccountNo || 'CreatedT:' || CreatedT || 'Commitment_Type:' || Commitment_Type || 'Commitment_End_Date:' || Commitment_End_Date);

       INSERT INTO hns_commitment_info_t (REC_ID, CREATED_T, ACCOUNT_NO, COMMITMENT_TYPE, COMMITMENT_END_DATE)
     VALUES (HNS_COMMITMENT_INFO_T_SEQ.nextval, CreatedT, AccountNo,Commitment_Type,Commitment_End_Date);
        commit;


           END LOOP; -- for each entry.
DBMS_OUTPUT.PUT_LINE ('account_canc_rec');
FOR account_canc_rec in comm_deal_can_prev_day
    LOOP
--DBMS_OUTPUT.PUT_LINE ('Account is a parent account');
     AccountNo := account_canc_rec.SAN;
     CreatedT  := account_canc_rec.account_created;
     Commitment_Type  := account_canc_rec.Commitment_Type;
     Commitment_End_Date  := account_canc_rec.TERM_DATE;

  --   DBMS_OUTPUT.PUT_LINE ('Account:' || AccountNo || 'CreatedT:' || CreatedT || 'Commitment_Type:' || Commitment_Type || 'Commitment_End_Date:' || Commitment_End_Date);

       INSERT INTO hns_commitment_info_t (REC_ID, CREATED_T, ACCOUNT_NO, COMMITMENT_TYPE, COMMITMENT_END_DATE)
     VALUES (HNS_COMMITMENT_INFO_T_SEQ.nextval, CreatedT, AccountNo,Commitment_Type,Commitment_End_Date);
        commit;

END LOOP; -- for each entry.
DBMS_OUTPUT.PUT_LINE ('account_serv_activate_prev_day');

  FOR account_serv_activate_prev_day in act_serv_activate_prev_day
    LOOP
--DBMS_OUTPUT.PUT_LINE ('Account is a parent account');
     AccountNo := account_serv_activate_prev_day.SAN;
     CreatedT  := account_serv_activate_prev_day.account_created;
     Commitment_Type  := account_serv_activate_prev_day.Commitment_Type;
     Commitment_End_Date  := account_serv_activate_prev_day.TERM_DATE;

  --   DBMS_OUTPUT.PUT_LINE ('Account:' || AccountNo || 'CreatedT:' || CreatedT || 'Commitment_Type:' || Commitment_Type || 'Commitment_End_Date:' || Commitment_End_Date);

       INSERT INTO hns_commitment_info_t (REC_ID, CREATED_T, ACCOUNT_NO, COMMITMENT_TYPE, COMMITMENT_END_DATE)
     VALUES (HNS_COMMITMENT_INFO_T_SEQ.nextval, CreatedT, AccountNo,Commitment_Type,Commitment_End_Date);
        commit;
    END LOOP; -- for each entry.



END HNS_COMMITMENT_INFO;

/
--------------------------------------------------------
--  DDL for Procedure HNS_COMMITMENT_INFO_OT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_COMMITMENT_INFO_OT" AS
AccountNo VARCHAR2(255);
CreatedT  INTEGER;
Commitment_Type INTEGER;
Commitment_End_Date VARCHAR2(255);

  CURSOR hns_pending_commitment_billing IS
       select  Y.SAN,
               Y.TERM,
               Y.CURRENT_BALANCE,
               (select (created_t) from account_t where poid_id0=a2p(Y.SAN)) as account_created,
               ADD_MONTHS (Y.next_bill_date,- Y.current_balance)
                 as TERM_START_DATE,
               (select case when poid_type = '/service/ip' then '1' when poid_type = '/service/dsl' then '2' end from service_t where account_obj_id0 = a2p(Y.SAN) and poid_type in ('/service/ip', '/service/dsl') and rownum <2)
                 as Commitment_Type,
               ADD_MONTHS (Y.next_bill_date, DECODE (SIGN (Y.term - Y.current_balance),-1, Y.term - Y.current_balance,Y.term - Y.current_balance))
                 as TERM_DATE
      from (select p2a(AccountPoid) as SAN,
                   X.Term as TERM,
                   (SELECT SUM (current_bal) FROM bal_grp_sub_bals_t s, bal_grp_t b WHERE b.poid_id0 = s.obj_id0 AND s.valid_to = 0 AND b.account_obj_id0 = X.AccountPoid AND EXISTS ( SELECT 1 FROM rate_plan_t rp, rate_t r, rate_quantity_tiers_t rq WHERE X.ProductPoid = rp.product_obj_id0 AND r.step_resource = s.rec_id2 AND r.rate_plan_obj_id0 = rp.poid_id0 AND r.poid_id0 = rq.obj_id0))
                      AS CURRENT_BALANCE,
                   (SELECT u2d (bi.next_bill_t) FROM billinfo_t bi WHERE X.AccountPoid = bi.account_obj_id0 AND bi.bill_info_id = 'Account Billinfo')
                      AS NEXT_BILL_DATE
           from (select  max(step_max) as Term,
                         ap.account_obj_id0 as AccountPoid,
                         ap.product_obj_id0 as ProductPoid
                 from purchased_product_t ap,rate_t r,rate_quantity_tiers_t rqt, rate_plan_t rp, account_t a
                 where rqt.obj_id0 = r.poid_id0
                 and a.poid_id0 = ap.account_obj_id0
                 and ap.product_obj_id0=rp.product_obj_id0
                 and r.rate_plan_obj_id0=rp.poid_id0
                 and ap.service_obj_type ='/service/commitment'
                 and ap.status!=3
                 GROUP BY ap.account_obj_id0, ap.product_obj_id0
                )X
          )Y;


      account_rec  hns_pending_commitment_billing%ROWTYPE;
BEGIN
  FOR account_rec in hns_pending_commitment_billing
    LOOP
--DBMS_OUTPUT.PUT_LINE ('Account is a parent account');
     AccountNo := account_rec.SAN;
     CreatedT  := account_rec.account_created;
     Commitment_Type  := account_rec.Commitment_Type;
     Commitment_End_Date  := account_rec.TERM_DATE;

  --   DBMS_OUTPUT.PUT_LINE ('Account:' || AccountNo || 'CreatedT:' || CreatedT || 'Commitment_Type:' || Commitment_Type || 'Commitment_End_Date:' || Commitment_End_Date);

       INSERT INTO hns_commitment_info_t (REC_ID, CREATED_T, ACCOUNT_NO, COMMITMENT_TYPE, COMMITMENT_END_DATE)
     VALUES (HNS_COMMITMENT_INFO_T_SEQ.nextval, CreatedT, AccountNo,Commitment_Type,Commitment_End_Date);
        commit;


           END LOOP; -- for each entry.

END HNS_COMMITMENT_INFO_OT;

/
--------------------------------------------------------
--  DDL for Procedure HNS_CON_TNM_DETAIL_DEAL_NM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_CON_TNM_DETAIL_DEAL_NM" 
IS
   V_COUNTER number := 0;
   INVOICE_DESCRIPTOR VARCHAR2(255);
   cursor READ_TNM_DETAIL is
   --select account_obj_id0, deal_name, node_location from hns_tnm_details_t  where node_location is not null;
   select account_obj_id0, deal_name, node_obj_id0 from hns_tnm_details_t  where node_obj_id0 is not null;
BEGIN
  DBMS_OUTPUT.PUT_LINE('HNS_CON_TNM_DETAIL_DEAL_NM BEGINS' || sysdate );
  FOR TNM_INVOICE_REC IN READ_TNM_DETAIL
  LOOP
    begin
      select INVOICE_DESCRIPTOR into INVOICE_DESCRIPTOR from ENT_DESCRIPTOR_MAPPING_T
                                where ACCOUNT_OBJ_ID0 = TNM_INVOICE_REC.ACCOUNT_OBJ_ID0
        and node_obj_id0 = TNM_INVOICE_REC.node_obj_id0
        AND INVOICE_DESCRIPTOR != TNM_INVOICE_REC.deal_name;
      EXCEPTION
        when NO_DATA_FOUND then
          --DBMS_OUTPUT.PUT_LINE('NO DATA FOUND FOR TNM FOR INVOICE ' || TNM_INVOICE_REC.node_location);
          CONTINUE;
        when OTHERS then
          --DBMS_OUTPUT.PUT_LINE('SOME EXCEPTION OCCURES FOR TNM FOR INVOICE ' || TNM_INVOICE_REC.node_location);
          CONTINUE;
    end;
     V_COUNTER := V_COUNTER + 1;
     UPDATE HNS_TNM_DETAILS_T SET deal_name = INVOICE_DESCRIPTOR WHERE node_obj_id0 = TNM_INVOICE_REC.node_obj_id0 AND ACCOUNT_OBJ_ID0 = TNM_INVOICE_REC.account_obj_id0;
      if V_COUNTER = 100 then
        commit;
        V_COUNTER :=0;
      end if;
  end LOOP;
  commit;
  DBMS_OUTPUT.PUT_LINE('---------------------------------');
  DBMS_OUTPUT.PUT_LINE('HNS_CON_TNM_DETAIL_DEAL_NM ENDS' || SYSDATE);
  EXCEPTION
    WHEN OTHERS THEN
      raise_application_error(-20002,'Unknown Error - '||SQLCODE||' -ERROR- '||SQLERRM);
  CLOSE READ_TNM_DETAIL;
END HNS_CON_TNM_DETAIL_DEAL_NM; -- Procedure HNS_CON_TNM_DETAIL_DEAL_NM

/
--------------------------------------------------------
--  DDL for Procedure HNS_CREATE_NCTUE_SUMMARY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_CREATE_NCTUE_SUMMARY" AS

    CURSOR C_NCTUE_SUMMARY_RECORDS IS
      select b.poid_id0, b.account_obj_id0, b.payinfo_obj_id0, b.payinfo_obj_type, b.exempt_from_collections
      from billinfo_t b
      where b.poid_id0=b.ar_billinfo_obj_id0
      --and b.created_t >= 1379131200
      and b.created_t < (select d2i(trunc(sysdate, 'MM')) from dual) and b.actg_next_t >= 1379131200
      and b.bill_info_id='Account Billinfo' and b.payinfo_obj_type is not null
      and b.payinfo_obj_id0 <> 0 and b.payinfo_obj_type <> '/payinfo'
      and not exists (select 1 from HNS_NCTUE_REPORT_SUMMARY_T hnr where b.account_obj_id0=hnr.account_obj_id0);

    COUNTER NUMBER := 0;
    IS_INSERT_REQD NUMBER := 1;
    ERROR_STR VARCHAR2(1000);
    ERROR_CNT NUMBER;
    WRITEM_POID NUMBER;
    WRITEM_DESC VARCHAR2(255);
    STARTDATE_CHK NUMBER;
    ENDDATE_CHK NUMBER;
    CLOSED_CHK NUMBER;

    SAN VARCHAR2(60);
    ACC_STATUS NUMBER(38);
    SERVICE_START_T    NUMBER(38);
    SERVICE_END_T    NUMBER(38);
    ACC_LASTSTAT_CMNT VARCHAR2(255);

    ACC_DUE    NUMBER;
    ACC_WOFF    NUMBER;
    ACC_DUE_T    NUMBER(38);
    ACC_EFT_T    NUMBER(38);
    ACC_DUE_ID VARCHAR2(1) := NULL;

    ACC_NAME VARCHAR2(255);
    ACC_ADDRESS    VARCHAR2(255);
    ACC_CITY VARCHAR2(90);
    ACC_STATE VARCHAR2(90);
    ACC_ZIP VARCHAR2(90);
    ACC_COUNTRY VARCHAR2(60);

BEGIN

     select d2i(trunc(sysdate, 'MM') -31) INTO STARTDATE_CHK from dual;
     select d2i(trunc(sysdate, 'MM')) INTO ENDDATE_CHK from dual;

     FOR HNS_NCTUE_SUMMARY_REC IN C_NCTUE_SUMMARY_RECORDS
     LOOP

        ACC_DUE_ID := NULL;
        ACC_DUE := 0;
        ACC_DUE_T := 0;
        ACC_WOFF := 0;

        BEGIN

          SELECT ACCOUNT_NO, STATUS, CREATED_T, LAST_STATUS_T, LASTSTAT_CMNT INTO
          SAN, ACC_STATUS, SERVICE_START_T, SERVICE_END_T, ACC_LASTSTAT_CMNT
          FROM ACCOUNT_T
          WHERE POID_ID0=HNS_NCTUE_SUMMARY_REC.ACCOUNT_OBJ_ID0 AND ACCOUNT_NO NOT LIKE 'ADJISSUE%' AND
          ACCOUNT_NO NOT LIKE 'TEMP%' AND (GL_SEGMENT LIKE '%CONSUMER.DIRECT' OR GL_SEGMENT LIKE '%CONSUMER.DEALER');

          SELECT SUM(DUE), MIN(DUE_T) INTO ACC_DUE, ACC_DUE_T FROM hns_ar_summary_t
          WHERE AR_BILLINFO_OBJ_ID0=HNS_NCTUE_SUMMARY_REC.POID_ID0 ;

          IF ACC_DUE_T=0 THEN
              SELECT MAX(EFFECTIVE_T) INTO ACC_DUE_T FROM hns_ar_summary_t
              WHERE AR_BILLINFO_OBJ_ID0=HNS_NCTUE_SUMMARY_REC.POID_ID0 ;
          END IF;

          select max(end_t) INTO ACC_EFT_T FROM bill_t where account_obj_id0 = HNS_NCTUE_SUMMARY_REC.ACCOUNT_OBJ_ID0
          and end_t < ENDDATE_CHK;

          IS_INSERT_REQD := 1;

          IF ACC_STATUS = 10103 AND (ACC_DUE <= 0 OR ACC_DUE IS NULL) THEN

              select COUNT(*) INTO CLOSED_CHK from hns_delinquency_t h, hns_delinquency_state_t hds
                where h.poid_id0 = hds.obj_id0
                and hds.collection_state = 6
                and h.account_obj_id0 = HNS_NCTUE_SUMMARY_REC.ACCOUNT_OBJ_ID0
                and hds.last_state_change_t < ENDDATE_CHK
                AND hds.last_state_change_t >= STARTDATE_CHK;

              IF CLOSED_CHK <> 0 THEN

                  select max(hds.last_state_change_t) into ACC_DUE_T from hns_delinquency_t h, hns_delinquency_state_t hds
                  where h.poid_id0 = hds.obj_id0 and hds.collection_state = 1
                  and h.account_obj_id0 = HNS_NCTUE_SUMMARY_REC.ACCOUNT_OBJ_ID0;

                  select SUM(i.item_total) INTO ACC_WOFF from item_t i where i.AR_BILLINFO_OBJ_ID0=HNS_NCTUE_SUMMARY_REC.POID_ID0
                  AND i.poid_type='/item/writeoff'
                  --AND i.effective_t < ENDDATE_CHK AND I.effective_t >= STARTDATE_CHK
                  ;

                  ACC_DUE_ID := 'U';
              ELSE
                  SELECT COUNT(*) INTO IS_INSERT_REQD FROM ACCOUNT_T WHERE POID_ID0=HNS_NCTUE_SUMMARY_REC.ACCOUNT_OBJ_ID0
                  AND LAST_STATUS_T >= STARTDATE_CHK AND LAST_STATUS_T < ENDDATE_CHK;

              END IF;

          END IF;

          IF HNS_NCTUE_SUMMARY_REC.EXEMPT_FROM_COLLECTIONS = 1 THEN
              ACC_DUE_T := ENDDATE_CHK + 86400;
          END IF;


        EXCEPTION
          WHEN NO_DATA_FOUND THEN
          IS_INSERT_REQD := 0;
          WHEN OTHERS THEN
          ERROR_STR := SUBSTR(SQLERRM, 1, 200);
          INSERT INTO HNS_NCTUE_REPORT_ERROR_T (ACCOUNT_OBJ_ID0, BILLINFO_OBJ_ID0, CREATED_T, REPORTING_DT, COMMENTS, IS_LATEST)
          VALUES(HNS_NCTUE_SUMMARY_REC.ACCOUNT_OBJ_ID0, HNS_NCTUE_SUMMARY_REC.POID_ID0, D2I(SYSDATE),trunc(sysdate, 'MM'),
          ERROR_STR,1);
        END;

     BEGIN
        IF IS_INSERT_REQD <> 0 THEN

            COUNTER := COUNTER + 1;

            IF HNS_NCTUE_SUMMARY_REC.PAYINFO_OBJ_TYPE = '/payinfo/cc' THEN

                SELECT NAME, ADDRESS, CITY, STATE, ZIP, COUNTRY INTO
                ACC_NAME, ACC_ADDRESS, ACC_CITY, ACC_STATE, ACC_ZIP, ACC_COUNTRY
                FROM PAYINFO_CC_T WHERE OBJ_ID0=HNS_NCTUE_SUMMARY_REC.PAYINFO_OBJ_ID0 AND ROWNUM < 2;

            ELSIF HNS_NCTUE_SUMMARY_REC.PAYINFO_OBJ_TYPE = '/payinfo/dd' THEN

                SELECT NAME, ADDRESS, CITY, STATE, ZIP, COUNTRY INTO
                ACC_NAME, ACC_ADDRESS, ACC_CITY, ACC_STATE, ACC_ZIP, ACC_COUNTRY
                FROM PAYINFO_DD_T WHERE OBJ_ID0=HNS_NCTUE_SUMMARY_REC.PAYINFO_OBJ_ID0 AND ROWNUM < 2;

            ELSIF HNS_NCTUE_SUMMARY_REC.PAYINFO_OBJ_TYPE = '/payinfo/invoice' THEN

                SELECT NAME, ADDRESS, CITY, STATE, ZIP, COUNTRY INTO
                ACC_NAME, ACC_ADDRESS, ACC_CITY, ACC_STATE, ACC_ZIP, ACC_COUNTRY
                FROM PAYINFO_INV_T WHERE OBJ_ID0=HNS_NCTUE_SUMMARY_REC.PAYINFO_OBJ_ID0 AND ROWNUM < 2;

            ELSE

                SELECT FIRST_NAME || ' ' || LAST_NAME, ADDRESS, CITY, STATE, ZIP, COUNTRY INTO
                ACC_NAME, ACC_ADDRESS, ACC_CITY, ACC_STATE, ACC_ZIP, ACC_COUNTRY
                FROM ACCOUNT_NAMEINFO_T WHERE OBJ_ID0=HNS_NCTUE_SUMMARY_REC.ACCOUNT_OBJ_ID0 AND ROWNUM < 2;

            END IF;

            IF UPPER(ACC_COUNTRY) = 'US' OR UPPER(ACC_COUNTRY) = 'USA'
            THEN
              INSERT INTO HNS_NCTUE_REPORT_SUMMARY_T (SAN, ACCOUNT_OBJ_ID0, CREATED_T, STATUS, ACC_STATUS_ID, SERVICE_START_T, SERVICE_END_T,
              LASTSTAT_CMNT, DUE, WRITEOFF, DUE_T, EFFECTIVE_T, NAME, ADDRESS, CITY, STATE, ZIP, COUNTRY) VALUES(SAN,
              HNS_NCTUE_SUMMARY_REC.ACCOUNT_OBJ_ID0, D2I(SYSDATE),ACC_STATUS, ACC_DUE_ID, SERVICE_START_T, SERVICE_END_T, ACC_LASTSTAT_CMNT,
              ACC_DUE, ACC_WOFF, ACC_DUE_T, ACC_EFT_T, ACC_NAME, ACC_ADDRESS, ACC_CITY, ACC_STATE, ACC_ZIP, ACC_COUNTRY);
            END IF;



        END IF;

        EXCEPTION
          WHEN OTHERS THEN
          ERROR_STR := SUBSTR(SQLERRM, 1, 200);
          INSERT INTO HNS_NCTUE_REPORT_ERROR_T (ACCOUNT_OBJ_ID0, BILLINFO_OBJ_ID0, CREATED_T, REPORTING_DT, COMMENTS, IS_LATEST)
          VALUES(HNS_NCTUE_SUMMARY_REC.ACCOUNT_OBJ_ID0, HNS_NCTUE_SUMMARY_REC.POID_ID0, D2I(SYSDATE),trunc(sysdate, 'MM'),
          ERROR_STR,1);
     END;


        IF COUNTER = 500 THEN
            COMMIT;
            COUNTER :=0;
        END IF;


     END LOOP;

    COMMIT;


    SELECT COUNT(*) INTO ERROR_CNT FROM HNS_NCTUE_REPORT_ERROR_T WHERE REPORTING_DT=trunc(sysdate, 'MM') AND IS_LATEST=1;

    IF ERROR_CNT <> 0
    THEN
      ERROR_STR := 'Unexpected error occurred. Please check HNS_NCTUE_REPORT_ERROR_T or retry';
      Update HNS_NCTUE_REPORT_RUN_T set IS_DATA_GENERATED=0, COMMENTS=ERROR_STR where REPORTING_DT=trunc(sysdate, 'MM');
    ELSE
      Update HNS_NCTUE_REPORT_RUN_T set IS_DATA_GENERATED=1, COMMENTS=NULL where REPORTING_DT=trunc(sysdate, 'MM');
    END IF;

    COMMIT;


EXCEPTION
      WHEN OTHERS THEN
      ERROR_STR := 'Unexpected error occurred. Please check HNS_NCTUE_REPORT_ERROR_T or retry';
      Update HNS_NCTUE_REPORT_RUN_T set COMMENTS=ERROR_STR where REPORTING_DT=trunc(sysdate, 'MM');
      COMMIT;

END HNS_CREATE_NCTUE_SUMMARY;

/
--------------------------------------------------------
--  DDL for Procedure HNS_DAILY_NOTES_CHANGES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_DAILY_NOTES_CHANGES" 
IS

     site_poid      account_t.poid_id0%TYPE;
     o_size			NUMBER :=0;
	 n_size			NUMBER :=0;

	  CURSOR get_acct_id IS
      SELECT DISTINCT child_id
      FROM   hns_temp_notes_t;

BEGIN

   OPEN get_acct_id;
   <<main_loop>>
   LOOP
   	  -- Get the site poid and blob
      FETCH get_acct_id INTO site_poid;
      EXIT WHEN get_acct_id%NOTFOUND;

	  SELECT (DBMS_LOB.GETLENGTH(internal_notes_buf))
	  INTO 	 n_size
	  FROM 	 account_internal_notes_buf
	  WHERE  obj_id0 = site_poid;

	  -- dbms_output.put_line('Size of added notes is:'||n_size);

	  BEGIN
	  	  SELECT new_size
	  	  INTO 	 o_size
	  	  FROM 	 hns_daily_notes_changes_t
	  	  WHERE  child_id = site_poid;

  	  -- dbms_output.put_line('Before updating changes for child_id:'||site_poid);

		  UPDATE hns_daily_notes_changes_t
		  SET 	 OLD_SIZE = o_size, NEW_SIZE = n_size, UPDATED = 'N'
		  WHERE  child_id = site_poid;

	  EXCEPTION
	  		WHEN no_data_found THEN
				 o_size :=0;
				 -- dbms_output.put_line('Before inserting changes for child_id:'||site_poid);

			 	 INSERT INTO hns_daily_notes_changes_t
				 (CHILD_ID,OLD_SIZE,NEW_SIZE,UPDATED)
		 		 VALUES
    			 (site_poid,o_size,n_size,'N');
	  END;

	END LOOP main_loop;

	CLOSE get_acct_id;

	COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure HNS_FINANCIAL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_FINANCIAL" 
(
date1   IN  VARCHAR2,
date2   IN  VARCHAR2
)
IS
  event_bal_poid          event_bal_impacts_t.obj_id0%TYPE;
  san_no                  account_t.account_no%TYPE;
  san_no_created_t        account_t.created_t%TYPE;
  gl_segment              item_t.gl_segment%TYPE;
  billinfo_obj            item_t.billinfo_obj_id0%TYPE;
  arbillinfo_obj          item_t.ar_billinfo_obj_id0%TYPE;
  item_number             item_t.item_no%TYPE;
  arbill_obj              item_t.ar_bill_obj_id0%TYPE;
  item_status             item_t.status%TYPE;
  company                 account_nameinfo_t.company%TYPE;
  state                   account_nameinfo_t.state%TYPE;
  city                    account_nameinfo_t.city%TYPE;
  country                 account_nameinfo_t.country%TYPE;
  zip                     account_nameinfo_t.zip%TYPE;
  dom                     billinfo_t.actg_cycle_dom%TYPE;
  invoice_number_val      bill_t.bill_no%TYPE;
  invoice_start_t_val     bill_t.start_t%TYPE;
  invoice_end_t_val       bill_t.end_t%TYPE;
  glid                    event_bal_impacts_t.gl_id%TYPE;
  amount                  event_bal_impacts_t.amount%TYPE;
  ratetag                 event_bal_impacts_t.rate_tag%TYPE;
  taxcode                 event_bal_impacts_t.tax_code%TYPE;
  account_obj             event_bal_impacts_t.account_obj_id0%TYPE;
  item_obj                event_bal_impacts_t.item_obj_id0%TYPE;
  product_obj             event_bal_impacts_t.product_obj_id0%TYPE;
  offering_obj            event_bal_impacts_t.offering_obj_id0%TYPE;
  item_obj_type           event_bal_impacts_t.item_obj_type%TYPE;
  percentage              event_bal_impacts_t.percent%TYPE;
  discount                event_bal_impacts_t.discount%TYPE;
  rec_id_val              INTEGER;
  rec_created_t           VARCHAR2(255);
  rec_modified_t          VARCHAR2(255);
  total_rec               INTEGER;
  bill_count              INTEGER;
  product_purchase_count  INTEGER;
  transid_count           INTEGER;
  tax_date_count          INTEGER;
  lr_date_count           INTEGER;
  event_type              event_t.poid_type%TYPE;
  event_descr             event_t.descr%TYPE;
  product_event_t         event_t.end_t%TYPE;
  event_created_t         event_t.created_t%TYPE;
  event_program_name      event_t.program_name%TYPE;
  event_userid_id0        event_t.userid_id0%TYPE;
  service_obj_id          event_t.service_obj_id0%TYPE;
  service_type            event_t.service_obj_type%TYPE;
  product_name            product_t.name%TYPE;
  deal_nm               deal_t.name%TYPE;
  product_purchase_t      event_t.end_t%TYPE;
  trans_id                event_billing_payment_t.trans_id%TYPE;
  product_or_tax_start_t  event_billing_cycle_t.cycle_start_t%TYPE;
  product_or_tax_end_t    event_billing_cycle_t.cycle_end_t%TYPE;
  parent_san_no           account_t.account_no%TYPE;
  parent_company          account_nameinfo_t.company%TYPE;
  lr_start_t_val          ledger_report_t.start_t%TYPE;
  lr_end_t_val            ledger_report_t.end_t%TYPE;
  product_type            product_t.TYPE%TYPE;
  check_number            event_billing_payment_check_t.check_no%TYPE;
  svc_status              service_t.status%TYPE;
  svc_last_status_t       service_t.last_status_t%TYPE;
  svc_laststat_comment    service_t.laststat_cmnt%TYPE;
  product_status_val      purchased_product_t.status%TYPE;
  bill_type_val           bill_t.name%TYPE;
  rate_step_resource_val  rate_t.step_resource%TYPE;
  inv_descriptor          ent_descriptor_mapping_t.invoice_descriptor%TYPE;



  --Create a cursor to get the list of evnt_bal_impacts gl_id, amount, rate_tag, tax_code, account_obj_id0, item_obj_id0, product_obj_id0
  CURSOR get_balimpacts_cur IS
  SELECT obj_id0,gl_id, amount, rate_tag, tax_code, account_obj_id0, item_obj_id0, product_obj_id0,offering_obj_id0,item_obj_type,percent,discount
            FROM event_bal_impacts_t
            WHERE obj_id0 >= Date_To_Low_Poid(date1) AND
                  obj_id0 < Date_To_Low_Poid(date2)  AND
                  resource_id = 840
                  and amount <> 0;

  CURSOR get_pending_item_cur IS
  SELECT rec_id, item_obj
            FROM hns_financial_t
            WHERE invoice_number ='PENDING';

    BEGIN

     DBMS_OUTPUT.PUT_LINE('Starting procedure ' || SYSDATE);
     DBMS_OUTPUT.PUT_LINE('---------------------------------');
     DBMS_OUTPUT.PUT_LINE('Starting first for loop  ');
     --Count the Total No. of records to store this info in audit table before starting execution

     SELECT COUNT(obj_id0) INTO total_rec from event_bal_impacts_t
     WHERE obj_id0 >= Date_To_Low_Poid(date1) AND
           obj_id0 < Date_To_Low_Poid(date2)  AND
           resource_id = 840
           and amount <> 0;

     --DBMS_OUTPUT.PUT_LINE('Total Records ' ||total_rec);

     --Insert an audit record in table HNS_AUDIT_FINANCIALS_T
     --END_TIME and PROCESSED_ROWS are 0 initially, there values will be updated once the procedure is executed successfully
     INSERT INTO HNS_AUDIT_FINANCIALS_T (START_TIME,END_TIME,TOTAL_ROWS,PROCESSED_ROWS)
     VALUES (SYSDATE,NULL,total_rec,0);
     COMMIT;
     total_rec               := 0   ;
FOR get_pending_item_rec IN get_pending_item_cur
    LOOP
      invoice_number_val := NULL;
      invoice_start_t_val  := NULL;
      invoice_end_t_val  := NULL;
      lr_start_t_val     := NULL;
      lr_end_t_val       := NULL;
      bill_type_val      := NULL;
      rec_id_val         := get_pending_item_rec.rec_id;
      item_obj           := get_pending_item_rec.item_obj;
-- get the status from item_t and stored into item_status.
      SELECT status INTO item_status
        FROM item_t
        WHERE
        poid_id0 = item_obj;
--Get the bill_no ,start_t, end_t from bill_t if item_status is not equal to one
     IF  item_status != 1 THEN

          SELECT b.bill_no, b.start_t, b.end_t,Date_To_Infranet(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM')),
          Date_To_Infranet(LAST_DAY(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM'))+1), b.name
          INTO invoice_number_val, invoice_start_t_val, invoice_end_t_val,lr_start_t_val,lr_end_t_val,bill_type_val
          FROM
          bill_t b, item_t i
          WHERE
          i.poid_id0 = item_obj AND
          i.ar_bill_obj_id0 = b.poid_id0  ;
--Update HNS_FINANCIAL_T table with new invoice_number
          UPDATE HNS_FINANCIAL_T SET
          INVOICE_NUMBER = invoice_number_val, REC_MODIFIED_T = Date_To_Infranet(SYSDATE),
          LR_START_T=lr_start_t_val,LR_END_T=lr_end_t_val,bill_type = bill_type_val,
		  INVOICE_START_T=invoice_start_t_val, INVOICE_END_T=invoice_end_t_val
          WHERE REC_ID = rec_id_val;

          -- incrementing the counter value
       total_rec := total_rec+1;
       --COMMIT;
        IF mod(total_rec, 1000) = 0 THEN    -- Commit every 1000 records
            COMMIT;
        END IF;
    END IF;
  END LOOP;
COMMIT;
     DBMS_OUTPUT.PUT_LINE('Ending First for loop ');

     DBMS_OUTPUT.PUT_LINE('Starting Second for loop  ');
     total_rec               := 0   ;
  FOR get_balimpacts_rec IN get_balimpacts_cur
      LOOP
      rec_created_t           := NULL;
      rec_modified_t          := NULL;
      arbill_obj              := NULL;
      san_no                  := NULL;
      san_no_created_t        := NULL;
      gl_segment              := NULL;
      billinfo_obj            := NULL;
      arbillinfo_obj          := NULL;
      item_number             := NULL;
      company                 := NULL;
      state                   := NULL;
      city                    := NULL;
      country                 := NULL;
      zip                     := NULL;
      dom                     := NULL;
      invoice_number_val      := NULL;
      invoice_start_t_val	  := NULL;
      invoice_end_t_val       := NULL;
      glid                    := NULL;
      amount                  := NULL;
      ratetag                 := NULL;
      taxcode                 := NULL;
      account_obj             := NULL;
      item_obj                := NULL;
      product_obj             := NULL;
      offering_obj            := NULL;
      item_obj_type           := NULL;
      percentage              := NULL;
      discount                := NULL;
      event_type              := NULL;
      event_descr             := NULL;
      product_event_t         := NULL;
      event_created_t         := NULL;
      event_program_name      := NULL;
      event_userid_id0        := NULL;
      service_obj_id          := NULL;
      service_type            := NULL;
      product_name            := NULL;
      deal_nm               := NULL;
      product_purchase_t      := NULL;
      trans_id                := NULL;
      product_or_tax_start_t  := NULL;
      product_or_tax_end_t    := NULL;
      parent_san_no           := NULL;
      parent_company          := NULL;
      product_type            := NULL;
      lr_start_t_val          := NULL;
      lr_end_t_val            := NULL;
      check_number            := NULL;
      svc_status              := NULL;
      svc_last_status_t       := NULL;
      svc_laststat_comment    := NULL;
      product_status_val      := NULL;
      bill_type_val           := NULL;
      rate_step_resource_val  := NULL;
      inv_descriptor          := NULL;

      event_bal_poid          := get_balimpacts_rec.obj_id0;
      glid                    := get_balimpacts_rec.gl_id;
      amount                  := get_balimpacts_rec.amount;
      ratetag                 := get_balimpacts_rec.rate_tag;
      taxcode                 := get_balimpacts_rec.tax_code;
      account_obj             := get_balimpacts_rec.account_obj_id0;
      item_obj                := get_balimpacts_rec.item_obj_id0;
      product_obj             := get_balimpacts_rec.product_obj_id0;
      offering_obj            := get_balimpacts_rec.offering_obj_id0;
      item_obj_type           := get_balimpacts_rec.item_obj_type;
      percentage              := get_balimpacts_rec.percent;
      discount                := get_balimpacts_rec.discount;

-- Following select query fetches san_no,san_no_CreatedDate from account_t table
       SELECT account_no, created_t
          INTO  san_no, san_no_created_t
          FROM
          account_t
          WHERE
          poid_id0 = account_obj ;

-- Following select query fetches Company, State, City, Country, Zip from account_nameinfo_t table
  SELECT company, state, city, country, zip
          INTO company, state, city, country, zip
          FROM
          account_nameinfo_t
          WHERE
          obj_id0 = account_obj;

-- Following select query fetches gl_segment,billinfo_obj_id0,ar_billinfo_obj_id0 from item_t table
  SELECT gl_segment,billinfo_obj_id0,ar_billinfo_obj_id0,item_no,status
          INTO gl_segment,billinfo_obj,arbillinfo_obj,item_number,item_status
          FROM
          item_t
          WHERE
          poid_id0 = item_obj;

-- For child accounts
IF billinfo_obj != arbillinfo_obj THEN
       SELECT P2a(account_obj_id0), (SELECT company FROM account_nameinfo_t WHERE obj_id0 = account_obj)
                      INTO parent_san_no,parent_company
                      FROM
                      billinfo_t
                      WHERE
                      poid_id0 = arbillinfo_obj;
ELSE
-- For parent/independent accounts
    parent_san_no := san_no;
    parent_company := company;
END IF ;

-- Following select query fetches Event_type, Event_descr, Product_Event_date, created_t, program_name, userid_id0 from event_t table
  SELECT poid_type, descr, end_t, created_t, program_name, userid_id0, NVL(service_obj_id0,0), service_obj_type
          INTO event_type, event_descr, product_event_t, event_created_t, event_program_name, event_userid_id0, service_obj_id, service_type
          FROM
          event_t
          WHERE
          poid_id0 = event_bal_poid;

-- If service_obj_id0 is not 0, get the service_t data
    IF service_obj_id > 0 THEN
       SELECT status, last_status_t, laststat_cmnt
            INTO svc_status, svc_last_status_t, svc_laststat_comment
            FROM service_t
            WHERE poid_id0 = service_obj_id
            AND account_obj_id0 = account_obj;
    END IF;

-- Following select query fetches DOM date from billinfo_t table
  SELECT actg_cycle_dom
          INTO dom
          FROM
          billinfo_t
          WHERE
          account_obj_id0 = account_obj AND ROWNUM < 2;

-- GET THE INFORMATION IF THE ITEM IS NOT PENDING
IF item_status != 1 THEN
    -- Following select query fetches bill_no, start_t, end_t from bill_t table
      SELECT COUNT(*) INTO bill_count
          FROM
          bill_t b, item_t i
          WHERE
          i.poid_id0 = item_obj AND
          i.ar_bill_obj_id0 = b.poid_id0  ;
    IF bill_count > 0 THEN
    -- Fetches invoice no,start_t,end_t and ledger report start_t and ledger_report end_t for billed items
           SELECT b.bill_no, b.start_t, b.end_t,Date_To_Infranet(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM')),
           Date_To_Infranet(LAST_DAY(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM'))+1), b.name
           INTO invoice_number_val, invoice_start_t_val, invoice_end_t_val,lr_start_t_val,lr_end_t_val, bill_type_val
            FROM
           bill_t b, item_t i
           WHERE
           i.poid_id0 = item_obj AND
           i.ar_bill_obj_id0 = b.poid_id0  ;
     ELSE
     -- Fetches ledger report start_t and ledger_report end_t for items that have ar_bill_obj_id0 set as zero
           SELECT Date_To_Infranet(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM')),
          Date_To_Infranet(LAST_DAY(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM'))+1)
          INTO lr_start_t_val,lr_end_t_val
          FROM item_t i WHERE i.poid_id0=item_obj;

    END IF;
ELSE
    invoice_number_val :='PENDING';
END IF;

-- Following select query fetches Product_Name from product_t table
IF product_obj > 0 THEN
  SELECT name,TYPE
          INTO product_name,product_type
          FROM
          product_t
          WHERE
          poid_id0  = product_obj;

    BEGIN
        SELECT rt.step_resource
            INTO rate_step_resource_val
            FROM
            rate_t rt, rate_plan_t rpt
            WHERE rt.rate_plan_obj_id0 = rpt.poid_id0
            AND step_type = 2
            AND rpt.event_type = event_type
            AND product_obj_id0 = product_obj
            AND ROWNUM < 2;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            rate_step_resource_val := null;
    END;

END IF;

-- Following select query fetches Deal_Name

IF product_obj > 0 THEN
  IF offering_obj IS NULL THEN
                  SELECT ep2d(event_bal_poid), end_t INTO deal_nm,product_purchase_t
                                FROM event_t
                                where poid_id0 = event_bal_poid;
  ELSIF offering_obj = 0 THEN
                                SELECT descr, end_t INTO deal_nm,product_purchase_t
                                FROM   event_t
                                where poid_id0 = event_bal_poid;

                                BEGIN
                                  SELECT invoice_descriptor into inv_descriptor
                                  FROM ent_descriptor_mapping_t
                                  WHERE node_obj_id0 = event_bal_poid and rownum < 2;
                                EXCEPTION
                                WHEN NO_DATA_FOUND THEN
                                  BEGIN
                                    SELECT deal_type INTO inv_descriptor
                                    from hns_con_inv_deal_t where deal_name = deal_nm and rownum < 2;
                                  EXCEPTION
                                  WHEN NO_DATA_FOUND THEN
                                    inv_descriptor := deal_nm;
                                  END;
                                END;
                ELSE
                                SELECT (SELECT name FROM deal_t WHERE poid_id0 = p.deal_obj_id0),p.cycle_start_t, p.status
                                                INTO deal_nm,product_purchase_t,product_status_val
                                FROM purchased_product_t p
                                WHERE p.poid_id0 = offering_obj;

                                BEGIN
                                  SELECT invoice_descriptor into inv_descriptor
                                  FROM ent_descriptor_mapping_t
                                  WHERE node_obj_id0 = offering_obj and rownum < 2;
                                EXCEPTION
                                WHEN NO_DATA_FOUND THEN
                                  BEGIN
                                    SELECT deal_type INTO inv_descriptor
                                    from hns_con_inv_deal_t where deal_name = deal_nm and rownum < 2;
                                  EXCEPTION
                                  WHEN NO_DATA_FOUND THEN
                                    inv_descriptor := deal_nm;
                                  END;
                                END;
                END IF;
END IF;

-- Following select query fetches trans_id
IF  item_obj_type = '/item/payment/reversal' THEN

         SELECT trans_id
         INTO trans_id
         FROM EVENT_BILLING_REVERSAL_T WHERE obj_id0 = event_bal_poid;

END IF;

IF  item_obj_type = '/item/payment' THEN
         SELECT trans_id
         INTO trans_id
         FROM event_billing_payment_t WHERE obj_id0 = event_bal_poid;

         IF event_type = '/event/billing/payment/check' THEN
         SELECT CHECK_NO
         INTO check_number
         FROM EVENT_BILLING_PAYMENT_CHECK_T
         WHERE OBJ_ID0 = event_bal_poid;
     END IF ;


END IF;
-- Following select query fetches product_or_tax_start_t and product_or_tax_end_t
IF item_obj_type = '/item/product_purchase' THEN
         product_or_tax_start_t := product_purchase_t;
         product_or_tax_end_t   := product_purchase_t;
ELSIF item_obj_type='/item/tax' THEN

        SELECT COUNT(*)
        INTO tax_date_count
        FROM
        event_billing_cycle_t
        WHERE
        obj_id0 = event_bal_poid ;
        IF tax_date_count > 0 THEN
        SELECT cycle_start_t, cycle_end_t
        INTO product_or_tax_start_t, product_or_tax_end_t
        FROM
        event_billing_cycle_t
        WHERE
        obj_id0 = event_bal_poid ;
        END IF;
ELSE
         SELECT COUNT(*)
         INTO product_purchase_count
         FROM
         event_product_fee_cycle_t
         WHERE
         obj_id0     = event_bal_poid ;
         IF product_purchase_count > 0 THEN
         SELECT cycle_start_t,cycle_end_t
         INTO product_or_tax_start_t, product_or_tax_end_t
         FROM
         event_product_fee_cycle_t
         WHERE
         obj_id0 = event_bal_poid ;
         END IF;

END IF;

-- inserting fetched fields into hns_financial_t table
       INSERT INTO
       hns_financial_t (rec_id, rec_created_t,rec_modified_t, san_no,san_no_created_t, gl_segment, company, state, city, country, zip, dom,
           invoice_number, invoice_start_t, invoice_end_t, glid, amount, ratetag, taxcode, account_obj,item_obj,event_type,
           event_descr, event_created_t, program_name, userid_id0, product_event_t, product_name, product_purchase_t,
           trans_id,product_or_tax_start_t, product_or_tax_end_t, deal_name,parent_san_no,parent_company,lr_start_t,lr_end_t,item_obj_type,
           event_bal_poid, check_no, item_no, percent, discount, service_type, service_status, service_last_status_t, service_laststat_cmnt,
           product_status, bill_type, rate_step_resource, invoice_descriptor, offering_obj_id0)
       VALUES(HNS_FINANCIAL_SEQ.NEXTVAL,Date_To_Infranet(SYSDATE), Date_To_Infranet(SYSDATE) ,san_no, san_no_created_t, gl_segment,
              company, state, city, country, zip,dom,invoice_number_val, invoice_start_t_val, invoice_end_t_val,glid, amount, ratetag, taxcode,
              account_obj, item_obj, event_type, event_descr, event_created_t, event_program_name, event_userid_id0, product_event_t,product_name, product_purchase_t,
              trans_id,product_or_tax_start_t, product_or_tax_end_t, deal_nm, parent_san_no, parent_company,lr_start_t_val,lr_end_t_val,item_obj_type,
              event_bal_poid, check_number, item_number, percentage, discount, service_type, svc_status, svc_last_status_t, svc_laststat_comment,
              product_status_val, bill_type_val, rate_step_resource_val, inv_descriptor, offering_obj);

      -- incrementing the counter value
       total_rec := total_rec+1;
       --COMMIT;
        IF mod(total_rec, 1000) = 0 THEN    -- Commit every 1000 records
            UPDATE HNS_AUDIT_FINANCIALS_T SET END_TIME=SYSDATE,PROCESSED_ROWS=total_rec
            WHERE start_time=(select max(start_time) from HNS_AUDIT_FINANCIALS_T WHERE TRUNC(start_time)=TRUNC(sysdate));
            COMMIT;
        END IF;

        NULL;
END LOOP;
   --Update the audit Table now to put the actual records processed

   UPDATE HNS_AUDIT_FINANCIALS_T SET END_TIME=SYSDATE,PROCESSED_ROWS=total_rec
   WHERE start_time=(select max(start_time) from HNS_AUDIT_FINANCIALS_T WHERE TRUNC(start_time)=TRUNC(sysdate));
   COMMIT;
        DBMS_OUTPUT.PUT_LINE('Ending Second for loop ');
        DBMS_OUTPUT.PUT_LINE('---------------------------------');
        DBMS_OUTPUT.PUT_LINE('Ending procedure ' || SYSDATE);
/*
      EXCEPTION  -- exception handlers begin
      WHEN OTHERS THEN  -- handles all other errors
      dbms_output.put_line('Error occurred.');
*/
END Hns_Financial;

/
--------------------------------------------------------
--  DDL for Procedure HNS_FINANCIAL_BACKDATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_FINANCIAL_BACKDATE" 
(
date1   IN  VARCHAR2,
date2   IN  VARCHAR2
)
IS
  event_bal_poid          event_bal_impacts_t.obj_id0%TYPE;
  san_no                  account_t.account_no%TYPE;
  san_no_created_t        account_t.created_t%TYPE;
  gl_segment              item_t.gl_segment%TYPE;
  billinfo_obj            item_t.billinfo_obj_id0%TYPE;
  arbillinfo_obj          item_t.ar_billinfo_obj_id0%TYPE;
  item_number             item_t.item_no%TYPE;
  arbill_obj              item_t.ar_bill_obj_id0%TYPE;
  item_status             item_t.status%TYPE;
  company                 account_nameinfo_t.company%TYPE;
  state                   account_nameinfo_t.state%TYPE;
  city                    account_nameinfo_t.city%TYPE;
  country                 account_nameinfo_t.country%TYPE;
  zip                     account_nameinfo_t.zip%TYPE;
  dom                     billinfo_t.actg_cycle_dom%TYPE;
  invoice_number_val      bill_t.bill_no%TYPE;
  invoice_start_t         bill_t.start_t%TYPE;
  invoice_end_t           bill_t.end_t%TYPE;
  glid                    event_bal_impacts_t.gl_id%TYPE;
  amount                  event_bal_impacts_t.amount%TYPE;
  ratetag                 event_bal_impacts_t.rate_tag%TYPE;
  taxcode                 event_bal_impacts_t.tax_code%TYPE;
  account_obj             event_bal_impacts_t.account_obj_id0%TYPE;
  item_obj                event_bal_impacts_t.item_obj_id0%TYPE;
  product_obj             event_bal_impacts_t.product_obj_id0%TYPE;
  offering_obj            event_bal_impacts_t.offering_obj_id0%TYPE;
  item_obj_type           event_bal_impacts_t.item_obj_type%TYPE;
  percentage              event_bal_impacts_t.percent%TYPE;
  discount                event_bal_impacts_t.discount%TYPE;
  rec_id_val              INTEGER;
  rec_created_t           VARCHAR2(255);
  rec_modified_t          VARCHAR2(255);
  total_rec               INTEGER;
  bill_count              INTEGER;
  product_purchase_count  INTEGER;
  transid_count           INTEGER;
  tax_date_count          INTEGER;
  lr_date_count           INTEGER;
  event_type              event_t.poid_type%TYPE;
  event_descr             event_t.descr%TYPE;
  product_event_t         event_t.end_t%TYPE;
  event_created_t         event_t.created_t%TYPE;
  event_program_name      event_t.program_name%TYPE;
  event_userid_id0        event_t.userid_id0%TYPE;
  service_obj_id          event_t.service_obj_id0%TYPE;
  service_type            event_t.service_obj_type%TYPE;
  product_name            product_t.name%TYPE;
  deal_name               deal_t.name%TYPE;
  product_purchase_t      event_t.end_t%TYPE;
  trans_id                event_billing_payment_t.trans_id%TYPE;
  product_or_tax_start_t  event_billing_cycle_t.cycle_start_t%TYPE;
  product_or_tax_end_t    event_billing_cycle_t.cycle_end_t%TYPE;
  parent_san_no           account_t.account_no%TYPE;
  parent_company          account_nameinfo_t.company%TYPE;
  lr_start_t_val          ledger_report_t.start_t%TYPE;
  lr_end_t_val            ledger_report_t.end_t%TYPE;
  product_type            product_t.TYPE%TYPE;
  check_number            event_billing_payment_check_t.check_no%TYPE;
  svc_status              service_t.status%TYPE;
  svc_last_status_t       service_t.last_status_t%TYPE;
  svc_laststat_comment    service_t.laststat_cmnt%TYPE;
  product_status_val      purchased_product_t.status%TYPE;
  bill_type_val           bill_t.name%TYPE;
  rate_step_resource_val  rate_t.step_resource%TYPE;



  --Create a cursor to get the list of evnt_bal_impacts gl_id, amount, rate_tag, tax_code, account_obj_id0, item_obj_id0, product_obj_id0
  CURSOR get_balimpacts_cur IS
  SELECT obj_id0,gl_id, amount, rate_tag, tax_code, account_obj_id0, item_obj_id0, product_obj_id0,offering_obj_id0,item_obj_type,percent,discount
            FROM event_bal_impacts_t
            WHERE obj_id0 >= Date_To_Low_Poid(date1) AND
                  obj_id0 < Date_To_Low_Poid(date2)  AND
                  resource_id = 840
                  and amount <> 0;

--Just making sure the cursor doesn't run
  CURSOR get_pending_item_cur IS
  SELECT rec_id, item_obj
            FROM hns_financial_t
            WHERE account_obj = -1;

    BEGIN

     DBMS_OUTPUT.PUT_LINE('Starting procedure ' || SYSDATE);
     DBMS_OUTPUT.PUT_LINE('---------------------------------');
     DBMS_OUTPUT.PUT_LINE('Starting first for loop  ');
     --Count the Total No. of records to store this info in audit table before starting execution

     SELECT COUNT(obj_id0) INTO total_rec from event_bal_impacts_t
     WHERE obj_id0 >= Date_To_Low_Poid(date1) AND
           obj_id0 < Date_To_Low_Poid(date2)  AND
           resource_id = 840
           and amount <> 0;

     --DBMS_OUTPUT.PUT_LINE('Total Records ' ||total_rec);

     --Insert an audit record in table HNS_AUDIT_FINANCIALS_T
     --END_TIME and PROCESSED_ROWS are 0 initially, there values will be updated once the procedure is executed successfully
     --INSERT INTO HNS_AUDIT_FINANCIALS_T (START_TIME,END_TIME,TOTAL_ROWS,PROCESSED_ROWS)
     --VALUES (SYSDATE,NULL,total_rec,0);
     --COMMIT;
     total_rec               := 0   ;
FOR get_pending_item_rec IN get_pending_item_cur
    LOOP
      invoice_number_val := NULL;
      invoice_end_t      := NULL;
      lr_start_t_val     := NULL;
      lr_end_t_val       := NULL;
      bill_type_val      := NULL;
      rec_id_val         := get_pending_item_rec.rec_id;
      item_obj           := get_pending_item_rec.item_obj;
-- get the status from item_t and stored into item_status.
      SELECT status INTO item_status
        FROM item_t
        WHERE
        poid_id0 = item_obj;
--Get the bill_no ,start_t, end_t from bill_t if item_status is not equal to one
     IF  item_status != 1 THEN

          SELECT b.bill_no, b.start_t, b.end_t,Date_To_Infranet(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM')),
          Date_To_Infranet(LAST_DAY(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM'))+1), b.name
          INTO invoice_number_val, invoice_start_t, invoice_end_t,lr_start_t_val,lr_end_t_val,bill_type_val
          FROM
          bill_t b, item_t i
          WHERE
          i.poid_id0 = item_obj AND
          i.ar_bill_obj_id0 = b.poid_id0  ;
--Update HNS_FINANCIAL_T table with new invoice_number
          UPDATE HNS_FINANCIAL_T SET
          INVOICE_NUMBER = invoice_number_val, REC_MODIFIED_T = Date_To_Infranet(SYSDATE),
          LR_START_T=lr_start_t_val,LR_END_T=lr_end_t_val,bill_type = bill_type_val
          WHERE REC_ID = rec_id_val;

          -- incrementing the counter value
       total_rec := total_rec+1;
       --COMMIT;
        IF mod(total_rec, 1000) = 0 THEN    -- Commit every 1000 records
            COMMIT;
        END IF;
    END IF;
  END LOOP;
COMMIT;
     DBMS_OUTPUT.PUT_LINE('Ending First for loop ');

     DBMS_OUTPUT.PUT_LINE('Starting Second for loop  ');
     total_rec               := 0   ;
  FOR get_balimpacts_rec IN get_balimpacts_cur
      LOOP
      rec_created_t           := NULL;
      rec_modified_t          := NULL;
      arbill_obj              := NULL;
      san_no                  := NULL;
      san_no_created_t        := NULL;
      gl_segment              := NULL;
      billinfo_obj            := NULL;
      arbillinfo_obj          := NULL;
      item_number             := NULL;
      company                 := NULL;
      state                   := NULL;
      city                    := NULL;
      country                 := NULL;
      zip                     := NULL;
      dom                     := NULL;
      invoice_number_val      := NULL;
      invoice_start_t         := NULL;
      invoice_end_t           := NULL;
      glid                    := NULL;
      amount                  := NULL;
      ratetag                 := NULL;
      taxcode                 := NULL;
      account_obj             := NULL;
      item_obj                := NULL;
      product_obj             := NULL;
      offering_obj            := NULL;
      item_obj_type           := NULL;
      percentage              := NULL;
      discount                := NULL;
      event_type              := NULL;
      event_descr             := NULL;
      product_event_t         := NULL;
      event_created_t         := NULL;
      event_program_name      := NULL;
      event_userid_id0        := NULL;
      service_obj_id          := NULL;
      service_type            := NULL;
      product_name            := NULL;
      deal_name               := NULL;
      product_purchase_t      := NULL;
      trans_id                := NULL;
      product_or_tax_start_t  := NULL;
      product_or_tax_end_t    := NULL;
      parent_san_no           := NULL;
      parent_company          := NULL;
      product_type            := NULL;
      lr_start_t_val          := NULL;
      lr_end_t_val            := NULL;
      check_number            := NULL;
      svc_status              := NULL;
      svc_last_status_t       := NULL;
      svc_laststat_comment    := NULL;
      product_status_val      := NULL;
      bill_type_val           := NULL;
      rate_step_resource_val  := NULL;

      event_bal_poid          := get_balimpacts_rec.obj_id0;
      glid                    := get_balimpacts_rec.gl_id;
      amount                  := get_balimpacts_rec.amount;
      ratetag                 := get_balimpacts_rec.rate_tag;
      taxcode                 := get_balimpacts_rec.tax_code;
      account_obj             := get_balimpacts_rec.account_obj_id0;
      item_obj                := get_balimpacts_rec.item_obj_id0;
      product_obj             := get_balimpacts_rec.product_obj_id0;
      offering_obj            := get_balimpacts_rec.offering_obj_id0;
      item_obj_type           := get_balimpacts_rec.item_obj_type;
      percentage              := get_balimpacts_rec.percent;
      discount                := get_balimpacts_rec.discount;

-- Following select query fetches san_no,san_no_CreatedDate from account_t table
       SELECT account_no, created_t
          INTO  san_no, san_no_created_t
          FROM
          account_t
          WHERE
          poid_id0 = account_obj ;

-- Following select query fetches Company, State, City, Country, Zip from account_nameinfo_t table
  SELECT company, state, city, country, zip
          INTO company, state, city, country, zip
          FROM
          account_nameinfo_t
          WHERE
          obj_id0 = account_obj;

-- Following select query fetches gl_segment,billinfo_obj_id0,ar_billinfo_obj_id0 from item_t table
  SELECT gl_segment,billinfo_obj_id0,ar_billinfo_obj_id0,item_no,status
          INTO gl_segment,billinfo_obj,arbillinfo_obj,item_number,item_status
          FROM
          item_t
          WHERE
          poid_id0 = item_obj;

-- For child accounts
IF billinfo_obj != arbillinfo_obj THEN
       SELECT P2a(account_obj_id0), (SELECT company FROM account_nameinfo_t WHERE obj_id0 = account_obj)
                      INTO parent_san_no,parent_company
                      FROM
                      billinfo_t
                      WHERE
                      poid_id0 = arbillinfo_obj;
ELSE
-- For parent/independent accounts
    parent_san_no := san_no;
    parent_company := company;
END IF ;

-- Following select query fetches Event_type, Event_descr, Product_Event_date, created_t, program_name, userid_id0 from event_t table
  SELECT poid_type, descr, end_t, created_t, program_name, userid_id0, NVL(service_obj_id0,0), service_obj_type
          INTO event_type, event_descr, product_event_t, event_created_t, event_program_name, event_userid_id0, service_obj_id, service_type
          FROM
          event_t
          WHERE
          poid_id0 = event_bal_poid;

-- If service_obj_id0 is not 0, get the service_t data
    IF service_obj_id > 0 THEN
       SELECT status, last_status_t, laststat_cmnt
            INTO svc_status, svc_last_status_t, svc_laststat_comment
            FROM service_t
            WHERE poid_id0 = service_obj_id
            AND account_obj_id0 = account_obj;
    END IF;

-- Following select query fetches DOM date from billinfo_t table
  SELECT actg_cycle_dom
          INTO dom
          FROM
          billinfo_t
          WHERE
          account_obj_id0 = account_obj AND ROWNUM < 2;

-- GET THE INFORMATION IF THE ITEM IS NOT PENDING
IF item_status != 1 THEN
    -- Following select query fetches bill_no, start_t, end_t from bill_t table
      SELECT COUNT(*) INTO bill_count
          FROM
          bill_t b, item_t i
          WHERE
          i.poid_id0 = item_obj AND
          i.ar_bill_obj_id0 = b.poid_id0  ;
    IF bill_count > 0 THEN
    -- Fetches invoice no,start_t,end_t and ledger report start_t and ledger_report end_t for billed items
           SELECT b.bill_no, b.start_t, b.end_t,Date_To_Infranet(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM')),
           Date_To_Infranet(LAST_DAY(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM'))+1), b.name
           INTO invoice_number_val, invoice_start_t, invoice_end_t,lr_start_t_val,lr_end_t_val, bill_type_val
            FROM
           bill_t b, item_t i
           WHERE
           i.poid_id0 = item_obj AND
           i.ar_bill_obj_id0 = b.poid_id0  ;
     ELSE
     -- Fetches ledger report start_t and ledger_report end_t for items that have ar_bill_obj_id0 set as zero
           SELECT Date_To_Infranet(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM')),
          Date_To_Infranet(LAST_DAY(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM'))+1)
          INTO lr_start_t_val,lr_end_t_val
          FROM item_t i WHERE i.poid_id0=item_obj;

    END IF;
ELSE
    invoice_number_val :='PENDING';
END IF;

-- Following select query fetches Product_Name from product_t table
IF product_obj > 0 THEN
  SELECT name,TYPE
          INTO product_name,product_type
          FROM
          product_t
          WHERE
          poid_id0  = product_obj;

    BEGIN
        SELECT rt.step_resource
            INTO rate_step_resource_val
            FROM
            rate_t rt, rate_plan_t rpt
            WHERE rt.rate_plan_obj_id0 = rpt.poid_id0
            AND step_type = 2
            AND rpt.event_type = event_type
            AND product_obj_id0 = product_obj
            AND ROWNUM < 2;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            rate_step_resource_val := null;
    END;

END IF;

-- Following select query fetches Deal_Name

IF product_obj > 0 THEN
  IF offering_obj IS NULL THEN
                  SELECT ep2d(event_bal_poid), end_t INTO deal_name,product_purchase_t
                                FROM event_t
                                where poid_id0 = event_bal_poid;
  ELSIF offering_obj = 0 THEN
                                SELECT descr, end_t INTO deal_name,product_purchase_t
                                FROM   event_t
                                where poid_id0 = event_bal_poid;
                ELSE
                                SELECT (SELECT name FROM deal_t WHERE poid_id0 = p.deal_obj_id0),p.cycle_start_t, p.status
                                                INTO deal_name,product_purchase_t,product_status_val
                                FROM purchased_product_t p
                                WHERE p.poid_id0 = offering_obj;
                END IF;
END IF;

-- Following select query fetches trans_id
IF  item_obj_type = '/item/payment/reversal' THEN

         SELECT trans_id
         INTO trans_id
         FROM EVENT_BILLING_REVERSAL_T WHERE obj_id0 = event_bal_poid;

END IF;

IF  item_obj_type = '/item/payment' THEN
         SELECT trans_id
         INTO trans_id
         FROM event_billing_payment_t WHERE obj_id0 = event_bal_poid;

         IF event_type = '/event/billing/payment/check' THEN
         SELECT CHECK_NO
         INTO check_number
         FROM EVENT_BILLING_PAYMENT_CHECK_T
         WHERE OBJ_ID0 = event_bal_poid;
     END IF ;


END IF;
-- Following select query fetches product_or_tax_start_t and product_or_tax_end_t
IF item_obj_type = '/item/product_purchase' THEN
         product_or_tax_start_t := product_purchase_t;
         product_or_tax_end_t   := product_purchase_t;
ELSIF item_obj_type='/item/tax' THEN

        SELECT COUNT(*)
        INTO tax_date_count
        FROM
        event_billing_cycle_t
        WHERE
        obj_id0 = event_bal_poid ;
        IF tax_date_count > 0 THEN
        SELECT cycle_start_t, cycle_end_t
        INTO product_or_tax_start_t, product_or_tax_end_t
        FROM
        event_billing_cycle_t
        WHERE
        obj_id0 = event_bal_poid ;
        END IF;
ELSE
         SELECT COUNT(*)
         INTO product_purchase_count
         FROM
         event_product_fee_cycle_t
         WHERE
         obj_id0     = event_bal_poid ;
         IF product_purchase_count > 0 THEN
         SELECT cycle_start_t,cycle_end_t
         INTO product_or_tax_start_t, product_or_tax_end_t
         FROM
         event_product_fee_cycle_t
         WHERE
         obj_id0 = event_bal_poid ;
         END IF;

END IF;

-- inserting fetched fields into hns_financial_t table
       INSERT INTO
       hns_financial_t (rec_id, rec_created_t,rec_modified_t, san_no,san_no_created_t, gl_segment, company, state, city, country, zip, dom,
           invoice_number, invoice_start_t, invoice_end_t, glid, amount, ratetag, taxcode, account_obj,item_obj,event_type,
           event_descr, event_created_t, program_name, userid_id0, product_event_t, product_name, product_purchase_t,
           trans_id,product_or_tax_start_t, product_or_tax_end_t, deal_name,parent_san_no,parent_company,lr_start_t,lr_end_t,item_obj_type,
           event_bal_poid, check_no, item_no, percent, discount, service_type, service_status, service_last_status_t, service_laststat_cmnt,
           product_status, bill_type, rate_step_resource)
       VALUES(HNS_FINANCIAL_SEQ.NEXTVAL,Date_To_Infranet(SYSDATE), Date_To_Infranet(SYSDATE) ,san_no, san_no_created_t, gl_segment,
              company, state, city, country, zip,dom,invoice_number_val, invoice_start_t, invoice_end_t,glid, amount, ratetag, taxcode,
              account_obj, item_obj, event_type, event_descr, event_created_t, event_program_name, event_userid_id0, product_event_t,product_name, product_purchase_t,
              trans_id,product_or_tax_start_t, product_or_tax_end_t, deal_name, parent_san_no, parent_company,lr_start_t_val,lr_end_t_val,item_obj_type,
              event_bal_poid, check_number, item_number, percentage, discount, service_type, svc_status, svc_last_status_t, svc_laststat_comment,
              product_status_val, bill_type_val, rate_step_resource_val);

      -- incrementing the counter value
       total_rec := total_rec+1;
       --COMMIT;
        IF mod(total_rec, 1000) = 0 THEN    -- Commit every 1000 records
            --UPDATE HNS_AUDIT_FINANCIALS_T SET END_TIME=SYSDATE,PROCESSED_ROWS=total_rec
            --WHERE start_time=(select max(start_time) from HNS_AUDIT_FINANCIALS_T WHERE TRUNC(start_time)=TRUNC(sysdate));
            COMMIT;
        END IF;

        NULL;
END LOOP;
   --Update the audit Table now to put the actual records processed

   --UPDATE HNS_AUDIT_FINANCIALS_T SET END_TIME=SYSDATE,PROCESSED_ROWS=total_rec
   --WHERE start_time=(select max(start_time) from HNS_AUDIT_FINANCIALS_T WHERE TRUNC(start_time)=TRUNC(sysdate));
   COMMIT;
        DBMS_OUTPUT.PUT_LINE('Ending Second for loop ');
        DBMS_OUTPUT.PUT_LINE('---------------------------------');
        DBMS_OUTPUT.PUT_LINE('Ending procedure ' || SYSDATE);
/*
      EXCEPTION  -- exception handlers begin
      WHEN OTHERS THEN  -- handles all other errors
      dbms_output.put_line('Error occurred.');
*/
END Hns_Financial_BackDate;

/
--------------------------------------------------------
--  DDL for Procedure HNS_FINANCIAL_ISSUE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_FINANCIAL_ISSUE" 
(
date1   IN  VARCHAR2,
date2   IN  VARCHAR2
)
IS
  event_bal_poid          event_bal_impacts_t.obj_id0%TYPE;
  san_no                  account_t.account_no%TYPE;
  san_no_created_t        account_t.created_t%TYPE;
  gl_segment              item_t.gl_segment%TYPE;
  billinfo_obj            item_t.billinfo_obj_id0%TYPE;
  arbillinfo_obj          item_t.ar_billinfo_obj_id0%TYPE;
  item_number             item_t.item_no%TYPE;
  arbill_obj              item_t.ar_bill_obj_id0%TYPE;
  item_status             item_t.status%TYPE;
  company                 account_nameinfo_t.company%TYPE;
  state                   account_nameinfo_t.state%TYPE;
  city                    account_nameinfo_t.city%TYPE;
  country                 account_nameinfo_t.country%TYPE;
  zip                     account_nameinfo_t.zip%TYPE;
  dom                     billinfo_t.actg_cycle_dom%TYPE;
  invoice_number_val      bill_t.bill_no%TYPE;
  invoice_start_t         bill_t.start_t%TYPE;
  invoice_end_t           bill_t.end_t%TYPE;
  glid                    event_bal_impacts_t.gl_id%TYPE;
  amount                  event_bal_impacts_t.amount%TYPE;
  ratetag                 event_bal_impacts_t.rate_tag%TYPE;
  taxcode                 event_bal_impacts_t.tax_code%TYPE;
  account_obj             event_bal_impacts_t.account_obj_id0%TYPE;
  item_obj                event_bal_impacts_t.item_obj_id0%TYPE;
  product_obj             event_bal_impacts_t.product_obj_id0%TYPE;
  offering_obj            event_bal_impacts_t.offering_obj_id0%TYPE;
  item_obj_type           event_bal_impacts_t.item_obj_type%TYPE;
  percentage              event_bal_impacts_t.percent%TYPE;
  discount                event_bal_impacts_t.discount%TYPE;
  rec_id_val              INTEGER;
  rec_created_t           VARCHAR2(255);
  rec_modified_t          VARCHAR2(255);
  total_rec               INTEGER;
  bill_count              INTEGER;
  product_purchase_count  INTEGER;
  transid_count           INTEGER;
  tax_date_count          INTEGER;
  lr_date_count           INTEGER;
  event_type              event_t.poid_type%TYPE;
  event_descr             event_t.descr%TYPE;
  product_event_t         event_t.end_t%TYPE;
  event_created_t         event_t.created_t%TYPE;
  event_program_name      event_t.program_name%TYPE;
  event_userid_id0        event_t.userid_id0%TYPE;
  service_obj_id          event_t.service_obj_id0%TYPE;
  service_type            event_t.service_obj_type%TYPE;
  product_name            product_t.name%TYPE;
  deal_nm               deal_t.name%TYPE;
  product_purchase_t      event_t.end_t%TYPE;
  trans_id                event_billing_payment_t.trans_id%TYPE;
  product_or_tax_start_t  event_billing_cycle_t.cycle_start_t%TYPE;
  product_or_tax_end_t    event_billing_cycle_t.cycle_end_t%TYPE;
  parent_san_no           account_t.account_no%TYPE;
  parent_company          account_nameinfo_t.company%TYPE;
  lr_start_t_val          ledger_report_t.start_t%TYPE;
  lr_end_t_val            ledger_report_t.end_t%TYPE;
  product_type            product_t.TYPE%TYPE;
  check_number            event_billing_payment_check_t.check_no%TYPE;
  svc_status              service_t.status%TYPE;
  svc_last_status_t       service_t.last_status_t%TYPE;
  svc_laststat_comment    service_t.laststat_cmnt%TYPE;
  product_status_val      purchased_product_t.status%TYPE;
  bill_type_val           bill_t.name%TYPE;
  rate_step_resource_val  rate_t.step_resource%TYPE;
  inv_descriptor          ent_descriptor_mapping_t.invoice_descriptor%TYPE;



  --Create a cursor to get the list of evnt_bal_impacts gl_id, amount, rate_tag, tax_code, account_obj_id0, item_obj_id0, product_obj_id0
  CURSOR get_balimpacts_cur IS
  SELECT obj_id0,gl_id, amount, rate_tag, tax_code, account_obj_id0, item_obj_id0, product_obj_id0,offering_obj_id0,item_obj_type,percent,discount
            FROM event_bal_impacts_t ebi
            WHERE obj_id0 >= Date_To_Low_Poid(date1) AND
                  obj_id0 < Date_To_Low_Poid(date2)  AND
                  resource_id = 840
                  and amount <> 0
				  and not exists (select 1 from hns_financial_t hf where ebi.obj_id0 = HF.EVENT_BAL_POID);

    BEGIN

     DBMS_OUTPUT.PUT_LINE('Starting procedure ' || SYSDATE);
     DBMS_OUTPUT.PUT_LINE('---------------------------------');
     DBMS_OUTPUT.PUT_LINE('Starting first for loop  ');


     DBMS_OUTPUT.PUT_LINE('Ending First for loop ');

     DBMS_OUTPUT.PUT_LINE('Starting Second for loop  ');
     total_rec               := 0   ;
  FOR get_balimpacts_rec IN get_balimpacts_cur
      LOOP
      rec_created_t           := NULL;
      rec_modified_t          := NULL;
      arbill_obj              := NULL;
      san_no                  := NULL;
      san_no_created_t        := NULL;
      gl_segment              := NULL;
      billinfo_obj            := NULL;
      arbillinfo_obj          := NULL;
      item_number             := NULL;
      company                 := NULL;
      state                   := NULL;
      city                    := NULL;
      country                 := NULL;
      zip                     := NULL;
      dom                     := NULL;
      invoice_number_val      := NULL;
      invoice_start_t         := NULL;
      invoice_end_t           := NULL;
      glid                    := NULL;
      amount                  := NULL;
      ratetag                 := NULL;
      taxcode                 := NULL;
      account_obj             := NULL;
      item_obj                := NULL;
      product_obj             := NULL;
      offering_obj            := NULL;
      item_obj_type           := NULL;
      percentage              := NULL;
      discount                := NULL;
      event_type              := NULL;
      event_descr             := NULL;
      product_event_t         := NULL;
      event_created_t         := NULL;
      event_program_name      := NULL;
      event_userid_id0        := NULL;
      service_obj_id          := NULL;
      service_type            := NULL;
      product_name            := NULL;
      deal_nm               := NULL;
      product_purchase_t      := NULL;
      trans_id                := NULL;
      product_or_tax_start_t  := NULL;
      product_or_tax_end_t    := NULL;
      parent_san_no           := NULL;
      parent_company          := NULL;
      product_type            := NULL;
      lr_start_t_val          := NULL;
      lr_end_t_val            := NULL;
      check_number            := NULL;
      svc_status              := NULL;
      svc_last_status_t       := NULL;
      svc_laststat_comment    := NULL;
      product_status_val      := NULL;
      bill_type_val           := NULL;
      rate_step_resource_val  := NULL;
      inv_descriptor          := NULL;

      event_bal_poid          := get_balimpacts_rec.obj_id0;
      glid                    := get_balimpacts_rec.gl_id;
      amount                  := get_balimpacts_rec.amount;
      ratetag                 := get_balimpacts_rec.rate_tag;
      taxcode                 := get_balimpacts_rec.tax_code;
      account_obj             := get_balimpacts_rec.account_obj_id0;
      item_obj                := get_balimpacts_rec.item_obj_id0;
      product_obj             := get_balimpacts_rec.product_obj_id0;
      offering_obj            := get_balimpacts_rec.offering_obj_id0;
      item_obj_type           := get_balimpacts_rec.item_obj_type;
      percentage              := get_balimpacts_rec.percent;
      discount                := get_balimpacts_rec.discount;

-- Following select query fetches san_no,san_no_CreatedDate from account_t table
       SELECT account_no, created_t
          INTO  san_no, san_no_created_t
          FROM
          account_t
          WHERE
          poid_id0 = account_obj ;

-- Following select query fetches Company, State, City, Country, Zip from account_nameinfo_t table
  SELECT company, state, city, country, zip
          INTO company, state, city, country, zip
          FROM
          account_nameinfo_t
          WHERE
          obj_id0 = account_obj;

-- Following select query fetches gl_segment,billinfo_obj_id0,ar_billinfo_obj_id0 from item_t table
  SELECT gl_segment,billinfo_obj_id0,ar_billinfo_obj_id0,item_no,status
          INTO gl_segment,billinfo_obj,arbillinfo_obj,item_number,item_status
          FROM
          item_t
          WHERE
          poid_id0 = item_obj;

-- For child accounts
IF billinfo_obj != arbillinfo_obj THEN
       SELECT P2a(account_obj_id0), (SELECT company FROM account_nameinfo_t WHERE obj_id0 = account_obj)
                      INTO parent_san_no,parent_company
                      FROM
                      billinfo_t
                      WHERE
                      poid_id0 = arbillinfo_obj;
ELSE
-- For parent/independent accounts
    parent_san_no := san_no;
    parent_company := company;
END IF ;

-- Following select query fetches Event_type, Event_descr, Product_Event_date, created_t, program_name, userid_id0 from event_t table
  SELECT poid_type, descr, end_t, created_t, program_name, userid_id0, NVL(service_obj_id0,0), service_obj_type
          INTO event_type, event_descr, product_event_t, event_created_t, event_program_name, event_userid_id0, service_obj_id, service_type
          FROM
          event_t
          WHERE
          poid_id0 = event_bal_poid;

-- If service_obj_id0 is not 0, get the service_t data
    IF service_obj_id > 0 THEN
       SELECT status, last_status_t, laststat_cmnt
            INTO svc_status, svc_last_status_t, svc_laststat_comment
            FROM service_t
            WHERE poid_id0 = service_obj_id
            AND account_obj_id0 = account_obj;
    END IF;

-- Following select query fetches DOM date from billinfo_t table
  SELECT actg_cycle_dom
          INTO dom
          FROM
          billinfo_t
          WHERE
          account_obj_id0 = account_obj AND ROWNUM < 2;

-- GET THE INFORMATION IF THE ITEM IS NOT PENDING
IF item_status != 1 THEN
    -- Following select query fetches bill_no, start_t, end_t from bill_t table
      SELECT COUNT(*) INTO bill_count
          FROM
          bill_t b, item_t i
          WHERE
          i.poid_id0 = item_obj AND
          i.ar_bill_obj_id0 = b.poid_id0  ;
    IF bill_count > 0 THEN
    -- Fetches invoice no,start_t,end_t and ledger report start_t and ledger_report end_t for billed items
           SELECT b.bill_no, b.start_t, b.end_t,Date_To_Infranet(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM')),
           Date_To_Infranet(LAST_DAY(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM'))+1), b.name
           INTO invoice_number_val, invoice_start_t, invoice_end_t,lr_start_t_val,lr_end_t_val, bill_type_val
            FROM
           bill_t b, item_t i
           WHERE
           i.poid_id0 = item_obj AND
           i.ar_bill_obj_id0 = b.poid_id0  ;
     ELSE
     -- Fetches ledger report start_t and ledger_report end_t for items that have ar_bill_obj_id0 set as zero
           SELECT Date_To_Infranet(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM')),
          Date_To_Infranet(LAST_DAY(TRUNC(Infranet_To_Date(i.EFFECTIVE_t),'MM'))+1)
          INTO lr_start_t_val,lr_end_t_val
          FROM item_t i WHERE i.poid_id0=item_obj;

    END IF;
ELSE
    invoice_number_val :='PENDING';
END IF;

-- Following select query fetches Product_Name from product_t table
IF product_obj > 0 THEN
  SELECT name,TYPE
          INTO product_name,product_type
          FROM
          product_t
          WHERE
          poid_id0  = product_obj;

    BEGIN
        SELECT rt.step_resource
            INTO rate_step_resource_val
            FROM
            rate_t rt, rate_plan_t rpt
            WHERE rt.rate_plan_obj_id0 = rpt.poid_id0
            AND step_type = 2
            AND rpt.event_type = event_type
            AND product_obj_id0 = product_obj
            AND ROWNUM < 2;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            rate_step_resource_val := null;
    END;

END IF;

-- Following select query fetches Deal_Name

IF product_obj > 0 THEN
  IF offering_obj IS NULL THEN
                  SELECT ep2d(event_bal_poid), end_t INTO deal_nm,product_purchase_t
                                FROM event_t
                                where poid_id0 = event_bal_poid;
  ELSIF offering_obj = 0 THEN
                                SELECT descr, end_t INTO deal_nm,product_purchase_t
                                FROM   event_t
                                where poid_id0 = event_bal_poid;

                                BEGIN
                                  SELECT invoice_descriptor into inv_descriptor
                                  FROM ent_descriptor_mapping_t
                                  WHERE node_obj_id0 = event_bal_poid and rownum < 2;
                                EXCEPTION
                                WHEN NO_DATA_FOUND THEN
                                  BEGIN
                                    SELECT deal_type INTO inv_descriptor
                                    from hns_con_inv_deal_t where deal_name = deal_nm and rownum < 2;
                                  EXCEPTION
                                  WHEN NO_DATA_FOUND THEN
                                    inv_descriptor := deal_nm;
                                  END;
                                END;
                ELSE
                                SELECT (SELECT name FROM deal_t WHERE poid_id0 = p.deal_obj_id0),p.cycle_start_t, p.status
                                                INTO deal_nm,product_purchase_t,product_status_val
                                FROM purchased_product_t p
                                WHERE p.poid_id0 = offering_obj;

                                BEGIN
                                  SELECT invoice_descriptor into inv_descriptor
                                  FROM ent_descriptor_mapping_t
                                  WHERE node_obj_id0 = offering_obj and rownum < 2;
                                EXCEPTION
                                WHEN NO_DATA_FOUND THEN
                                  BEGIN
                                    SELECT deal_type INTO inv_descriptor
                                    from hns_con_inv_deal_t where deal_name = deal_nm and rownum < 2;
                                  EXCEPTION
                                  WHEN NO_DATA_FOUND THEN
                                    inv_descriptor := deal_nm;
                                  END;
                                END;
                END IF;
END IF;

-- Following select query fetches trans_id
IF  item_obj_type = '/item/payment/reversal' THEN

         SELECT trans_id
         INTO trans_id
         FROM EVENT_BILLING_REVERSAL_T WHERE obj_id0 = event_bal_poid;

END IF;

IF  item_obj_type = '/item/payment' THEN
         SELECT trans_id
         INTO trans_id
         FROM event_billing_payment_t WHERE obj_id0 = event_bal_poid;

         IF event_type = '/event/billing/payment/check' THEN
         SELECT CHECK_NO
         INTO check_number
         FROM EVENT_BILLING_PAYMENT_CHECK_T
         WHERE OBJ_ID0 = event_bal_poid;
     END IF ;


END IF;
-- Following select query fetches product_or_tax_start_t and product_or_tax_end_t
IF item_obj_type = '/item/product_purchase' THEN
         product_or_tax_start_t := product_purchase_t;
         product_or_tax_end_t   := product_purchase_t;
ELSIF item_obj_type='/item/tax' THEN

        SELECT COUNT(*)
        INTO tax_date_count
        FROM
        event_billing_cycle_t
        WHERE
        obj_id0 = event_bal_poid ;
        IF tax_date_count > 0 THEN
        SELECT cycle_start_t, cycle_end_t
        INTO product_or_tax_start_t, product_or_tax_end_t
        FROM
        event_billing_cycle_t
        WHERE
        obj_id0 = event_bal_poid ;
        END IF;
ELSE
         SELECT COUNT(*)
         INTO product_purchase_count
         FROM
         event_product_fee_cycle_t
         WHERE
         obj_id0     = event_bal_poid ;
         IF product_purchase_count > 0 THEN
         SELECT cycle_start_t,cycle_end_t
         INTO product_or_tax_start_t, product_or_tax_end_t
         FROM
         event_product_fee_cycle_t
         WHERE
         obj_id0 = event_bal_poid ;
         END IF;

END IF;

-- inserting fetched fields into hns_financial_t table
       INSERT INTO
       hns_financial_t (rec_id, rec_created_t,rec_modified_t, san_no,san_no_created_t, gl_segment, company, state, city, country, zip, dom,
           invoice_number, invoice_start_t, invoice_end_t, glid, amount, ratetag, taxcode, account_obj,item_obj,event_type,
           event_descr, event_created_t, program_name, userid_id0, product_event_t, product_name, product_purchase_t,
           trans_id,product_or_tax_start_t, product_or_tax_end_t, deal_name,parent_san_no,parent_company,lr_start_t,lr_end_t,item_obj_type,
           event_bal_poid, check_no, item_no, percent, discount, service_type, service_status, service_last_status_t, service_laststat_cmnt,
           product_status, bill_type, rate_step_resource, invoice_descriptor)
       VALUES(HNS_FINANCIAL_SEQ.NEXTVAL,Date_To_Infranet(SYSDATE), Date_To_Infranet(SYSDATE) ,san_no, san_no_created_t, gl_segment,
              company, state, city, country, zip,dom,invoice_number_val, invoice_start_t, invoice_end_t,glid, amount, ratetag, taxcode,
              account_obj, item_obj, event_type, event_descr, event_created_t, event_program_name, event_userid_id0, product_event_t,product_name, product_purchase_t,
              trans_id,product_or_tax_start_t, product_or_tax_end_t, deal_nm, parent_san_no, parent_company,lr_start_t_val,lr_end_t_val,item_obj_type,
              event_bal_poid, check_number, item_number, percentage, discount, service_type, svc_status, svc_last_status_t, svc_laststat_comment,
              product_status_val, bill_type_val, rate_step_resource_val, inv_descriptor);

      -- incrementing the counter value
       total_rec := total_rec+1;
       --COMMIT;
        IF mod(total_rec, 1000) = 0 THEN    -- Commit every 1000 records
            --UPDATE HNS_AUDIT_FINANCIALS_T SET END_TIME=SYSDATE,PROCESSED_ROWS=total_rec
            --WHERE start_time=(select max(start_time) from HNS_AUDIT_FINANCIALS_T WHERE TRUNC(start_time)=TRUNC(sysdate));
            COMMIT;
        END IF;

        NULL;
END LOOP;
   --Update the audit Table now to put the actual records processed

   --UPDATE HNS_AUDIT_FINANCIALS_T SET END_TIME=SYSDATE,PROCESSED_ROWS=total_rec
   --WHERE start_time=(select max(start_time) from HNS_AUDIT_FINANCIALS_T WHERE TRUNC(start_time)=TRUNC(sysdate));
   COMMIT;
        DBMS_OUTPUT.PUT_LINE('Ending Second for loop ');
        DBMS_OUTPUT.PUT_LINE('---------------------------------');
        DBMS_OUTPUT.PUT_LINE('Ending procedure ' || SYSDATE);
/*
      EXCEPTION  -- exception handlers begin
      WHEN OTHERS THEN  -- handles all other errors
      dbms_output.put_line('Error occurred.');
*/
END Hns_Financial_Issue;

/
--------------------------------------------------------
--  DDL for Procedure HNS_FIX_REMAINING_UNITS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_FIX_REMAINING_UNITS" IS
--
-- This procedure is used to fix the remaining_units field in HNS_SERVICE_CREDIT_T
-- It calculates the remaining units based on the actual credit given to the customer
-- by the service credit deal.
-- ---------   ------  -------------------------------------------
    credited_account  account_t.account_no%TYPE;
    new_remaining_units  hns_service_credit_t.remaining_units%TYPE;
    old_remaining_units hns_service_credit_t.remaining_units%TYPE;
    deal_obj hns_service_credit_t.discount_deal_id%TYPE;
    created_time hns_service_credit_t.created_t%TYPE;
    credit_id_row hns_service_credit_t.credit_id%TYPE;
    credit_months hns_service_credit_t.credit_months%TYPE;
    credit_amount hns_service_credit_t.amount%TYPE;
    diff INTEGER;


    CURSOR credit_accounts_cur IS
        select h.account_no, h.created_t,h.discount_deal_id, remaining_units, credit_id, credit_months, amount
        from hns_service_credit_t h
        where h.status not in ('D','F');


BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure to fix remaining units ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');


-- 1. Get the list of all accounts that are not done or forfeited

    FOR account_list in credit_accounts_cur
    LOOP

     credited_account := account_list.account_no;
     old_remaining_units := account_list.remaining_units;
     created_time := account_list.created_t;
     deal_obj := account_list.discount_deal_id;
     credit_id_row := account_list.credit_id;
     credit_months := account_list.credit_months;
     credit_amount := account_list.amount;

-- 2. For each account do the following
-- 2a. Get the actual remaining units
        select credit_months+nvl(sum(ebi.amount/credit_amount),0) into new_remaining_units
        from   event_bal_impacts_t ebi
        where  ebi.account_obj_id0 = a2p(credited_account)
        and    ebi.obj_id0 >= d2lp(trunc(u2d(created_time)))
        and    ebi.RESOURCE_ID = 840
        and    ebi.product_obj_id0 = (select product_obj_id0 from deal_products_t where obj_id0 = deal_obj);

-- 2b. If remaining units in DB doesn't match actual balance impacts
--     set the replace table entry with actual balance impacts
        if old_remaining_units <> new_remaining_units then
            --DBMS_OUTPUT.PUT_LINE('Updating account credit_id: ' || credit_id_row || ' Old: ' || old_remaining_units || ' New: ' || new_remaining_units);
            update hns_service_credit_t
                set remaining_units = new_remaining_units,
                modified_t = d2i(sysdate)
                where credit_id = credit_id_row;
            commit;
        end if;

-- 2c. If new_remaining_units < 0 mark the record is done
--     Too much credit given already. The deal needs to cancelled as well - separate process
       if new_remaining_units < 0 then
            update hns_service_credit_t
                set status = 'D',
                modified_t = d2i(sysdate)
                where credit_id = credit_id_row;
            commit;
       end if;

-- 2d. If new_remaining_units is 0 check if the cycle_end_t is already past

       if new_remaining_units = 0 then
            select (d2i(sysdate) - nvl(max(cycle_end_t),d2i(sysdate))) into diff from event_product_fee_cycle_t ebc, event_bal_impacts_t ebi
                where  ebc.obj_id0 = ebi.obj_id0
                and    ebi.account_obj_id0 = a2p(credited_account)
                and    ebi.obj_id0 >= d2lp(trunc(u2d(created_time)))
                and    ebc.obj_id0 >= d2lp(trunc(u2d(created_time)))
                and    ebi.product_obj_id0 = (select product_obj_id0 from deal_products_t where obj_id0 = deal_obj)
                and    ebi.resource_id = 840
                and    ebi.amount <> 0;

            if diff > 0 then
                update hns_service_credit_t
                    set status = 'D',
                    remaining_units = -1,
                    modified_t = d2i(sysdate)
                    where credit_id = credit_id_row;
                commit;
            end if;
       end if;

    END LOOP;

DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending fix remaining units procedure ' || sysdate);

END; -- Procedure HNS_FIX_REMAINING_UNITS

/
--------------------------------------------------------
--  DDL for Procedure HNS_GET_ACCOUNT_INFO
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_GET_ACCOUNT_INFO" (
   San                 IN     VARCHAR,
   SITE_ID                OUT VARCHAR,
   PAYING_BILL_TYPE       OUT INTEGER,
   COLLECTION_STATE       OUT INTEGER,
   HAVE_BAD_ADDRESS       OUT INTEGER,
   GL_SEGMENT             OUT VARCHAR,
   SERVICE_ZIP            OUT VARCHAR,
   BILLING_ZIP            OUT VARCHAR,
   SERVICE_STATUS         OUT INTEGER,
   SERVICE_DEAL_NAME      OUT VARCHAR,
   PARENT_ACCOUNT_NO      OUT VARCHAR,
   ACCOUNT_POID           OUT NUMBER,
   REMAINING_MONTH        OUT INTEGER,
   TOTAL_MONTH            OUT INTEGER,
   SERIAL_NUMBER          OUT VARCHAR,
   IS_LEASE_HARDWARE      OUT INTEGER,
   TOTAL_DUE          OUT NUMBER,
   ALLOW_PURCHASE         OUT INTEGER,
   THRESHOLD              OUT INTEGER)
IS
   PARENT_ACCOUNT_POID    NUMBER;
   PAY_INFO_POID          NUMBER;
   CURRENT_BALANCE        INTEGER;
   ACTIVE_IPS             INTEGER;
   GROUP_POID             NUMBER;
   THRESHOLD1             INTEGER;
   THRESHOLD2             INTEGER;
   THRESHOLD3             INTEGER;
   PARENT_BILLINFO_POID   NUMBER;
BEGIN
   BEGIN
      THRESHOLD1 := 500;
      THRESHOLD2 := 1000;
      THRESHOLD3 := 1000000;


      DBMS_OUTPUT.PUT_LINE ('Start Of HNS_GET_ACCOUNT_INFO ' || SYSDATE);

      --Going to Get Account Poid
      SELECT A.POID_ID0, A.GL_SEGMENT, AN.ZIP
        INTO ACCOUNT_POID, GL_SEGMENT, SERVICE_ZIP
        FROM ACCOUNT_T A, ACCOUNT_NAMEINFO_T AN
       WHERE A.POID_ID0 = AN.OBJ_ID0 AND A.ACCOUNT_NO = SAN;


      BEGIN
         SELECT STATUS, LOGIN
           INTO SERVICE_STATUS, SITE_ID
           FROM SERVICE_T
          WHERE     ACCOUNT_OBJ_ID0 = ACCOUNT_POID
                AND POID_TYPE = '/service/ip'
                AND LOGIN NOT LIKE 'DUP%';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            DBMS_OUTPUT.PUT_LINE ('No Active Data Found for Serivce IP');
            SERVICE_STATUS := 0;
      END;


      --Getting IP Deal Name
      BEGIN
         SELECT D.NAME
           INTO SERVICE_DEAL_NAME
           FROM PURCHASED_PRODUCT_T AP, DEAL_T D
          WHERE     AP.ACCOUNT_OBJ_ID0 = ACCOUNT_POID
                AND AP.DEAL_OBJ_ID0 = D.POID_ID0
                AND AP.SERVICE_OBJ_TYPE = '/service/ip'
                AND AP.STATUS <> 3
                AND ROWNUM < 2;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            DBMS_OUTPUT.PUT_LINE ('No Active Deal Found for Serivce IP');
      END;



      -- Getting Parent Account Poid
      BEGIN
         SELECT G.ACCOUNT_OBJ_ID0, P2A (G.ACCOUNT_OBJ_ID0), G.POID_ID0
           INTO PARENT_ACCOUNT_POID, PARENT_ACCOUNT_NO, GROUP_POID
           FROM GROUP_BILLING_MEMBERS_T GB, GROUP_T G
          WHERE GB.OBJ_ID0 = G.POID_ID0 AND GB.OBJECT_ID0 = ACCOUNT_POID;

         DBMS_OUTPUT.PUT_LINE ('Account is a child account');
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            BEGIN
               SELECT G.ACCOUNT_OBJ_ID0, P2A (G.ACCOUNT_OBJ_ID0), G.POID_ID0
                 INTO PARENT_ACCOUNT_POID, PARENT_ACCOUNT_NO, GROUP_POID
                 FROM GROUP_T G
                WHERE G.ACCOUNT_OBJ_ID0 = ACCOUNT_POID;

               DBMS_OUTPUT.PUT_LINE ('Account is a parent account');
            EXCEPTION
               WHEN NO_DATA_FOUND
               THEN
                  DBMS_OUTPUT.PUT_LINE ('Account is not in a heirarchy');
                  PARENT_ACCOUNT_POID := ACCOUNT_POID;
                  PARENT_ACCOUNT_NO := SAN;
                  GROUP_POID := 0;
            END;
      END;

      DBMS_OUTPUT.PUT_LINE ('Group poid is ' || GROUP_POID);

      -- Getting Active IPs in hierarchy
      IF GROUP_POID = 0
      THEN
         THRESHOLD := THRESHOLD1;
      ELSE
         BEGIN
            SELECT POID_ID0
              INTO PARENT_BILLINFO_POID
              FROM BILLINFO_T
             WHERE ACCOUNT_OBJ_ID0 = PARENT_ACCOUNT_POID;
         EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
               PARENT_BILLINFO_POID := 0;
         END;

         BEGIN
            SELECT COUNT (*)
              INTO ACTIVE_IPS
              FROM SERVICE_T
             WHERE  ACCOUNT_OBJ_ID0 IN (SELECT OBJECT_ID0
                                             FROM GROUP_BILLING_MEMBERS_T
                                            WHERE OBJ_ID0 = GROUP_POID)
                   AND POID_TYPE = '/service/ip'
                   AND STATUS <> 10103;
         EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
               ACTIVE_IPS := 0;
               DBMS_OUTPUT.PUT_LINE ('No active IP services found');
         END;

         IF ACTIVE_IPS <= 1
         THEN
            THRESHOLD := THRESHOLD1;
         ELSE
            THRESHOLD := THRESHOLD2;
         END IF;
      END IF;

	  IF INSTR (p2gl(ACCOUNT_POID),'.VAR.') <> 0
	  THEN
			THRESHOLD := THRESHOLD3;
	  END IF;

      -- Getting Paying Bill Type and BILLING_ZIP
      BEGIN
         SELECT PAY_TYPE, PAYINFO_OBJ_ID0
           INTO PAYING_BILL_TYPE, PAY_INFO_POID
           FROM BILLINFO_T
          WHERE     ACCOUNT_OBJ_ID0 = PARENT_ACCOUNT_POID
                AND BILL_INFO_ID = 'Account Billinfo';
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            PAYING_BILL_TYPE := 0;
      END;

      IF PAYING_BILL_TYPE = 10001
      THEN
         BEGIN
            SELECT ZIP
              INTO BILLING_ZIP
              FROM PAYINFO_INV_T
             WHERE OBJ_ID0 = PAY_INFO_POID;
         EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
               DBMS_OUTPUT.PUT_LINE ('Billing Zip Not Found');
         END;
      END IF;

      IF PAYING_BILL_TYPE = 10003
      THEN
         BEGIN
            SELECT ZIP
              INTO BILLING_ZIP
              FROM PAYINFO_CC_T
             WHERE OBJ_ID0 = PAY_INFO_POID;
         EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
               DBMS_OUTPUT.PUT_LINE ('Billing Zip Not Found');
         END;
      END IF;

      IF PAYING_BILL_TYPE = 10005
      THEN
         BEGIN
            SELECT ZIP
              INTO BILLING_ZIP
              FROM PAYINFO_DD_T
             WHERE OBJ_ID0 = PAY_INFO_POID;
         EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
               DBMS_OUTPUT.PUT_LINE ('Billing Zip Not Found');
         END;
      END IF;


      --Check Account Collection State
      BEGIN
         SELECT COLLECTION_STATE
           INTO COLLECTION_STATE
           FROM HNS_DELINQUENCY_T
          WHERE ACCOUNT_OBJ_ID0 = PARENT_ACCOUNT_POID;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            COLLECTION_STATE := 0;
      END;

      --Get Total Commitment Month
      BEGIN
         SELECT V.TERM
           INTO TOTAL_MONTH
           FROM PURCHASED_PRODUCT_T AP, BILLING_COMMITMENT_TERM_VW V
          WHERE     AP.ACCOUNT_OBJ_ID0 = ACCOUNT_POID
                AND AP.DEAL_OBJ_ID0 = V.POID_ID0
                AND AP.SERVICE_OBJ_TYPE = '/service/commitment'
                AND AP.STATUS <> 3;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            TOTAL_MONTH := 0;
      END;


      --Get Remaining Commitment Month
      BEGIN
         SELECT SUM (CURRENT_BAL)
           INTO CURRENT_BALANCE
           FROM BAL_GRP_SUB_BALS_T GSB, BAL_GRP_T BG
          WHERE     BG.ACCOUNT_OBJ_ID0 = ACCOUNT_POID
                AND BG.POID_ID0 = GSB.OBJ_ID0
                AND VALID_TO = 0
                AND REC_ID2 LIKE 1000099;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            CURRENT_BALANCE := 0;
      END;

      SELECT (TOTAL_MONTH - CURRENT_BALANCE) INTO REMAINING_MONTH FROM DUAL;

      -- Get Serial Number
      BEGIN
         SELECT H.HNS_SERIAL_NUMBER
           INTO SERIAL_NUMBER
           FROM HNS_PROFILE_CUSTOMER_T H, PROFILE_T P
          WHERE P.POID_ID0 = H.OBJ_ID0 AND P.ACCOUNT_OBJ_ID0 = ACCOUNT_POID;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            DBMS_OUTPUT.PUT_LINE ('No Serial Number Found');
      END;

      -- Getting is Lease Hardware or Purchased One
      SELECT COUNT (*)
        INTO IS_LEASE_HARDWARE
        FROM PURCHASED_PRODUCT_T AP
       WHERE     AP.ACCOUNT_OBJ_ID0 = ACCOUNT_POID
             AND AP.SERVICE_OBJ_TYPE = '/service/rental'
             AND AP.STATUS <> 3;

      -- Get Actual Account Have Bad Address or Not

      HAVE_BAD_ADDRESS := IS_ACCOUNT_HAVE_BAD_ADDRESS (PARENT_ACCOUNT_NO);

DBMS_OUTPUT.PUT_LINE ('Timing Of new change HNS_GET_ACCOUNT_INFO ' || SYSDATE);
      -- Get the balance due of the tokens on the account
      IF GROUP_POID = 0
      THEN
         BEGIN
            SELECT NVL (SUM (DUE), 0)
              INTO TOTAL_DUE
              FROM ITEM_T
             WHERE     ACCOUNT_OBJ_ID0 = ACCOUNT_POID
                   AND DUE <> 0;
         EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
               TOTAL_DUE := 0;
               DBMS_OUTPUT.PUT_LINE ('No Tokens Found');
         END;
      ELSE
         BEGIN
            SELECT NVL (SUM (DUE), 0)
              INTO TOTAL_DUE
              FROM ITEM_T
             WHERE     AR_BILLINFO_OBJ_ID0 = PARENT_BILLINFO_POID
                   AND DUE <> 0;
         EXCEPTION
            WHEN NO_DATA_FOUND
            THEN
               TOTAL_DUE := 0;
               DBMS_OUTPUT.PUT_LINE ('No Tokens Found');
         END;
      END IF;


      IF TOTAL_DUE < THRESHOLD
      THEN
         ALLOW_PURCHASE := 1;
      ELSE
         ALLOW_PURCHASE := 0;
      END IF;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         ACCOUNT_POID := 0;
      WHEN OTHERS
      THEN
         raise_application_error (
            -20002,
            'Unknown Error - ' || SQLCODE || ' -ERROR- ' || SQLERRM);
   END;

   DBMS_OUTPUT.PUT_LINE ('---------------------------------');
   DBMS_OUTPUT.PUT_LINE ('End Of HNS_GET_ACCOUNT_INFO ' || SYSDATE);
END HNS_GET_ACCOUNT_INFO;

/
--------------------------------------------------------
--  DDL for Procedure HNS_GET_COMMITMENT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_GET_COMMITMENT" 
(SAN In Varchar,
TOTAL_COMMITMENT OUT INTEGER,
GL_SEGMENT  OUT VARCHAR)
IS

  ACCOUNT_POID NUMBER;
  PARENT_ACCOUNT_POID NUMBER;
  PARENT_ACCOUNT_NO VARCHAR2(255);
  TOKEN_ACCOUNT_POID NUMBER;
  Token_Account_No Varchar2(255);
  LIST_OF_GL_SEGMENT Varchar2(2000);


BEGIN
  BEGIN

  DBMS_OUTPUT.PUT_LINE('Given Account No ' || SAN);

  --Going to Get Account Poid

  SELECT GL_SEGMENT,
         (SELECT COMMITMENT
          FROM   PURCHASED_PRODUCT_T AP,
                 BILLING_COMMITMENT_VW V
          WHERE  V.DEAL_ID = AP.DEAL_OBJ_ID0
                 AND AP.STATUS <> 3
                 AND AP.SERVICE_OBJ_TYPE = '/service/commitment'
                 AND AP.PRODUCT_OBJ_ID0 = A.POID_ID0) AS COMMITMENT
                 INTO GL_SEGMENT, TOTAL_COMMITMENT
  FROM   ACCOUNT_T A
  WHERE  A.ACCOUNT_NO = SAN;

  DBMS_OUTPUT.PUT_LINE('GL Segment  ' || GL_SEGMENT);
  DBMS_OUTPUT.PUT_LINE('Commitment  ' || TOTAL_COMMITMENT);



  EXCEPTION
    WHEN NO_DATA_FOUND THEN
        TOTAL_COMMITMENT := 0;
        GL_SEGMENT := '';
    WHEN OTHERS THEN
        raise_application_error(-20002,'Unknown Error - '||SQLCODE||' -ERROR- '||SQLERRM);

    END;

    DBMS_OUTPUT.PUT_LINE('---------------------------------');
    DBMS_OUTPUT.PUT_LINE('End Of HNS_GET_COMMITMENT ' || SYSDATE);

END HNS_GET_COMMITMENT;

/
--------------------------------------------------------
--  DDL for Procedure HNS_GET_ITEM_DETAIL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_GET_ITEM_DETAIL" 
(
date1   IN  date,
date2   IN  date
)
IS
  parent_san_no           account_t.account_no%TYPE;
  item_number             item_t.item_no%TYPE;
  invoice_number_val      hns_financial_t.invoice_number%TYPE;
  arbill_obj              item_t.ar_bill_obj_id0%TYPE;
  parent_account_obj      account_t.poid_id0%TYPE;
  item_obj                event_bal_impacts_t.item_obj_id0%TYPE;
  itm_san_no           		  account_t.account_no%TYPE;
  transfer_event_obj      event_t.poid_id0%TYPE;
  transfer_amt			  event_bal_impacts_t.amount%TYPE;
  amt			          event_bal_impacts_t.amount%TYPE;
  itm_total			          event_bal_impacts_t.amount%TYPE;
  itm_due			          event_bal_impacts_t.amount%TYPE;
  itm_glid					  number;
  itm_adjusted				item_t.adjusted%TYPE;
  itm_recvd					item_t.adjusted%TYPE;
  itm_writeoff				item_t.adjusted%TYPE;
  tr_item_type              varchar2(50);



   t_sql_text varchar2(4000);

  --Create a cursor to get the list of evnt_bal_impacts gl_id, amount, rate_tag, tax_code, account_obj_id0, item_obj_id0, product_obj_id0
  CURSOR get_items_cur IS
  select san_no, parent_san_no,item_obj,item_no,invoice_number, glid from hns_financial_t
	where event_created_t > (select d2i(date1-365) from dual)
	and   (glid like '%132' or glid like '%332' or glid like '%117');

  CURSOR get_transfer_obj_cur (arbobj NUMBER) IS
  select obj_id0
  from transfer_events_t eit
	where ar_bill_obj_id0=arbobj;

    BEGIN

     DBMS_OUTPUT.PUT_LINE('Starting procedure ' || SYSDATE);
     DBMS_OUTPUT.PUT_LINE('---------------------------------');
     DBMS_OUTPUT.PUT_LINE('Starting first for loop  '|| SYSDATE);
     --Count the Total No. of records to store this info in audit table before starting execution

	 /* truncate all temp tables */
	t_sql_text := 'truncate table transfer_events_t';
	Execute Immediate t_sql_text;

	--t_sql_text := 'DROP INDEX I_HNS_EVT_TNSFR_ID';
    --Execute Immediate t_sql_text;

	Insert /*+ append */ into transfer_events_t
        Select /*+ parallel (event_item_transfer_t,6) */ * from event_item_transfer_t
              where obj_id0 >= (select date_to_low_poid(date1) from dual)
			  and obj_id0 < (select date_to_low_poid(date2) from dual);
    commit;

    --t_sql_text := 'CREATE INDEX I_HNS_EVT_TNSFR_ID ON transfer_events_t (AR_BILL_OBJ_ID0)';
    --Execute Immediate t_sql_text;

     --total_rec               := 0   ;


  FOR get_items_rec IN get_items_cur
      LOOP
      parent_san_no           := NULL;
	  item_number             := NULL;
	  arbill_obj              := NULL;
	  parent_account_obj      := NULL;
    invoice_number_val      := NULL;
	  item_obj                := NULL;
	  itm_san_no           	:= NULL;
      tr_item_type          := NULL;
	  transfer_event_obj      := NULL;
	  transfer_amt			  := 0;
	  amt			          := 0;
    itm_total         := 0;
    itm_due	          := 0;

	itm_glid	:= 0;
    itm_adjusted	:= 0;
    itm_recvd		:= 0;
    itm_writeoff	:= 0;



      itm_san_no                := get_items_rec.san_no;
	  parent_san_no           := get_items_rec.parent_san_no;
	  item_obj                := get_items_rec.item_obj;
	  item_number             := get_items_rec.item_no;
    invoice_number_val      := get_items_rec.invoice_number;
	itm_glid				:= get_items_rec.glid;




	-- Get ar bill poid for item
  BEGIN
	  SELECT ar_bill_obj_id0, item_total, due,adjusted,recvd,writeoff
			  INTO arbill_obj, itm_total, itm_due,itm_adjusted,itm_recvd,itm_writeoff
			  FROM
			  item_t
			  WHERE
			  poid_id0 = item_obj
			  and mod_t >= (select d2i(date1) from dual)
			  --and mod_t < (select d2i(date2) from dual)
			  --and recvd <> 0
			  ;
   EXCEPTION
        WHEN NO_DATA_FOUND THEN
		--This item is not be processed - no payments in the given date range
            continue;
    END;
    DBMS_OUTPUT.PUT_LINE('parent obj and ar obj ' || parent_account_obj || ' ' || arbill_obj || SYSDATE);

	-- Get parent account poid (same as account poid for independent accounts)
       SELECT poid_id0
          INTO  parent_account_obj
          FROM
          account_t
          WHERE
          account_no = parent_san_no ;

   for transfer_rec in get_transfer_obj_cur (arbill_obj)
   loop
    transfer_event_obj := transfer_rec.obj_id0;
    DBMS_OUTPUT.PUT_LINE('transfer event obj ' || transfer_event_obj || SYSDATE);
	BEGIN
		--select regexp_substr(regexp_substr(utl_raw.cast_to_varchar2(dbms_lob.substr(buffer_buf)),'[^('||chr(13)||chr(10)||')]+',1,3),'-*\d*',1,9) into amt
		--select regexp_substr(regexp_substr(utl_raw.cast_to_varchar2(dbms_lob.substr(buffer_buf)),item_obj || '.*1 57 14 0 -*\d*',1,1,'n'),'-*\d*$') into amt
		select substr(regexp_substr(regexp_substr(utl_raw.cast_to_varchar2(dbms_lob.substr(buffer_buf)),item_obj|| '.*' || chr(10) ||'1 57 14 0 -*\d*\.*\d*'|| chr(10) ||'1 797 5 0',1,1),'1 57 14 0 -*\d*\.*\d*'),10) into amt
		  from event_item_transfer_buf_t
		  where obj_id0=transfer_event_obj;
		  --and utl_raw.cast_to_varchar2(dbms_lob.substr(buffer_buf)) like '%' || item_number || '%';
	if amt is not null then
        select item_obj_type into tr_item_type from event_t where poid_id0=transfer_event_obj;
		INSERT INTO
       hns_item_transfer_t (item_obj_id0, parent_san_no,invoice_number,start_t,end_t,paid_amt, item_total,item_due,
					transfer_obj_id0,glid,adjusted, recvd, writeoff, san_no, transfer_item_type)
       VALUES(item_obj,parent_san_no,invoice_number_val,date1,date2,amt, itm_total, itm_due,
					transfer_event_obj,itm_glid, itm_adjusted, itm_recvd, itm_writeoff, itm_san_no, tr_item_type);
	end if;
	exception
		when others then
		amt := 0;
		DBMS_OUTPUT.PUT_LINE('exception in reading blob for event poid ' || transfer_event_obj || ' and item no ' || item_number || SYSDATE);
		--select to_char(regexp_substr(regexp_substr(blob_to_clob(buffer_buf),item_obj || '.*1 57 14 0 -*\d*',1,1,'n'),'-*\d*$')) into amt
		select to_char(substr(regexp_substr(regexp_substr(blob_to_clob(buffer_buf),item_obj || '.*' || chr(10) ||'1 57 14 0 -*\d*\.*\d*'|| chr(10) ||'1 797 5 0',1,1),'1 57 14 0 -*\d*\.*\d*'),10)) into amt
                  from event_item_transfer_buf_t
                  where obj_id0=transfer_event_obj;
	if amt is not null then
        select item_obj_type into tr_item_type from event_t where poid_id0=transfer_event_obj;
		INSERT INTO
        hns_item_transfer_t (item_obj_id0, parent_san_no,invoice_number,start_t,end_t,paid_amt, item_total,item_due,
					transfer_obj_id0,glid,adjusted, recvd, writeoff, san_no, transfer_item_type)
        VALUES(item_obj,parent_san_no,invoice_number_val,date1,date2,amt, itm_total, itm_due,
					transfer_event_obj,itm_glid, itm_adjusted, itm_recvd, itm_writeoff, itm_san_no, tr_item_type);
	end if;

	end;
		--transfer_amt := transfer_amt+amt;
   end loop;





      -- incrementing the counter value
       --total_rec := total_rec+1;
       COMMIT;

        NULL;
END LOOP;
   --Update the audit Table now to put the actual records processed

        DBMS_OUTPUT.PUT_LINE('Ending Second for loop ');
        DBMS_OUTPUT.PUT_LINE('---------------------------------');
        DBMS_OUTPUT.PUT_LINE('Ending procedure ' || SYSDATE);
/*
      EXCEPTION  -- exception handlers begin
      WHEN OTHERS THEN  -- handles all other errors
      dbms_output.put_line('Error occurred.');
*/
END Hns_Get_Item_Detail;

/
--------------------------------------------------------
--  DDL for Procedure HNS_GET_ITEM_DETAIL_NEW
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_GET_ITEM_DETAIL_NEW" 
(
date1   IN  date,
date2   IN  date
)
IS
  parent_san_no           account_t.account_no%TYPE;
  item_number             item_t.item_no%TYPE;
  invoice_number_val      hns_financial_t.invoice_number%TYPE;
  arbill_obj              item_t.ar_bill_obj_id0%TYPE;
  parent_account_obj      account_t.poid_id0%TYPE;
  item_obj                event_bal_impacts_t.item_obj_id0%TYPE;
  itm_san_no           		  account_t.account_no%TYPE;
  transfer_event_obj      event_t.poid_id0%TYPE;
  transfer_amt			  event_bal_impacts_t.amount%TYPE;
  amt			          event_bal_impacts_t.amount%TYPE;
  itm_total			          event_bal_impacts_t.amount%TYPE;
  itm_due			          event_bal_impacts_t.amount%TYPE;
  itm_glid					  number;
  itm_adjusted				item_t.adjusted%TYPE;
  itm_recvd					item_t.adjusted%TYPE;
  itm_writeoff				item_t.adjusted%TYPE;
  tr_item_type              varchar2(50);



   t_sql_text varchar2(4000);

  --Create a cursor to get the list of evnt_bal_impacts gl_id, amount, rate_tag, tax_code, account_obj_id0, item_obj_id0, product_obj_id0
  CURSOR get_items_cur (invNo varchar2) IS
  select san_no, parent_san_no,item_obj,item_no,invoice_number, glid from hns_financial_t
	where invoice_number=invNo
	and   (glid like '%132' or glid like '%332' or glid like '%117');

  CURSOR get_transfer_obj_cur IS
  select obj_id0, bill_no
  from transfer_events_t eit;

    BEGIN

     DBMS_OUTPUT.PUT_LINE('Starting procedure ' || SYSDATE);
     DBMS_OUTPUT.PUT_LINE('---------------------------------');
     DBMS_OUTPUT.PUT_LINE('Starting first for loop  '|| SYSDATE);
     --Count the Total No. of records to store this info in audit table before starting execution

	 /* truncate all temp tables */
	t_sql_text := 'truncate table transfer_events_t';
	Execute Immediate t_sql_text;

	Insert /*+ append */ into transfer_events_t
		Select /*+ parallel (event_item_transfer_t,6) */ eit.*, (select bill_no from bill_t where poid_id0 = eit.ar_bill_obj_id0) from event_item_transfer_t eit
              where obj_id0 >= (select date_to_low_poid(date1) from dual)
			  and obj_id0 < (select date_to_low_poid(date2) from dual);
    commit;


     --total_rec               := 0   ;


  FOR get_transfer_rec IN get_transfer_obj_cur
      LOOP
      parent_san_no           := NULL;
	  item_number             := NULL;
	  arbill_obj              := NULL;
	  parent_account_obj      := NULL;
    invoice_number_val      := NULL;
	  item_obj                := NULL;
	  itm_san_no           	:= NULL;
      tr_item_type          := NULL;
	  transfer_event_obj      := NULL;
	  transfer_amt			  := 0;
	  amt			          := 0;
    itm_total         := 0;
    itm_due	          := 0;

	itm_glid	:= 0;
    itm_adjusted	:= 0;
    itm_recvd		:= 0;
    itm_writeoff	:= 0;


	transfer_event_obj := get_transfer_rec.obj_id0;
	invoice_number_val := get_transfer_rec.bill_no;

	DBMS_OUTPUT.PUT_LINE('transfer event obj ' || transfer_event_obj || SYSDATE);


   for get_items_rec in get_items_cur (invoice_number_val)
   loop
		itm_san_no              := get_items_rec.san_no;
		parent_san_no           := get_items_rec.parent_san_no;
		item_obj                := get_items_rec.item_obj;
		item_number             := get_items_rec.item_no;
		invoice_number_val      := get_items_rec.invoice_number;
		itm_glid				:= get_items_rec.glid;

	BEGIN

		SELECT ar_bill_obj_id0, item_total, due,adjusted,recvd,writeoff
			  INTO arbill_obj, itm_total, itm_due,itm_adjusted,itm_recvd,itm_writeoff
			  FROM
			  item_t
			  WHERE
			  poid_id0 = item_obj;

		--select regexp_substr(regexp_substr(utl_raw.cast_to_varchar2(dbms_lob.substr(buffer_buf)),'[^('||chr(13)||chr(10)||')]+',1,3),'-*\d*',1,9) into amt
		--select regexp_substr(regexp_substr(utl_raw.cast_to_varchar2(dbms_lob.substr(buffer_buf)),item_obj || '.*1 57 14 0 -*\d*',1,1,'n'),'-*\d*$') into amt
		select substr(regexp_substr(regexp_substr(utl_raw.cast_to_varchar2(dbms_lob.substr(buffer_buf)),item_obj|| '.*' || chr(10) ||'1 57 14 0 -*\d*\.*\d*'|| chr(10) ||'1 797 5 0',1,1),'1 57 14 0 -*\d*\.*\d*'),10) into amt
		  from event_item_transfer_buf_t
		  where obj_id0=transfer_event_obj;
		  --and utl_raw.cast_to_varchar2(dbms_lob.substr(buffer_buf)) like '%' || item_number || '%';
	if amt is not null then
        select item_obj_type into tr_item_type from event_t where poid_id0=transfer_event_obj;
		INSERT INTO
       hns_item_transfer_t_new (item_obj_id0, parent_san_no,invoice_number,start_t,end_t,paid_amt, item_total,item_due,
					transfer_obj_id0,glid,adjusted, recvd, writeoff, san_no, transfer_item_type)
       VALUES(item_obj,parent_san_no,invoice_number_val,date1,date2,amt, itm_total, itm_due,
					transfer_event_obj,itm_glid, itm_adjusted, itm_recvd, itm_writeoff, itm_san_no, tr_item_type);
	end if;
	exception
		when others then
		amt := 0;
		DBMS_OUTPUT.PUT_LINE('exception in reading blob for event poid ' || transfer_event_obj || ' and item no ' || item_number || SYSDATE);
		--select to_char(regexp_substr(regexp_substr(blob_to_clob(buffer_buf),item_obj || '.*1 57 14 0 -*\d*',1,1,'n'),'-*\d*$')) into amt
		select to_char(substr(regexp_substr(regexp_substr(blob_to_clob(buffer_buf),item_obj || '.*' || chr(10) ||'1 57 14 0 -*\d*\.*\d*'|| chr(10) ||'1 797 5 0',1,1),'1 57 14 0 -*\d*\.*\d*'),10)) into amt
                  from event_item_transfer_buf_t
                  where obj_id0=transfer_event_obj;
	if amt is not null then
        select item_obj_type into tr_item_type from event_t where poid_id0=transfer_event_obj;
		INSERT INTO
        hns_item_transfer_t_new (item_obj_id0, parent_san_no,invoice_number,start_t,end_t,paid_amt, item_total,item_due,
					transfer_obj_id0,glid,adjusted, recvd, writeoff, san_no, transfer_item_type)
        VALUES(item_obj,parent_san_no,invoice_number_val,date1,date2,amt, itm_total, itm_due,
					transfer_event_obj,itm_glid, itm_adjusted, itm_recvd, itm_writeoff, itm_san_no, tr_item_type);
	end if;

	end;
		--transfer_amt := transfer_amt+amt;
   end loop;





      -- incrementing the counter value
       --total_rec := total_rec+1;
       COMMIT;

        NULL;
END LOOP;
   --Update the audit Table now to put the actual records processed

        DBMS_OUTPUT.PUT_LINE('Ending Second for loop ');
        DBMS_OUTPUT.PUT_LINE('---------------------------------');
        DBMS_OUTPUT.PUT_LINE('Ending procedure ' || SYSDATE);
/*
      EXCEPTION  -- exception handlers begin
      WHEN OTHERS THEN  -- handles all other errors
      dbms_output.put_line('Error occurred.');
*/
END Hns_Get_Item_Detail_new;

/
--------------------------------------------------------
--  DDL for Procedure HNS_GET_TOKEN_ACCOUNT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_GET_TOKEN_ACCOUNT" 
(San In Varchar,
SECONDARY_ACCOUNT OUT VARCHAR)
IS

  ACCOUNT_POID NUMBER;
  PARENT_ACCOUNT_POID NUMBER;
  TOKEN_ACCOUNT_POID NUMBER;
  TOKEN_ACCOUNT_NO Varchar2(255);


BEGIN
  BEGIN

  --Going to Get Account Poid
  SELECT A.POID_ID0 INTO ACCOUNT_POID FROM ACCOUNT_T A WHERE A.ACCOUNT_NO = SAN;



  -- Getting Parent Account Poid
  BEGIN
    SELECT G.ACCOUNT_OBJ_ID0 INTO PARENT_ACCOUNT_POID  FROM GROUP_BILLING_MEMBERS_T GB, GROUP_T G   WHERE GB.OBJ_ID0 = G.POID_ID0 AND GB.OBJECT_ID0 = ACCOUNT_POID;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        PARENT_ACCOUNT_POID := ACCOUNT_POID;
  END;
      --Check for Token Account Exists or Note

      Begin
        SELECT TOKEN_ACCOUNT_OBJ,P2A(TOKEN_ACCOUNT_OBJ) INTO TOKEN_ACCOUNT_POID,TOKEN_ACCOUNT_NO  FROM HNS_ACCOUNT_TOKEN_MAP_T WHERE ACCOUNT_OBJ = PARENT_ACCOUNT_POID;
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            TOKEN_ACCOUNT_POID := 0;
      END;

      IF TOKEN_ACCOUNT_POID != 0 THEN

         SECONDARY_ACCOUNT := TOKEN_ACCOUNT_NO;

      END IF;



  EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ACCOUNT_POID := 0;
    WHEN OTHERS THEN
        raise_application_error(-20002,'Unknown Error - '||SQLCODE||' -ERROR- '||SQLERRM);

    END;

    DBMS_OUTPUT.PUT_LINE('---------------------------------');
    DBMS_OUTPUT.PUT_LINE('End Of HNS_GET_TOKEN_ACCOUNT ' || SYSDATE);

END HNS_GET_TOKEN_ACCOUNT;

/
--------------------------------------------------------
--  DDL for Procedure HNS_INDEXES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_INDEXES" as

	v_ddl_stmt VARCHAR2(4000);

        c_step_name upg_log_t.step_name%TYPE := 'hns_indexes';

	v_errmsg VARCHAR2(200);
BEGIN
        pin_upg_common.delete_info (c_step_name);

      	v_ddl_stmt := 'ALTER SESSION FORCE PARALLEL dml';
        EXECUTE IMMEDIATE v_ddl_stmt;

      	v_ddl_stmt := 'ALTER SESSION FORCE PARALLEL ddl';
        EXECUTE IMMEDIATE v_ddl_stmt;

      		pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'DROP INDEX I_HNS_AU_PRFL_PRNT_OBJ', NULL);
                IF (pin_upg_common.INDEX_EXISTS('I_HNS_AU_PRFL_PRNT_OBJ', v_errmsg)) THEN
                        v_ddl_stmt := 'DROP INDEX I_HNS_AU_PRFL_PRNT_OBJ';
                        EXECUTE IMMEDIATE v_ddl_stmt;
                END IF;

      		pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'DROP INDEX I_HNS_AU_PRFL_PRNT_OBJ', NULL);
                IF (pin_upg_common.INDEX_EXISTS('I_HNS_UPG_BILL_ID', v_errmsg)) THEN
                        v_ddl_stmt := 'DROP INDEX I_HNS_UPG_BILL_ID';
                        EXECUTE IMMEDIATE v_ddl_stmt;
                END IF;


      	pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'I_USERCREATION_SLOW_1_IDX', NULL);
        IF (NOT pin_upg_common.index_exists('I_USERCREATION_SLOW_1_IDX', v_errmsg)) THEN
                IF (pin_upg_common.table_exists('ITEM_T', v_errmsg)) THEN
                        v_ddl_stmt := 'CREATE INDEX I_USERCREATION_SLOW_1_IDX ON ITEM_T (ACCOUNT_OBJ_ID0, CLOSED_T, STATUS)
                              tablespace PINIDX
                              storage (initial 2m next 2m pctincrease 0 ) PARALLEL' ;

                        EXECUTE IMMEDIATE v_ddl_stmt;
                END IF;
        END IF;

      	pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'I_HNS_BILL_BINF_OBJ_PRNT_ID', NULL);
        IF (NOT pin_upg_common.index_exists('I_HNS_BILL_BINF_OBJ_PRNT_ID', v_errmsg)) THEN
                IF (pin_upg_common.table_exists('BILL_T', v_errmsg)) THEN
                        v_ddl_stmt := 'CREATE INDEX I_HNS_BILL_BINF_OBJ_PRNT_ID ON BILL_T (BILLINFO_OBJ_ID0, PARENT_ID0)
                              tablespace PINIDX
                              storage (initial 2m next 2m pctincrease 0 ) PARALLEL' ;

                        EXECUTE IMMEDIATE v_ddl_stmt;
                END IF;
        END IF;

      	pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'I_HNS_BILL_BINF_OBJ_END', NULL);
        IF (NOT pin_upg_common.index_exists('I_HNS_BILL_BINF_OBJ_END', v_errmsg)) THEN
                IF (pin_upg_common.table_exists('BILL_T', v_errmsg)) THEN
                        v_ddl_stmt := 'CREATE INDEX I_HNS_BILL_BINF_OBJ_END ON BILL_T (BILLINFO_OBJ_ID0, END_T, BILL_NO)
                              tablespace PINIDX
                              storage (initial 2m next 2m pctincrease 0 ) PARALLEL' ;

                        EXECUTE IMMEDIATE v_ddl_stmt;
                END IF;
        END IF;

      	pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'I_HNS_ITEM_AR_BNFO_BIL_DB', NULL);
        IF (NOT pin_upg_common.index_exists('I_HNS_ITEM_AR_BNFO_BIL_DB', v_errmsg)) THEN
                IF (pin_upg_common.table_exists('ITEM_T', v_errmsg)) THEN
                        v_ddl_stmt := 'CREATE INDEX I_HNS_ITEM_AR_BNFO_BIL_DB ON ITEM_T (AR_BILLINFO_OBJ_ID0, AR_BILL_OBJ_DB)
                              tablespace PINIDX
                              storage (initial 2m next 2m pctincrease 0 ) PARALLEL' ;

                        EXECUTE IMMEDIATE v_ddl_stmt;
                END IF;
        END IF;

      	pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'I_HNS_ITEM_AR_BNFO_BIL_ID', NULL);
        IF (NOT pin_upg_common.index_exists('I_HNS_ITEM_AR_BNFO_BIL_ID', v_errmsg)) THEN
                IF (pin_upg_common.table_exists('ITEM_T', v_errmsg)) THEN
                        v_ddl_stmt := 'CREATE INDEX I_HNS_ITEM_AR_BNFO_BIL_ID ON ITEM_T (AR_BILLINFO_OBJ_ID0, AR_BILL_OBJ_ID0)
                              tablespace PINIDX
                              storage (initial 2m next 2m pctincrease 0 ) PARALLEL' ;

                        EXECUTE IMMEDIATE v_ddl_stmt;
                END IF;
        END IF;

      	pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'I_HNS_REPORTS_EVENT_CREATED', NULL);
        IF (NOT pin_upg_common.index_exists('I_HNS_REPORTS_EVENT_CREATED', v_errmsg)) THEN
                IF (pin_upg_common.table_exists('EVENT_T', v_errmsg)) THEN
                        v_ddl_stmt := 'CREATE INDEX I_HNS_REPORTS_EVENT_CREATED ON EVENT_T(CREATED_T)
                              tablespace PINIDX
                              storage (initial 2m next 2m pctincrease 0 ) PARALLEL' ;

                        EXECUTE IMMEDIATE v_ddl_stmt;
                END IF;
        END IF;

      	pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'I_HNS_REPORTS_NAMEINFO', NULL);
        IF (NOT pin_upg_common.index_exists('I_HNS_REPORTS_NAMEINFO', v_errmsg)) THEN
                IF (pin_upg_common.table_exists('ACCOUNT_NAMEINFO_T', v_errmsg)) THEN
                        v_ddl_stmt := 'CREATE INDEX I_HNS_REPORTS_NAMEINFO ON ACCOUNT_NAMEINFO_T(OBJ_ID0, REC_ID, COUNTRY, STATE)
                              tablespace PINIDX
                              storage (initial 2m next 2m pctincrease 0 ) PARALLEL' ;

                        EXECUTE IMMEDIATE v_ddl_stmt;
                END IF;
        END IF;

      	pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'I_EVENT_TAX_JURIS__ID', NULL);
        IF (NOT pin_upg_common.index_exists('I_EVENT_TAX_JURIS__ID', v_errmsg)) THEN
                IF (pin_upg_common.table_exists('EVENT_TAX_JURISDICTIONS_T', v_errmsg)) THEN
                        v_ddl_stmt := 'CREATE INDEX I_EVENT_TAX_JURIS__ID ON EVENT_TAX_JURISDICTIONS_T(OBJ_ID0, REC_ID)
                              tablespace PINIDX
                              storage (initial 2m next 2m pctincrease 0 ) PARALLEL' ;

                        EXECUTE IMMEDIATE v_ddl_stmt;
                END IF;
        END IF;

      	pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'I_HNS_RPT_TAX_PROFILE', NULL);
        IF (NOT pin_upg_common.index_exists('I_HNS_RPT_TAX_PROFILE', v_errmsg)) THEN
                IF (pin_upg_common.table_exists('PROFILE_T', v_errmsg)) THEN
                        v_ddl_stmt := 'CREATE INDEX I_HNS_RPT_TAX_PROFILE ON PROFILE_T(POID_TYPE, NAME)
                              tablespace PINIDX
                              storage (initial 2m next 2m pctincrease 0 ) PARALLEL' ;

                        EXECUTE IMMEDIATE v_ddl_stmt;
                END IF;
        END IF;

      	pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'I_HNS_JOURNAL_ITEM__ID', NULL);
        IF (NOT pin_upg_common.index_exists('I_HNS_JOURNAL_ITEM__ID', v_errmsg)) THEN
                IF (pin_upg_common.table_exists('JOURNAL_T', v_errmsg)) THEN
                        v_ddl_stmt := 'CREATE INDEX I_HNS_JOURNAL_ITEM__ID ON JOURNAL_T (ITEM_OBJ_ID0, RESOURCE_ID)
                              tablespace PINIDX
                              storage (initial 2m next 2m pctincrease 0 ) PARALLEL' ;

                        EXECUTE IMMEDIATE v_ddl_stmt;
                END IF;
        END IF;


      		pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'I_ITEM__MOD_T', NULL);
                IF (pin_upg_common.INDEX_EXISTS('I_ITEM__MOD_T', v_errmsg)) THEN
                        v_ddl_stmt := 'DROP INDEX I_ITEM__MOD_T';
                        EXECUTE IMMEDIATE v_ddl_stmt;
                END IF;


      	pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'I_ITEM__MOD_T', NULL);
        IF (NOT pin_upg_common.index_exists('I_ITEM__MOD_T', v_errmsg)) THEN
                IF (pin_upg_common.table_exists('ITEM_T', v_errmsg)) THEN
                        v_ddl_stmt := 'CREATE INDEX I_ITEM__MOD_T ON ITEM_T (MOD_T)
                              tablespace PINIDX
                              storage (initial 2m next 2m pctincrease 0 ) PARALLEL' ;

                        EXECUTE IMMEDIATE v_ddl_stmt;
                END IF;
        END IF;

      	pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'I', 'I_EVENT_BILLING_CHARGE__CKPT', NULL);
        IF (NOT pin_upg_common.index_exists('I_EVENT_BILLING_CHARGE__CKPT', v_errmsg)) THEN
                IF (pin_upg_common.table_exists('EVENT_BILLING_CHARGE_T', v_errmsg)) THEN
                        v_ddl_stmt := 'CREATE INDEX I_EVENT_BILLING_CHARGE__CKPT ON EVENT_BILLING_CHARGE_T (OBJ_ID0, PAY_TYPE, RESULT)
                              tablespace PINIDX
                              storage (initial 2m next 2m pctincrease 0 ) PARALLEL' ;

                        EXECUTE IMMEDIATE v_ddl_stmt;
                END IF;
        END IF;



EXCEPTION
        WHEN others THEN
                pin_upg_common.log_info (c_step_name, null, null, 'E', v_ddl_stmt, sqlerrm);
END hns_indexes;

/
--------------------------------------------------------
--  DDL for Procedure HNS_JOURNAL_T_ARCHIVE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_JOURNAL_T_ARCHIVE" 
   IS
--***************************************************************************
-- Purpose: This procedure is used to remove records over 14 months old
--          from Journal_T after copying the records to a staging table.
--          Journal_T record deletes will be driven from the staging table.
--          A separate procedure will be used to copy the staging table
--          records into the archive database (HNSARCHP).
--
-- MODIFICATION HISTORY
-- Person      Date      Comments
-- ---------   ------    -------------------------------------------
-- JMatalenas  09/28/11  - Initial creation
--
--***************************************************************************

--***** Declarations Section *****
  d_end_date        date;
  n_cntr            integer :=0;
  n_rows_archived   integer :=0;
  n_max_poid        number;
  n_del_limit       number := 100000;
  t_sql_text        varchar2(2000);

  Cursor Stage_Recs Is
    Select poid_id0 From journal_t_stg;

-- **** Main Processing *****
BEGIN
  dbms_output.put_line('Starting Journal_T archive process at ' ||
         to_char(sysdate,'yyyymmdd hh24:mi:ss'));

  --- Save current Journal_T optimizer stats so they can be re-imported
  --- after the archive completes.  New stats seem to cause negative
  --- impact on GL process.

  t_sql_text := 'truncate table journalstats';
  Execute Immediate t_sql_text;

  dbms_stats.export_table_stats(ownname => 'PIN', tabname => 'JOURNAL_T', stattab => 'JOURNALSTATS', cascade =>true, statown => 'PIN');

  -- Truncate Journal_T staging table before starting data copy

  t_sql_text := 'Truncate table journal_t_stg';
  Execute Immediate t_sql_text;


  -- Determine max_poid value for date 13 months from end of prev month

  --n_max_poid := DATE_TO_LOW_POID(ADD_MONTHS(d_end_date, -14));
  --d_end_date := trunc(last_day(add_months(sysdate, -1)));
  n_max_poid := DATE_TO_LOW_POID(add_months((trunc(last_day(add_months(sysdate, -1)))), -13));

  dbms_output.put_line('Max POID value is ' || to_char(n_max_poid));

  -- Copy records to staging table based on max POID value
  Insert into journal_t_stg
    select * from journal_t
       where poid_id0 <= n_max_poid;

  Commit;


  -- Delete old Journal_T data based on data in staging table

  For C1 in Stage_Recs
    Loop
      Delete From journal_t
        Where poid_id0 = C1.poid_id0;

      n_cntr := n_cntr + 1;
      n_rows_archived := n_rows_archived + 1;

      If n_cntr >= n_del_limit Then
        Commit;
        n_cntr := 0;
      End If;

  End Loop;

  Commit;

  --- Rebuild Journal_T indexes online to defrag
  For C2 in (select index_name from all_indexes where table_name = 'JOURNAL_T')
    Loop
      t_sql_text := 'alter index ' || C2.index_name || ' rebuild online';
      Execute Immediate t_sql_text;
  End Loop;

  --- Need to update stats on Journal_T and indexes
  ---dbms_stats.gather_table_stats(ownname=> 'PIN', tabname=> 'JOURNAL_T',cascade=>TRUE,estimate_percent=>20,degree=>3);
  dbms_stats.import_table_stats(ownname => 'PIN', tabname => 'JOURNAL_T', stattab => 'JOURNALSTATS', cascade =>true, statown => 'PIN');


  dbms_output.put_line('Number of rows archived was: ' || to_char(n_rows_archived));
  dbms_output.put_line('Journal_T archive process completed at ' ||
       to_char(sysdate,'yyyymmdd hh24:mi:ss'));

EXCEPTION
    WHEN Others THEN
        dbms_output.put_line('Unexpected Error: ' || SQLERRM);
        rollback;
        raise;
END;

/
--------------------------------------------------------
--  DDL for Procedure HNS_LOAD_TIMEZONE_DATA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_LOAD_TIMEZONE_DATA" 
   IS
--
-- To modify this template, edit file PROC.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the procedure
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------

  m_tz_poid				account_t.poid_id0%TYPE;
  m_total_offset			NUMBER;
  m_gmt_offset				NUMBER;
  m_daylight_savings_time		VARCHAR2(255);
  -- poid stuff

--
--	Get next poid work areas
--

   m_a					NUMBER:=0;
   m_b					NUMBER:=0;
   m_c					NUMBER:=0;
   m_d					NUMBER:=0;
   m_poid_id0				NUMBER:=0;

   m_poid_db		    		account_t.poid_db%TYPE;


   m_date_real				DATE;
   m_unix_start_date_real		DATE;

   m_sysdate_real			DATE;
   m_sysdate_tm				NUMBER;
   m_date_char				VARCHAR2(255);
   m_date_work				DATE;
   m_date_yyyymmdd			VARCHAR2(255);

   m_days_difference			NUMBER;

--
--	Date validation work areas
--

   m_yyyymmdd				VARCHAR2(255);
   m_valid_days				VARCHAR2(24);

   m_account_poid_id0			account_t.poid_id0%TYPE;
   m_profile_poid_id0			profile_t.poid_id0%TYPE;

   m_zip				VARCHAR2(20);
   m_timezone				VARCHAR2(5);

-- Declare program variables as shown above

--
-- CURSOR DECLARATIONS
--

  CURSOR get_tz_rec IS
  SELECT zip, timezone FROM HNS_INPUT_TIMEZONE;

  CURSOR m_a_cur IS
  SELECT poid_ids2.nextval FROM dual;

-- ------------------------------------------------------------------------------------
FUNCTION UNIX_TIME (m_date_real IN DATE) RETURN NUMBER IS

BEGIN

	IF 	(m_date_real > TO_DATE('19901028 0000', 'YYYYMMDD HH24MI') AND
			m_date_real <= TO_DATE ('19910407 0000', 'YYYYMMDD HH24MI')) OR
		(m_date_real > TO_DATE('19911027 0000', 'YYYYMMDD HH24MI') AND
			m_date_real <= TO_DATE ('19920405 0000', 'YYYYMMDD HH24MI')) OR
		(m_date_real > TO_DATE('19921025 0000', 'YYYYMMDD HH24MI') AND
			m_date_real <= TO_DATE ('19930404 0000', 'YYYYMMDD HH24MI')) OR
		(m_date_real > TO_DATE('19931031 0000', 'YYYYMMDD HH24MI') AND
			m_date_real <= TO_DATE ('19940403 0000', 'YYYYMMDD HH24MI')) OR
		(m_date_real > TO_DATE('19941030 0000', 'YYYYMMDD HH24MI') AND
			m_date_real <= TO_DATE ('19950402 0000', 'YYYYMMDD HH24MI')) OR
		(m_date_real > TO_DATE('19951029 0000', 'YYYYMMDD HH24MI') AND
			m_date_real <= TO_DATE ('19960407 0000', 'YYYYMMDD HH24MI')) OR
		(m_date_real > TO_DATE('19961027 0000', 'YYYYMMDD HH24MI') AND
			m_date_real <= TO_DATE ('19970406 0000', 'YYYYMMDD HH24MI')) OR
		(m_date_real > TO_DATE('19971026 0000', 'YYYYMMDD HH24MI') AND
			m_date_real <= TO_DATE ('19980405 0000', 'YYYYMMDD HH24MI')) OR
		(m_date_real > TO_DATE('19981025 0000', 'YYYYMMDD HH24MI') AND
			m_date_real <= TO_DATE ('19990404 0000', 'YYYYMMDD HH24MI')) OR
		(m_date_real > TO_DATE('19991031 0000', 'YYYYMMDD HH24MI') AND
			m_date_real <= TO_DATE ('20000402 0000', 'YYYYMMDD HH24MI')) OR
		(m_date_real > TO_DATE('20001029 0000', 'YYYYMMDD HH24MI') AND
			m_date_real <= TO_DATE ('20010401 0000', 'YYYYMMDD HH24MI')) OR
		(m_date_real > TO_DATE('20011028 0000', 'YYYYMMDD HH24MI') AND
			m_date_real <= TO_DATE ('20020407 0000', 'YYYYMMDD HH24MI'))
	THEN
		m_daylight_savings_time := 'TRUE';
	ELSIF m_date_real > TO_DATE('20021027 0000', 'YYYYMMDD HH24MI')
	THEN
		m_daylight_savings_time := 'FALSE';
	ELSE
		m_daylight_savings_time := 'FALSE';
	END IF;

	IF m_daylight_savings_time = 'TRUE'
	THEN
		m_total_offset := m_gmt_offset + 3600;
	ELSE
		m_total_offset := m_gmt_offset;
	END IF;

 	m_days_difference := (m_date_real - m_unix_start_date_real);
	RETURN (m_days_difference * 86400) + m_total_offset;

END UNIX_TIME;

-- ---------------------------------------------------------------------------------------------
-- generating new poid for Infranet from the Oracle sequence number
FUNCTION NEW_POID RETURN NUMBER IS

BEGIN

	OPEN m_a_cur;
	FETCH m_a_cur INTO m_a;
	CLOSE m_a_cur;

--	SELECT poid_ids2.nextval INTO m_a FROM dual;

	m_poid_id0 := TRUNC(m_a/4096)*4096;

	m_a := m_a-m_poid_id0;

	m_d := 2048;

	FOR m_b IN 1 .. 12
		LOOP
			m_c := TRUNC(m_a/2);
			IF (m_c*2) != m_a
			THEN
				m_poid_id0 := m_poid_id0+m_d;
			END IF;
			m_a := m_c;
			m_d := TRUNC(m_d/2);
		END LOOP;

	RETURN m_poid_id0;

END NEW_POID;

-- --------------------------------------------------------------------
PROCEDURE insert_hns_timezone IS

BEGIN


--
--	Create profile_t entry
--

	m_tz_poid := NEW_POID;

	INSERT INTO hns_timezone
		VALUES
		(
		m_poid_db,										-- poid_db
		m_tz_poid,								-- poid_id0
		'/hns_timezone',									-- poid_type
		0,											-- poid_rev
		m_sysdate_tm,									-- created_t
		m_sysdate_tm,									-- mod_t
		'L',											-- read_access
		'L',											-- write_access
		m_poid_db,										-- account_obj_db
		1,								-- account_obj_id0
		'/account',										-- account_obj_type
		0,											-- account_obj_rev
		m_timezone,
		m_zip
		);

		COMMIT;

END insert_hns_timezone;

-- -----------------------------------------------------------------------------------------------------

BEGIN

	m_unix_start_date_real := TO_DATE('19700101 0000', 'YYYYMMDD HH24MI');

	m_date_char := TO_CHAR(SYSDATE, 'YYYYMMDD HH24MI');
	m_sysdate_real := TO_DATE(m_date_char, 'YYYYMMDD HH24MI');
	m_sysdate_tm := UNIX_TIME(m_sysdate_real);

	m_poid_db := 1;

 OPEN get_tz_rec;

 LOOP <<main_loop>>

    FETCH get_tz_rec INTO m_zip, m_timezone;

	EXIT WHEN get_tz_rec%NOTFOUND;

	insert_hns_timezone;

  END LOOP main_loop;

  CLOSE get_tz_rec;

END; -- Procedure HNS_CREATE_PMT_HISTORY

/
--------------------------------------------------------
--  DDL for Procedure HNS_OT_FIX_REMAINING_UNITS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_OT_FIX_REMAINING_UNITS" IS
--
-- This procedure is used to fix the remaining_units field in HNS_SERVICE_CREDIT_T
-- It calculates the remaining units based on the actual credit given to the customer
-- by the service credit deal.
-- ---------   ------  -------------------------------------------
    credited_account  account_t.account_no%TYPE;
    new_remaining_units  hns_service_credit_t.remaining_units%TYPE;
    old_remaining_units hns_service_credit_t.remaining_units%TYPE;
    deal_obj hns_service_credit_t.discount_deal_id%TYPE;
    created_time hns_service_credit_t.created_t%TYPE;
    credit_id_row hns_service_credit_t.credit_id%TYPE;
    credit_months hns_service_credit_t.credit_months%TYPE;
    credit_amount hns_service_credit_t.amount%TYPE;
    diff INTEGER;


    CURSOR credit_accounts_cur IS
        select h.account_no, h.created_t,h.discount_deal_id, remaining_units, credit_id, credit_months, amount
        from hns_service_credit_t h
        where h.status = 'D' and remaining_units = 0;


BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure to fix remaining units ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');


-- 1. Get the list of all accounts that are not done or forfeited

    FOR account_list in credit_accounts_cur
    LOOP

     credited_account := account_list.account_no;
     old_remaining_units := account_list.remaining_units;
     created_time := account_list.created_t;
     deal_obj := account_list.discount_deal_id;
     credit_id_row := account_list.credit_id;
     credit_months := account_list.credit_months;
     credit_amount := account_list.amount;

-- 2d. If new_remaining_units is 0 check if the cycle_end_t is already past

       if old_remaining_units = 0 then
            select (d2i(sysdate) - nvl(max(cycle_end_t),d2i(sysdate))) into diff from event_product_fee_cycle_t ebc, event_bal_impacts_t ebi
                where  ebc.obj_id0 = ebi.obj_id0
                and    ebi.account_obj_id0 = a2p(credited_account)
                and    ebi.obj_id0 >= d2lp(trunc(u2d(created_time)))
                and    ebc.obj_id0 >= d2lp(trunc(u2d(created_time)))
                and    ebi.product_obj_id0 = (select product_obj_id0 from deal_products_t where obj_id0 = deal_obj)
                and    ebi.resource_id = 840
                and    ebi.amount <> 0;

            if diff > 0 then
                update hns_service_credit_t
                    set status = 'D',
                    remaining_units = -1,
                    modified_t = d2i(sysdate)
                    where credit_id = credit_id_row;
                commit;
            end if;
       end if;

    END LOOP;

DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending fix remaining units procedure ' || sysdate);

END; -- Procedure HNS_ONETIME_FIX_REMAINING_UNITS

/
--------------------------------------------------------
--  DDL for Procedure HNS_SET_STATUS_STAGING
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_SET_STATUS_STAGING" 
   IS
--
-- To modify this template, edit file PROC.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the procedure
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
m_parent_id	    hns_input_billto_data_t.LEGACY_ACCT_ID%TYPE;
p_status	    hns_input_billto_data_t.ACCOUNT_STATUS%TYPE;
p_status_date	    hns_input_billto_data_t.ACCOUNT_STATUS_DATE%TYPE;
p_status_code	    hns_input_billto_data_t.DECOMMISSION_CODE%TYPE;
p_status_flag	    hns_input_billto_data_t.STATUS_FLAG%TYPE;
p_recommission_date hns_input_billto_data_t.RECOMMISSION_DATE%TYPE;
p_decommission_date hns_input_billto_data_t.DECOMMISSION_DATE%TYPE;

m_status	    hns_input_site_data_t.ACCOUNT_STATUS%TYPE;
m_status_date	    hns_input_site_data_t.ACCOUNT_STATUS_DATE%TYPE;
m_status_code	    hns_input_site_data_t.DECOMMISSION_CODE%TYPE;

n_status	    hns_input_site_data_t.ACCOUNT_STATUS%TYPE;
n_status_date	    hns_input_site_data_t.ACCOUNT_STATUS_DATE%TYPE;
n_status_code	    hns_input_site_data_t.DECOMMISSION_CODE%TYPE;
n_status_flag	    hns_input_billto_data_t.STATUS_FLAG%TYPE;

n_total_children    NUMBER;
n_child_children    NUMBER;
n_total_inactive    NUMBER;
n_child_inactive    NUMBER;


CURSOR get_accounts_cursor IS
SELECT legacy_acct_id, account_status, account_status_date, decommission_code, status_flag from hns_input_billto_data_t for UPDATE;

CURSOR get_account_children_cursor IS
SELECT ACCOUNT_STATUS, ACCOUNT_STATUS_DATE, DECOMMISSION_CODE from hns_input_site_data_t where legacy_acct_id = m_parent_id;

-- -----------------------------------------------------------------------------------------------------
   -- Declare program variables as shown above
BEGIN


    OPEN get_accounts_cursor;

     LOOP <<find_accounts>>

	   FETCH get_accounts_cursor INTO m_parent_id,
		p_status, p_status_date, p_status_code, p_status_flag;

           EXIT WHEN get_accounts_cursor%NOTFOUND;

       n_status := 0;
       n_total_children := 0;
       n_child_inactive := 0;

       OPEN get_account_children_cursor;

       LOOP <<find_children>>

          FETCH get_account_children_cursor INTO m_status, m_status_date, m_status_code;

          EXIT WHEN get_account_children_cursor%NOTFOUND;

          n_total_children := n_total_children + 1;

          IF m_status = 'Inactive' OR m_status = 'Closed'
          THEN
            n_child_inactive := n_child_inactive + 1;
          ELSE
            CLOSE get_account_children_cursor;
            goto find_accounts; -- If an active child found don't do any more analysis
          END IF;

	  IF (n_total_children = 1) OR (m_status_date > n_status_date)
	  THEN
		n_status_date := m_status_date;
                n_status_code := m_status_code;
	  END IF;

          IF m_status_date > n_status_date
          THEN
                n_status_date := m_status_date;
                n_status_code := m_status_code;
          END IF;

        END LOOP find_children;
        CLOSE get_account_children_cursor;

        -- Just a double check to make sure that there were no active children
        IF n_total_children != n_child_inactive
        THEN
            goto find_accounts;
        END IF;

	-- All the children should be inactive if we made it this far. Now check the site logic
	IF (p_recommission_date >= p_decommission_date) AND (p_recommission_date is not NULL) and (p_decommission_date is not NULL)
	THEN
		goto find_accounts;
	END IF;

	IF (SUBSTR(p_status_code, 1, 1) != '5') OR (p_status_flag != 'TA') OR (p_status_flag != 'TT')
	THEN
		goto find_accounts;	-- leave the status alone as we have an active service
	END IF;

        -- All the children, service are inactive now. Make the account inactive with latest status
        IF p_status_date > n_status_date
        THEN
           n_status_date := p_status_date;
           n_status_code := p_status_code;
        END IF;


        -- Do an update on the account
        UPDATE hns_input_billto_data_t
        set ACCOUNT_STATUS = 'Inactive',
            account_status_date = n_status_date,
            decommission_code = n_status_code
        where
            legacy_acct_id = m_parent_id;

    END LOOP find_accounts;
    CLOSE get_accounts_cursor;


END; -- Procedure HNS_SET_STATUS_STAGING

/
--------------------------------------------------------
--  DDL for Procedure HNS_UPDATE_ACCOUNT_STATUS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_UPDATE_ACCOUNT_STATUS" 
   IS
--
-- To modify this template, edit file PROC.TXT in TEMPLATE
-- directory of SQL Navigator
--
-- Purpose: Briefly explain the functionality of the procedure
--
-- MODIFICATION HISTORY
-- Person      Date    Comments
-- ---------   ------  -------------------------------------------
m_acct_poid         account_t.poid_id0%TYPE;
m_group_poid        account_t.group_obj_id0%TYPE;
m_site_poid         group_billing_members_t.object_id0%TYPE;
m_site_status_t     account_t.last_status_t%TYPE := 0;
n_site_status_t     account_t.last_status_t%TYPE := 0;
n_child_inactive    NUMBER := 0;
n_total_children    NUMBER := 0;
m_site_status       account_t.status%TYPE;
n_site_status       account_t.status%TYPE;
m_site_status_flag  account_t.LASTSTAT_CMNT%TYPE;
n_site_status_flag  account_t.LASTSTAT_CMNT%TYPE;
m_service_status    service_t.status%TYPE;
m_service_status_flag   service_t.LASTSTAT_CMNT%TYPE;
m_service_last_status_t service_t.last_status_t%TYPE;
n_rec_found         NUMBER;

CURSOR get_accounts_cursor IS
SELECT poid_id0, group_obj_id0 FROM account_t WHERE account_no||'' like 'AMR-%-%';

CURSOR get_account_children_cursor IS
SELECT object_id0 FROM group_billing_members_t WHERE obj_id0 = m_group_poid;

CURSOR get_account_service_cursor IS
SELECT status, laststat_cmnt, last_status_t FROM service_t WHERE account_obj_id0 = m_acct_poid;

CURSOR last_status_t_cur IS
SELECT status, LASTSTAT_CMNT, last_status_t FROM account_t WHERE poid_id0 = m_site_poid;

-- ----------------------------------------------------------------------------------------------
   -- Declare program variables as shown above
BEGIN


    OPEN get_accounts_cursor;

     LOOP <<find_accounts>>

	   FETCH get_accounts_cursor INTO m_acct_poid, m_group_poid;

	   EXIT WHEN get_accounts_cursor%NOTFOUND;

       OPEN get_account_service_cursor;

       FETCH get_account_service_cursor into m_service_status, m_service_status_flag, m_service_last_status_t;

       IF get_accounts_cursor%NOTFOUND
       THEN
	 m_service_last_status_t := 0;
       ELSE
        IF m_service_status = 10100
        THEN
	    CLOSE get_account_service_cursor;
            goto find_accounts;  -- account has an active service
        END IF;
       END IF;

       CLOSE get_account_service_cursor;

       n_site_status_t := 0;
       n_total_children := 0;
       n_child_inactive := 0;

       OPEN get_account_children_cursor;

       LOOP <<find_children>>

          FETCH get_account_children_cursor INTO m_site_poid;

          EXIT WHEN get_account_children_cursor%NOTFOUND;

--          IF get_account_children_cursor%NOTFOUND
--          THEN
/************** Comment out the following code
            CLOSE get_account_children_cursor;
	    IF m_service_last_status_t > 0
            THEN
            UPDATE account_t
            set status = 10102,
                LASTSTAT_CMNT = m_service_status_flag,
                last_status_t = m_service_last_status_t
            where
                poid_id0 = m_acct_poid;
	    END IF;
            goto find_accounts;
**********************************************/

	    -- Added the following line 1/2/2001 SDD
--	    EXIT;
--          END IF;

          -- get the status date, last status changed timestamp
          OPEN last_status_t_cur;
          FETCH last_status_t_cur INTO m_site_status, m_site_status_flag, m_site_status_t;
          CLOSE last_status_t_cur;

--          SELECT status, LASTSTAT_CMNT, last_status_t
--          INTO m_site_status, m_site_status_flag, m_site_status_t
--          FROM account_t
--          WHERE poid_id0 = m_site_poid;

          n_total_children := n_total_children + 1;

          IF m_site_status = 10102 OR m_site_status = 10103
          THEN
            n_child_inactive := n_child_inactive + 1;
          ELSE
            CLOSE get_account_children_cursor;
            goto find_accounts; -- If an active child found don't do any more analysis
          END IF;

          IF m_site_status_t > n_site_status_t
          THEN
                n_site_status_t := m_site_status_t;
                n_site_status_flag := m_site_status_flag;
          END IF;

        END LOOP find_children;
        CLOSE get_account_children_cursor;

        -- Just a double check to make sure that there were no active children
        IF n_total_children != n_child_inactive
        THEN
            goto find_accounts;
        END IF;

        -- All the children, service are inactive now. Make the account inactive with latest status
        IF m_service_last_status_t > n_site_status_t
        THEN
            n_site_status_t := m_service_last_status_t;
            n_site_status_flag := m_service_status_flag;
        END IF;

        -- Do an update on the account
        UPDATE account_t
        SET status = 10102,
            LASTSTAT_CMNT = n_site_status_flag,
            last_status_t = n_site_status_t
        WHERE
            poid_id0 = m_acct_poid;


END LOOP find_accounts;
CLOSE get_accounts_cursor;


END; -- Procedure HNS_UPDATE_ACCOUNT_STATUS

/
--------------------------------------------------------
--  DDL for Procedure HNS_UPDATE_AR_SUMMARY_DUE_T
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_UPDATE_AR_SUMMARY_DUE_T" AS

    CURSOR V_AR_SUMMARY_UPD_RESULT IS
    SELECT  ITEM_OBJ_ID0,DUE_T FROM HNS_AR_SUMMARY_UPD_ITEM_DUE_T  ;

    V_COUNTER NUMBER := 0;
BEGIN

     FOR HNS_AR_SUMMARY_UPD_REC IN V_AR_SUMMARY_UPD_RESULT
       LOOP
           V_COUNTER := V_COUNTER + 1;
           UPDATE HNS_AR_SUMMARY_T SET DUE_T=HNS_AR_SUMMARY_UPD_REC.DUE_T where ITEM_POID=HNS_AR_SUMMARY_UPD_REC.ITEM_OBJ_ID0;

           IF V_COUNTER = 1000 THEN
             commit;
             V_COUNTER :=0;
           END IF;

       END LOOP;
   commit;

END HNS_UPDATE_AR_SUMMARY_DUE_T;

/
--------------------------------------------------------
--  DDL for Procedure HNS_UPDATE_PAYMENT_ZIPCODES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_UPDATE_PAYMENT_ZIPCODES" IS
old_zipcode 	payinfo_cc_t.ZIP%TYPE;
new_zipcode 	payinfo_cc_t.ZIP%TYPE;
zip_rowid	VARCHAR2(255);
zip_length	NUMBER;

CURSOR get_cc_zipcode IS SELECT TRANSLATE(RTRIM(LTRIM(zip)), '1234567890-\/().,=_-= ', '1234567890'), rowid FROM payinfo_cc_t;

CURSOR get_inv_zipcode IS SELECT TRANSLATE(RTRIM(LTRIM(zip)), '1234567890-\/().,=_-= ', '1234567890'), rowid FROM payinfo_inv_t;

BEGIN

	-- do credit card zipcode
	OPEN get_cc_zipcode;

	LOOP

	FETCH get_cc_zipcode INTO old_zipcode, zip_rowid;

	EXIT WHEN get_cc_zipcode%notfound;

	-- process the zipcode

        zip_length := LENGTH(old_zipcode);

        IF zip_length < 5
        THEN
                new_zipcode := LPAD(old_zipcode, 5, '0');
        ELSIF zip_length = 5
        THEN
                new_zipcode:= old_zipcode;
        ELSIF zip_length = 9
        THEN
                new_zipcode:= SUBSTR(old_zipcode, 1, 5) || '-' || SUBSTR(old_zipcode, 6, 4);
        ELSE
                new_zipcode:= SUBSTR(old_zipcode, 1, 5);
        END IF;

	-- update the zipcode
	UPDATE payinfo_cc_t SET zip = new_zipcode where rowid = zip_rowid;

	END LOOP;

	CLOSE get_cc_zipcode;

	-- do invoice zipcode
	OPEN get_inv_zipcode;

	LOOP

	FETCH get_inv_zipcode INTO old_zipcode, zip_rowid;

	EXIT WHEN get_inv_zipcode%notfound;

	-- process the zipcode

        zip_length := LENGTH(old_zipcode);

        IF zip_length < 5
        THEN
                new_zipcode := LPAD(old_zipcode, 5, '0');
        ELSIF zip_length = 5
        THEN
                new_zipcode:= old_zipcode;
        ELSIF zip_length = 9
        THEN
                new_zipcode:= SUBSTR(old_zipcode, 1, 5) || '-' || SUBSTR(old_zipcode, 6, 4);
        ELSE
                new_zipcode:= SUBSTR(old_zipcode, 1, 5);
        END IF;

        -- update the zipcode
        UPDATE payinfo_inv_t SET zip = new_zipcode where rowid = zip_rowid;

	END LOOP;

	CLOSE get_inv_zipcode;

END hns_update_payment_zipcodes;

/
--------------------------------------------------------
--  DDL for Procedure HNS_UPDATE_PROVIDER_ID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_UPDATE_PROVIDER_ID" 

   IS

        m_account_poid          profile_t.account_obj_id0%TYPE;
        m_profile_poid          profile_t.poid_id0%TYPE;

        CURSOR get_provider_account IS
        SELECT account_obj_id0, poid_id0 FROM profile_t where poid_id0 in (SELECT obj_id0 from hns_profile_customer_t where hns_provider_id is not NULL);

BEGIN

        OPEN get_provider_account;

        LOOP
                FETCH get_provider_account INTO m_account_poid, m_profile_poid;

                EXIT WHEN get_provider_account%NOTFOUND;

                UPDATE input_product_data_t
                SET provider_id = (select hns_provider_id from hns_profile_customer_t where obj_id0 = m_profile_poid)
		WHERE infranet_acct_id = m_account_poid;

	END LOOP;

	CLOSE get_provider_account;

END HNS_UPDATE_PROVIDER_ID;

/
--------------------------------------------------------
--  DDL for Procedure HNS_WRITEOFF_ADJ_RPT_CALC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_WRITEOFF_ADJ_RPT_CALC" IS
--TO BE DONE
--reads data from hns_reverse_writeoff_rpt and hns_writeoff_rpt
--populates hns_writeoff_ADJUSTMENT_rpt

     account_poid  INTEGER;
     min_writeoff_t INTEGER := 0;
     max_reverse_writeoff_t INTEGER := 0;

     CURSOR pymt_cur  IS
     select  account_obj_id0, max(i_effective_t) max_rev_writeoff_t
     from hns_reverse_writeoff_rpt
     group by account_obj_id0;

BEGIN

    DBMS_OUTPUT.PUT_LINE('HNS_WRITEOFF_ADJ_RPT_CALC ' || sysdate);
    DBMS_OUTPUT.PUT_LINE('---------------------------------');

    -- find the buckets for the account
    FOR account_poid_list in pymt_cur
    LOOP
        --DBMS_OUTPUT.PUT_LINE('###################################');
        account_poid := account_poid_list.account_obj_id0;
        max_reverse_writeoff_t := account_poid_list.max_rev_writeoff_t;

        DBMS_OUTPUT.PUT_LINE('account_obj_id0 ' || account_poid);
        DBMS_OUTPUT.PUT_LINE('max_reverse_writeoff_t ' || max_reverse_writeoff_t);

        select max(min_eff_t) into min_writeoff_t
        from
        (select min(r.I_EFFECTIVE_T) min_eff_t
        from   hns_writeoff_rpt r
        where r.account_obj_id0 = account_poid
        group by r.account_obj_id0
        union
        select 0 min_eff_t from dual);

        DBMS_OUTPUT.PUT_LINE('min_writeoff_t ' || min_writeoff_t);
        --DBMS_OUTPUT.PUT_LINE('Inserting data into REPORT_WRITEOFF');
        IF ((min_writeoff_t <> 0) and (max_reverse_writeoff_t <> 0)) THEN

        DBMS_OUTPUT.PUT_LINE('Inserting data into HNS_WRITEOFF_ADJ_RPT_CALC -- INSIDE IF');
        insert into pin.HNS_WRITEOFF_ADJUSTMENT_RPT
        (
        I_POID ,
        I_POID_TYPE ,
        ACCOUNT_OBJ_ID0 ,
        ADJUSTED ,
        DISPUTED ,
        DUE ,
        I_EFFECTIVE_T ,
        ITEM_NO ,
        ITEM_TOTAL ,
        RECVD ,
        STATUS ,
        TRANSFERED ,
        WRITEOFF ,
        BILLINFO_OBJ_ID0,
        AR_BILLINFO_OBJ_ID0
        )
        select  distinct i.poid_id0, i.poid_type, i.account_obj_id0, i.adjusted, i.disputed, i.due, i.effective_t,
            i.item_no, i.item_total, i.recvd, i.status, i.transfered, i.writeoff, i.billinfo_obj_id0,
            i.ar_billinfo_obj_id0
        from  item_t i, event_t e
        where i.POID_TYPE = '/item/adjustment'
        and i.poid_id0 = e.item_obj_id0
        and lower(e.descr) not like '%write%off%'
        and i.effective_t > min_writeoff_t
        and i.effective_t < max_reverse_writeoff_t
        and i.account_obj_id0  = account_poid;

        commit;

        END IF;

    END LOOP; -- for each account

    DBMS_OUTPUT.PUT_LINE('---------------------------------');
    DBMS_OUTPUT.PUT_LINE('Ending HNS_WRITEOFF_ADJ_RPT_CALC ' || sysdate);

END; -- Procedure HNS_WRITEOFF_ADJ_RPT_CALC

/
--------------------------------------------------------
--  DDL for Procedure HNS_WRITEOFF_PYMT_RPT_CALC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_WRITEOFF_PYMT_RPT_CALC" IS
--reads data from hns_reverse_writeoff_rpt and hns_writeoff_rpt
--populates hns_writeoff_pymt_rpt

     account_poid  INTEGER;
     min_writeoff_t INTEGER := 0;
     max_reverse_writeoff_t INTEGER := 0;

     CURSOR pymt_cur  IS
     select  account_obj_id0, max(i_effective_t) max_rev_writeoff_t
     from hns_reverse_writeoff_rpt
     group by account_obj_id0;

BEGIN

    DBMS_OUTPUT.PUT_LINE('HNS_WRITEOFF_PYMT_RPT_CALC ' || sysdate);
    DBMS_OUTPUT.PUT_LINE('---------------------------------');

    -- find the buckets for the account
    FOR account_poid_list in pymt_cur
    LOOP
        --DBMS_OUTPUT.PUT_LINE('###################################');
        account_poid := account_poid_list.account_obj_id0;
        max_reverse_writeoff_t := account_poid_list.max_rev_writeoff_t;

        DBMS_OUTPUT.PUT_LINE('account_obj_id0 ' || account_poid);
        DBMS_OUTPUT.PUT_LINE('max_reverse_writeoff_t ' || max_reverse_writeoff_t);

        select max(min_eff_t) into min_writeoff_t
        from
        (select min(r.I_EFFECTIVE_T) min_eff_t
        from   hns_writeoff_rpt r
        where r.account_obj_id0 = account_poid
        group by r.account_obj_id0
        union
        select 0 min_eff_t from dual);

        DBMS_OUTPUT.PUT_LINE('min_writeoff_t ' || min_writeoff_t);
        --DBMS_OUTPUT.PUT_LINE('Inserting data into REPORT_WRITEOFF');
        IF ((min_writeoff_t <> 0) and (max_reverse_writeoff_t <> 0)) THEN

        DBMS_OUTPUT.PUT_LINE('Inserting data into HNS_WRITEOFF_PYMT_RPT -- INSIDE IF');
        insert into pin.HNS_WRITEOFF_PYMT_RPT
        (
        I_POID ,
        I_POID_TYPE ,
        ACCOUNT_OBJ_ID0 ,
        ADJUSTED ,
        DISPUTED ,
        DUE ,
        I_EFFECTIVE_T ,
        ITEM_NO ,
        ITEM_TOTAL ,
        RECVD ,
        STATUS ,
        TRANSFERED ,
        WRITEOFF ,
        BILLINFO_OBJ_ID0,
        AR_BILLINFO_OBJ_ID0
        )
        select  i.poid_id0, i.poid_type, i.account_obj_id0, i.adjusted, i.disputed, i.due, i.effective_t,
            i.item_no, i.item_total, i.recvd, i.status, i.transfered, i.writeoff, i.billinfo_obj_id0,
            i.ar_billinfo_obj_id0
        from  item_t i
        where i.POID_TYPE = '/item/payment'
        and i.effective_t > min_writeoff_t
        and i.effective_t < max_reverse_writeoff_t
        and i.account_obj_id0  = account_poid;

        commit;

        END IF;

    END LOOP; -- for each account

    DBMS_OUTPUT.PUT_LINE('---------------------------------');
    DBMS_OUTPUT.PUT_LINE('Ending HNS_WRITEOFF_PYMT_RPT_CALC ' || sysdate);

END; -- Procedure HNS_WRITEOFF_PYMT_RPT_CALC

/
--------------------------------------------------------
--  DDL for Procedure HNS_WRITEOFF_RPT_CALC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."HNS_WRITEOFF_RPT_CALC" IS
--reads data from hns_reverse_writeoff_rpt
--populates hns_writeoff_rpt
----------------------------------------------------
--QUERY TO POPULATE DATA IN HNS_REVERSE_WRITEOFF_RPT
----------------------------------------------------
--create table HNS_REVERSE_WRITEOFF_RPT
--as
--select to_char(e.poid_id0) EVENT_POID, e.end_t E_END_T, e.descr E_DESCR, e.program_name PROGRAM_NAME,
--    i.poid_id0 I_POID, i.POID_TYPE, i.account_obj_id0, i.adjusted, i.disputed, i.due, i.effective_t I_EFFECTIVE_T, i.item_no,
--    i.item_total, i.RECVD, i.STATUS, i.transfered, i.writeoff, i.billinfo_obj_id0, i.ar_billinfo_obj_id0
--from event_t e, item_t i
--where e.ITEM_OBJ_ID0 = i.POID_ID0
--and e.POID_TYPE = '/event/billing/adjustment/account'
--and e.end_t >= d2u('MM/DD/YYYY')
--and e.end_t < d2u('MM/DD/YYYY2011')
--and upper(e.descr) LIKE '%REVERSE%WRITE%'
----------------------------------------------------
     ar_billinfo_poid  INTEGER;
     max_effective_t INTEGER := 0;

     CURSOR writeoff_cur  IS
     select distinct ar_billinfo_obj_id0
     from hns_reverse_writeoff_rpt r;

BEGIN
    DBMS_OUTPUT.PUT_LINE('HNS_WRITEOFF_RPT_CALC ' || sysdate);
    DBMS_OUTPUT.PUT_LINE('---------------------------------');
    -- find the buckets for the account
    FOR ar_billinfo_list in writeoff_cur
    LOOP
        --DBMS_OUTPUT.PUT_LINE('###################################');
        ar_billinfo_poid := ar_billinfo_list.ar_billinfo_obj_id0;

        DBMS_OUTPUT.PUT_LINE('ar_billinfo_obj_id0 ' || ar_billinfo_poid);
        max_effective_t := 0;

        select max(max_eff_t) into max_effective_t
        from
        (select max(i.EFFECTIVE_T) max_eff_t
        from   item_t i, hns_reverse_writeoff_rpt rw, event_t e
        where  i.ar_billinfo_obj_id0 = ar_billinfo_poid
        and    i.ar_billinfo_obj_id0 = rw.ar_billinfo_obj_id0
        and i.poid_id0 = e.ITEM_OBJ_ID0
        and    rw.I_EFFECTIVE_T > i.effective_t
        and    (i.poid_type = '/item/writeoff' or (lower(e.descr) like '%write%off%')and (lower(e.descr) not like '%re%write%off%'))
        and not exists (select 1 from hns_reverse_writeoff_rpt rw where i.poid_id0 = rw.i_poid)
        group by i.account_obj_id0
        union
        select 0 max_eff_t from dual);

        DBMS_OUTPUT.PUT_LINE('max_effective_t ' || max_effective_t);
        --DBMS_OUTPUT.PUT_LINE('Inserting data into HNS_WRITEOFF_RPT');
        IF (max_effective_t <> 0) THEN
        DBMS_OUTPUT.PUT_LINE('Inserting data into HNS_WRITEOFF_RPT -- INSIDE IF');
        insert into pin.HNS_WRITEOFF_RPT
        (
        I_POID ,
        I_POID_TYPE ,
        ACCOUNT_OBJ_ID0 ,
        ADJUSTED ,
        DISPUTED ,
        DUE ,
        I_EFFECTIVE_T ,
        ITEM_NO ,
        ITEM_TOTAL ,
        RECVD ,
        STATUS ,
        TRANSFERED ,
        WRITEOFF ,
        BILLINFO_OBJ_ID0,
        AR_BILLINFO_OBJ_ID0
        )
        --select to_char(e.poid_id0) event_poid,e.end_t , e.DESCR, e.PROGRAM_NAME,
        select distinct
            i.poid_id0, i.poid_type, i.account_obj_id0, i.adjusted, i.disputed, i.due, i.effective_t,
            i.item_no, i.item_total, i.recvd, i.status, i.transfered, i.writeoff, i.billinfo_obj_id0,
            i.ar_billinfo_obj_id0
        from  item_t i, event_t e
        where e.ITEM_OBJ_ID0 = i.POID_ID0
        --and (e.POID_TYPE = '/event/billing/writeoff/account' or lower(e.descr) like '%rite%ff%')
        and (e.POID_TYPE like ('/event/billing/writeoff%') or lower(e.descr) like '%rite%ff%')
        --and (i.POID_TYPE = '/item/writeoff' or lower(e.descr) like '%rite%ff%')
        and i.effective_t = max_effective_t
        and i.ar_billinfo_obj_id0  = ar_billinfo_poid;

        commit;

        END IF;

    END LOOP; -- for each account

    DBMS_OUTPUT.PUT_LINE('---------------------------------');
    DBMS_OUTPUT.PUT_LINE('Ending HNS_WRITEOFF_RPT_CALC ' || sysdate);

END; -- Procedure HNS_WRITEOFF_RPT_CALC

/
--------------------------------------------------------
--  DDL for Procedure IDENTIFYBADCONINVOICES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."IDENTIFYBADCONINVOICES" IS
   BEGIN

-- If the invoice accounts or their GL segments are configured in HNS_INVOICE_PRINT_EXCLUSION table, and then marks all such invoices with PRINTDONE as 99

   DBMS_OUTPUT.PUT_LINE('Updating PRINTDONE to 99');

   UPDATE HNS_INVOICES HI SET HI.PRINTDONE = 99
   WHERE HI.PRINTDONE = 0 AND
   EXISTS (SELECT 1 FROM HNS_INVOICE_PRINT_EXCLUSION IPE WHERE IPE.FIELD_VALUE = HI.ACCOUNT_NUMBER
   OR IPE.FIELD_VALUE = HI.GL_SEGMENT OR IPE.FIELD_VALUE = HI.INVOICE_NUMBER);

   -- If NEP account is cc or dd type then marks all such invoices with PRINTDONE as 55

   DBMS_OUTPUT.PUT_LINE('Updating PRINTDONE to 55');

   UPDATE HNS_INVOICES HI SET HI.PRINTDONE = 55
    WHERE HI.PRINTDONE = 0 and HI.BILLTYPE NOT IN ('10001');
-- If the invoice has no transactions on it, then marks all such invoices with PRINTDONE as 77

   DBMS_OUTPUT.PUT_LINE('Updating PRINTDONE to 77');

   UPDATE HNS_INVOICES HI SET HI.PRINTDONE =77
   WHERE HI.PRINTDONE = 0 AND
   HI.PREV_BALANCE =0 AND
   HI.CURRENT_CHARGES = 0 AND
   HI.TOTAL_ADJUSTMENT = 0 AND
   HI.AMOUNT_DUE =0 AND
   HI.TOTAL_PAYMENT = 0;

-- If the invoice is a bill now invoice with no new charges, then marks all such invoices with PRINTDONE as 66

   DBMS_OUTPUT.PUT_LINE('Updating PRINTDONE to 66');

   UPDATE HNS_INVOICES HI SET HI.PRINTDONE =66
   WHERE HI.PRINTDONE = 0 AND
   HI.TOTAL_NO_OF_EVENT_CHARGES = 0 AND
   HI.CURRENT_CHARGES = 0 AND
   EXISTS (select 1 from bill_t b where b.BILL_NO = HI.INVOICE_NUMBER and a2p(HI.ACCOUNT_NUMBER) = B.ACCOUNT_OBJ_ID0 AND B.NAME != 'PIN Bill');

-- If the invoice is of a closed account which is in write off or writeoff paid state and bill date is past collections date, then marks all such invoices with PRINTDONE as 88

   DBMS_OUTPUT.PUT_LINE('Updating PRINTDONE to 88');

   UPDATE HNS_INVOICES HI SET HI.PRINTDONE = 88
   WHERE
   HI.PRINTDONE = 0
   AND EXISTS (SELECT 1 FROM HNS_DELINQUENCY_T D, ACCOUNT_T A
   WHERE HI.ACCOUNT_NUMBER = D.ACCOUNT_NO
   AND HI.ACCOUNT_NUMBER = A.ACCOUNT_NO
   AND HI.BILL_END >= u2d(D.LAST_STATE_CHANGE_T)
   AND D.COLLECTION_STATE IN (4,6,7)
   AND A.STATUS = 10103);

-- If ADDRESS field in HNS_INVOICES table has substring 'bad address' in it (with case insensitive), then such invoices are marked with PRINTDONE as 20.

   DBMS_OUTPUT.PUT_LINE('Updating PRINTDONE to 20');

   UPDATE HNS_INVOICES HI SET HI.PRINTDONE = 20
   WHERE HI.PRINTDONE = 0 AND
   LOWER(HI.ADDRESS) LIKE '%bad address%'AND
   NOT EXISTS (SELECT 1 FROM HNS_INVOICE_PRINT_EXCLUSION IPE WHERE IPE.FIELD_VALUE = HI.ACCOUNT_NUMBER
   OR IPE.FIELD_VALUE = HI.GL_SEGMENT OR IPE.FIELD_VALUE = HI.INVOICE_NUMBER);

-- If ADDRESS field in HNS_INVOICES table has length greater than 40, then such invoices are marked with PRINTDONE as 40.

   DBMS_OUTPUT.PUT_LINE('Updating PRINTDONE to 40');

   UPDATE HNS_INVOICES HI SET HI.PRINTDONE = 40
   WHERE HI.PRINTDONE = 0 AND
   LENGTH(HI.ADDRESS) > 40 AND
   STATE != 'PR' AND
   LOWER (HI.ADDRESS) NOT LIKE '%bad address%'AND
   NOT EXISTS (SELECT 1 FROM HNS_INVOICE_PRINT_EXCLUSION IPE WHERE IPE.FIELD_VALUE = HI.ACCOUNT_NUMBER
   OR IPE.FIELD_VALUE = HI.GL_SEGMENT OR IPE.FIELD_VALUE = HI.INVOICE_NUMBER);


-- If accounts with the invoices having PRINTDONE  as 40 and are not using payment type as Invoice, then such invoices are marked with PRINTDONE as 45.

   DBMS_OUTPUT.PUT_LINE('Updating PRINTDONE to 45');

   UPDATE HNS_INVOICES HIU SET HIU.PRINTDONE = 45
   WHERE HIU.PRINTDONE = 40 AND EXISTS
   (SELECT 1 FROM HNS_INVOICES HI, BILLINFO_T BI
   WHERE HI.INVOICE_NUMBER = HIU.INVOICE_NUMBER AND
   HI.PRINTDONE = 40 AND
   A2P(HI.ACCOUNT_NUMBER) = BI.ACCOUNT_OBJ_ID0 AND
   BI.PAY_TYPE != 10001 AND
   EXISTS (SELECT 1 FROM BILLINFO_T LBI WHERE A2P(HI.ACCOUNT_NUMBER)=   LBI.ACCOUNT_OBJ_ID0 AND U2D(LBI.LAST_BILL_T) = HI.BILL_END));


-- If accounts with the invoices having PRINTDONE as 40 and are not latest invoice for an account, then such invoices are marked with PRINTDONE as 49.

  DBMS_OUTPUT.PUT_LINE('Updating PRINTDONE to 49');


  UPDATE HNS_INVOICES HIU SET HIU.PRINTDONE = 49
   WHERE HIU.PRINTDONE = 40 AND EXISTS
   (SELECT 1 FROM HNS_INVOICES HI, BILLINFO_T BI, PAYINFO_INV_T PIV
   WHERE HI.INVOICE_NUMBER = HIU.INVOICE_NUMBER AND
   HI.PRINTDONE = 40 AND
   A2P (HI.ACCOUNT_NUMBER) = BI.ACCOUNT_OBJ_ID0 AND
   BI.PAYINFO_OBJ_ID0 = PIV.OBJ_ID0 AND
   BI.PAYINFO_OBJ_TYPE = '/payinfo/invoice' AND
   NOT EXISTS (SELECT 1 FROM BILLINFO_T LBI WHERE A2P    (HI.ACCOUNT_NUMBER) = LBI.ACCOUNT_OBJ_ID0 AND U2D(LBI.LAST_BILL_T) = HI.BILL_END));


-- IF PRINTDONE is 40, the address has been fixed, the pay type is invoice, and the invoice is the last bill date update the address to the current and set PRINTDONE to 0.

   DBMS_OUTPUT.PUT_LINE('Updating PRINTDONE to 0');

   UPDATE HNS_INVOICES HIU
   SET HIU.PRINTDONE = 0, HIU.ADDRESS =
    (SELECT PU.ADDRESS FROM BILLINFO_T BIA, PAYINFO_INV_T PU, BILL_T B
     WHERE A2P(HIU.ACCOUNT_NUMBER) = BIA.ACCOUNT_OBJ_ID0
     AND B.BILL_NO = HIU.INVOICE_NUMBER
     AND B.BILLINFO_OBJ_ID0 = BIA.POID_ID0
     AND BIA.PAYINFO_OBJ_ID0 = PU.OBJ_ID0)
    WHERE HIU.PRINTDONE = 40
    AND EXISTS
    (SELECT HI.INVOICE_NUMBER FROM HNS_INVOICES HI, BILLINFO_T BI, PAYINFO_INV_T PIV
     WHERE HI.INVOICE_NUMBER = HIU.INVOICE_NUMBER
     AND HI.PRINTDONE = 40
     AND A2P(HI.ACCOUNT_NUMBER) = BI.ACCOUNT_OBJ_ID0
     AND BI.PAYINFO_OBJ_ID0 = PIV.OBJ_ID0
     AND BI.PAYINFO_OBJ_TYPE = '/payinfo/invoice' AND LENGTH (PIV.ADDRESS) < 41
     AND EXISTS
        (SELECT 1 FROM BILLINFO_T LBI WHERE A2P(HI.ACCOUNT_NUMBER) = LBI.ACCOUNT_OBJ_ID0 AND U2D (LBI.LAST_BILL_T) = HI.BILL_END)
    );

-- IF PRINTDONE is 0 and there is only an invoice charge on the invoice, set PRINTDONE to 50.

   DBMS_OUTPUT.PUT_LINE('Updating PRINTDONE to 50');

    update hns_invoices hi
      set HI.PRINTDONE = 50
    where HI.INVOICE_PULLED > (select trunc(add_months(sysdate,-1)) from dual) and
      HI.PRINTDONE = 0 and
      HI.TOTAL_SERVICE_CHARGE = 5 and
      HI.TOTAL_SERVICE_CHARGE = HI.MONTHLY_CHARGES and
      HI.TOTAL_SERVICE_CHARGE = HI.CURRENT_CHARGES and
      HI.TOTAL_ADJUSTMENT = 0 and
      HI.TOTAL_TNM_CHARGE = 0 and
      HI.TOTAL_SPONSORED_CHARGE = 0 and
      HI.TOTAL_NO_OF_EVENT_CHARGES = 1 and
    not exists(select 1 from service_t s where a2p(HI.ACCOUNT_NUMBER) = S.ACCOUNT_OBJ_ID0 and S.STATUS != 10103) and
    not exists (select 1 from group_t g, group_billing_members_t gbm where a2p(HI.ACCOUNT_NUMBER) = G.ACCOUNT_OBJ_ID0 and
      G.POID_ID0 = GBM.OBJ_ID0 and not exists
    (select 1 from service_t cs where CS.ACCOUNT_OBJ_ID0 = GBM.OBJECT_ID0 and CS.STATUS != 10103));

    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001,'No Data found - '||SQLCODE||' -ERROR- '||SQLERRM);
    WHEN OTHERS THEN
        raise_application_error(-20002,'Unknown Error - '||SQLCODE||' -ERROR- '||SQLERRM);

   END;

/
--------------------------------------------------------
--  DDL for Procedure INITIALIZE_GL_SEGMENTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."INITIALIZE_GL_SEGMENTS" (
	poid_id0	INTEGER,
	gl_segment	VARCHAR2 ) AS

	rec_id		INTEGER := 0;

	CURSOR c1(c_gl_segment VARCHAR2) IS
		SELECT
			segment_name
		FROM
			config_gl_segment_t
		START WITH
			segment_name = c_gl_segment
		CONNECT BY
			PRIOR segment_name = parent_segment AND
			roll_up = 'Y';

BEGIN
	FOR r IN c1(gl_segment) LOOP

		rec_id := rec_id + 1;

		INSERT INTO ledger_report_gl_segments_t (
			obj_id0,
			rec_id,
			gl_segment)
		VALUES (
			poid_id0,
			rec_id,
			r.segment_name);
	END LOOP;

END initialize_gl_segments;

/
--------------------------------------------------------
--  DDL for Procedure INITIATE_LEDGER_FOR_ACCT_GRPS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."INITIATE_LEDGER_FOR_ACCT_GRPS" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
38e 21f
BowMQDYP48Iquotd/ECIVXAAF7wwg/AJryfhf46KKjoYcZ7VTBqeQacc4JtxXp+3Q3krHj7j
DWaJYVS1TxttPYrFY7DIOGUgyYfFIeGR1t0zLPiGPxBoRf7NHkgSuCBPW8QZfkpIv86S3BaT
V7IMB8n6nsitDoRNdKPGAnzwYdGA68MNA/5B4OqUdARDKmxC7ieFDFCnVlcYrcZSZUFZOYhs
55lQslPdG/K6peViaPwzabPKrG/VF/UtGKWDm2cb8zajnzcJ3rth37IYVMJdlsRwewJx3qrx
q54v3xjIwo/FAbBrPvaAY1/x4p2JOnjMy6tdLoAWy7Usr0qDdC6hRfZLiVbBqWfFjBpem/cA
LU6XQMmSdktfQAJ0x0vR9dMfaUntN1Le+W/MWxeIsoViU0q3XSf8MjRN50+guumO0pa2eYCc
zD8X7kkjzZlvQETYgQXDJbrNnMlWlv8keFZoQeObRpJvEt0d/XMrEJe/Ct7UDX6MvapORsxg
7aTooMLF5X7JSw19lQp7mPj7EbMzsw==

/
--------------------------------------------------------
--  DDL for Procedure INITIATE_LEDGER_FOR_REP_OBJECT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."INITIATE_LEDGER_FOR_REP_OBJECT" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
445 233
Co+eZ/fG72nlWYoaGvkez9rS49kwgztemvYVfC8Z9pLqaNnd5vMQ/fXL4BKf93WJIVWLh0pz
fUALR6j5tVazJwoTMwE3p4vA/hCaEL6LYEl1pzk4CA1UlkE8lBArZLs9GBmn1aNcmqDP+U2H
PO2pVfcVEmWSHBToiKtldfYL+odFdZDBBMKpH/sTCFu/w30lFIVGwn3ACx9v/NClBIJrrKn0
vdIzNnNZua+k0XHQcOcOsm5HBK+URvt32RlRngTZkSSEDEFTOyYR82xjf03xrd5swfOgKkVM
ChZfxKnmvdVTjtBa3OY3MXSNee+LoxoUJTX1FmH/0nxNCS+3UwresQm0/BR/hWIldybMcWGX
dnZ5UgE30cQd9edoCHi9eqF+NeVus6L9l1/Rx1M3NefL5ckX+QjJkoQGQHHw0ZgFM1/NEDi+
sfNCEdRKe+P/9p7tD7yVuTW9v5fu25Jy1oOIwxHkgXbkiKQzis1XnwaFQckjP62/iqVrpMGL
vkAJY4nzzr8E+IVI3xOoVc9+QLzecpoYhqgAQeDghm0s9lcfCg==

/
--------------------------------------------------------
--  DDL for Procedure INSERT_ENT_DESC_MAP_MULTIPLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."INSERT_ENT_DESC_MAP_MULTIPLE" 
AS
    offer_id       ent_descriptor_mapping_t.node_obj_id0%TYPE;
    deal_id       ent_descriptor_mapping_t.deal_obj_id0%TYPE;
    account_id       ent_descriptor_mapping_t.account_obj_id0%TYPE;
    node_loc       ent_descriptor_mapping_t.node_location%TYPE;

    TYPE NODE_LOC_ARR IS TABLE OF ent_descriptor_mapping_t.NODE_LOCATION%TYPE;
    TYPE NODE_OBJ_ID0_ARR IS TABLE OF purchased_product_t.POID_ID0%TYPE;
    TYPE PACKAGE_ID_ARR IS TABLE OF ent_descriptor_mapping_t.PACKAGE_ID%TYPE;

    node_locs NODE_LOC_ARR;
    node_objs NODE_OBJ_ID0_ARR;
    package_ids PACKAGE_ID_ARR;

    loop_id        INTEGER;
    loop_id1        INTEGER;

    CURSOR get_ent_desc_map_cur
    IS
        SELECT
        order_id, account_obj_id0, deal_obj_id0, deal_type, wbs_num, product_no, invoice_descriptor,
        current_group_count, total_group_count, purchase_t, cancel_t, bundling_id, node_location,
        po_order_no, cust_invoice_id, unit_used, service_order_no, invoice_id, service_category_name
        FROM ent_descriptor_mapping_t edm
        WHERE EXISTS (select 1 from deal_products_t d
                    where d.obj_id0 = edm.deal_obj_id0 having count(*) > 1);
    BEGIN
        Insert Into Ebi_Audit (Total_Count, Ot_Count, proc_name,Start_T,High_Val) Values (0, 0,'insert_ent_desc_map_multiple:START',Sysdate,null);
        Insert Into Ebi_Audit (Total_Count, Ot_Count, proc_name,Start_T,High_Val) Values (0, 0,'insert_ent_desc_map_multiple1:START',Sysdate,null);
        COMMIT;
        loop_id := 1;
        loop_id1 := 1;
        FOR ent_desc_map_rec IN get_ent_desc_map_cur
        LOOP
            deal_id     := ent_desc_map_rec.deal_obj_id0;
            account_id  := ent_desc_map_rec.account_obj_id0;
            node_loc    := ent_desc_map_rec.node_location;

            BEGIN
                select poid_id0, package_id, node_location
                BULK COLLECT INTO
                NODE_OBJS, PACKAGE_IDS, NODE_LOCS
                from purchased_product_t pp1
                    where account_obj_id0 = account_id
                    and deal_obj_id0 = deal_id
                    and node_location != node_loc;

                FOR i in NODE_OBJS.first..NODE_OBJS.last
                LOOP
                    INSERT into ent_descriptor_mapping_t (
                        descriptor_id, order_id, account_obj_id0, deal_obj_id0, deal_type, wbs_num, product_no, invoice_descriptor,
                        current_group_count, total_group_count, purchase_t, cancel_t, bundling_id, node_location,
                        po_order_no, cust_invoice_id, unit_used, service_order_no, invoice_id, service_category_name, node_obj_id0, package_id
                    ) VALUES (
                        (ENT_DESCRIPTOR_MAPPING_T_SEQ.nextval), ent_desc_map_rec.order_id, account_id, deal_id, ent_desc_map_rec.deal_type,
                        ent_desc_map_rec.wbs_num, ent_desc_map_rec.product_no, ent_desc_map_rec.invoice_descriptor,
                        ent_desc_map_rec.current_group_count, ent_desc_map_rec.total_group_count, ent_desc_map_rec.purchase_t,
                        ent_desc_map_rec.cancel_t, ent_desc_map_rec.bundling_id, NODE_LOCS(i), ent_desc_map_rec.po_order_no,
                        ent_desc_map_rec.cust_invoice_id, ent_desc_map_rec.unit_used, ent_desc_map_rec.service_order_no,
                        ent_desc_map_rec.invoice_id, ent_desc_map_rec.service_category_name, NODE_OBJS(i), PACKAGE_IDS(i)
                    );
                loop_id1 := loop_id1 + 1;
                END LOOP;

                IF MOD (loop_id, 500) = 0
                THEN
                    update ebi_audit set total_count = loop_id, end_t = sysdate where proc_name = 'insert_ent_desc_map_multiple:START';
                    update ebi_audit set total_count = loop_id1, end_t = sysdate where proc_name = 'insert_ent_desc_map_multiple1:START';
                    COMMIT;
                END IF;

                IF NODE_OBJS.count > 0
                THEN
                    loop_id := loop_id + 1;
                END IF;
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                loop_id := loop_id;
            WHEN OTHERS THEN
                loop_id := loop_id;
            END;
        END LOOP;
        update ebi_audit set total_count = loop_id, end_t = sysdate, proc_name = 'insert_ent_desc_map_multiple:DONE' where proc_name = 'insert_ent_desc_map_multiple:START';
        update ebi_audit set total_count = loop_id1, end_t = sysdate, proc_name = 'insert_ent_desc_map_multiple1:DONE' where proc_name = 'insert_ent_desc_map_multiple1:START';
    COMMIT;
END insert_ent_desc_map_multiple;

/
--------------------------------------------------------
--  DDL for Procedure INSERT_ENT_DESC_MAP_MULT_GG
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."INSERT_ENT_DESC_MAP_MULT_GG" 
AS
    offer_id       ent_descriptor_mapping_t.node_obj_id0%TYPE;
    deal_id       ent_descriptor_mapping_t.deal_obj_id0%TYPE;
    account_id       ent_descriptor_mapping_t.account_obj_id0%TYPE;
    node_loc       ent_descriptor_mapping_t.node_location%TYPE;

    TYPE NODE_LOC_ARR IS TABLE OF ent_descriptor_mapping_t.NODE_LOCATION%TYPE;
    TYPE NODE_OBJ_ID0_ARR IS TABLE OF purchased_product_t.POID_ID0%TYPE;
    TYPE PACKAGE_ID_ARR IS TABLE OF ent_descriptor_mapping_t.PACKAGE_ID%TYPE;

    node_locs NODE_LOC_ARR;
    node_objs NODE_OBJ_ID0_ARR;
    package_ids PACKAGE_ID_ARR;

    loop_id        INTEGER;
    loop_id1        INTEGER;

    CURSOR get_ent_desc_map_cur
    IS
        SELECT
        order_id, account_obj_id0, deal_obj_id0, deal_type, wbs_num, product_no, invoice_descriptor,
        current_group_count, total_group_count, purchase_t, cancel_t, bundling_id, node_location,
        po_order_no, cust_invoice_id, unit_used, service_order_no, invoice_id, service_category_name
        From Ent_Descriptor_Mapping_T Edm
        Where descriptor_id >= 1822169
        and  EXISTS (select 1 from deal_products_t d
                    where d.obj_id0 = edm.deal_obj_id0 having count(*) > 1);
    BEGIN
        Insert Into Ebi_Audit (Total_Count, Ot_Count, proc_name,Start_T,High_Val) Values (0, 0,'insert_ent_desc_map_multiple:START',Sysdate,null);
        Insert Into Ebi_Audit (Total_Count, Ot_Count, proc_name,Start_T,High_Val) Values (0, 0,'insert_ent_desc_map_multiple1:START',Sysdate,null);
        COMMIT;
        loop_id := 1;
        loop_id1 := 1;
        FOR ent_desc_map_rec IN get_ent_desc_map_cur
        LOOP
            deal_id     := ent_desc_map_rec.deal_obj_id0;
            account_id  := ent_desc_map_rec.account_obj_id0;
            node_loc    := ent_desc_map_rec.node_location;

            BEGIN
                select poid_id0, package_id, node_location
                BULK COLLECT INTO
                NODE_OBJS, PACKAGE_IDS, NODE_LOCS
                from purchased_product_t pp1
                    where account_obj_id0 = account_id
                    and deal_obj_id0 = deal_id
                    and node_location != node_loc;

                FOR i in NODE_OBJS.first..NODE_OBJS.last
                LOOP
                    INSERT into ent_descriptor_mapping_t (
                        descriptor_id, order_id, account_obj_id0, deal_obj_id0, deal_type, wbs_num, product_no, invoice_descriptor,
                        current_group_count, total_group_count, purchase_t, cancel_t, bundling_id, node_location,
                        po_order_no, cust_invoice_id, unit_used, service_order_no, invoice_id, service_category_name, node_obj_id0, package_id
                    ) VALUES (
                        (ENT_DESCRIPTOR_MAPPING_T_SEQ.nextval), ent_desc_map_rec.order_id, account_id, deal_id, ent_desc_map_rec.deal_type,
                        ent_desc_map_rec.wbs_num, ent_desc_map_rec.product_no, ent_desc_map_rec.invoice_descriptor,
                        ent_desc_map_rec.current_group_count, ent_desc_map_rec.total_group_count, ent_desc_map_rec.purchase_t,
                        ent_desc_map_rec.cancel_t, ent_desc_map_rec.bundling_id, NODE_LOCS(i), ent_desc_map_rec.po_order_no,
                        ent_desc_map_rec.cust_invoice_id, ent_desc_map_rec.unit_used, ent_desc_map_rec.service_order_no,
                        ent_desc_map_rec.invoice_id, ent_desc_map_rec.service_category_name, NODE_OBJS(i), PACKAGE_IDS(i)
                    );
                loop_id1 := loop_id1 + 1;
                END LOOP;

                IF MOD (loop_id, 500) = 0
                THEN
                    update ebi_audit set total_count = loop_id, end_t = sysdate where proc_name = 'insert_ent_desc_map_multiple:START';
                    update ebi_audit set total_count = loop_id1, end_t = sysdate where proc_name = 'insert_ent_desc_map_multiple1:START';
                    COMMIT;
                END IF;

                IF NODE_OBJS.count > 0
                THEN
                    loop_id := loop_id + 1;
                END IF;
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                loop_id := loop_id;
            WHEN OTHERS THEN
                loop_id := loop_id;
            END;
        END LOOP;
        update ebi_audit set total_count = loop_id, end_t = sysdate, proc_name = 'insert_ent_desc_map_multiple:DONE' where proc_name = 'insert_ent_desc_map_multiple:START';
        update ebi_audit set total_count = loop_id1, end_t = sysdate, proc_name = 'insert_ent_desc_map_multiple1:DONE' where proc_name = 'insert_ent_desc_map_multiple1:START';
    Commit;
End Insert_Ent_Desc_Map_Mult_Gg;

/
--------------------------------------------------------
--  DDL for Procedure INSERT_GROUP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."INSERT_GROUP" (
	poid_id0		INTEGER,
	rec_id			INTEGER,
	beg_ar_account		INTEGER,
	end_ar_account		INTEGER,
	grp_status		INTEGER) AS
BEGIN
	INSERT	INTO ledger_report_account_groups_t(
		obj_id0, rec_id, beg_acct, end_acct, grp_stat)
	VALUES (poid_id0, rec_id, beg_ar_account, end_ar_account, grp_status);

END insert_group;

/
--------------------------------------------------------
--  DDL for Procedure LEDGER_INSERT_ROWS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."LEDGER_INSERT_ROWS" (
	detail IN INTEGER,
	obj_id0 IN INTEGER,
	elem_id IN INTEGER,
	gl_type IN INTEGER,
	config_poid_id0 IN INTEGER,
	account_obj IN INTEGER,
	item_obj IN INTEGER,
	resource_id IN INTEGER,
	gl_id IN INTEGER,
	db_ar_gross_amt IN REAL,
	cr_ar_gross_amt IN REAL,
	db_ar_disc_amt IN REAL,
	cr_ar_disc_amt IN REAL,
	db_ar_tax_amt IN REAL,
	cr_ar_tax_amt IN REAL) AS

	ar_gross_acct		VARCHAR2(255) := '-- N/A --';
	off_gross_acct		VARCHAR2(255) := '-- N/A --';
	ar_net_acct		VARCHAR2(255) := '-- N/A --';
	off_net_acct		VARCHAR2(255) := '-- N/A --';
	ar_disc_acct		VARCHAR2(255) := '-- N/A --';
	off_disc_acct		VARCHAR2(255) := '-- N/A --';
	ar_tax_acct		VARCHAR2(255) := '-- N/A --';
	off_tax_acct		VARCHAR2(255) := '-- N/A --';
	item_name		VARCHAR2(255);
	bill_no			VARCHAR2(255);
	item_no			VARCHAR2(255);
	account_no		VARCHAR2(255);
	effective_t		INTEGER;
	rec_id			INTEGER;

	db_off_gross_amt	REAL;
	cr_off_gross_amt	REAL;
	db_off_net_amt		REAL;
	cr_off_net_amt		REAL;
	db_off_disc_amt		REAL;
	cr_off_disc_amt		REAL;
	db_off_tax_amt		REAL;
	cr_off_tax_amt		REAL;

	db_ar_net_amt		REAL := 0;
	cr_ar_net_amt		REAL := 0;
	tmp_net_amt		REAL := 0;

	CURSOR acct_names (c_obj_id0 INTEGER, c_gl_id INTEGER,
		c_gl_type INTEGER) IS

		SELECT	/*+ index(config_glid_accts_t i_config_glid_accts__id)*/
			gl_ar_acct,
			gl_offset_acct,
			attribute
		FROM
			config_glid_accts_t
		WHERE
			obj_id0 = acct_names.c_obj_id0 AND
			rec_id2 = acct_names.c_gl_id AND
			type	= acct_names.c_gl_type;


BEGIN
	----------------------------------------------------
	-- Initialize the variables.
	----------------------------------------------------
	rec_id 	:= elem_id;

	FOR r IN acct_names(config_poid_id0, gl_id, gl_type) LOOP

		if r.attribute = 8 THEN
			ar_gross_acct := r.gl_ar_acct;
			off_gross_acct := r.gl_offset_acct;
		ELSIF r.attribute = 1 THEN
			ar_net_acct := r.gl_ar_acct;
			off_net_acct := r.gl_offset_acct;
		ELSIF r.attribute = 2 THEN
			ar_disc_acct := r.gl_ar_acct;
			off_disc_acct := r.gl_offset_acct;
		ELSE
			ar_tax_acct := r.gl_ar_acct;
			off_tax_acct := r.gl_offset_acct;
		END IF;
	END LOOP;

	IF detail = 1 THEN
		----------------------------------------------------
		-- Get the item and bill details
		----------------------------------------------------
		BEGIN
			SELECT
				i.name,
				NVL(i.effective_t, 0),
				NVL(i.item_no, '-- N/A --'),
				a.account_no
			INTO
				item_name,
				effective_t,
				item_no,
				account_no
			FROM
				item_t i,
				account_t a
			WHERE
				i.poid_id0 = item_obj and
				a.poid_id0 = account_obj and
				i.poid_db IS NOT NULL;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					item_no := '-- N/A --';
		END;

		BEGIN
                       	SELECT
				NVL(bill_no, '-- N/A --')
			INTO
				bill_no
			FROM
				bill_t
			WHERE
				account_obj_id0 = account_obj AND
				end_t = effective_t and
				poid_db IS NOT NULL;
			EXCEPTION
				WHEN NO_DATA_FOUND THEN
					bill_no := '-- N/A --';
				WHEN TOO_MANY_ROWS THEN
					bill_no := '-- N/A --';
		END;

	END IF;

        /* calculate the net amounts*/
        db_ar_net_amt := (db_ar_gross_amt - db_ar_disc_amt);
        cr_ar_net_amt := (cr_ar_gross_amt - cr_ar_disc_amt);

        /** if both debit net and credit net are negative then swap **/
        IF (db_ar_net_amt < 0 and cr_ar_net_amt < 0) THEN
                tmp_net_amt := ABS(cr_ar_net_amt);
                cr_ar_net_amt := ABS(db_ar_net_amt);
                db_ar_net_amt := tmp_net_amt;
        ELSIF (db_ar_net_amt < 0) THEN
                cr_ar_net_amt := cr_ar_net_amt + ABS(db_ar_net_amt);
                db_ar_net_amt := 0;
        ELSIF (cr_ar_net_amt < 0) THEN
                db_ar_net_amt := db_ar_net_amt + ABS(cr_ar_net_amt);
                cr_ar_net_amt := 0;
        END IF;

	db_off_gross_amt := cr_ar_gross_amt;
	cr_off_gross_amt := db_ar_gross_amt;
	db_off_net_amt := cr_ar_net_amt;
	cr_off_net_amt := db_ar_net_amt;
	db_off_disc_amt := cr_ar_disc_amt;
	cr_off_disc_amt := db_ar_disc_amt;
	db_off_tax_amt := cr_ar_tax_amt;
	cr_off_tax_amt := db_ar_tax_amt;

	----------------------------------------------------
	-- Insert the report data for the AR G/L account.
	----------------------------------------------------
	INSERT INTO ledger_report_accts_t (
		obj_id0, rec_id,
		account_no, bill_no,
		item_no, item_name,
		effective_t, resource_id, gl_id,
		cr_ar_gross_amt, db_ar_gross_amt, ar_gross_gl_acct,
		cr_off_gross_amt, db_off_gross_amt, off_gross_gl_acct,
		cr_ar_net_amt, db_ar_net_amt, ar_net_gl_acct,
		cr_off_net_amt, db_off_net_amt, off_net_gl_acct,
		cr_ar_disc_amt, db_ar_disc_amt, ar_disc_gl_acct,
		cr_off_disc_amt, db_off_disc_amt, off_disc_gl_acct,
		cr_ar_tax_amt, db_ar_tax_amt, ar_tax_gl_acct,
		cr_off_tax_amt, db_off_tax_amt, off_tax_gl_acct)
	VALUES (
		obj_id0, rec_id,
		account_no, bill_no,
		item_no, item_name,
		effective_t, resource_id, gl_id,
		cr_ar_gross_amt, db_ar_gross_amt, ar_gross_acct,
		cr_off_gross_amt, db_off_gross_amt, off_gross_acct,
		cr_ar_net_amt, db_ar_net_amt, ar_net_acct,
		cr_off_net_amt, db_off_net_amt, off_net_acct,
		cr_ar_disc_amt, db_ar_disc_amt, ar_disc_acct,
		cr_off_disc_amt, db_off_disc_amt, off_disc_acct,
		cr_ar_tax_amt, db_ar_tax_amt, ar_tax_acct,
		cr_off_tax_amt, db_off_tax_amt, off_tax_acct
	);

END ledger_insert_rows;

/
--------------------------------------------------------
--  DDL for Procedure MAKE_INDEXES_PARTITION_READY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."MAKE_INDEXES_PARTITION_READY" (i_table_name VARCHAR2) is

	--
	-- Cursors to get all the indexes for the given table.
	--

	CURSOR index_cur IS
	SELECT *
	FROM user_indexes
	WHERE table_name = i_table_name
	AND index_name NOT like 'SYS_%$$'; -- ignore the indexes that are used for maintaining the BLOBs

	CURSOR index_col_cur (i_index_name IN VARCHAR2) IS
	SELECT column_name
	FROM user_ind_columns
	WHERE index_name = i_index_name
	ORDER BY column_position;

        e_skip_index EXCEPTION;

        v_poid_column VARCHAR2(30);
        v_poid_in_index BOOLEAN;
        v_errmsg VARCHAR2(200);

        C_STEP_NAME upg_log_t.step_name%TYPE := 'make_indexes_partition_ready::' || i_table_name;
BEGIN

        pin_upg_common.delete_info (C_STEP_NAME);

        IF (i_table_name = 'EVENT_T') THEN
                v_poid_column := 'POID_ID0';
        ELSE
                v_poid_column := 'OBJ_ID0';
        END IF;

	FOR index_rec IN index_cur LOOP
        DECLARE
             v_crt_index_cmd VARCHAR2(4000);
             v_index_storage_info VARCHAR2(4000);
             v_storage VARCHAR2(4000);
        BEGIN
                --
                -- We do not care about the nonunique indexes.
                --

                IF (index_rec.uniqueness = 'NONUNIQUE') THEN
                      RAISE e_skip_index;
                END IF;

                v_index_storage_info := ' TABLESPACE ' || index_rec.tablespace_name || ' INITRANS ' || index_rec.ini_trans ;

                IF index_rec.initial_extent IS NOT NULL THEN
                   v_storage  :=  ' INITIAL ' || index_rec.initial_extent ;
                END IF;

                IF index_rec.next_extent IS NOT NULL THEN
                   v_storage := v_storage || ' NEXT ' || index_rec.next_extent ;
                END IF;

                IF index_rec.min_extents IS NOT NULL THEN
                   v_storage := v_storage || ' MINEXTENTS ' || index_rec.min_extents  ;
                END IF;

                IF index_rec.max_extents IS NOT NULL THEN
                   v_storage := v_storage || ' MAXEXTENTS ' || index_rec.max_extents  ;
                END IF;

                IF index_rec.pct_increase IS NOT NULL THEN
                   v_storage := v_storage || ' PCTINCREASE ' || index_rec.pct_increase ;
                END IF;


                IF index_rec.freelists IS NOT NULL THEN
                   v_storage := v_storage || ' FREELISTS ' || index_rec.freelists ;
                END IF;

                IF v_storage IS NOT NULL THEN
                   v_index_storage_info  := v_index_storage_info  || ' STORAGE (' || v_storage || ')';
                END IF;

                IF index_rec.pct_free IS NOT NULL THEN
                   v_index_storage_info  := v_index_storage_info  || ' PCTFREE ' || index_rec.pct_free;
                END IF;

                v_crt_index_cmd := 'CREATE UNIQUE INDEX ' || index_rec.index_name || ' ON ' || index_rec.table_name || '(';

                v_poid_in_index := FALSE;

		FOR index_col_rec IN index_col_cur(index_rec.index_name) LOOP
                      v_crt_index_cmd := v_crt_index_cmd || index_col_rec.column_name || ', ';

                      IF (index_col_rec.column_name = v_poid_column) THEN
                            v_poid_in_index := TRUE;
                      END IF;
		END LOOP;

                --
                -- If the poid_id0/obj_id0 is part of this index, there is no need to proceed further.
                -- Else drop this index and recreate it with the poid column.
                --

                IF (v_poid_in_index) THEN
                      RAISE e_skip_index;
                END IF;

                v_crt_index_cmd := v_crt_index_cmd || v_poid_column || ')' || v_index_storage_info;

                BEGIN
                     EXECUTE IMMEDIATE 'DROP INDEX ' || index_rec.index_name;
                EXCEPTION
                     WHEN OTHERS THEN
                          pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'E',
                                                  'Unable to drop the index ' || index_rec.index_name,
                                                  SQLERRM);
                          RAISE;
                END;

                IF (NOT pin_upg_common.index_exists (index_rec.index_name, v_errmsg)) THEN
                BEGIN
                      EXECUTE IMMEDIATE v_crt_index_cmd;
                EXCEPTION
                      WHEN OTHERS THEN
                          pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'E',
                                                  'Index creation failed:: Run this command manually to create the index ' || v_crt_index_cmd,
                                                  SQLERRM);
                          RAISE;
                END;
                END IF;

		pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'C',
					'Index ' || index_rec.index_name || ' recreated with ' || v_poid_column || ' column.',
					NULL);
        EXCEPTION
                 WHEN e_skip_index THEN
                      NULL;
        END;
	END LOOP;

EXCEPTION
        WHEN OTHERS THEN
             pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'E', NULL, SQLERRM);
END make_indexes_partition_ready;

/
--------------------------------------------------------
--  DDL for Procedure MASTER_UPD_ENT_DESC_NODE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."MASTER_UPD_ENT_DESC_NODE" 
(
num_threads IN INTEGER
)
IS
    total_rec                              INTEGER;
    max_rec_id                        INTEGER;
    batch_size                          INTEGER;
    lower_lmt                           INTEGER;
    upper_lmt                          INTEGER;
    v_jobno                                               INTEGER;

    BEGIN
    total_rec := 0;
    SELECT MAX(descriptor_id) INTO max_rec_id FROM ent_descriptor_mapping_t;
    SELECT TRUNC(max_rec_id/num_threads) INTO batch_size FROM dual;
    batch_size := batch_size + 1;

    lower_lmt := 1;
    upper_lmt := batch_size;
    FOR loop_cntr IN 1..num_threads
    LOOP
        dbms_job.submit(job => v_jobno, what => 'begin upd_ent_desc_map_node('||lower_lmt||','||upper_lmt||'); end;', next_date => sysdate, interval =>  null);
        COMMIT;
        lower_lmt := lower_lmt + batch_size;
        IF upper_lmt + batch_size < max_rec_id THEN
                        upper_lmt := upper_lmt + batch_size;
        ELSE
                        upper_lmt := max_rec_id;
        END IF;
    END LOOP;
end master_upd_ent_desc_node;

/
--------------------------------------------------------
--  DDL for Procedure MASTER_UPD_EVT_BAL_IMPACTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."MASTER_UPD_EVT_BAL_IMPACTS" 
IS
	lower_lmt                           all_tab_partitions.high_value%TYPE;
	upper_lmt                          all_tab_partitions.high_value%TYPE;
	v_jobno                                               INTEGER;

	CURSOR get_event_poid_limits_cur
	IS
		Select High_Value From All_Tab_Partitions
		WHERE table_name = 'EVENT_BAL_IMPACTS_T' AND (partition_name LIKE '%2012' OR partition_name LIKE '%2013' OR partition_name LIKE '%2014' OR partition_name LIKE '%2015')
		ORDER BY partition_position ASC;

	BEGIN

	upper_lmt := 0;
	lower_lmt := 269740988619030528;

	FOR event_poid_limits_rec IN get_event_poid_limits_cur
	LOOP
		upper_lmt := event_poid_limits_rec.high_value;
		dbms_output.put_line(lower_lmt||','||upper_lmt);
		DBMS_JOB.SUBMIT(job => V_JOBNO, WHAT => 'begin upd_evt_bal_impacts('||LOWER_LMT||','||UPPER_LMT||'); END;', NEXT_DATE => sysdate, interval =>  null);
		COMMIT;
		lower_lmt := upper_lmt;
	END LOOP;
End Master_Upd_Evt_Bal_Impacts;

/
--------------------------------------------------------
--  DDL for Procedure MASTER_UPD_EVT_DEAL_INFO_PKG
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."MASTER_UPD_EVT_DEAL_INFO_PKG" 
(
num_threads IN INTEGER
)
IS
    total_rec                         INTEGER;
    max_poid_id                        INTEGER;
    min_poid_id                        INTEGER;
    batch_size                        INTEGER;
    lower_lmt                         INTEGER;
    upper_lmt                         INTEGER;
    v_jobno                           INTEGER;

BEGIN
    total_rec := 0;
    SELECT min(poid_id0), max(poid_id0) INTO min_poid_id, max_poid_id FROM purchased_product_t;
    SELECT count(*) into total_rec FROM purchased_product_t;
    SELECT TRUNC(total_rec/num_threads) INTO batch_size FROM dual;
    batch_size := batch_size + 1;

    lower_lmt := min_poid_id;
    upper_lmt := min_poid_id + batch_size;
    FOR loop_cntr IN 1..num_threads
    LOOP
        dbms_job.submit(job => v_jobno, what => 'begin upd_evt_deal_info_pkg('||lower_lmt||','||upper_lmt||'); end;', next_date => sysdate, interval =>  null);
        COMMIT;
        lower_lmt := lower_lmt + batch_size;
        IF upper_lmt + batch_size < max_poid_id THEN
            upper_lmt := upper_lmt + batch_size;
        ELSE
            upper_lmt := max_poid_id;
        END IF;
    END LOOP;
end master_upd_evt_deal_info_pkg;

/
--------------------------------------------------------
--  DDL for Procedure NEWEXTRACTTAX
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."NEWEXTRACTTAX" 
(RuntimeT IN VARCHAR2,
 StartExtractT IN VARCHAR2,
 EndExtractT IN VARCHAR2)

IS

--------------------------------------------------------------------
-- Assumption: the date validity has already been checked.
-- specifically that the end date is correct.
--------------------------------------------------------------------



--------------------------------------------------------------------
-- group by positive and negative amounts
--assume no re-rating and .
--------------------------------------------------------------------

CURSOR extract_tax_cursor(InfStartT Integer, InfEndT Integer)
IS
SELECT SUBSTR(EVENT_TAX_JURISDICTIONS_T.NAME,1,6) as "STATE",
    SUM(EVENT_TAX_JURISDICTIONS_T.AMOUNT) as "AMOUNT"
FROM
    EVENT_T,
    EVENT_TAX_JURISDICTIONS_T
WHERE
    EVENT_T.POID_DB > 0
    and EVENT_T.POID_ID0 = EVENT_TAX_JURISDICTIONS_T.OBJ_ID0
    and EVENT_T.MOD_T >= InfStartT
    and EVENT_T.MOD_T < InfEndT
    and amount <> 0
GROUP BY
    SUBSTR(EVENT_TAX_JURISDICTIONS_T.NAME,1,6), sign(amount);



extract_tax_cursor_rec extract_tax_cursor%ROWTYPE;
InfStartT INTEGER;
InfEndT INTEGER;
SuccessFlag NUMBER :=0;
TaxUS_Total DECIMAL(12,2) := 0;
TotalAmount DECIMAL(12,2) := 0;
DocumentKey VARCHAR2(32);
TotalRecords NUMBER := 0;
DocumentRecord VARCHAR2(255);
StateValue VARCHAR2(255);


BEGIN


     DocumentKey := RuntimeT || StartExtractT || EndExtractT;

---------------------------------------------------------------------------
-- convert the dates to Infranet dates.  Infranet dates use the number
-- of seconds offset since 1970.  These are needed for the event query
---------------------------------------------------------------------------

    Select date_to_infranet(to_date(StartExtractT, 'YYYYMMDD')) INTO InfStartT from dual;
    DBMS_OUTPUT.PUT_LINE('InfStart is ' || InfStartT);
    Select date_to_infranet(to_date(EndExtractT, 'YYYYMMDD')) INTO InfEndT from dual;
    DBMS_OUTPUT.PUT_LINE('InfEndt is ' || InfEndT);
----------------------------------------------------------------------------
-- Build the rest of the dates I need for the output record.  We only
-- need to initialize them once, might as well do it here
----------------------------------------------------------------------------


--------------------------------------------------------------------
-- a slight change should be noted here.  There will be no weekly
-- output from this program so the only filename needed is the monthly
-------------------------------------------------------------------

    --FileName := 'dss_sap_tax_mon_' || RuntimeT || '.txt';
    --UTL_DIR := '/opt/portal/hns/hns_apps/GL_Reporting/report_generator';

--------------------------------------------------------------------
-- open file for output
--------------------------------------------------------------------
    --DBMS_OUTPUT.PUT_LINE(UTL_DIR);
    --FileHandle := utl_file.fopen(UTL_DIR, FileName, 'W');

    --IF UTL_FILE.IS_OPEN(FileHandle)
    --THEN
      --DBMS_OUTPUT.PUT_LINE('File Handle is opened');
     --   END IF;

--------------------------------------------------------------------
-- delete old data
--------------------------------------------------------------------
    execute immediate 'TRUNCATE TABLE HNS_EXTRACT_TAX_T';

--------------------------------------------------------------------
-- Build the document header record.  There is only one header record
-- per file.
--------------------------------------------------------------------
    DocumentRecord:= 'HD:MonthlyTX' || StartExtractT || EndExtractT || RuntimeT;
    INSERT INTO HNS_EXTRACT_TAX_T VALUES (DocumentRecord);COMMIT;


--------------------------------------------------------------------
-- Execute the search and walk through the fetched records and
-- start writing both to the file.  s
--------------------------------------------------------------------
    --Open the cursor
    IF NOT extract_tax_cursor%ISOPEN
       THEN
             DBMS_OUTPUT.PUT_LINE('Cursor opened');
          OPEN extract_tax_cursor(InfStartT, InfEndT);
    END IF;

    --Fetch row from cursor directly into an Oracle Forms item


   LOOP
      DBMS_OUTPUT.PUT_LINE('Just fetched record number ' ||  TO_CHAR (extract_tax_cursor%ROWCOUNT));
      FETCH extract_tax_cursor INTO extract_tax_cursor_rec;
      EXIT WHEN NOT extract_tax_cursor%FOUND;



    -- convert US; XX; to usable date field
        StateValue := 'TAX' ||  SUBSTR(extract_tax_cursor_rec.state,INSTR(extract_tax_cursor_rec.state, ';',1,1)+2,3);
            DBMS_OUTPUT.PUT_LINE('StateValue is ' || StateValue);

    -- add to running total
        TaxUS_Total := TaxUS_Total + (extract_tax_cursor_rec.amount * (1));
        DBMS_OUTPUT.PUT_LINE('Tax is ' || TaxUS_Total);
        TotalRecords := TotalRecords + 1;

        TotalAmount := (extract_tax_cursor_rec.amount * (-1));

    -- build the document record

        IF TotalAmount >= 0 THEN
            DocumentRecord := 'IT:' || StateValue || '   ' || '   ' ||
                '     ' ||TRIM(to_char(TotalAmount, '0000000000D00'));
        ELSE
            DocumentRecord := 'IT:' || StateValue || '   ' || '   ' ||
                '     ' ||TRIM(to_char(TotalAmount, '0000000000D00S'));
        END IF;

    -- write the record to the TABLE
        INSERT INTO HNS_EXTRACT_TAX_T VALUES (DocumentRecord);COMMIT;


    END LOOP;



    --Close the cursor
    IF extract_tax_cursor%ISOPEN
         THEN
               CLOSE extract_tax_cursor;
    END IF;








--------------------------------------------------------------------
-- write TaxUS Offset entry
--------------------------------------------------------------------
    IF TaxUS_Total >=0 THEN
        DocumentRecord := 'IT:TAXUS   ' || '   ' ||
            '     ' ||TRIM(to_char(TaxUS_Total,'0000000000D00'));
    ELSE
        DocumentRecord := 'IT:TAXUS   ' || '   ' ||
            '     ' ||TRIM(to_char(TaxUS_Total, '0000000000D00S'));
    END IF;

    INSERT INTO HNS_EXTRACT_TAX_T VALUES (DocumentRecord);COMMIT;

    TotalRecords := TotalRecords + 1;

--------------------------------------------------------------------
-- write Trailer record
--------------------------------------------------------------------
    DocumentRecord := 'TR:' || TRIM(to_char(TotalRecords,'0000000000'));
    INSERT INTO HNS_EXTRACT_TAX_T VALUES (DocumentRecord);COMMIT;

--------------------------------------------------------------------
-- write audit record, finalize and close the program.
--------------------------------------------------------------------
--On error    SuccessFlag := 1


    DBMS_OUTPUT.PUT_LINE('DocKey is ' || DocumentKey);
    DBMS_OUTPUT.PUT_LINE('Runtime is ' || RuntimeT);
    DBMS_OUTPUT.PUT_LINE('StartExtract is ' || StartExtractT);
    DBMS_OUTPUT.PUT_LINE('EndExtract is ' || EndExtractT);
    DBMS_OUTPUT.PUT_LINE('SuccesFlag is ' || SuccessFlag);

INSERT INTO    hns_tax_ledger_t VALUES    (DocumentKey, RuntimeT, StartExtractT, EndExtractT, SuccessFlag, '-p');

--utl_file.fclose(FileHandle);



EXCEPTION
    WHEN OTHERS THEN
         BEGIN
             INSERT INTO    hns_tax_ledger_t VALUES    (DocumentKey, RuntimeT, StartExtractT, EndExtractT, '1', '-p');
         EXCEPTION
             WHEN OTHERS THEN
                      raise_application_error(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
            END;

END NewExtractTax;

/
--------------------------------------------------------
--  DDL for Procedure NEW_ARCH_JOURNAL_T
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."NEW_ARCH_JOURNAL_T" (start_t date, end_t date) AS

  d_end_date        date;
  n_cntr            integer :=0;
  n_rows_archived   integer :=0;
  n_max_poid        number;
  n_del_limit       number := 100000;
  t_sql_text        varchar2(2000);


  CURSOR journal_cur IS
  Select /*+ parallel (journal_t,4) */ poid_id0 from journal_t
  where poid_id0 >= (select d2lp(start_t) from zonemap_t)
  and poid_id0 < (select d2lp(end_t) from zonemap_t)
  and (resource_id <> 840
      or (resource_id = 840
          and item_obj_type in ('/item/payment','/item/adjustment','/item/writeoff')
      )
  );

  journal_rec  journal_cur%ROWTYPE;


BEGIN

    insert into J_TIMINGS values (sysdate, 'deletion started from ' || start_t || ' to ' || end_t);
    Commit;


    FOR journal_rec IN journal_cur LOOP

      DELETE FROM journal_t
      WHERE poid_id0 = journal_rec.poid_id0;

      n_cntr := n_cntr + 1;
      n_rows_archived := n_rows_archived + 1;

       If n_cntr >= n_del_limit Then
        Commit;
        n_cntr := 0;
      End If;


End Loop;

  Commit;

  insert into J_TIMINGS values (sysdate, 'finished deleting ' || n_rows_archived || ' rows');
    Commit;

  --- Rebuild Journal_T indexes online to defrag
  /*For C2 in (select index_name from all_indexes where table_name = 'JOURNAL_T')
    Loop
      t_sql_text := 'alter index ' || C2.index_name || ' rebuild online';
      Execute Immediate t_sql_text;
  End Loop;

  insert into J_TIMINGS values (sysdate, 'index rebuild finished');
    Commit;*/

  END;

/
--------------------------------------------------------
--  DDL for Procedure NEW_TUMS_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."NEW_TUMS_PROC" IS
--
--
-- ---------   ------  -------------------------------------------
    decline_obj event_t.poid_id0%TYPE;
    decline_t event_t.end_t%TYPE;
    account_obj event_t.account_obj_id0%TYPE;
    subords_obj event_t.account_obj_id0%TYPE;
    scenario_count INTEGER;
    service_count INTEGER;
    new_pymt_count INTEGER;
    scenario_name VARCHAR2 (255);
    tum_start new_hns_tum_t.tum_start_days%TYPE;
    tum_end new_hns_tum_t.tum_end_days%TYPE;
    url_p new_hns_tum_t.url_parent%TYPE;
    url_c new_hns_tum_t.url_child%TYPE;
    hit new_hns_tum_t.hits%TYPE;
    esn hns_profile_customer_t.hns_serial_number%TYPE;
    t_sql_text varchar2(100);
    last_state_change event_t.end_t%TYPE;
    days_in_coll INTEGER;
    account_type cc_decline_t.account_type%TYPE;
    day_in_coll cc_decline_t.DAYSINCOLLECTIONS%TYPE;
    scenario_nm cc_decline_t.SCENARIO_NAME%TYPE;


    --1. Create a cursor to get the list of event poids that declined
    --2. For each event poid, skip if
         -- a. there is a new payment poid after that
         -- b. the account is in collections
         -- c. if there is no bill that is still due and older than the payment attempt
    --3. Load the data corresponding to it in a table


BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');

   --t_sql_text := 'truncate table cc_decline_t';
   --Execute Immediate t_sql_text;

   Execute Immediate 'truncate table cc_decline_table';

   commit;


   --rows_cnt := 0;

   Execute Immediate 'insert /*+ append */ into cc_decline_table   --  1sec
    select ''1'',null,ceil(sysdate - u2d(last_state_change_t))
                   ,last_state_change_t,''NA'',
                   null,null,null,null,null
                   ,account_no
                   ,p2gl(account_obj_id0)
                   ,null,account_obj_id0
                 ,null,1
        from  hns_delinquency_t h
        where collection_state = 1
        and not exists (select 1 from account_t a
                    where a.poid_id0 = h.account_obj_id0
                    and    (a.gl_segment like ''%VAR%''
                    OR    a.gl_segment like ''%GUEST%''
                    OR    a.gl_segment like ''.NAD.KU.ENTERPRISE.GOVT.GSC''))';

    commit;

    Execute Immediate 'merge into cc_decline_table DPT
    using (select bi.account_obj_id0,ccs.scenario_name,ht.tum_start_days,ht.tum_end_days,ht.url_parent,ht.url_child,ht.hits
        from   collections_scenario_t cs, config_collections_scenario_t ccs, new_hns_tum_t ht , billinfo_t bi
        where  bi.SCENARIO_OBJ_ID0 = cs.POID_ID0
        and    cs.config_scenario_obj_id0 = ccs.obj_id0
        and    ht.coll_scenario = ccs.scenario_name
        ) HCD
    on (hcd.account_obj_id0 = DPT.account_obj_id0
        and dpt.record_type = 1
        and DPT.DAYSINCOLLECTIONS >= hcd.tum_start_days
        and DPT.DAYSINCOLLECTIONS < hcd.tum_end_days)
    when matched then
    update set DPT.TUM_START_DAYS = HCD.TUM_START_DAYS,
        DPT.TUM_END_DAYS = HCD.TUM_END_DAYS,
        DPT.URL_PARENT = HCD.URL_PARENT,
        DPT.URL_CHILD = HCD.URL_CHILD,
        DPT.SCENARIO_NAME = HCD.scenario_name,
        DPT.HITS = HCD.HITS';

    commit;

    Execute Immediate 'insert /*+ append */ into cc_decline_table   --  1sec
    select ''2'',null,c.DAYSINCOLLECTIONS
                   ,c.LAST_STATE_CHANGE,c.scenario_name,
                   c.TUM_START_DAYS,c.TUM_END_DAYS,c.URL_PARENT,c.URL_CHILD,c.HITS
                   ,p2a(gbm.object_id0)
                   ,p2gl(gbm.object_id0)
                   ,null,gbm.object_id0
                 ,null,2
        from  cc_decline_table c, group_t g, group_billing_members_t gbm
        where c.obj_id0 is null
        and   g.account_obj_id0 = c.account_obj_id0
        and   g.poid_id0 = gbm.obj_id0 and
        (select min(status) from service_t s where s.account_obj_id0 = gbm.object_id0 and s.poid_type = ''/service/ip'') = 10100';

    commit;

    Execute Immediate 'delete from cc_decline_table where tum_start_days is null';

    Execute Immediate 'delete from cc_decline_table c
                       where record_type = 1
                       and (select min(status) from service_t s where s.account_obj_id0 = c.account_obj_id0 and s.poid_type = ''/service/ip'') <> 10100';

    commit;


    Execute Immediate 'insert /*+ append */ into cc_decline_table   --  1sec
    select ''1'',null,''NA''
                   ,(select end_t from event_t where poid_id0 = obj_id0),''NA'',
                   null,null,null,null,null
                   ,(select p2a(account_obj_id0) from event_t where poid_id0 = obj_id0)
                   ,(select p2gl(account_obj_id0) from event_t where poid_id0 = obj_id0)
                   ,obj_id0,(select account_obj_id0 from event_t where poid_id0 = obj_id0)
                 ,decode(result,0,1,0),3
            from  event_billing_payment_cc_t
            where result in (0,7)
            and   obj_id0 >= (select d2lp(sysdate-10) from dual)
            and   obj_id0 < (select d2lp(sysdate+1) from dual)';

    commit;

    Execute Immediate 'delete from cc_decline_table where record_type = 3 and obj_id0 in (
    select obj_id0 from (
    SELECT obj_id0, DENSE_RANK()
       OVER (PARTITION BY c.account_obj_id0 ORDER BY c.LAST_STATE_CHANGE desc) AS drank
       FROM cc_decline_table c) where drank <> 1)';


	Execute Immediate 'delete from cc_decline_table where to_be_deleted=1';

	commit;

    Execute Immediate 'update cc_decline_table c set to_be_deleted =  (select count(*) from billinfo_t bi
           where record_type = 3 and bi.account_obj_id0=c.account_obj_id0
           and   (bi.scenario_obj_id0 <> 0 or bi.exempt_from_collections = 1))';

    Execute Immediate 'delete from cc_decline_table where to_be_deleted=1';

	commit;

    Execute Immediate 'update cc_decline_table c set HNS_SERIAL_NUMBER =  (select hns_serial_number from   hns_profile_customer_t hpc, profile_t p
       where  p.poid_id0 = hpc.obj_id0
       and    p.account_obj_id0 = c.account_obj_id0)';

    Execute Immediate 'delete from cc_decline_table where HNS_SERIAL_NUMBER is null';

	commit;

	Execute Immediate 'delete from cc_decline_table c
    where record_type = 3
    and exists (select 1  from billinfo_t b
            where  b.account_obj_id0 = c.account_obj_id0
            and    b.pending_recv <= 0)';

	commit;


    Execute Immediate 'merge into cc_decline_table DPT
    using (select collection_state,tum_start_days, tum_end_days,url_parent,url_child,hits from new_hns_tum_t
    where collection_state = 8 ) HCD
    on (hcd.collection_state = 8 and dpt.record_type = 3)
    when matched then
    update set DPT.TUM_START_DAYS = HCD.TUM_START_DAYS,
        DPT.TUM_END_DAYS = HCD.TUM_END_DAYS,
        DPT.URL_PARENT = HCD.URL_PARENT,
        DPT.URL_CHILD = HCD.URL_CHILD,
        DPT.HITS = HCD.HITS';

	commit;

    Execute Immediate 'SELECT DISTINCT X.account_type,
                     hpc.HNS_SERIAL_NUMBER,
                     ''NA'' AS daysincollections,
                     0 AS last_state_change,
                     ''NA'' AS scenario_name,
                     ht.tum_start_days,
                     ht.tum_end_days,
                     ht.url_parent,
                     ht.url_child,
                     ht.hits,
                     a.account_no,
                     a.gl_segment,null,null,null,null
       FROM ((SELECT a.poid_id0 PARENT_POID,
                     a.poid_id0 SUBORD_POID,
                     ''1'' ACCOUNT_TYPE,
                     address,
                     PAYINFO_ADDRESS.payinfo_obj_id0
                FROM ( (SELECT p.obj_id0  payinfo_obj_id0,
                               address,
                               city,
                               state,
                               zip
                          FROM payinfo_cc_t p
                         WHERE p.address LIKE ''%BAD ADDRESS%'')
                      UNION
                      (SELECT p.obj_id0  payinfo_obj_id0,
                              --p.account_obj_id0 AS account_obj_id0,
                              address,
                              city,
                              state,
                              zip
                         FROM payinfo_inv_t p
                        WHERE p.address LIKE ''%BAD ADDRESS%'')
                      UNION
                      (SELECT p.obj_id0  payinfo_obj_id0,
                              address,
                              city,
                              state,
                              zip
                         FROM payinfo_dd_t p
                        WHERE   p.address LIKE ''%BAD ADDRESS%'')) PAYINFO_ADDRESS,
                     account_t a,
                     billinfo_t bi
               WHERE     PAYINFO_ADDRESS.payinfo_obj_id0 = bi.PAYINFO_OBJ_ID0
                     AND bi.ACCOUNT_OBJ_ID0 = a.poid_id0
                     AND a.status = 10100
                     AND INSTR (a.lineage,
                                '':'',
                                1,
                                2) = 0
                     AND EXISTS
                            (SELECT 1
                               FROM service_t s
                              WHERE     account_obj_id0 = a.poid_id0
                                    AND poid_type = ''/service/ip''
                                    AND s.status = 10100))) X,
            profile_t p,
            hns_profile_customer_t hpc,
            account_t a,
            hns_delinquency_t hd,
            new_hns_tum_t ht
      WHERE     a.poid_id0 = X.subord_poid
            AND p.account_obj_id0 = a.poid_id0
            AND p.poid_id0 = hpc.obj_id0
            AND X.parent_poid = hd.ACCOUNT_OBJ_ID0(+)
            AND a.status != 10103
            AND hpc.HNS_SERIAL_NUMBER != ''00000000''
            AND ht.ADDITIONAL_PARAMETER = ''BAD ADDRESS''
                        ';
    --Execute Immediate 'INSERT /*+ append */ INTO CC_DECLINE_T
    --(ACCOUNT_TYPE, DAYSINCOLLECTIONS,
    --       SCENARIO_NAME, TUM_START_DAYS,
    --       TUM_END_DAYS, URL_PARENT, URL_CHILD,
    --       HITS, HNS_SERIAL_NUMBER, LAST_STATE_CHANGE, ACCOUNT_NO, GL_SEGMENT)
    --values (account_type,day_in_coll, scenario_nm,tum_start,tum_end, url_p,url_c,hit,  (select c.esn,c.end_t,p2a(c.account_obj_id0), p2gl(c.account_obj_id0)
    --from cc_decline_table c))';

    commit;

DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending procedure ' || sysdate);

END;

/
--------------------------------------------------------
--  DDL for Procedure PIN_ROUND_GET_CONFIG_BEID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."PIN_ROUND_GET_CONFIG_BEID" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
3f1 26c
wOcEzWRxXkQdk4tRWMzR1aBx45AwgzJes0gTfI7N1fkY+GXz6BE7PMTCw8Du5tjz/TEbHkHi
g41cWpTw5aAl+T/fVr3cb52pz9By7cF2mDzFajSz5xPisMSx/vn0QQVicyPNqr9y0rSfroJv
6RigJ5HRkb3lLcoaldOBek1Q8kMwcW8as01gF1pmKJlTYN76+djzPHEXDOKoxqx4jQLOx3Tv
TTNOiIYp8ENsuRYzUPZbDKZTOHRKbyc7Ib2+i42FsM2lImqDnmxenwdjyAeMUamTAsKg2TH1
3TZIa2/xceuW1T+uDcBGvGfvBInLRVsHNcWZjc5KLw9hLHmdc44dnP9fPosFOx+QFHCcFq6J
EdF0QT23uQh93m2JLYVwAlgCTN/Hqcobb60slN2o7a12bPpR5gqUkfJvURra9WIyXmuo2VEs
DPV4YAuL5nOemecJnzcwQrZSbWcenZKhwhwyNFjCESw89NVInkIiXbWriATyNOLV91Ku3B1y
fh/CtctIyMMhDXCp13KbuSvPMyqvsvVzxmpt+B6S1/hvQNX7BSQT39wJuIt0won9DxPMoo40
nRNEcWPuGc6b1OFOv498P/Sfe6ojCB/NOeHK

/
--------------------------------------------------------
--  DDL for Procedure POPULATE_RATE_PLAN_CODE_75
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POPULATE_RATE_PLAN_CODE_75" AS
        v_ddl_stmt VARCHAR2(4000);
        RATE_PLAN_CODE_UPDATE CONSTANT NUMBER := -20001;
        SOME_OTHER_EXCEPTION  CONSTANT NUMBER := -20002;
        v_errmsg VARCHAR2(200);
BEGIN
IF (pin_upg_common.table_exists('product_usage_map_t',v_errmsg)) THEN
                BEGIN
                v_ddl_stmt := 'update product_usage_map_t set rate_plan_code= rate_plan_name where rate_plan_code is NULL and rate_plan_name is not null';
                EXECUTE IMMEDIATE v_ddl_stmt;
                EXCEPTION
                 WHEN OTHERS THEN
                  RAISE_APPLICATION_ERROR(RATE_PLAN_CODE_UPDATE,'Update of rate_plan_code failed due to ||SQLERRM',TRUE);
                END;
END IF;
IF (pin_upg_common.table_exists('au_product_usage_map_t',v_errmsg)) THEN
                BEGIN
                v_ddl_stmt := 'update au_product_usage_map_t set rate_plan_code= rate_plan_name where rate_plan_code is NULL and rate_plan_name is not null';
                EXECUTE IMMEDIATE v_ddl_stmt;
                EXCEPTION
                 WHEN OTHERS THEN
                  RAISE_APPLICATION_ERROR(RATE_PLAN_CODE_UPDATE,'Update of rate_plan_code failed due to ||SQLERRM',TRUE);
                END;
END IF;
EXCEPTION
        WHEN OTHERS THEN
                 RAISE_APPLICATION_ERROR(SOME_OTHER_EXCEPTION,'SCRIPT FAILED WITH THE ERROR'||SQLERRM, TRUE);

END populate_rate_plan_code_75;

/
--------------------------------------------------------
--  DDL for Procedure POPULATE_SERVICE_TELEPHONY_T
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POPULATE_SERVICE_TELEPHONY_T" AS

CURSOR service_telephony_cur IS
	SELECT poid_id0
	FROM service_t
	WHERE poid_type = '/service/telephony';

        C_STEP_NAME upg_log_t.step_name%TYPE := 'populate_service_telephony_t';
	v_dummy PLS_INTEGER;

	v_rows_processed PLS_INTEGER := 0;
        commit_constant CONSTANT PLS_INTEGER := 100000;
BEGIN
        IF (NOT pin_upg_common.step_completed (C_STEP_NAME)) THEN
                pin_upg_common.delete_info (C_STEP_NAME);

                pin_upg_common.log_info (C_STEP_NAME, NULL, NULL, 'I',
                                         'Starting populate_service_telephony_t.',
					 NULL);

		FOR service_telephony_rec IN service_telephony_cur LOOP
			SELECT count(*) INTO v_dummy
			FROM service_telephony_t
			WHERE obj_id0 = service_telephony_rec.poid_id0;

			IF (v_dummy = 0) THEN
			BEGIN
				INSERT INTO service_telephony_t (obj_id0, max_active_calls, network, qos, cos)
				VALUES (service_telephony_rec.poid_id0, 1, NULL, 0, 0);
			EXCEPTION
				WHEN OTHERS THEN
					--
					-- Commit the changes done so far.
					--

					COMMIT;
					pin_upg_common.log_info(C_STEP_NAME, NULL, NULL, 'E',
								'Unable to insert into service_telephony_t',
								SQLERRM);
					RAISE;
			END;
			END IF;

			v_rows_processed := v_rows_processed + 1;
                        IF v_rows_processed MOD commit_constant = 0 THEN
                                COMMIT;
                                pin_upg_common.log_info (C_STEP_NAME, NULL, NULL, 'I',
                                                         'Done with ' || to_char(v_rows_processed) || ' rows',
							 NULL);
                        END IF;
		END LOOP;

		COMMIT;

                pin_upg_common.log_info (C_STEP_NAME, NULL, NULL, 'C', 'Done with ' || to_char (v_rows_processed) || ' rows.',
				         NULL);

	END IF;

EXCEPTION
        WHEN OTHERS THEN
		ROLLBACK;
                pin_upg_common.log_info(C_STEP_NAME, NULL, NULL,
                                                'E', 'Unable to populate the service_telephony_t table.', sqlerrm);
END populate_service_telephony_t;

/
--------------------------------------------------------
--  DDL for Procedure POPULATE_TOTAL_WRITEOFF_SUMM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POPULATE_TOTAL_WRITEOFF_SUMM" 
AS
	AMT_VAL number;
	COUNT_VAL number;
	CURSOR USF_CUR IS
	select distinct parent_san_no, month_billed from  HNS_USF_AUDIT_SUMMARY_T;

    BEGIN

        AMT_VAL := 0;
        COUNT_VAL := 0;

        FOR USF_REC IN USF_CUR
        LOOP
			BEGIN
				--get Service charge

				select sum(writeoff) into AMT_VAL from item_t i
                    where i.account_obj_id0 = a2p(USF_REC.parent_san_no)
					and   (select trunc(u2d(i.effective_t), 'month') from dual) = USF_REC.month_billed;

                update HNS_USF_AUDIT_SUMMARY_T set total_writeoff = AMT_VAL
					where parent_san_no = USF_REC.parent_san_no
					and month_billed = USF_REC.month_billed;

                COUNT_VAL := COUNT_VAL + 1;
				IF mod(COUNT_VAL, 1000) = 0 THEN
					Commit;
				END IF;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    --PREV_NONE := 1;
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':1:'||SUBSTR(SQLERRM, 1, 250));
					update HNS_USF_AUDIT_SUMMARY_T set total_writeoff = -888
						where parent_san_no = USF_REC.parent_san_no
						and month_billed = USF_REC.month_billed;
					IF mod(COUNT_VAL, 1000) = 0 THEN
						Commit;
					END IF;
					when OTHERS then
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':2:'||SUBSTR(SQLERRM, 1, 250));
					--PREV_NONE := 1;
					update HNS_USF_AUDIT_SUMMARY_T set total_writeoff = -999
						where parent_san_no = USF_REC.parent_san_no
						and month_billed = USF_REC.month_billed;
					IF mod(COUNT_VAL, 1000) = 0 THEN
						Commit;
					END IF;
            END;
        END LOOP;
	Commit;
end POPULATE_TOTAL_WRITEOFF_SUMM;

/
--------------------------------------------------------
--  DDL for Procedure POPULATE_USF_ADJUST_SUMM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POPULATE_USF_ADJUST_SUMM" 
AS
	AMT_VAL number;
	COUNT_VAL number;
	CURSOR USF_CUR IS
	select distinct parent_san_no, month_billed from  HNS_USF_AUDIT_SUMMARY_T where usf_adjustment is null;

    BEGIN

        AMT_VAL := 0;
        COUNT_VAL := 0;

        FOR USF_REC IN USF_CUR
        LOOP
			BEGIN
				--get Service charge

				select NVL(sum(amount),0) into AMT_VAL from hns_financial_t
					where event_type = '/event/billing/adjustment/account'
					and event_descr in ('Universal Service Fee Adjustment','Reverse USF Fees')
					and parent_san_no = USF_REC.parent_san_no
					and (select trunc(u2d(event_created_t), 'month') from dual) = USF_REC.month_billed;

				--IF AMT_VAL != 0 THEN
                update HNS_USF_AUDIT_SUMMARY_T set usf_adjustment = AMT_VAL where parent_san_no = USF_REC.parent_san_no and month_billed = USF_REC.month_billed;
				--END IF;
                COUNT_VAL := COUNT_VAL + 1;
				IF mod(COUNT_VAL, 200) = 0 THEN
					Commit;
				END IF;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    --PREV_NONE := 1;
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':1:'||SUBSTR(SQLERRM, 1, 250));
					update HNS_USF_AUDIT_SUMMARY_T set usf_adjustment = -888 where parent_san_no = USF_REC.parent_san_no and month_billed = USF_REC.month_billed;
					COUNT_VAL := COUNT_VAL + 1;
					when OTHERS then
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':2:'||SUBSTR(SQLERRM, 1, 250));
					--PREV_NONE := 1;
					update HNS_USF_AUDIT_SUMMARY_T set usf_adjustment = -999 where parent_san_no = USF_REC.parent_san_no and month_billed = USF_REC.month_billed;
					COUNT_VAL := COUNT_VAL + 1;
            END;
        END LOOP;
	Commit;
end POPULATE_USF_ADJUST_SUMM;

/
--------------------------------------------------------
--  DDL for Procedure POPULATE_USF_ADJUST_SUMM_PRE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POPULATE_USF_ADJUST_SUMM_PRE" 
AS
	AMT_VAL number;
	COUNT_VAL number;
	CURSOR USF_CUR IS
	select distinct parent_san_no from  HNS_USF_AUDIT_SUMMARY_T  where usf_adjustment is null;

    BEGIN

        AMT_VAL := 0;
        COUNT_VAL := 0;

        FOR USF_REC IN USF_CUR
        LOOP
			BEGIN
				--get Service charge

				select count(*) into AMT_VAL from hns_financial_t
					where event_type = '/event/billing/adjustment/account'
					and event_descr in ('Universal Service Fee Adjustment','Reverse USF Fees')
					and parent_san_no = USF_REC.parent_san_no;

				IF AMT_VAL = 0 THEN
                update HNS_USF_AUDIT_SUMMARY_T set usf_adjustment = AMT_VAL where parent_san_no = USF_REC.parent_san_no;
				END IF;
                COUNT_VAL := COUNT_VAL + 1;
				IF mod(COUNT_VAL, 200) = 0 THEN
					Commit;
				END IF;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    --PREV_NONE := 1;
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':1:'||SUBSTR(SQLERRM, 1, 250));
					update HNS_USF_AUDIT_SUMMARY_T set usf_adjustment = -888 where parent_san_no = USF_REC.parent_san_no;
					COUNT_VAL := COUNT_VAL + 1;
					when OTHERS then
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':2:'||SUBSTR(SQLERRM, 1, 250));
					--PREV_NONE := 1;
					update HNS_USF_AUDIT_SUMMARY_T set usf_adjustment = -999 where parent_san_no = USF_REC.parent_san_no;
					COUNT_VAL := COUNT_VAL + 1;
            END;
        END LOOP;
	Commit;
end POPULATE_USF_ADJUST_SUMM_PRE;

/
--------------------------------------------------------
--  DDL for Procedure POPULATE_USF_EX_HAN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POPULATE_USF_EX_HAN" 
(REC_ID_VAL IN NUMBER)
AS
    ACCT_OBJ_VAL number;
    COUNT_VAL number;
        IS_HAN_VAL number;
    CURSOR USF_YES_HAN_CUR IS
    select rec_id,san_no,parent_san_no,location_id, event_created_t, invoice_number from hns_financial_usf_t where billable = 'EX-YES-HAN';-- and rec_id >= REC_ID_VAL;

    BEGIN

        ACCT_OBJ_VAL := NULL;
        COUNT_VAL := 0;
        IS_HAN_VAL := 0;

        FOR USF_YES_HAN IN USF_YES_HAN_CUR
        LOOP
            BEGIN
            --get VSAT SAN
            --select distinct account_obj into ACCT_OBJ_VAL from hns_financial_usf_t where location_id = USF_YES_HAN.location_id and san_no <> USF_YES_HAN.san_no and parent_san_no = USF_YES_HAN.parent_san_no and site_type in
                            --('Broadband Hub','Broadband Remote','HX Remote','Jupiter','Production - Dedicated','Production - Offshore',
                            --'Production - RTS','Production - Shared','Shared Hub','Spaceway'
                            --) and invoice_number = USF_YES_HAN.invoice_number;

            -- Check if this USF event happened while VSAT was active - else mark as No_HAN
            select count(*) into IS_HAN_VAL from service_t where poid_type = '/service/ip'
                and account_obj_id0 in (
                select distinct account_obj from hns_financial_usf_t where location_id = USF_YES_HAN.location_id and san_no <> USF_YES_HAN.san_no and parent_san_no = USF_YES_HAN.parent_san_no and site_type in
                            ('Broadband Hub','Broadband Remote','HX Remote','Jupiter','Production - Dedicated','Production - Offshore',
                            'Production - RTS','Production - Shared','Shared Hub','Spaceway'
                            ) and invoice_number = USF_YES_HAN.invoice_number)
                 and created_t < USF_YES_HAN.event_created_t
                and (status <> 10103 or (status = 10103 and last_status_t >  (USF_YES_HAN.event_created_t + (90*86400))));

            if IS_HAN_VAL = 0 then
                update hns_financial_usf_t set billable = 'NO-YES-HAN' where rec_id = USF_YES_HAN.rec_id;
                COUNT_VAL := COUNT_VAL + 1;
            else
                update hns_financial_usf_t set billable = 'YES-HAN' where rec_id = USF_YES_HAN.rec_id;
                COUNT_VAL := COUNT_VAL + 1;
            end if;
            IF mod(COUNT_VAL, 500) = 0 THEN
                Commit;
            END IF;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    --PREV_NONE := 1;
                    --DBMS_OUTPUT.PUT_LINE(SQLCODE||':1:'||SUBSTR(SQLERRM, 1, 250));
                    update hns_financial_usf_t set billable = 'ND-YES-HAN' where rec_id = USF_YES_HAN.rec_id;
                    COUNT_VAL := COUNT_VAL + 1;
                    when OTHERS then
                    --DBMS_OUTPUT.PUT_LINE(SQLCODE||':2:'||SUBSTR(SQLERRM, 1, 250));
                    --PREV_NONE := 1;
                    update hns_financial_usf_t set billable = 'EX-YES-HAN' where rec_id = USF_YES_HAN.rec_id;
                    COUNT_VAL := COUNT_VAL + 1;
            END;
        END LOOP;
        Commit;
end POPULATE_USF_EX_HAN;

/
--------------------------------------------------------
--  DDL for Procedure POPULATE_USF_NO_HAN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POPULATE_USF_NO_HAN" 
(REC_ID_VAL IN NUMBER)
AS
	ACCT_OBJ_VAL number;
	COUNT_VAL number;
        IS_HAN_VAL number;
	CURSOR USF_YES_HAN_CUR IS
	select rec_id,san_no,parent_san_no,location_id, event_created_t from hns_financial_usf_t where billable = 'YES-HAN' and rec_id >= REC_ID_VAL;

    BEGIN

        ACCT_OBJ_VAL := NULL;
		COUNT_VAL := 0;
		IS_HAN_VAL := 0;

        FOR USF_YES_HAN IN USF_YES_HAN_CUR
        LOOP
			BEGIN
			--get VSAT SAN
			select distinct account_obj into ACCT_OBJ_VAL from hns_financial_usf_t where location_id = USF_YES_HAN.location_id and san_no <> USF_YES_HAN.san_no and parent_san_no = USF_YES_HAN.parent_san_no and site_type in
							('Broadband Hub','Broadband Remote','HX Remote','Jupiter','Production - Dedicated','Production - Offshore',
							'Production - RTS','Production - Shared','Shared Hub','Spaceway'
							);

			-- Check if this USF event happened while VSAT was active - else mark as No_HAN
			select count(*) into IS_HAN_VAL from service_t where poid_type = '/service/ip'
				and account_obj_id0 = ACCT_OBJ_VAL and created_t < USF_YES_HAN.event_created_t
				and (status <> 10103 or (status = 10103 and last_status_t >  (USF_YES_HAN.event_created_t + (90*86400))));

			if IS_HAN_VAL = 0 then
				update hns_financial_usf_t set billable = 'NO-YES-HAN' where rec_id = USF_YES_HAN.rec_id;
				COUNT_VAL := COUNT_VAL + 1;
			end if;
			IF mod(COUNT_VAL, 500) = 0 THEN
				Commit;
			END IF;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    --PREV_NONE := 1;
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':1:'||SUBSTR(SQLERRM, 1, 250));
					update hns_financial_usf_t set billable = 'ND-YES-HAN' where rec_id = USF_YES_HAN.rec_id;
					COUNT_VAL := COUNT_VAL + 1;
					when OTHERS then
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':2:'||SUBSTR(SQLERRM, 1, 250));
					--PREV_NONE := 1;
					update hns_financial_usf_t set billable = 'EX-YES-HAN' where rec_id = USF_YES_HAN.rec_id;
					COUNT_VAL := COUNT_VAL + 1;
            END;
        END LOOP;
        Commit;
end POPULATE_USF_NO_HAN;

/
--------------------------------------------------------
--  DDL for Procedure POPULATE_USF_SITE_TYPE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POPULATE_USF_SITE_TYPE" 
AS

    REC_ID_VAL NUMBER;
    EVENT_CREATED_T_VAL1 NUMBER;
    EVENT_CREATED_T_VAL DATE;
    SAN_NO_VAL NUMBER;
    SITE_TYPE_VAL VARCHAR2(255);
	PREV_NONE NUMBER;
	COUNT_VAL NUMBER;

    CURSOR USF_SITE_CUR IS
        SELECT rec_id, event_created_t, san_no
        FROM hns_financial_usf_t;

    BEGIN

        SITE_TYPE_VAL := NULL;
	REC_ID_VAL := 0;
	EVENT_CREATED_T_VAL := NULL;
		COUNT_VAL := 0;

        FOR USF_SITE IN USF_SITE_CUR
        LOOP
            --REC_ID_VAL := USF_SITE.rec_id;
            --SAN_NO_VAL := USF_SITE.san_no;
		select u2d(USF_SITE.event_created_t) into EVENT_CREATED_T_VAL from dual;
			SITE_TYPE_VAL := NULL;
			PREV_NONE := 0;

            BEGIN
                SELECT SITETYPE into SITE_TYPE_VAL
					FROM (
						SELECT ss.swsitename SAN, sso.hnsorderedsitetype SITETYPE, sso.SWSCHENDDATE DATEFSOCLOSED, DENSE_RANK() OVER(PARTITION BY ss.swsitename ORDER BY sso.SWSCHENDDATE desc) R
						FROM sw_service_order@IPINTF sso, sw_site@IPINTF ss
						WHERE ss.swsiteid = sso.swsiteid
							AND sso.hnsdateinstcancelled IS NULL
							and ss.swsitename = USF_SITE.san_no
							and ss.swaccttype <> 'Physical Location'
							and sso.SWSCHENDDATE < EVENT_CREATED_T_VAL
							and (sso.hnsordsubtype is null or sso.hnsordsubtype not in ('Circuit Deactivation', 'POTS line deactivation', 'VOIP Deactivation' , 'Wireless Deactivation', 'Circuit/POTS line deactivation', 'RFP Prequal Survey'))
					)
					WHERE R = 1
					ORDER BY DATEFSOCLOSED desc;

                Update hns_financial_usf_t set site_type2= SITE_TYPE_VAL where rec_id = USF_SITE.rec_id;
				COUNT_VAL := COUNT_VAL + 1;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    PREV_NONE := 1;
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':1:'||SUBSTR(SQLERRM, 1, 250));
					when OTHERS then
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':2:'||SUBSTR(SQLERRM, 1, 250));
					PREV_NONE := 1;
            END;

			IF mod(COUNT_VAL, 5000) = 0 THEN
				Commit;
			END IF;
        END LOOP;
        Commit;

end POPULATE_USF_SITE_TYPE;

/
--------------------------------------------------------
--  DDL for Procedure POPULATE_USF_SITE_TYPE_AOBJ
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POPULATE_USF_SITE_TYPE_AOBJ" 
AS

    REC_ID_VAL NUMBER;
    EVENT_CREATED_T_VAL1 NUMBER;
    EVENT_CREATED_T_VAL DATE;
    SAN_NO_VAL NUMBER;
    SITE_TYPE_VAL VARCHAR2(255);
	PREV_NONE NUMBER;
	COUNT_VAL NUMBER;

    CURSOR USF_SITE_CUR IS
        SELECT rec_id, event_created_t, p2a(account_obj) san_no
        FROM hns_financial_usf_t where site_type is null;

    BEGIN

        SITE_TYPE_VAL := NULL;
	REC_ID_VAL := 0;
	EVENT_CREATED_T_VAL := NULL;
		COUNT_VAL := 0;

        FOR USF_SITE IN USF_SITE_CUR
        LOOP
            --REC_ID_VAL := USF_SITE.rec_id;
            --SAN_NO_VAL := USF_SITE.san_no;
		select u2d(USF_SITE.event_created_t) into EVENT_CREATED_T_VAL from dual;
			SITE_TYPE_VAL := NULL;
			PREV_NONE := 0;

            BEGIN
                SELECT SITETYPE into SITE_TYPE_VAL
					FROM (
						SELECT ss.swsitename SAN, sso.hnsorderedsitetype SITETYPE, sso.SWSCHENDDATE DATEFSOCLOSED, DENSE_RANK() OVER(PARTITION BY ss.swsitename ORDER BY sso.SWSCHENDDATE desc) R
						FROM sw_service_order@IPINTF sso, sw_site@IPINTF ss
						WHERE ss.swsiteid = sso.swsiteid
							AND sso.hnsdateinstcancelled IS NULL
							and ss.swsitename = USF_SITE.san_no
							and ss.swaccttype <> 'Physical Location'
							and sso.SWSCHENDDATE < EVENT_CREATED_T_VAL
					)
					WHERE R = 1
					ORDER BY DATEFSOCLOSED desc;

                Update hns_financial_usf_t set site_type = SITE_TYPE_VAL where rec_id = USF_SITE.rec_id;
				COUNT_VAL := COUNT_VAL + 1;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    PREV_NONE := 1;
			BEGIN
			if USF_SITE.san_no like '201%' and length(USF_SITE.san_no) > 9 then
			select substr(USF_SITE.san_no,9) into SAN_NO_VAL from dual;
			SELECT SITETYPE into SITE_TYPE_VAL
                                        FROM (
                                                SELECT ss.swsitename SAN, sso.hnsorderedsitetype SITETYPE, sso.SWSCHENDDATE DATEFSOCLOSED, DENSE_RANK() OVER(PARTITION BY ss.swsitename ORDER BY sso.SWSCHENDDATE desc) R
                                                FROM sw_service_order@IPINTF sso, sw_site@IPINTF ss
                                                WHERE ss.swsiteid = sso.swsiteid
                                                        AND sso.hnsdateinstcancelled IS NULL
                                                        and ss.swsitename = SAN_NO_VAL
                                                        and ss.swaccttype <> 'Physical Location'
                                                        and sso.SWSCHENDDATE < EVENT_CREATED_T_VAL
                                        )
                                        WHERE R = 1
                                        ORDER BY DATEFSOCLOSED desc;

                Update hns_financial_usf_t set site_type = SITE_TYPE_VAL where rec_id = USF_SITE.rec_id;
                                COUNT_VAL := COUNT_VAL + 1;
			end if;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    PREV_NONE := 1;

                                        when OTHERS then
                                        --DBMS_OUTPUT.PUT_LINE(SQLCODE||':2:'||SUBSTR(SQLERRM, 1, 250));
                                        PREV_NONE := 1;
            END;

					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':1:'||SUBSTR(SQLERRM, 1, 250));
					when OTHERS then
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':2:'||SUBSTR(SQLERRM, 1, 250));
					PREV_NONE := 1;
            END;

			IF mod(COUNT_VAL, 100) = 0 THEN
				Commit;
			END IF;
        END LOOP;
        Commit;

end POPULATE_USF_SITE_TYPE_AOBJ;

/
--------------------------------------------------------
--  DDL for Procedure POPULATE_USF_SITE_TYPE_AOBJ2
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POPULATE_USF_SITE_TYPE_AOBJ2" 
(REC_ID_VAL IN NUMBER)
AS

    --REC_ID_VAL NUMBER;
    EVENT_CREATED_T_VAL1 NUMBER;
    EVENT_CREATED_T_VAL DATE;
    SAN_NO_VAL NUMBER;
    SITE_TYPE_VAL VARCHAR2(255);
	PREV_NONE NUMBER;
	COUNT_VAL NUMBER;

    CURSOR USF_SITE_CUR IS
        SELECT rec_id, event_created_t, p2a(account_obj) san_no
        FROM hns_financial_usf_t where rec_id > REC_ID_VAL and site_type is null;

    BEGIN

        SITE_TYPE_VAL := NULL;
	--REC_ID_VAL := 0;
	EVENT_CREATED_T_VAL := NULL;
		COUNT_VAL := 0;

        FOR USF_SITE IN USF_SITE_CUR
        LOOP
            --REC_ID_VAL := USF_SITE.rec_id;
            --SAN_NO_VAL := USF_SITE.san_no;
		select u2d(USF_SITE.event_created_t) into EVENT_CREATED_T_VAL from dual;
			SITE_TYPE_VAL := NULL;
			PREV_NONE := 0;

            BEGIN
                SELECT SITETYPE into SITE_TYPE_VAL
					FROM (
						SELECT ss.swsitename SAN, sso.hnsorderedsitetype SITETYPE, sso.SWSCHENDDATE DATEFSOCLOSED, DENSE_RANK() OVER(PARTITION BY ss.swsitename ORDER BY sso.SWSCHENDDATE desc) R
						FROM sw_service_order@IPINTF sso, sw_site@IPINTF ss
						WHERE ss.swsiteid = sso.swsiteid
							AND sso.hnsdateinstcancelled IS NULL
							and ss.swsitename = USF_SITE.san_no
							and ss.swaccttype <> 'Physical Location'
							AND SSO.SWTYPE NOT IN ('Quality Audit','Abort','Permit','Repair','Electric Anti-Ice','Site Survey')
							and sso.SWSCHENDDATE is not null
							and sso.SWSCHENDDATE < EVENT_CREATED_T_VAL
							and sso.SWSTATUS in ('Installed/Repaired','Closed')
							and (sso.hnsordsubtype is null or sso.hnsordsubtype not in ('Circuit Deactivation', 'POTS line deactivation', 'VOIP Deactivation' , 'Wireless Deactivation', 'Circuit/POTS line deactivation', 'RFP Prequal Survey'))
					)
					WHERE R = 1
					ORDER BY DATEFSOCLOSED desc;

                Update hns_financial_usf_t set site_type = SITE_TYPE_VAL where rec_id = USF_SITE.rec_id;
				COUNT_VAL := COUNT_VAL + 1;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    PREV_NONE := 1;
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':1:'||SUBSTR(SQLERRM, 1, 250));
					when OTHERS then
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':2:'||SUBSTR(SQLERRM, 1, 250));
					PREV_NONE := 1;
            END;

			IF mod(COUNT_VAL, 5000) = 0 THEN
				Commit;
			END IF;
        END LOOP;
        Commit;

end POPULATE_USF_SITE_TYPE_AOBJ2;

/
--------------------------------------------------------
--  DDL for Procedure POPULATE_USF_SITE_TYPE_UF
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POPULATE_USF_SITE_TYPE_UF" 
(REC_ID_VAL IN NUMBER)
AS

    --REC_ID_VAL NUMBER;
    EVENT_CREATED_T_VAL1 NUMBER;
    EVENT_CREATED_T_VAL DATE;
    SAN_NO_VAL NUMBER;
    SITE_TYPE_VAL VARCHAR2(255);
	PREV_NONE NUMBER;
	COUNT_VAL NUMBER;

    CURSOR USF_SITE_CUR IS
        SELECT rec_id, event_created_t, p2a(account_obj) san_no
        FROM hns_financial_usf_t where rec_id > REC_ID_VAL and ps_purchase is not null;

    BEGIN

        SITE_TYPE_VAL := NULL;
	--REC_ID_VAL := 0;
	EVENT_CREATED_T_VAL := NULL;
		COUNT_VAL := 0;

        FOR USF_SITE IN USF_SITE_CUR
        LOOP
            --REC_ID_VAL := USF_SITE.rec_id;
            --SAN_NO_VAL := USF_SITE.san_no;
		select u2d(USF_SITE.event_created_t) into EVENT_CREATED_T_VAL from dual;
			SITE_TYPE_VAL := NULL;
			PREV_NONE := 0;

            BEGIN
                SELECT SITETYPE into SITE_TYPE_VAL
					FROM (
						SELECT ss.swsitename SAN, sso.hnsorderedsitetype SITETYPE, sso.SWSCHENDDATE DATEFSOCLOSED, DENSE_RANK() OVER(PARTITION BY ss.swsitename ORDER BY sso.SWSCHENDDATE desc) R
						FROM sw_service_order@IPINTF sso, sw_site@IPINTF ss
						WHERE ss.swsiteid = sso.swsiteid
							AND sso.hnsdateinstcancelled IS NULL
							and ss.swsitename = USF_SITE.san_no
							and ss.swaccttype <> 'Physical Location'
							AND SSO.SWTYPE NOT IN ('Quality Audit','Abort','Permit','Repair','Electric Anti-Ice','Site Survey')
							and sso.SWSCHENDDATE is not null
							and sso.SWSCHENDDATE < EVENT_CREATED_T_VAL
							and sso.SWSTATUS in ('Installed/Repaired','Closed')
							and (sso.hnsordsubtype is null or sso.hnsordsubtype not in ('Circuit Deactivation', 'POTS line deactivation', 'VOIP Deactivation' , 'Wireless Deactivation', 'Circuit/POTS line deactivation', 'RFP Prequal Survey'))
					)
					WHERE R = 1
					ORDER BY DATEFSOCLOSED desc;

                Update hns_financial_usf_t set site_type = SITE_TYPE_VAL where rec_id = USF_SITE.rec_id;
				COUNT_VAL := COUNT_VAL + 1;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    PREV_NONE := 1;
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':1:'||SUBSTR(SQLERRM, 1, 250));
					when OTHERS then
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':2:'||SUBSTR(SQLERRM, 1, 250));
					PREV_NONE := 1;
            END;

			IF mod(COUNT_VAL, 5000) = 0 THEN
				Commit;
			END IF;
        END LOOP;
        Commit;

end POPULATE_USF_SITE_TYPE_UF;

/
--------------------------------------------------------
--  DDL for Procedure POPULATE_USF_SVC_CHARGE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POPULATE_USF_SVC_CHARGE" 
AS
	AMT_VAL number;
	COUNT_VAL number;
	EVT_CT1 number;
	EVT_CT2 number;
	CURSOR USF_CUR IS
	SELECT REC_ID, ACCOUNT_OBJ, EVENT_CREATED_T, INVOICE_NUMBER FROM HNS_FINANCIAL_USF_T where service_charge is null;

    BEGIN

        AMT_VAL := 0;
        COUNT_VAL := 0;
		EVT_CT1 := 0;
		EVT_CT2 := 0;

        FOR USF_REC IN USF_CUR
        LOOP
			BEGIN
				--get Service charge
				select d2i(trunc(U2D(USF_REC.EVENT_CREATED_T))) into EVT_CT1 from dual;
				select d2i(trunc(U2D(USF_REC.EVENT_CREATED_T)+1)) into EVT_CT2 from dual;

				select AMOUNT into AMT_VAL from hns_financial_t
					where ACCOUNT_OBJ = USF_REC.ACCOUNT_OBJ and INVOICE_NUMBER = USF_REC.INVOICE_NUMBER
					and service_type in ('/service/ip', '/service/dsl')
					and event_created_t  >= EVT_CT1
					and event_created_t < EVT_CT2
					and taxcode in ('IS','SH');

                update hns_financial_usf_t set service_charge = AMT_VAL where rec_id = USF_REC.REC_ID;

                COUNT_VAL := COUNT_VAL + 1;
				IF mod(COUNT_VAL, 5000) = 0 THEN
					Commit;
				END IF;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    --PREV_NONE := 1;
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':1:'||SUBSTR(SQLERRM, 1, 250));
					update hns_financial_usf_t set service_charge = -888 where rec_id = USF_REC.REC_ID;
					COUNT_VAL := COUNT_VAL + 1;
                                IF mod(COUNT_VAL, 5000) = 0 THEN
                                        Commit;
                                END IF;

					when OTHERS then
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':2:'||SUBSTR(SQLERRM, 1, 250));
					--PREV_NONE := 1;
					update hns_financial_usf_t set service_charge = -999 where rec_id = USF_REC.REC_ID;
					COUNT_VAL := COUNT_VAL + 1;
                                IF mod(COUNT_VAL, 5000) = 0 THEN
                                        Commit;
                                END IF;

            END;
        END LOOP;
	Commit;
end POPULATE_USF_SVC_CHARGE;

/
--------------------------------------------------------
--  DDL for Procedure POPULATE_USF_SVC_CHARGE_SUMM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POPULATE_USF_SVC_CHARGE_SUMM" 
AS
	AMT_VAL number;
	TAX_VAL number;
	COUNT_VAL number;
	CURSOR USF_CUR IS
	select invoice_number, usf_billable from  HNS_USF_AUDIT_SUMMARY_T where invoice_number != 'PENDING';

    BEGIN

        AMT_VAL := 0;
        TAX_VAL := 0;
        COUNT_VAL := 0;

        FOR USF_REC IN USF_CUR
        LOOP
			BEGIN
				--get Service charge

				IF USF_REC.usf_billable like 'YES%' THEN
					select sum(hu.AMOUNT) into AMT_VAL from hns_financial_t hu
						where hu.INVOICE_NUMBER = USF_REC.INVOICE_NUMBER
						and hu.ratetag != 'Tax'
						and hu.taxcode in ('IS','SH')
						and hu.account_obj in (
							select account_obj from hns_financial_usf_t where invoice_number = USF_REC.invoice_number and billable like 'YES%');

					select sum(hu.AMOUNT) into TAX_VAL from hns_financial_t hu
						where hu.INVOICE_NUMBER = USF_REC.INVOICE_NUMBER
						and hu.ratetag = 'Tax'
						and hu.taxcode in ('IS','SH')
						and hu.account_obj in (
							select account_obj from hns_financial_usf_t where invoice_number = USF_REC.invoice_number and billable like 'YES%');
				ELSE
					select sum(hu.AMOUNT) into AMT_VAL from hns_financial_t hu
						where hu.INVOICE_NUMBER = USF_REC.INVOICE_NUMBER
						and hu.ratetag != 'Tax'
						and hu.taxcode in ('IS','SH')
						and hu.account_obj in (
							select account_obj from hns_financial_usf_t where invoice_number = USF_REC.invoice_number and billable like 'NO%');

					select sum(hu.AMOUNT) into TAX_VAL from hns_financial_t hu
						where hu.INVOICE_NUMBER = USF_REC.INVOICE_NUMBER
						and hu.ratetag = 'Tax'
						and hu.taxcode in ('IS','SH')
						and hu.account_obj in (
							select account_obj from hns_financial_usf_t where invoice_number = USF_REC.invoice_number and billable like 'NO%');
				END IF;

				update HNS_USF_AUDIT_SUMMARY_T set service_billed = AMT_VAL, tax_billed = TAX_VAL where invoice_number = USF_REC.invoice_number and usf_billable = USF_REC.usf_billable;

                COUNT_VAL := COUNT_VAL + 1;
				IF mod(COUNT_VAL, 1000) = 0 THEN
					Commit;
				END IF;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    --PREV_NONE := 1;
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':1:'||SUBSTR(SQLERRM, 1, 250));
					update HNS_USF_AUDIT_SUMMARY_T set service_billed = -888, tax_billed = -888 where invoice_number = USF_REC.invoice_number and usf_billable = USF_REC.usf_billable;
					COUNT_VAL := COUNT_VAL + 1;
					when OTHERS then
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':2:'||SUBSTR(SQLERRM, 1, 250));
					--PREV_NONE := 1;
					update HNS_USF_AUDIT_SUMMARY_T set service_billed = -999, tax_billed = -999 where invoice_number = USF_REC.invoice_number and usf_billable = USF_REC.usf_billable;
					COUNT_VAL := COUNT_VAL + 1;
            END;
        END LOOP;
	Commit;
end POPULATE_USF_SVC_CHARGE_SUMM;

/
--------------------------------------------------------
--  DDL for Procedure POPULATE_USF_WRITEOFF
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POPULATE_USF_WRITEOFF" 
AS
	AMT_VAL number;
	COUNT_VAL number;
	CURSOR USF_CUR IS
	select rec_id, item_obj from  HNS_FINANCIAL_USF_T;

    BEGIN

        AMT_VAL := 0;
        COUNT_VAL := 0;

        FOR USF_REC IN USF_CUR
        LOOP
			BEGIN
				--get Service charge

				select writeoff into AMT_VAL from item_t i
                    where i.poid_id0 = USF_REC.item_obj;

                update HNS_FINANCIAL_USF_T set usf_writeoff = AMT_VAL where rec_id = USF_REC.rec_id;

                COUNT_VAL := COUNT_VAL + 1;
				IF mod(COUNT_VAL, 1000) = 0 THEN
					Commit;
				END IF;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    --PREV_NONE := 1;
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':1:'||SUBSTR(SQLERRM, 1, 250));
					update HNS_FINANCIAL_USF_T set usf_writeoff = -888 where rec_id = USF_REC.rec_id;
					COUNT_VAL := COUNT_VAL + 1;
					IF mod(COUNT_VAL, 1000) = 0 THEN
						Commit;
					END IF;
					when OTHERS then
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':2:'||SUBSTR(SQLERRM, 1, 250));
					--PREV_NONE := 1;
					update HNS_FINANCIAL_USF_T set usf_writeoff = -999 where rec_id = USF_REC.rec_id;
					COUNT_VAL := COUNT_VAL + 1;
					IF mod(COUNT_VAL, 1000) = 0 THEN
						Commit;
					END IF;
            END;
        END LOOP;
	Commit;
end POPULATE_USF_WRITEOFF;

/
--------------------------------------------------------
--  DDL for Procedure POPULATE_USF_WRITEOFF_SUMM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POPULATE_USF_WRITEOFF_SUMM" 
AS
	AMT_VAL number;
	COUNT_VAL number;
	CURSOR USF_CUR IS
	select invoice_number, usf_billable from  HNS_USF_AUDIT_SUMMARY_T;

    BEGIN

        AMT_VAL := 0;
        COUNT_VAL := 0;

        FOR USF_REC IN USF_CUR
        LOOP
			BEGIN
				--get Service charge

				select sum(usf_writeoff) into AMT_VAL from hns_financial_usf_t hu
                    where hu.INVOICE_NUMBER = USF_REC.INVOICE_NUMBER
                    and hu.billable like USF_REC.usf_billable||'%';

                update HNS_USF_AUDIT_SUMMARY_T set usf_writeoff = AMT_VAL where invoice_number = USF_REC.invoice_number and usf_billable = USF_REC.usf_billable;

                COUNT_VAL := COUNT_VAL + 1;
				IF mod(COUNT_VAL, 1000) = 0 THEN
					Commit;
				END IF;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    --PREV_NONE := 1;
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':1:'||SUBSTR(SQLERRM, 1, 250));
					update HNS_USF_AUDIT_SUMMARY_T set usf_writeoff = -888 where invoice_number = USF_REC.invoice_number and usf_billable = USF_REC.usf_billable;
					COUNT_VAL := COUNT_VAL + 1;
					when OTHERS then
					--DBMS_OUTPUT.PUT_LINE(SQLCODE||':2:'||SUBSTR(SQLERRM, 1, 250));
					--PREV_NONE := 1;
					update HNS_USF_AUDIT_SUMMARY_T set usf_writeoff = -999 where invoice_number = USF_REC.invoice_number and usf_billable = USF_REC.usf_billable;
					COUNT_VAL := COUNT_VAL + 1;
            END;
        END LOOP;
	Commit;
end POPULATE_USF_WRITEOFF_SUMM;

/
--------------------------------------------------------
--  DDL for Procedure POST_GG_UPD_ENT_DESC_MAP_NODE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POST_GG_UPD_ENT_DESC_MAP_NODE" 
(
days  IN NUMBER
)
IS
    --descr_id       ent_descriptor_mapping_t.descriptor_id%TYPE;
    --offer_id       ent_descriptor_mapping_t.node_obj_id0%TYPE;
    --pack_id        ent_descriptor_mapping_t.package_id%TYPE;
    loop_id        INTEGER;

    CURSOR get_ent_desc_map_cur
    IS
        SELECT edm.descriptor_id, pp.poid_id0, pp.package_id
        FROM ent_descriptor_mapping_t edm, purchased_product_t pp
        WHERE descriptor_id >= 1822169
        AND pp.node_location = edm.node_location
        AND edm.account_obj_id0 = pp.account_obj_id0;
    BEGIN
        Insert Into Ebi_Audit (Total_Count, Ot_Count, proc_name,Start_T) Values (0, 0,'post_gg_upd_ent_desc_map_node:START',Sysdate);
		COMMIT;
        loop_id := 1;
        FOR ent_desc_map_rec IN get_ent_desc_map_cur
        LOOP
            --offer_id := ent_desc_map_rec.poid_id0;
            --descr_id := ent_desc_map_rec.descriptor_id;
			--pack_id  := ent_desc_map_rec.package_id;
            UPDATE ent_descriptor_mapping_t SET node_obj_id0 = ent_desc_map_rec.poid_id0, package_id = ent_desc_map_rec.package_id WHERE descriptor_id = ent_desc_map_rec.descriptor_id;
            IF MOD (loop_id, 500) = 0
            THEN
                COMMIT;
            END IF;
            loop_id := loop_id + 1;
        END LOOP;
        update ebi_audit set total_count = loop_id, end_t = sysdate, proc_name = 'post_gg_upd_ent_desc_map_node:DONE' where proc_name = 'post_gg_upd_ent_desc_map_node:START';
    COMMIT;
END post_gg_upd_ent_desc_map_node;

/
--------------------------------------------------------
--  DDL for Procedure POST_GG_UPD_EVT_BAL_IMPACTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."POST_GG_UPD_EVT_BAL_IMPACTS" 
(
days In Number
)
Is
	--obj_id		event_bal_impacts_t.obj_id0%TYPE;
	Offer_Id	Event_Bal_Impacts_T.Offering_Obj_Id0%Type;
	--Node_Loc	Event_Bal_Impacts_T.Node_Location%Type;
	t_count		Number;
	o_count		number;
    CURSOR get_event_bal_cur
    Is
		Select Obj_Id0, Node_Location From Event_Bal_Impacts_T
		Where Obj_Id0 >= (select d2lp(trunc(sysdate - days)) from dual)
		and product_obj_id0 <> 0;

    Begin
        Dbms_Output.Put_Line('starting proc: '||Date_To_Infranet(Sysdate));
		Insert Into Ebi_Audit (Total_Count, Ot_Count, proc_name,Start_T) Values (0, 0,'post_gg_upd_evt_bal_impacts:START',Sysdate);
		COMMIT;
        o_Count := 0;
		t_count := 0;
        FOR eb_rec IN get_event_bal_cur
        Loop

			t_count := t_count + 1;
			--obj_id := Eb_Rec.obj_id0;
			--Node_Loc := Eb_Rec.Node_Location;

		Begin
		select poid_id0 into offer_id from purchased_product_t where node_location = Eb_Rec.Node_Location and rownum < 2;
		EXCEPTION
		When No_Data_Found Then
			Update Ent_Descriptor_Mapping_T Set Node_Obj_Id0 = Eb_Rec.obj_id0 Where Node_Location = Eb_Rec.Node_Location;
			o_count := o_count + 1;
			continue;
		END;
			Update Event_Bal_Impacts_T Set Offering_Obj_Id0 = Offer_Id, Offering_Obj_Db = 1, Offering_Obj_Type = '/purchased_product', Offering_Obj_Rev = 0
		Where Obj_Id0 = Eb_Rec.obj_id0;

			IF MOD (t_count, 100000) = 0
			Then
				update ebi_audit set total_count = t_count, ot_count = o_count, end_t = sysdate where proc_name = 'post_gg_upd_evt_bal_impacts:START';
				COMMIT;
			End If;

		End Loop;
    update ebi_audit set total_count = t_count, ot_count = o_count, end_t = sysdate, proc_name = 'post_gg_upd_evt_bal_impacts:DONE' where proc_name = 'post_gg_upd_evt_bal_impacts:START';
    COMMIT;
    Dbms_Output.Put_Line('ending proc: '||Date_To_Infranet(Sysdate));
End post_gg_upd_evt_bal_impacts;

/
--------------------------------------------------------
--  DDL for Procedure PROCESS_TMP_AR_ITEMS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."PROCESS_TMP_AR_ITEMS" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
22e9 9b6
tVJmWGMaRqlw/EJ+02VvLlRhIRAwg82jVSAF3y+aCtLqpWNLkE0mtz96ITL7k1F5MsJNzAmD
IvOTBm8c8bRLkAf7c4a/GloY8VaT/2GfHfzhSlYc0P46mO8xddMo+IiVEe2TVVZhumGYDwMe
srq5b/66d8Q7qfDWfHRRvTiR5Dc6C9XjaYnXxnV7DbPSx186zo0M7VgMlvyONyR+C2cIXAG0
2RaVzJclcEo74H5wmPR5TC0UE4Ikak3k+t5QBfOrh8DliRpIVIwKCb7D54xdfg4G1eh38PG9
Ofrkb8UkWgZWPRT4K9IlPplVNneEW01m5CkvjYBlfMOY0huNJEgGKjn2Lt7PqZyhPRUMOsRw
d2BcfCczaQJM/VwDccfTY4Jvoj7o6khUsEVXQq16vjAym5vXLxtNUqV+/OiT4JNcPzUYwVZm
jVrDWFCdMHMjDhq2GrJhPUjyAX0STwVxQcLehdN6kIRKIdGIor3oPhNGuXfC1EZGtPBXnPT9
GwQW04pjRmXTOOKkLmJIjT7oQ6h2OisQFHNa7BsIa0Chghj9sZdbOtvg5wmyYNN24aEvN28c
9HB7fXQhcY3BH2rupXFeyS27YS+8d0Z/vc/7uo97Sy9dQNAz3ELH3gUzBK7WhWFdLNV10v6m
yiP+HIGH5Lw0mLoiz5OBORaQONx5zHhafMeGV3R6yEqiWYVQwQvXBlfgU7DOa4EnQtmfquIf
Eb7p2QcTPckDUzGBwMKJyXX4aOFOa3AVPV/P0b5j+S5Slxprxm4QJZYLViNK5b7uyuL2WPz1
KD3I2WnwbFuNhFp8CtRKG/GoC3xl5mMOCfPh5fIgqcmnddvvRhNR4QfLxe9PL2rlj27Wl8gb
fsVxZjmVt+wnrFktOTsrDEmc6Wp6nISMvmIJ1uc/Kqa/aZQ7pKFUt0WelUoagg4JL5QOTVRc
plzYk+augPrJEWnlWnwia5FBE17XhiAk/3yglOhEs+c9mPscUU96dk7PhRfp42fUUKJDLl6D
w3w1WoNqE9cn1mFt2oX0Q2rq0gEDRYDFv7TLEDfMkPKMHJIz8K4MvYbIMWRteLjIlyZ6t/Wb
HhG2e28WisoCBSr+7HBiVboONN5aQ/5g2jxRQxJ1CJKLyYHOS7criZ38YNj6K8Q4OOksEmvV
gU4YFRa4IZDGRaPhx/IOeNngp0GNhUEIZNnPIpVrmbKcuV3yAmH3TAVWt9q7LP1Y3Q6h9p/j
8Md0USV75SB+h1kJdQMUlCFFW3RJEdJZ551GaTbTahTp+inTjhQVYmCJumzZ2k3XwKk8MTQo
yYhdrkDCm/Al5vlWRv2lDfVlVC78DmdfbTb6Y9oF1pcSzFu+NCJBQ+12aeMfrICdLG4pohLQ
5UNZ64jDu2CNq3hnRrmoGNbjOjDA35nTyst6OTRUbzWbtizYynBG8VZghnIlgxfNOcuXWLj0
+cYsaVRwrFBu26YPEuYJRiNaWlZHgq8meAUsvnaf1bjhU0eD1z5lbrV/5lw0jVL8yoLZRlZQ
ERCeCRSPn9DKcg5tti5uFMsbTQ/pvvMhbc/EcwaSM9DGzbk/CEuCI2DO44dvjM8B46COUsqr
9LtebKAeqoXTSoiMBswoGMpGOyp0/MZe9UqbJeCJjZ+ZPvBqGlzQBUOfc1O6drCi+l2rpoCV
C/B9+MUNTIqfv23R/97SRkpR7yqqh56YqtwI7a0RlLpb+GmXizn2O76p2CVxTHxneeKVM/ib
j46liCLsuwpo7uQyVb9FHH2IlIzhIoEBAFYpk44K1kPyVpADO494ntYPUpRhkWMnA5t9qbbD
+vyHaHunxO+ZaA6EWQjQJ1fLs5ONHZjcR0LehQJkpM4y7HIAYq9xV1PrGjTpKaOe0N3iaq1m
t0IP6AXlFIFOGTNVEkE7ehlFlD625wwHWXpyehg1SDNSYOZuU6grPrOc9+tCnRLbp8QF4v7j
8Ls37WT6cmiXKe2QvlVeiF57gK1hKbghZT46I3op0+S6OZmG5H0WltrPPUEDxiDLeyxxg4B4
EYs+kgXMKbB+IUHdoIS9+owlFr7li54lsCGigfKT1qxJTVGuaEfToy6Cx7q0bFX1loGCsT+R
4muLkbfHbVle0RKj7KSFZYSlDJi633YFk7+XSjzKsW6YolMxVLV0m7XJNTcO8oRx0RZAmj9x
GrXZEjuMXjUim7YY5MPRFL1Ie4UvF2s6xEjZGEDM6Towl4t13C1KRByw0VMbKbHmpw/aTJpM
JGhWtLHX/FJVCkAN50drC7/1aT4l8NU7CW+4QVUEy/YXGUopn8cScBP//2SORmoLfOovLmsL
pdv5seRCoxhr7B6ry/vpM6FaRRZPLgzzijwAkFM5ha6A8E7bxz9XF3538CyVK3NThvKY+Pk7
2YvNTZAFmu1MabEti0MVhpIzo2hiBLWGRs0rfgNFmAvQ9mGE/OBr6ryg87vM/tX9+YHZD1Zv
IEE=

/
--------------------------------------------------------
--  DDL for Procedure PROC_CYCLE_DEFERRED_TAX
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."PROC_CYCLE_DEFERRED_TAX" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
13d4 526
5g9wbqVKxaiWYE/WmE4fnjhMg9Qwg83quiAF344ZCtLVtLC0qS/1+zNljCiJogp+AQnKPnJC
ZhghYns2zS/Y3TO7v8s+8onesYNADfsr2ggCwaVxvLtx8dz6GD3t4F3Exq6/M7lymAcS+DP5
VXOGhnO6+PgTJCutiBxowgC21J/xsWHR+jDR5Jh9v2xe6VEgSNpgUYBQml5c7Rr86FfNN7Fy
nCO4khjNlh6cNHm3Nm8pxpPPPtYpYIndZijM4fQ/3xa5JqiT1ETkBDx003lN4XVe+7YywHpC
4iNjdU1IVbFU9Ni9PUJBs+XxAN3V2eqTyHmbR1DWPRCxDW4+SROiEgUJec9NGxO9EQGrmM2y
iYOh95gw8sq0qPMOHdFh01XGIdyrCQgbXG0qpqOcQDtICqcp27yU9cbCfo8wMsdO6yPxsshy
jOWOjEBEhbDH18XvXNtgL4HskzE8p9/w4LIqcZ4Fl0Dq77YkncokSOerJjE8ZpsFp9+TVqq8
+gw8uPtGbHKGHdej4wKi2+CNbxTooMrw8RB4vcagwMHq1LHB6nP6vaVrq4Kaf99hYVzAgECo
NT9C+nCe8JBOZlg5E3r7tiUgbgB5K/cprHQNnRldgCac5HvFs+GdcsXHewhE9PcX7oWcZk1x
xvqtiTkNacMY3rL3ziUVmVRZziKO3KnAPHznVXoEoHse0MxsRsKuuNwM2hGTLNs0Rh2yjIjb
TcoiZgnLoDb5lx6INU44gOkAKaTvNpKprkdjqpKD1+EkYKMkTiukXPVbHWTNMex0cJUuL+Fk
GrTgvoHsmWdVRRKDbN+JiYJGvoR06ghIA50/kuTOCNdqB9C7ZA6kMWvgpN9rncXjIXBntjCU
HLS0JG8PxkRBTIb+zM7yM/JQb8XIp2IKs0upsX8LvGyzIQc5W/VbH8qj6XH3Fy98zspDBwcH
Cio1q+Z8hzJvUAOZ+z1xmOM8MCS0+nvOmXDDNTLlDtvFESDMt5RSezFSluAHskQhO4nH0Ev0
S9IGM2JRbMN26uvhA7ATSSHyZXWnBG4q6/qhYP/LeXEoiMAuzm8e/a2jkOq/R2Shl0RQOfPq
Ph+ZTeertaZIv4FtyCONNrFETddrWElFjPwNPZBDQDgFJR3Ww4yOBqnALIZlqtg9igr1lzob
WNCDIDE+CCVT2Kr0hmwct2zSDatbVZXSbiBuCyP5EP5HcId30e6L83HGpII/q+WSIH4YCP4k
SEC72ob0il+7mQujBJzOEubZ2/DltVXFOjn27ia7RscDJE8i7lucbq7ZY02lDw8jtOSlHzmT
vFI=

/
--------------------------------------------------------
--  DDL for Procedure PROC_DEFER_CYCLE_TAX_ACCT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."PROC_DEFER_CYCLE_TAX_ACCT" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
b98 4bc
HvHhXJQu2V29DeIet9iE2vzbgjgwg/ArDCAFfHQZPfmU5q7LyTb6MhCmYUcaq3b6yEMi3Ob3
MrD7/RgcYaokCfGkOvffEYPFFOk/FCTMJ6AGaTKrtE/EmoD4hoHBHhMA+dr5Iw27lqrN2QjO
/8IhzEO/1eWyttMkOTMOTiHeLmvwKguohSfFJzf9Y82sQL+j1l1yC94+/IPRYFZTMbq9rgNN
6DDCebEhDaYAvxtd3GJXcS1RLuuiHYDp8TYpgaZUoUvRgGFNFc+Lnk5N/82oPZtBErIX70JD
EQ/sRz9xPrpjiJrJaEGrhgrdzmnkvFa9xMwIWwOhKe8eUikHsrcVgP1vnizeco11z9GxMKAg
K4sRmhr/hhBOCcbasA2Hf7PCiSPMjESErmkYKkNHXERdvs3Lk0TSYu+NZM+Mouk+wVmfMpAD
Bg573n5E2t3x6q0F2CuKlwxkm4X2OzDMHffAsD03y4fn8Jkho/YRXLCtDk5uRDGp6B9ZjPdT
tdfmGwtuGgjz12stkH4RFqBiw28cZ+xvurkvFND+qbfhC9IAYq964VrJG1gD4W0RPNtFh6DA
HBtEwMiGd++hrgohcO/wfLjK4SOC4RfZUWEGUMokvUmJ956d6PugDCJtyJotRNNmJ2WRUhh4
xILy4nUlGblfxrYAJE4EhZK+xuNTT5KK3s+be2F+RhQj2LvpbTPhKHgzJrdXdMiAU9U2dcf0
VWgtLhpKzoUv3Z+kLo1wbDziMVyhgKHFhkpGjIAabHHENiWBxICDxli0WXfgABMh+5dZIld2
LjtwAPFE2VZtpj9HdYWlC9RWEnFwR4jQgtRfzdGKeYvcC9TkJDZEmKSSHyipsItvW45FF7YI
Lk2JnQxNAkiPWOKVpAU9j9qgkSak7UdYOgR+dl3RVP6/tPrB55c2oXw+IZ1J1vs9i3roqaiy
qitaYjfWv2RcsUubQjg8rujSMqMVh4X5yzNy56fPhLEIpO1b68Ti22rDDZNaYhcIaueWRL9P
WeffBERmvj4kQ0dwjlPzrRiL1PondShJbtp+AhKt7h3g3R+pgYB7F1K9cxC2AJnAbyyoIHYs
JHh1lpe7UTaW2cjACo0nCb+1OihMID8ak6i6DnHzMFx1Zv3ATlVfwLDje0V+MnXwoBha7vKD
x/smLysPMaeO0qDKIVPoATZGJE6rdkqsx8dzQySrBgX9

/
--------------------------------------------------------
--  DDL for Procedure PROC_DEFER_CYCLE_TAX_AR_ACCT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."PROC_DEFER_CYCLE_TAX_AR_ACCT" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
17f6 656
jaNR4X2B9viSAOC4kW0jlkNilr4wg81UVSAF3y+aCtLqaJIUDaz2+AHdm/uF0824yGw3UeyS
9IV6IBK0PNF5N82dmqTpl45sSRyjfh2LFDKJ+Aa7IjC/XGLlX0M7cKX5CFWHc7jOCKVNM6q5
qq1N0CiqTQeAgUuaqkYWdOU9vxjBx49s+VphOGa91mDo5sWtFMJl/qGy2ZFsdzZJ9gJwAWH9
Ceo0Fndd9N4beOWRIICwl9I7J4NF0Ve2Cws0cerrOdmfCoHDYdmePFdHBCUbdB2vZXee4YTt
/O0m8uj1pnDxAv9KiJu8e2OE2N6Q2q/cQXd/WyN7TS5syrqiWHvoTU4EwiKyQC85NehuetLA
h29+22kjdQKHr9k39qpmvUrtXvNsjOuopH3wUfx9Qjik/PDvHieSa/A3eC8JfZmJyp20GHKF
KdiXiJNIg3mJgpLVZisf+EUGrb5uZzFv6eEpYScMJsBhyQROejdCdmptSpJmUthvXKfgoUCv
o8O6RdaLkc9nWFhwLj0YX2t5pJFRgXBWryRfhTMPkXaIFRTcv1FoPOVi9ifzLmrAlRlLCd91
wPDKU50LtHildBMllLf+X43KAMaolQSXiI2QbJWDrB8ssjGBaGu0wp6y3wa4+mHDqZAEN14K
oGnPugsQ09xhwFTOFxFn9sHvWzpiWXfKURs1uEw0vIhckXSNfV3cVHorwcdvLjsiILMmBRd5
g8Uio6TyPDQam3VVCDlDrYdIR1664ILde+Zix91Tp4+Sb4vLBSaAZ6ZtWOtcX45PKZHB1UWh
AWyB8FBD7ri9sbI3dzoNWs2tQV/GiwPDXxLwNYJR/t9b8NlaKBFgZRh2X64f8O/O9bNZum4W
7LZvgOmCidqC7fe8yJJqEF2CYYeGreSyapn11jvlcqeUdNw/SqHP33U+eHC6UB6cZI9zsCgk
CihPvLWkPxKwPwB6+fWpnGSvoF47KM6UNjJFXsDqC9C6R8FOINMWJWDLQFwGWpjSBPW7fR5n
5prL2M0LUjJUVSMp7CtQc8IIn2qUe9AcUgSFul4Ln1cTFDAJsZBpeOLQZiaFuVqmjQEFaQk5
WUMCMCJExHKAIJHuFDzWNZWL3OS3rMQzS1DP2zDprTlw7+VhQD1I4JEjasuxH5jtVpYF2QES
vn6WnM1DmrSHp7UmzQE6xGGcQ7X1En9PXgyZ/7cRej2nufVEvwTU7Sk/4GCGAmcgvV4+HjLu
XdSCyhL2obAFeCawnNMDjXUIHN2O/2RPW6tCWia8QkLUrIsngd0kxmvrs058KfP5ldDQT6NO
1PZom24qSDqVPFNyg9grfmrZfH28mP6jL89tYSlj93MZfN6WwZ7ayRmi1O02aLEwV86B/48N
yIeFoJ4Al3PiUJlYBbsEwEBqzOUs4eO2sfW8ObU7pOmuGe7SYYfYCNQe/qkxBuOapsQQADez
qqtuPXz7xAcbjx8YpyTZcwPkJJamXaPMXDJNvw65BytuSNg+h99fcemPQsXrheYC0TFKHvVR
uG/ROIvvAK3phPMofiZwY3Ww6kvKOXmcRosYwuHYEbSi5JyczrXvCLEK+av60o9wJXiihBXo
8clYNJL8lkKDmE8=

/
--------------------------------------------------------
--  DDL for Procedure PROC_DEFER_C_TAX_ACCT_OND
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."PROC_DEFER_C_TAX_ACCT_OND" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
c6a 4e5
RBxICTPZNdEAQT0eGc43smQ4+dgwg/Ar2Uhoe3TtuvjV4+J6TX9aYcShpiRXtkwwVoSnE59s
jt6Yfm1RbT/5bGwxhJ3xyrc3B3pRFkELCZCzlDzWNc6B+MED+JLN+MSauTFzOpuxEEI/+YY/
+c6ek+x9mySw/P1pYhBWQbNd3iUFFVQXwWB+HmMmxpcnht96PXB0YT3Bvg3DLobfv34YGXu7
hzbFxRKfGZi4tAa3Hgfi9o7sgdHlACnNkKDMF/7hXabpT+j0rxh2odM7LOhq/G+QZCh+RU1v
9gcQJRL2tA3ti7OPudyvrbqcGwokroRkssPEk0PiGkAJZyrzeDwbJm7KSKxiEbZ9rXnrrK3e
4Z3KLjDfBPMZACU2kdAc/xcTTzFFlOngVayMOkUqLsBD8bAdTRwJiy2oNmkUVj332Qkpq63A
JHHCqzrq1OLdo7Bc14D/a6TsGwcGUQc8RauuWvU9rWh2y6XRVJpDZieMClE1b9L6fZmdpVL2
I8pQs3BkW16oRHKog+h+YGrAeN/QtZN6+nquM0akzWPHhAVSgvwS2KQ/2zwzGplPNZvS43dr
EdD369PNtuCZn1LAFk3jM4UYpC5bLDjMyk/CekVLX5cMC0iKzG+W2CWmhl1xkyHcTHvTf8H0
Y7izciEbzShP9EcscIRGiSodNRwIuT9s+h0Rtrja82Sbz2Lgjh4e8wK4D/Ctl86rMkqKw9mb
VyLlQaUYe6YIIaB3WlqAoMVISzzTaADd8LiZAOFsuBKOpD5Rd7O3TJzkxQ2DkuoV2YQwrWQS
3CVO2sl7uQPdVmj8U/whf42NEJ5X9n7zAAPpkaf0Ng8rX6a82HXN4/0YMfRTCUd2/mBIFy6o
mSpo5U/YpM0a2n73sFBqACotfwKBI9Aoszf/NHjTuTjWYy8hMQ8DyeTKCkCwtlzyENvIi8+K
zY+56AjFpgImHDEuNLRr/rCbLl+dyxqi6RCSftJQNTpCCyFW7HvX5NNy5aTBEFPCZ5uWlY3+
N4KD9/zxh7xFcqL5rYUMdrLTJNZvUW5nzM8/ZVYy3zdRQaLKs/biTSawcccAs0yVD4t9FdNk
1a3b29TfyNbDYMubVnEMUv6FNbysOGsUMYZ4Ku4AIOUVE5elYXu4RKs7mHfZes8wuEDJKcMF
7+pGSsMfYYXonjYZ6QIwgO/UU/RMnE9GP8/ugD3IEQbrElMBWw+jV/0ji4D3Wn1+6VyT5aJz
7k+1+2yyjgk=

/
--------------------------------------------------------
--  DDL for Procedure PROC_DEFER_C_TAX_AR_ACCT_OND
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."PROC_DEFER_C_TAX_AR_ACCT_OND" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
d6e 536
eOSe2ZJ7PCq5Skn3Y0GMFctIAugwg/Ar2Uhoe3TtuvjVRuJ6U9TKMRnJ4c6vWE2lVEBWeMTV
qFoFAbo2TNJODPLCLgXA0xT7drxCy+km6+WsI1DKP+3kz2EPnRC1M+BPzbuwJDMplSIAJLVh
JKrPlJPsTZu3jYHwyGL5q1Op/+saeALfPFYCUDz2zCiNzINgIT0OKqA9nGOgiS4LjIgTUXg8
Juo3GJdx2OvijujOmjOEsSrT0t9tfnLFQaHeQi1kdXais7DeUWvm6fE2KcYmkz2sMs7jTZ4t
tMVHjINOqFxowTVqSBtkcc5j+ovGs1DVYuUF2MKCJhyezC7bRDXsFI0BRy6f1RlgFrMj+gVd
S5HwMWRUhvTvbnzGAIN1+hw1w2luawKaQBSLxODeKcRsGBLiWHvnMW2JdX5QrKMHCRy9nPI9
Z/f47uw9Z7UBGps0MvI8d8DRg2vewMxxPVCrumqIyGR7H3gH1s6PYyzAbw3MXLNnTxsXO+L1
BoTJ5GcTjECHskXhX80wyjHDRxZUSe8IzpwCYKcB8dQXIbH/y3mAmSa7a2GliKPrhnFTnvHG
W91iAq1g8gx80KY7fArU6TcE7O/wihZ7U+fVz3H6NMcbiEmWsg33YKtTJYkjgsX/p+kLQw1q
qOh7a/XlfF1sA4RMq3u4WpHY8BLziFp+N3REu/65oIhy1mmDBc2iboCBO+M4uJpKhUDO13WG
WnLMnKeQft4rSijCgBL0Hqah/aNoxVfDfZTTflsMaFVt/ejJaj5LqQXvuq4DPXU6FI+FsGxN
pK8D8Gi0kYi37f/9gs+QxDDb5yDa83g0Ys0Z9Li45QyDrTtlSL9T1tuupeOv4NlPor6mnplp
pKBnH9RzvcTXVDE8CMm53JESE/gUZv2aB1kzEM/R0Xq4Fu7PYM5dF6Xp0WSwpJiYKRyROQLi
HFrwkVhrvwC+AYIBarM9COELm/re5iFZTuG+9KAwffqobyO+mmAeAn5un1sIpw0uAO9qod+/
lAsx0NoHiYmveJM3EKuzM5gF1uzTSzAP7jswsyd9ojpswGLi0SHPCIm4983Ogwgo3/fkBzE6
9n3hyXrDbNETRXK0aV2sJDgI0zL+u/zOrmDudZj2UhBRSYy4wJPKYboXCt4H/w1BCGOLQcLO
cZnQDXFGFdQNnJnchNEwlkZsEjBDrOu7pDp9V/h9Ncfsv2ul0QQZBx2oUBY9Y0ioOg8jKs7Z
r5dhW+Y2uuWZXpG24UG/QC8Bd4qyjGpihA9+P3alhnePUEZkqpViPn2vYD2PeBDC5uQmFU5p
w401fPzQteREyYPclw==

/
--------------------------------------------------------
--  DDL for Procedure PROC_DEFER_INSERT_TAX_DATA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."PROC_DEFER_INSERT_TAX_DATA" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
448 2e2
9b7gGq1Gb8Ao0lEFriISdlYSAEEwgzLD2UrrfI4BHj+VVS7FFU2k9C4KNcDxBUqoLdaGicLC
eyFnaY1RIavJfyzQIBzSr/UBwUHHLCLG3OVc48zi8z+x+CCfus+WJ7orB1FIfgNCYQUuAwhg
fgFSAiVUlM+gZux8qDVa1gx3IjerhB/JtQeCjR4vvZipdA8Faem0i9hTyyxTvPbzQU1oMmUY
V0aXer3cwuCUmwQD6zR/pX6iU8jVHG2FO/MJEOrngVAfyf58WNoZrdXm1muv57ik4CdG8U7z
DCoPG+QEwHE4NLG2EDB4ECS+/Zgl+9EC9aTgYyXzC1VJjILJTbKyUQ62ZS9SVl3x3EZYKo/z
8IGbklC98h4kRHOnf32LhLC3KEnsX/QGYEd/HpmHzotqj1zEmBY/oAKPgu8WuIPe3L1Tbzm8
eg5GisdZ3lDVWWlkdhCgidXl/QeB1w+/IJ+aFeoIxHx5Bzjg+xkqJVtaAvUuH8T02kZgjJ2D
VBQVX9AdfNfpQKew3lbmGUVKo9VVPvq0aWuyQf4IEpeyPIG8QTdNYZWCiVsWCrDX4mgVT0/p
RFUDxQosuB2WloTykyoSFkEY5S3QQ0jBcCMwla/fiVwfF11KxKrkAdnN2yYQrK1PfX8wH6fQ
BzFf/y0D8GtfZ1ZFEI4UiL6SKd9t814gg8B2amLbjAqKVmN5/PmUGqYlKSnmxHhmBkBymuRE
l0KrYw==

/
--------------------------------------------------------
--  DDL for Procedure PROC_DEFER_MARK_SP_ITEMS_TAXED
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."PROC_DEFER_MARK_SP_ITEMS_TAXED" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
21f 17d
M1arXcaoKqmtBjpHXUN5XChAUo4wgzL3zAxqfC/GEC4ilQBIyglPFwKgvp+z0WL6XBDaQArK
ZXZVHOTOG/2M4gqoL/H4Q6q1mPZxkIxIpBXitT/BLv6zgTRM/g80mgjBawW5Okv5Kd98t+E7
yaweAX60RmxFuj7FQ/SCXlzv0uEYUgtt7B6KKQ9Nn+hdvcCpiw40iYin1PKz36PzrKhxAndg
ntBJW4vcvs/eh8gAPicAGriWlR7ThLN/IyH9XTF9FNvTaSsopxovA/ZJPnFx9h98fwKQXXIo
f5V6/Ft6gwZSuFbPYC0WfLBUHa8LnqoTek3wGFkbqiTdUl+ZPmq9LgQk9lZQCPK+FzOyxjkj
G4FAI1JOmcsrQFU=

/
--------------------------------------------------------
--  DDL for Procedure PROC_JOURNAL_TAX_ACCT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."PROC_JOURNAL_TAX_ACCT" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
b25 4d9
rg4HXjTvzv2fD6jHwPR7GSCgKoIwg/Ar+kgFfC/NXJIY3txlZgT/DUodhY5s62la1lHsXaI2
vpTpXjZiUHK7uLdNYqFvugS8QgMoMvesUMK3jj+d7bx9LGSqmj8AtXeqQbUpwZycJMhj9FdB
KtW/3Vf5PqNeWLChCp4moKuZPpawUafTbBqHV6iQiYm3sC3ShexglqNW4+UqsNCCCuUwd3m/
viFfl62Iho1UG4qj5ele/FHibDuZlTax8E2I+7MmqdayjnnsG/HTkVrTlhn+973cDS45Vhw4
j04dgco89Uezwv+hJVwMubgaF7Zonr1dG+8jFpxtHFoP8chKRn1NFAB+CcjnANFaZHw+gBpL
aUp99WJPQMeta+/tk9zv7aEJeN2jWi6bq3pbkTgYGSAK6E0Fdv+6tvvzbNdrzbkDTmFTH6Tq
RRqUleSJ/VPA8Qp6AvrQXkg2PquD6KFsle2IqCCeLNNh7ecr7KXBg+7BhcOv2V9EnNFf/R66
TnlxPWBIthBvkF0R2VcBr+oRaqMNYXRvtqxyKEnF3pGdeuwUuGupvy4dEf/efhfpe3BbeR8Y
B8Vg79lA44/Lb/x9N6bzpTN8Cvw5RvVTlNRrFSx/kiMoXwtxWsH0DePJtPpXnqTG/8ZRjCvj
R88UiFOW9RgrlJsDu47HI6mQawf0zjwX2bKc+sUFUXLl9syGyevH+KKWbK2FVkcxqS332tDL
hAC4SnFYMAaoAhRJHX3tgzv4XRBac1v/st+O3OP2exoAsBALMfP8A8/doUtVH4XCHi8Sp76o
Kb9G0MkUak1JFus7tCZKAXrR+s9g7jPLHQNW67e/41a3GmLUgBZFpHEe/lFsX/s3dOteDLNM
j84hh0nV/RXinChhgMiek+DkpzDof7Z06AieVyXsCCFSnbk51l39PDK1Gc3BpjWyHYzFdDzz
XpNhWCB6aNCzzUFq0cQTSHr5AIXQQssdTU99HF1JeGYYue37lOKY148XAg0tsSQZv+2qGS1p
nXYGOcRB22SUrdukwd0Il4KHENG8KB1oBJz9qNHousVuuCkYOQ8oTwUz/KKt2IfKu2/+yZ3l
gCxYFRlaEeurZBosQTjJXzFceWZT4DSMxz9dA5yu5KqveK54jewIp+ysOOMBaxjYlsgeMU2p
n6j6fUDL0eywETB+CxRrwX8RtfV5Ua7T+GVpzc391XVlymh6o0+SgUD1RKgntUMkYjo78g==


/
--------------------------------------------------------
--  DDL for Procedure PROC_JOURNAL_TAX_ACCT_OND
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."PROC_JOURNAL_TAX_ACCT_OND" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
bff 509
+VdeWDFULEWoLA36hYjXw0JtTxEwg/ArDCAFVy8ZCtLV6K36TXAasTJ2Z+hgZbICjlrl0Lbz
ka5tUZOOTHCq+cuhAE3qCUncNv94ciDJTSuhQAGwL/k6OpLgtT9z/sHQwbszsU6qMzpDQ5wQ
cwgfkd5mlnjZ2RKPrD+yPE2bIbPoadTsOqgYwEIa94gmikBGMvJrcJqLsB8ZIZ/rC14RC+0w
OE1w6GGHRS91Bgo9TAXfdj2DmR+NaDMUlGTNBcjcjI0u3m1FK1QfQAw4/ZPHOcKCHcvLaX0h
Lo5lwsgUcwje2BiOERCoOF6i6bqZRx++sIaiBXvqAphBrLjowfqzCfv4iX/azKTCW98lrYnv
ON9Rx0ZihV9Qx2WAAq2N8z81ARQxjz7xucyINTNTuAh+t3/rugjzKWLnraaxyEUVeBRbwhWy
IqQK6E0yy8SMDPH608dQVV6f2m+uwrbUp1SoPWF63UxXvtleVM+swO+Tsw7ct/L6SXhF7dUj
Ws4tjTT1KWQNB3ICE+aJiCzmJ764GdC5nZk9RcdylS6f8siWH4lbmvcouz34wFTF5wCqvlEV
hapCUukvJal97DmFTFBX4lp7Xv6keM5slLD3AV5gpef9ejNnqefOuIctI6Ym4UjGBtulEm8S
vEltx2hp/9WxRot3uSFgkA4mqCWhCngsqkynAz4Y5dPqRnr6b0RFLc96anMEFaOahtYyUXoF
E/eCfnciBC4zMjx6HAblOFzMY84XdDj//t3LuThoePMOaYr829ttKaBy/I+RuSjwiIEsssN9
zAk0YwsskvT9oa3rj87JpGWFIssIyZN1JlIe0o1PkLMYcQ5xx14LW9VtCPI8grIo0LgsR1Zs
u5MJTT41QI7+LwVT1u2vBHwEjJJ38p9icbzXsXL/YAgefZB5gm7yXAn7NO6N1PxwwC6x10T2
0SUU5EYF0/Ek9Hfrunh5pnQniQTsOC+Ww5cJF8y/s9zwGaLAU3Jzn25kX/N3ZEB2G1BTRGBp
JM33a31BkGlqgSN14DvjLLVg5v72qpiLUFvfuHWEesSt275T3NDil3YGb3QYCOcj5IvbI/og
XO5VZXZx4PCJOx4KnmVpN4fOuPntEttxzN25PdLJ/c97zfzu6khNbdN+oG3ygQvfLpzHmArX
Gnxx9VNhrjO4vti6I0/LTva+UH0RY47ZFY4xWgt9uePJnWlc9f4oqEWwEUfP+BRq9Wklc+uA
nBDxzrFf/F2ar6+zZ7j+fQureKhY1QSC235CkoaqQf8p4A==

/
--------------------------------------------------------
--  DDL for Procedure PROC_JOURNAL_TAX_AR_ACCT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."PROC_JOURNAL_TAX_AR_ACCT" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
1770 6af
BMGFQSxR79qJGjiVCV/6xQbrNrUwg81UuiAF344Z1YHV/5sUKqz8zgHdJTbIbINra+M56Tv6
tvdElUA49kWgRJJOvzC3JhOQ0en+S10G512+T7txUZCPRGK6Ne5qhmrtkobuTob4mCQ9sJiW
/LnMVVWaqqxXZs8NXNhxpgoIgCWylN6iq1iZJpG1yDxDpU1rAl3mLmiOOy+g0Uj4sNUrXCcJ
C4eF8OUp11oKRyDD67mflIzgVl899iJiS0hksk/FSG0Y33PZYWsY6mOXeP01eL6RNCuUmkvh
MNUApBTIeMyiNmJpeqi5zjTHE7HDWFqvXZRgAc+omputHBAq18dsfdgbEjGGgrMgU6kGVtF3
Ipw8EhZFz77W48jmRL0efTkpm7OE/D9Fe0A1wuY6tjGeXdfpw5mQy97QII49qSAvPDZUHffL
DwL+g98bKTJh4psutxXf69GONBo+Ic0yNNeb9hk8CY31Ln9nAeFJM10U8HClAVjVh13nU+PY
RJ08lIvD7h04MUoDCZgkizMP1RtORV9YeN7GJzsA66oNJvJPE1ogQtUnd2PwZdtJTWoRKkUh
Yjk2T5qHzDUdc0PyW2uL0/xh5aY9r9itVtkCPQq2SSC/d6V7ItWOPmAp7WfSAbbev1lSNNBE
cRU24XZrYQ7vz8d/FYThcVRFiPQSfna3fcjCnLSwTvRT4LIJglbhVoxh1FE1U8qc/lmqL07z
IsJf4rFNB3Pmf9UfS1p+aPpByEc/StBUPNX/meOkDg+dewIoTyT54iI/+YEgMLUO+SP+zgXa
MIGr8uWyDeX1yb0xQ8QbjD5uYm9tTwlNm2Az5SKyTWpONnT/RYryfXyLAfiFTKkNKqI14JBL
qs80arjpr4aPSyyFDAeCmkNx0znDIFb3zRIS8XGO6uymWAEFfRrS0T3K220+x5jP9eb/rNvL
R1BwmbrBVu5j6m++KH66VNa0Dn7X79ffwDIA5VRVcqylIAPiz4E1zydre+qlUn74VLHGTEYS
F1dxOcPiPnb3APyw1FzVSDDrt02G7dc2eVC1rFHvGdhISIiIqDfBriG436zE2lRVM/hzWZl4
c7VaEv6wcYl97fPYqhu3OInucTMLQjplpw/Um6rfp5y1hi2KIrDof2/Jekix2bh+Z7RDt9z1
eJ4GCBqChiDF86SWR0qbGQhwGaOHBmc2B7A7/cRISPN1wk7GhkDUHQwqCQia5YYTgIU9iPl2
B4uMeEv60hUg4iKtoJ1f/rdDXjO3Q3gFrkFLZVO5kj0M4Vijy6dyusuFnQ+eGxSy30ZD699G
u6AsdK3LSJnVRTgyoorEEFv7XRdHmzpr/h+n3QNrD8OSIkUVWqcuisjj1iEwQresk4EHVbzv
wExVVrJqORnzvmCk554ZcYom5JltNs13ImQ4zuJgHUyHs6s0H/ZZkEL4Xm7Nzb9A+NLofJLG
bFQHCef7WBVL6LJzt2gk/KpRYuJXmt5WO6g5OF7luoq3YTkekmhdJHX4A06TIiNqXc6nK/Bh
zFPmBbGc3+YSuqWjwkVj43us28kPvaq/rB9hepQK/eVe1hmJvkcLLKNLfbIJAauN56d7ZA8k
RFxGL3/yduSzNf715QBs21bIHsdOSNP1hTvWg/+9ilYPS05WigSmdmfZdv4c5rZ9+LmpkiN6
OutaJARORfcY8VLLwemocqrOWzDwEdg=

/
--------------------------------------------------------
--  DDL for Procedure PROC_JOURNAL_TAX_AR_ACCT_OND
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."PROC_JOURNAL_TAX_AR_ACCT_OND" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
dc2 5bc
RCpbfAYPIq9rB0usMPMgqIWqoJwwg5DqMUgFey/tZJvqR9cMAcN8brF7yw4Cp94WGjXM3k6i
U73Rj2bjbcpikjq/QHfmYkrWnzU2/z//R8gx1VjC2Al0P7xBHNfQ62SxnGoDQtrkfwfqxzDP
z4KwnEnnFzdZn0AXDI/htd6ngpTXrAnG8v1VJJFm/RyNVj0JWL2hoz6VopJQJC4wzHX64+lx
JwuVHYBS5ccLYx03Sp1YwoO7mf93V54f/a2kocVBE/5c5fGIk5Eb/8eVm1THPlmox0Gs2PWM
W8fj2TFWaVbpKDVpLGSjwxpw1OG9t2Y2eVZQD0Ot/dMuBX6U2v36vRKfp24JxVpkanf1w5j8
qHkp2CjJNcir0HIrIN3J1hwn/jF+spJxI5Id0QD6NsxB0nacQZetZRZP3t8jn+/mepj778eP
bEfnOuFDNv2xikgtPgY0X3DEDmZeWC3nl/zRaGIG2pO9eWVhOON53wfVv8DpvVeB5uhSr5eT
S8ybSugNn0os+w+KbHJNcAzzn+1K6W+bG49BmZvtDk+J42vHbdLcK/IOD57ejWRQGWBLP6Ef
2fBuXtk4rJoPxFl/e5lq0SFoFTbbdVs+4TAYeB7zj8fIlymQCLQ3qvoLLunBLWSxcC1DbCfH
iqJ+CPJwhO8sEVyYZPDCRnWOCdZNGKxGbwS1JDhQ9rUqFEyiwo+ZvhessxRV4jgxyd/fcZ89
NTDisLF8f5n/AbgZ1JWbKMEiiX4DNc7OAMehM8EzXxkumMp6AlRjutPvk0XFeS7H8Q2z08NY
3Lj8NCon85Vd4h/W8Ovx381FKnXApKOP1HFfUSE0RDicHo6/4vQQDlpUBTkd57GyQG8a3TUq
71MRzrjqU/vpPaS5t8mlit8ILzFiik3f+kZPpIOPta9gMhMaVeIy8O2CNJk5o3e1tPi2HPrB
Eb+v1zs7b9TxDEGO1S2DiTiyLkjNTAukkp7wgjbV6sKDhJtQDwPNi6BtnzSAY5dLRV03OSN1
LqoLhgBYS25tiP/4EHGlVjxHd30HKovzzyP+QjKS+Wp2T6cPj86b+KXPzxVPJKrt+0I6IQ8u
zoGYHvFOu8bBF07q8+Q3zlqJhtmqsAz35xuSHoeEL8+vMw/t/vHAnvCIm/r1A0e2ig7YdO0B
Ruro/iVfcIgxCkuqzaDygYHgZJXuLiXFPXhAwYUSgDKj10761VLWed4Pbs4/5Q+u83f0Kjv9
NU/ynW/sn7tsjjckQv9Lxi8prtEw1Tovnh84dV44AokS7DeyRg5ojt2dHtAAFNKnvQQuw4LB
u2GvgRhlkZpT6CgriYmp5R+hxCQWFb6myPJrvk1UzTeyux4A+SJdn/HuUZHbiIvQt/O/A4qj
sYZQ0RdD7QXsGn3ZutVheKzogS1Rkh4D1dci83jV+JmOL9RN3E/fsJ89jNo0hwYhPYVxYZLB
qly3n8M=

/
--------------------------------------------------------
--  DDL for Procedure RENAME_COLUMN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."RENAME_COLUMN" (
	i_table_name		IN VARCHAR2,
	i_column_old_name	IN VARCHAR2,
	i_column_new_name	IN VARCHAR2
) AS
	v_errmsg			VARCHAR2(500);
	v_ddl_stmt			VARCHAR2(500);
	v_rename_column_err	CONSTANT NUMBER := -20101;

BEGIN
	IF ( pin_upg_common.table_exists(i_table_name, v_errmsg)
		AND pin_upg_common.column_exists(i_table_name, i_column_old_name,
		v_errmsg) ) THEN

		v_ddl_stmt := 'ALTER TABLE ' || UPPER(i_table_name) ||
			' RENAME COLUMN ' || UPPER(i_column_old_name) || ' TO ' ||
			UPPER(i_column_new_name);
		EXECUTE IMMEDIATE v_ddl_stmt;
	END IF;
EXCEPTION
	WHEN OTHERS THEN
		RAISE_APPLICATION_ERROR(v_rename_column_err,
		'Error renaming column ' || i_column_old_name || ' of table ' ||
		i_table_name || ' to new name ' || i_column_new_name || ' ' ||
		v_errmsg, TRUE);
END rename_column;

/
--------------------------------------------------------
--  DDL for Procedure RENAME_POID_COLUMNS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."RENAME_POID_COLUMNS" (
	i_table_name	IN VARCHAR2,
	i_obj_old_name	IN VARCHAR2,
	i_obj_new_name	IN VARCHAR2
) AS
	v_rename_poid_columns_err	CONSTANT NUMBER := -20102;
	v_table_name				VARCHAR2(255);
	v_old_prefix				VARCHAR2(255);
	v_new_prefix				VARCHAR2(255);

BEGIN
	v_table_name := UPPER(i_table_name);
	v_old_prefix := UPPER(i_obj_old_name);
	v_new_prefix := UPPER(i_obj_new_name);

	rename_column(i_table_name,
		v_old_prefix || '_DB', v_new_prefix || '_DB');
	rename_column(i_table_name,
		v_old_prefix || '_TYPE', v_new_prefix || '_TYPE');
	rename_column(i_table_name,
		v_old_prefix || '_ID0', v_new_prefix || '_ID0');
	rename_column(i_table_name,
		v_old_prefix || '_REV', v_new_prefix || '_REV');

EXCEPTION
	WHEN OTHERS THEN
		RAISE_APPLICATION_ERROR(v_rename_poid_columns_err,
		'Error renaming columns for POID field ' || i_obj_old_name ||
		' of table ' || i_table_name, TRUE);
END rename_poid_columns;

/
--------------------------------------------------------
--  DDL for Procedure REQUESTFAPDEALPURCHASE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."REQUESTFAPDEALPURCHASE" (san IN CHAR, deal IN CHAR, transId OUT INTEGER)  AS

    myERROR INTEGER;

BEGIN

    transId := 0;

    select fapPurchaseSeq.nextval into transId from dual;
    insert into HNS_FAP_TOKEN_PURCHASE_T values(san, deal, transId, 'P', d2i(sysdate), d2i(sysdate), 'NO ERROR - PENDING OPERATION', 0, 'MKTWEB');

    commit;


EXCEPTION
   WHEN ZERO_DIVIDE THEN
      ROLLBACK;
      transId := 0;
   WHEN OTHERS THEN
      ROLLBACK;
      transId := 0;
END;

/
--------------------------------------------------------
--  DDL for Procedure REQUESTSWITCHTOECHECKPAY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."REQUESTSWITCHTOECHECKPAY" (san IN CHAR, deal IN CHAR, name IN CHAR, address IN CHAR,
        city IN CHAR, state IN CHAR, zip IN CHAR, country IN CHAR, accountNo IN CHAR, bankRouting IN CHAR, transId OUT INTEGER)  AS
    myERROR INTEGER;
BEGIN
    transId := 0;

    if LENGTH(TRIM(TRANSLATE(accountNo, '0123456789', ' '))) > 0
    then
        return;
    end if;

    select switchToECheckSeq.nextval into transId from dual;

    insert into HNS_SWITCH_PYMT_TO_ECHECK_T values(san, deal, transId, name, address, city, state, zip, country, accountNo, bankRouting , 'MKTWEB', 'P', d2i(sysdate), d2i(sysdate), 'NO ERROR - PENDING OPERATION', 0);
    commit;

EXCEPTION
   WHEN ZERO_DIVIDE THEN
      ROLLBACK;
      transId := 0;
   WHEN OTHERS THEN
      ROLLBACK;
      transId := 0;
END;

/
--------------------------------------------------------
--  DDL for Procedure REVERSE_HAN_DISCOUNT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."REVERSE_HAN_DISCOUNT" (PROCESS_ID NUMBER)
IS
  -------------------------------------------------------------------------------------
  --FETCH_LAST_HAN_DISC_CURSOR CONTAINS ALL THE RECORDS(APPLICABLE FOR HAN DISCOUNTING)
  --WHICH HAVE RECIEVED HAN DISCOUNT IN LAST BILLING AND HAVE CANCEL PRORATION FLAG TRUE.
  --------------------------------------------------------------------------------------
  CURSOR FETCH_LAST_HAN_DISC_CURSOR
  IS
      SELECT DISTINCT
      HDBH.PARENT_ACCT_OBJ_ID0, HDBH.HNS_LOCATION_ID, HDC.LOC_ACCOUNT_OBJ_ID0, HDC.LOC_GL_SEGMENT, HDC.DEVICE_LIST, HDDC_HAN.INVOICE_ID,
      HDDC_HAN.PRORATION_SUPPORTED, HDDC_HANR.DISCOUNT_TYPE, HDBH.ACTG_NEXT_T, BI.ACTG_LAST_T , HDDC_HANR.RESOURCE_ID
      FROM
      HNS_DEVICE_COUNT_T HDC, BILLINFO_T BI, HNS_DEVICE_BILLING_HOLD_T HDBH, HNS_DEVICE_DISCOUNT_CONFIG_T HDDC_HAN, HNS_DEVICE_DISCOUNT_CONFIG_T HDDC_HANR
      WHERE HDC.LOC_ACCOUNT_OBJ_ID0 = BI.ACCOUNT_OBJ_ID0
      AND HDBH.CHILD_ACCT_OBJ_ID0 = BI.ACCOUNT_OBJ_ID0
      AND P2A(HDBH.CHILD_ACCT_OBJ_ID0) LIKE '%D-L-%'
      AND HDC.DISCOUNT_TYPE = 'HAN'
      AND HDC.STATUS = 'D'
      AND HDC.ACTG_NEXT_T = BI.ACTG_LAST_T
      AND HDC.DISCOUNT_TYPE = HDDC_HAN.DISCOUNT_TYPE
      AND HDC.LOC_GL_SEGMENT = HDDC_HAN.GL_SEGMENT
      AND HDC.DEVICE_LIST = HDDC_HAN.DEVICE_LIST
      AND HDDC_HAN.CANCEL_PRORATION_FLAG = 1
      AND HDDC_HANR.GL_SEGMENT = HDDC_HAN.GL_SEGMENT
      AND HDDC_HANR.DEVICE_LIST = HDDC_HAN.DEVICE_LIST
      AND HDDC_HANR.DISCOUNT_TYPE = 'HANR'
      AND HDDC_HAN.INVOICE_ID = BI.BILL_INFO_ID;


  -------------------------------------------------------------------------------------
  --FETCH_INACTIVE_ACC_CURSOR TRACKS ALL THE STATUS CHANGES FOR ALL THE DEVICE ACCOUNTS
  --AFTER LAST BILLING AND UNDER A GIVEN PARENT/LOCATION ID AND SERVICE TYPE.
  --------------------------------------------------------------------------------------

  CURSOR FETCH_INACTIVE_ACC_CURSOR(PARENT_ACCOUNT_POID NUMBER, HNSLOCATIONID VARCHAR2 , SERVICE_TYPE VARCHAR2, LAST_BILLING_T INTEGER)
  IS
    SELECT Y.*
    FROM
      (SELECT X.EVENTTIME,
        TRUNC(X.EVENTTIME) INACTIVE_START_DAY,
        X.TIMESTAMP,
        X.SERVICE_OBJ_TYPE,
        X.ACCOUNT_OBJ_ID0,
        X.INITIALSTATUS,
        X.FINALSTATUS CURR_STATUS,
        LEAD(X.FINALSTATUS) OVER (PARTITION BY X.ACCOUNT_OBJ_ID0 ORDER BY X.ACCOUNT_OBJ_ID0 ASC,X.TIMESTAMP ASC) NEXT_STATUS,
        TRUNC(U2D(LEAD(X.TIMESTAMP,1, (SELECT ROUND(DATE_TO_INFRANET(PIN_VIRTUAL_TIME)) FROM DUAL)) OVER (PARTITION BY X.ACCOUNT_OBJ_ID0 ORDER BY X.ACCOUNT_OBJ_ID0 ASC,X.TIMESTAMP ASC))) INACTIVE_END_DAY
      FROM
        (SELECT U2D(E.CREATED_T) EVENTTIME,
          E.CREATED_T TIMESTAMP,
          E.SERVICE_OBJ_TYPE,
          E.ACCOUNT_OBJ_ID0,
          ECS_INITIAL.STATUS INITIALSTATUS,
          ECS_FINAL.STATUS FINALSTATUS,
          E.DESCR DESCR
        FROM EVENT_T E,
          EVENT_CUSTOMER_STATUSES_T ECS_INITIAL,
          EVENT_CUSTOMER_STATUSES_T ECS_FINAL
        WHERE E.POID_ID0       = ECS_INITIAL.OBJ_ID0
        AND E.POID_ID0         = ECS_FINAL.OBJ_ID0
        AND ECS_INITIAL.REC_ID = 0
        AND ECS_FINAL.REC_ID   = 1
        AND E.ACCOUNT_OBJ_ID0 IN (SELECT CHILD_ACCT_OBJ_ID0 FROM HNS_DEVICE_BILLING_HOLD_T HDBH
        WHERE PARENT_ACCT_OBJ_ID0 = PARENT_ACCOUNT_POID AND HNS_LOCATION_ID = HNSLOCATIONID)
        AND E.SERVICE_OBJ_TYPE = SERVICE_TYPE
        AND NOT EXISTS (
        SELECT 1 FROM SERVICE_T S WHERE E.SERVICE_OBJ_TYPE = S.POID_TYPE AND S.STATUS = 10100
        AND S.ACCOUNT_OBJ_ID0 IN (SELECT CHILD_ACCT_OBJ_ID0 FROM HNS_DEVICE_BILLING_HOLD_T HDBH
        WHERE PARENT_ACCT_OBJ_ID0 = PARENT_ACCOUNT_POID AND HNS_LOCATION_ID = HNSLOCATIONID)
        AND S.LAST_STATUS_T <  LAST_BILLING_T)
        ) X
      ORDER BY X.ACCOUNT_OBJ_ID0 ASC,
        X.TIMESTAMP ASC
      ) Y
    WHERE ( (Y.CURR_STATUS   != 10100    AND Y.NEXT_STATUS         = 10100)
    OR (Y.CURR_STATUS        != 10100    AND Y.NEXT_STATUS        != 10100)
    OR (Y.CURR_STATUS        != 10100    AND Y.NEXT_STATUS        IS NULL))
    AND Y.INACTIVE_START_DAY != Y.INACTIVE_END_DAY
    AND Y.TIMESTAMP > LAST_BILLING_T;

    SERVICETYPE   VARCHAR2(255);
    SERVICETYPE1  VARCHAR2(255);
    SERVICETYPE2  VARCHAR2(255);
    DEVICELIST VARCHAR2(255);
    PARENTACCPOID NUMBER;
    HNSLOCID      VARCHAR2(255);
    LOCACCNO      NUMBER(38,0);
    LOCGLSEGMENT      VARCHAR2(255);
    INVOICEID      VARCHAR2(255);
    RESOURCEID      NUMBER;
    PRORATIONSUPPORTED  NUMBER;
    LASTBILLINGDATE INTEGER;
    DISCOUNTTYPE      VARCHAR2(255);
    ACTGNEXT_T NUMBER;

    RESULT_ARRAY DATE_ARRAY              := DATE_ARRAY();
    SERVICETYPE_RESULT_ARRAY DATE_ARRAY              := DATE_ARRAY();
    ACCOUNT_OBJ_ID NUMBER;
    PREV_ACCOUNTID NUMBER:=0;

    FIRST_ITERATION INTEGER:= 0;
    NO_OF_DIFF_ACCOUNTS INTEGER:= 1;
    PREV_ACCOUNT_OBJ_ID0 INTEGER:= 0;
    CURR_ACCOUNT_OBJ_ID0 NUMBER:= 0;
    SINGLE_ACCOUNT_ARRAY DATE_ARRAY := DATE_ARRAY();
    HAN_ARRAY ARRAY_OF_DATE_ARRAY := ARRAY_OF_DATE_ARRAY();

    BALOBJ_ID0 NUMBER;
    CURRENTRESOURCECOUNT NUMBER(38,2);
    START_DATE DATE;
    END_DATE DATE;
  BEGIN
    --------------------------------------------------------------------
    FOR FETCH_LAST_HAN_DISC_CURSOR_REC IN FETCH_LAST_HAN_DISC_CURSOR
    LOOP
      DBMS_OUTPUT.PUT_LINE('TOTAL ROWS FETCHED IN FETCH_LAST_HAN_DISC_CURSOR : ' || FETCH_LAST_HAN_DISC_CURSOR%ROWCOUNT);
      PARENTACCPOID :=FETCH_LAST_HAN_DISC_CURSOR_REC.PARENT_ACCT_OBJ_ID0;
      HNSLOCID := FETCH_LAST_HAN_DISC_CURSOR_REC.HNS_LOCATION_ID;
      LOCACCNO := FETCH_LAST_HAN_DISC_CURSOR_REC.LOC_ACCOUNT_OBJ_ID0;
      LOCGLSEGMENT :=FETCH_LAST_HAN_DISC_CURSOR_REC.LOC_GL_SEGMENT;
      INVOICEID :=FETCH_LAST_HAN_DISC_CURSOR_REC.INVOICE_ID;
      RESOURCEID :=FETCH_LAST_HAN_DISC_CURSOR_REC.RESOURCE_ID;
      PRORATIONSUPPORTED :=FETCH_LAST_HAN_DISC_CURSOR_REC.PRORATION_SUPPORTED;
      LASTBILLINGDATE := FETCH_LAST_HAN_DISC_CURSOR_REC.ACTG_LAST_T;
      DISCOUNTTYPE :=FETCH_LAST_HAN_DISC_CURSOR_REC.DISCOUNT_TYPE;
      ACTGNEXT_T := FETCH_LAST_HAN_DISC_CURSOR_REC.ACTG_NEXT_T;
      DEVICELIST:= FETCH_LAST_HAN_DISC_CURSOR_REC.DEVICE_LIST;

      SELECT SUBSTR (DEVICELIST,1,(INSTR(DEVICELIST,','))-1) INTO SERVICETYPE1 FROM DUAL;
      DBMS_OUTPUT.PUT_LINE('SERVICE TYPE 1 : ' || SERVICETYPE1);
      SELECT SUBSTR (DEVICELIST,(INSTR(DEVICELIST,','))+1) INTO SERVICETYPE2 FROM DUAL;
      DBMS_OUTPUT.PUT_LINE('SERVICE TYPE 2 : ' || SERVICETYPE2);

      FOR SERVICE_TYPE_COUNTER IN 1..2
      LOOP
        IF SERVICE_TYPE_COUNTER=1 THEN
          DBMS_OUTPUT.PUT_LINE('SERVICE_TYPE_COUNTER = ' || SERVICE_TYPE_COUNTER);
          SERVICETYPE := SERVICETYPE1;
        ELSE
          DBMS_OUTPUT.PUT_LINE('SERVICE_TYPE_COUNTER = ' || SERVICE_TYPE_COUNTER);
          SERVICETYPE := SERVICETYPE2;
        END IF;
        NO_OF_DIFF_ACCOUNTS := 1;
        FIRST_ITERATION := 0;
        PREV_ACCOUNT_OBJ_ID0 := 0;
        SINGLE_ACCOUNT_ARRAY := DATE_ARRAY();
        FOR FETCH_INACTIVE_ACC_CURSOR_REC IN FETCH_INACTIVE_ACC_CURSOR(PARENTACCPOID , HNSLOCID , SERVICETYPE, LASTBILLINGDATE)
        LOOP
          START_DATE := FETCH_INACTIVE_ACC_CURSOR_REC.INACTIVE_START_DAY;
          END_DATE   := FETCH_INACTIVE_ACC_CURSOR_REC.INACTIVE_END_DAY;
          CURR_ACCOUNT_OBJ_ID0 := FETCH_INACTIVE_ACC_CURSOR_REC.ACCOUNT_OBJ_ID0;
          /* IF PREVIOUS ACCOUNT IS SAME AS CURRENT ACCOUNT OR IT IS FIRST ITERATION */
          IF ( PREV_ACCOUNT_OBJ_ID0 = CURR_ACCOUNT_OBJ_ID0) OR FIRST_ITERATION = 0 THEN
              SINGLE_ACCOUNT_ARRAY := APPEND_DATE_RANGE(START_DATE,END_DATE,SINGLE_ACCOUNT_ARRAY);
              PREV_ACCOUNT_OBJ_ID0 := CURR_ACCOUNT_OBJ_ID0;
              -- CHANGE THE FIRST ITERATION INDEX SO THAT IT ENTERS THIS LOOP ONLY IF CURRENT ACCOUNT IS
              -- SAME AS PREVIOUS ACCOUNT
              FIRST_ITERATION := 1;
          ELSE
            NO_OF_DIFF_ACCOUNTS := NO_OF_DIFF_ACCOUNTS + 1;
            PREV_ACCOUNT_OBJ_ID0 := CURR_ACCOUNT_OBJ_ID0;
            IF NO_OF_DIFF_ACCOUNTS = 2 THEN
              SERVICETYPE_RESULT_ARRAY := SINGLE_ACCOUNT_ARRAY;
            ELSE
              SERVICETYPE_RESULT_ARRAY := GET_DATE_RANGE_INTERSECTION(SERVICETYPE_RESULT_ARRAY,SINGLE_ACCOUNT_ARRAY);
            END IF;

            SINGLE_ACCOUNT_ARRAY := NULL;
            SINGLE_ACCOUNT_ARRAY := GET_DATE_RANGE_ARRAY(START_DATE,END_DATE);
         END IF;
      END LOOP;

        IF NO_OF_DIFF_ACCOUNTS = 1 THEN
            SERVICETYPE_RESULT_ARRAY := SINGLE_ACCOUNT_ARRAY;
        ELSE
            SERVICETYPE_RESULT_ARRAY := GET_DATE_RANGE_INTERSECTION(SERVICETYPE_RESULT_ARRAY,SINGLE_ACCOUNT_ARRAY);
        END IF;
        HAN_ARRAY.EXTEND;
        HAN_ARRAY(SERVICE_TYPE_COUNTER) := SERVICETYPE_RESULT_ARRAY;
        DBMS_OUTPUT.PUT_LINE(SERVICETYPE||' INACTIVE DAY COUNT: ' || SERVICETYPE_RESULT_ARRAY.COUNT);
      END LOOP;
      /* SERVICE_TYPE_COUNTER LOOP END */

        RESULT_ARRAY := GET_DATE_RANGE_INTERSECTION(HAN_ARRAY(1),HAN_ARRAY(2));

        CURRENTRESOURCECOUNT := ROUND(LEAST((HAN_ARRAY(1).COUNT + HAN_ARRAY(2).COUNT- RESULT_ARRAY.COUNT)/30,1),2);

        DBMS_OUTPUT.PUT_LINE('HNS_LOCATION_ID : ' || HNSLOCID);
        DBMS_OUTPUT.PUT_LINE('LOCACCNO : ' || LOCACCNO);
        DBMS_OUTPUT.PUT_LINE('LOCGLSEGMENT : ' || LOCGLSEGMENT);
        DBMS_OUTPUT.PUT_LINE('INVOICEID : ' || INVOICEID);
        DBMS_OUTPUT.PUT_LINE('DEVICELIST : ' || DEVICELIST);
        DBMS_OUTPUT.PUT_LINE('RESOURCEID : ' || RESOURCEID);
        DBMS_OUTPUT.PUT_LINE('CURRENTRESOURCECOUNT : ' || CURRENTRESOURCECOUNT);
        DBMS_OUTPUT.PUT_LINE('PRORATIONSUPPORTED : ' || PRORATIONSUPPORTED);
        DBMS_OUTPUT.PUT_LINE('ACTGNEXT_T : ' || ACTGNEXT_T);
        DBMS_OUTPUT.PUT_LINE('DISCOUNTTYPE : ' || DISCOUNTTYPE);

        SELECT DISTINCT BAL_OBJ_ID0 INTO BALOBJ_ID0 FROM HNS_DEVICE_LOCATION_DATA_T WHERE HNS_LOCATION_ID = HNSLOCID
        AND LOC_GL_SEGMENT = LOCGLSEGMENT AND INVOICE_ID = INVOICEID;

        IF CURRENTRESOURCECOUNT <> 0 THEN
          INSERT INTO HNS_DEVICE_COUNT_T
          (REC_ID, HNS_LOCATION_ID, LOC_ACCOUNT_OBJ_ID0,LOC_GL_SEGMENT,INVOICE_ID,BAL_OBJ_ID0,DEVICE_LIST,RESOURCE_ID,PREV_RESOURCE_COUNT,
          CURRENT_RESOURCE_COUNT,PRORATION_SUPPORTED,PROCESS_ID,ACTG_NEXT_T, STATUS, DISCOUNT_TYPE ,CREATED_T)
          VALUES
          (HNS_DEVICE_COUNT_SEQ.NEXTVAL,HNSLOCID,LOCACCNO,LOCGLSEGMENT,INVOICEID,BALOBJ_ID0,DEVICELIST,RESOURCEID,0,
          CURRENTRESOURCECOUNT,PRORATIONSUPPORTED, PROCESS_ID,ACTGNEXT_T,'P', DISCOUNTTYPE ,
          (SELECT ROUND(DATE_TO_INFRANET(PIN_VIRTUAL_TIME)) FROM DUAL
          ));
        END IF;

    END LOOP;
    /* CLOSING CURSOR -- FETCH_LAST_HAN_DISC_CURSOR */
    COMMIT;
  EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001,'AN ERROR WAS ENCOUNTERED - '||SQLCODE||' -ERROR- '||SQLERRM);

  END REVERSE_HAN_DISCOUNT;

/
--------------------------------------------------------
--  DDL for Procedure ROLLUP_SUBORDS_CHARGES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."ROLLUP_SUBORDS_CHARGES" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
2374 be5
ctFXanwNFv5MG0+df3cpwL4uCpwwg82TLscF37a5jZKUBYTGd0Zk5RrNY0plhPfIR8suwuRp
8SnSQxr07EWG24i6vEPGvy3OOaGTRdLDSbcvtJXhtNAXv+7l0bannyrW+JgFBcaWc2qGLL/+
LByS/qrtmLVTqqm4b5EQbhR5D42Tg7AeyoUYDn3isdhKcaP4YeBuU20eXcXiDzBdVpCHowOQ
rpGYYZaxnV+KTRagmnCE6aRIsBbvEzsDeiwFsl3QlX/CHuecxPjnxrSNmcNmUFbl6IoYYSAf
sWzcP8a/kHIGyW+KpV/piDYjtaU6wD/6wQOnTLd7YoNtTz/T28XiRNZXtfNAVkw5m8OlTp6n
0Y1KzV6GGlUzQmiPQq/kX8CUitdS0dOEoycH/bP8PmZBZGDtw0LrF+nZYawzbhEalakKK7bb
UexscTgdOC6/YoFcYVIi8tzaiztev4P0XG4dj4VMvolXcwHP/iH25eIBKVeUcu0Tyg0ycSH9
K4Yl9Os7OjE8j3N2OP8lgnW+B75HQcS+in3MSZeLn3IYLiluc6HJ+IquZQUXTyINycRyIqja
KSeR9kpMfxFUJacyD2/YIINTSBB4DX3j8682vhBMHEz/KcanDz2Kzvms1m0ERvM1Ot+7/WHt
yenarJbbN5dNk/c0pFJo30iY1EG1zDYys0tFzXhCNLKsMpOLVtFXMrbBsoTLK7EwwkBDMNvY
Z0EaVmkrs+FB94L5u5XAvqIvVAN5K0fh+YA/OeCUdzCNeJRA/0XeHmmMEU8XLv2vlSC1tZL4
A23nQYDKfMki75Snyg4EgBNFNDmyMVcIkp5qKJGDuhWeaKIwrWrWnaFUPckBqLSZFlBkht+5
eBZsAm+wyUYMQj/0tYasrDwB/b6WkbLi3jfHR+EGxHZZaLPQo0KGgZ+oA0IanQhuyd1q3V9Q
2Yw3Fg1yn69qN1E1FFARV/oBT8VnIM1Hm+/de7oWWxXPiBb7MRWXJPccbVmEC9WwULTy7yHo
inxXyjG03QEaLXzCqdFlFt9C6R9FZiiQ3KPoxMJrSWWl4ClqocbzV0KcKKQBVz6NKALFGgzW
UifjzF4wcnlMgWg3UxkaELh1N58j4x+3PyhS9+zW1JlsaZLnm7oZfWWMjVYt78uf3gr34AKW
19nC5qhmuK12hWQXNNF1RNxLUIfGtaSEdHVGdFt/iYSTMux1pKlb/5CpLG7w7fqjyqVLGtPR
uHd1LkFPHW2/WwymTKaOiwBPgMFLnVfQc1u6Ks9r6iZgGXao9NoCN3A+Zc3gUsf9DwJgmRbz
bB5gC/akF7IehuWXAxSL2AABt8jr4fd4G9ZetXFL+PiYElM6dCz+BxNyLO6LS7U2D7lIIt1P
/r9PEbROOKoSTrhTMKNwur9fsFlEzjf5CmghS0cEjph62+WWIZX8eqP/TxlgO2qrgTREVEuf
sjxjF0jvCjFOK8yNEhnTXnObMgNniycljQ88gDMhxRWIhgBMRTQ1kdezOoq9A9pPFNAU5bS3
vOl+69jAONaq4gqZG9g5ojI2URNScfhUzXxTZMXEitooi6UZhCJC/vs3jnx1KqNQFNlY6aFJ
5kHNS6NdiOVk2Xq7xXt+hHwERuX1ZzQuFs0nAQhWJ/bcBPJy434mB4nFeQrVHxvZ3pjhQql8
Pk3VuCQGvRT/2jxQJopJOculdzVRzx6VZpuKBPDm/VPK1Ma8EquubrJzL1adDVXzz+9HoU6b
Gma9GK5YRL7MRZ6k46FizHlZ3w7AqZsoANyio9cVTyuno8yDj+EaD9ItlLE7yY9Ji44BORQe
chcZkA3Ba+eBJkO08z56UmyKsJNZqaMivuH2pXRgZpzgiWTCCUv2CZlYxNjNAQegiwixRoBt
VjihCX42P8HBRw6X7/v+SKqwWJGAwXxY0f9LJrx5uYu2C58LK4VGCDgOggEqOK73QCrRc1pq
FJb9i61HjoeM0TvqeKM48K66gFWSl6qQ2nk75QrY9Otvm0GqQ+1ds80xyWoTUKTvRFcyxM0J
OBGNwmQ5HMrZGd3gI76bNODLAWJLEaLxn7eM8RoeFqHRro2UEJffbdVWF9l7DCOJd79E34cB
GLgVRFu3RZdvG7pY73qN/Fk6Iv0zNYsq8N3ZdGKi84Eih/QnP7D9MBBci9j0xzxkxHMqCsRZ
JKKlGWLR09QLPHlOiov/oM/GgzQDkrw4hL9HtUqhM6s1uiTHMYZQJOUjdygsaHyL+hvhY7Y6
NKi4lxK083MagfHvuumsx7X72x1pnQfzpF/+nganfV6URf78hO5JmQgHc835AJQGwz+dErX5
uQhOayTdT1qJ71RM3bFkRrgBcpom5v5+Tlrq7uicw5IMk/HGBsChu4l2Gzbn8tdengCaDxiU
+RNLA+H032RcRnRCslfaBlzxdpSW9DPh1TcoHwRRh6xAIJer08W0I9i0kS94tL/sGUYYNR4+
ob+rj7F9j59bj4Fl5V9h5RFMoutxFi0xP5nK9S3v9uKpFudbNJricKJGDRXUgerV/hABrM1j
mbVvnDy9PJ0vh89yBWq7mhDO+Ajupd61iPiEyMcsSBy8ehwzyQY4qldoufTeuZld/o8gN3Ho
fsukoGNgGu081OZDJ/gNcIkpdrhESr/rQZstan2TeSDc9RjUj01hi5GBeUyflNia8WlzuVuS
z2iIMmk5AQKPf/XywMA650ZK24NdJ3cyQpYG6YLhUU07kFcak0w3Be7vqw7dNPp0/jrLeaJi
qz04NpX7qlCyEMqTr1CCi+hkx5qVQglZJ0AycSBlkGhliRtSCGLh/r9F912bA5CELbaNT4P/
XXubZyZC2M+LwcoQSczgQd5J/NBN5sys0TDt60sP2tJ8YDl96SQVv4L7faI+c/8qDrxvwvAg
clCVuZxkcD5zPyUlxRnBtTE6D6ADcXs5mK6jVLCDXkceUf6qb/mxVl/tfhOCePFiCwTa1mWg
oL4R78Pq2ve60par2wczlPmoD6DsSEw83oQyi6cqnJrkHXrOC10=

/
--------------------------------------------------------
--  DDL for Procedure SCHED_SPIN_REPORT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."SCHED_SPIN_REPORT" 
IS

jobno number;
spindate date;

BEGIN

  spindate := to_date(to_char(trunc(sysdate))|| ' 16:30', 'DD-MON-YYYY HH24:MI');

  DBMS_JOB.SUBMIT(job => jobno, what=>'begin SpinReport; end;', next_date => spindate, interval=>'SYSDATE + 1');
  commit;

END sched_spin_report;

/
--------------------------------------------------------
--  DDL for Procedure SC_GET_BILLING_DATA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."SC_GET_BILLING_DATA" 
(
daystogoback_start   IN  NUMBER,
daystogoback_end   IN  NUMBER
)
AS
   v_san                   ACCOUNT_T.ACCOUNT_NO%TYPE;
   v_delinq_poid           ACCOUNT_T.POID_ID0%TYPE;
   v_serial_number           NUMBER;
   v_account_poid           ACCOUNT_T.POID_ID0%TYPE;
   v_gl_segment               ACCOUNT_T.GL_SEGMENT%TYPE;
   v_svc_status            SERVICE_T.STATUS%TYPE;
   v_svc_laststat_cmnt     SERVICE_T.LASTSTAT_CMNT%TYPE;
   v_svc_last_status_t     SERVICE_T.LAST_STATUS_T%TYPE;
   v_ws_operation          HNS_AUDIT_EVENT_T.OPERATION%TYPE;
   v_ws_operation_t        HNS_AUDIT_EVENT_T.CREATED_T%TYPE;
   v_lut_created_t         HNS_LUT_MESSAGE_T.CREATED_T%TYPE;
   v_lut_action            HNS_LUT_MESSAGE_T.ACTION%TYPE;
   v_lut_reason_code       HNS_LUT_MESSAGE_T.REASON_CODE%TYPE;
   v_lut_status            HNS_LUT_MESSAGE_T.STATUS%TYPE;
   v_lut_retries           HNS_LUT_MESSAGE_T.NUM_ATTEMPTS%TYPE;
   v_ded_created_t         HNS_DED_MESSAGE_T.CREATED_T%TYPE;
   v_ded_reason_code       HNS_DED_MESSAGE_T.REASON%TYPE;
   v_ded_status            HNS_DED_MESSAGE_T.STATE%TYPE;
   v_collections_state     HNS_DELINQUENT_CONSTANTS_T.DESCR%TYPE;
   v_delinq_last_changed_t HNS_DELINQUENCY_T.LAST_STATE_CHANGE_T%TYPE;
   loop_id                   INTEGER;
   t_sql_text              VARCHAR2(100);
   v_start_time               NUMBER;
   v_create_dt				DATE;

   CURSOR SVC_DATA_CUR
   IS
      SELECT ACCOUNT_OBJ_ID0,
             STATUS,
             LASTSTAT_CMNT,
             LAST_STATUS_T
        FROM SERVICE_T S
       WHERE     S.POID_TYPE = '/service/ip'
             AND LOGIN NOT LIKE 'DUP%'
             AND LOGIN NOT LIKE 'XX%'
             AND last_status_t >= (SELECT d2i(TRUNC(SYSDATE - daystogoback_start)) FROM DUAL)
             AND last_status_t < (SELECT d2i(TRUNC(SYSDATE - daystogoback_end + 1)) FROM DUAL);

BEGIN
   DBMS_OUTPUT.PUT_LINE ('---------------------------------');
   DBMS_OUTPUT.PUT_LINE ('Starting procedure ' || SYSDATE);

   --t_sql_text := 'TRUNCATE TABLE STG_SITE_STATUS_COMP_T';
   --EXECUTE IMMEDIATE t_sql_text;
   --v_create_dt :=
   --REC_STATUS R-ready for Informatica to pick up. D-Updated by Informatica

   loop_id := 0;
   FOR SVC_DATA IN SVC_DATA_CUR
   LOOP
      v_svc_status         := SVC_DATA.STATUS;
      v_svc_laststat_cmnt := SVC_DATA.LASTSTAT_CMNT;
      v_svc_last_status_t := SVC_DATA.LAST_STATUS_T;
      v_account_poid        := SVC_DATA.ACCOUNT_OBJ_ID0;

      BEGIN
         SELECT ACCOUNT_NO, GL_SEGMENT
            INTO v_san, v_gl_segment
            FROM ACCOUNT_T
            WHERE POID_ID0 = v_account_poid;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            CONTINUE;
      END;

      BEGIN
         SELECT OPERATION, CREATED_T
           INTO V_WS_OPERATION, V_WS_OPERATION_T
           FROM (
           select OPERATION, CREATED_T from HNS_AUDIT_EVENT_T
          WHERE     (UPPER (OPERATION) LIKE '%TERMIN%'
                     OR UPPER (OPERATION) LIKE '%REAC%'
                     OR UPPER (OPERATION) LIKE '%FORCEUNLOCK%')
                AND ACCOUNT_NO = V_SAN
                ORDER BY CREATED_T DESC)
            where rownum < 2;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_ws_operation         := NULL;
            v_ws_operation_t     := NULL;
      END;

      BEGIN
         SELECT CREATED_T,
                ACTION,
                REASON_CODE,
                STATUS,
                NUM_ATTEMPTS
           INTO v_lut_created_t,
                v_lut_action,
                v_lut_reason_code,
                v_lut_status,
                v_lut_retries
           FROM (SELECT CREATED_T, ACTION, REASON_CODE, STATUS, NUM_ATTEMPTS FROM HNS_LUT_MESSAGE_T
          WHERE ACCOUNT_NO = V_SAN AND ACTION != 'E' ORDER BY CREATED_T DESC)
          where rownum < 2;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_lut_created_t     := NULL;
            v_lut_action         := NULL;
            v_lut_reason_code := NULL;
            v_lut_status         := NULL;
            v_lut_retries         := NULL;
      END;

      BEGIN
	  SELECT created_t, reason, state
           INTO v_ded_created_t,
                v_ded_reason_code,
                v_ded_status
		  FROM (SELECT created_t, reason, state
					FROM hns_ded_message_t
				   WHERE accountno = V_SAN AND servicetype = '/service/ip'
				ORDER BY created_t DESC)
		 WHERE ROWNUM < 2;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_ded_created_t     := NULL;
            v_ded_reason_code 	:= NULL;
            v_ded_status         := NULL;
      END;


      BEGIN
         SELECT PARENT_ACCOUNT_ID
           INTO v_delinq_poid
           FROM PARENT_CHILD_VW
          WHERE CHILD_ACCOUNT_NO = v_san;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_delinq_poid := v_account_poid;
      END;

      BEGIN
         SELECT to_number(PCT.HNS_SERIAL_NUMBER)
           INTO V_SERIAL_NUMBER
           FROM PROFILE_T P, HNS_PROFILE_CUSTOMER_T PCT
          WHERE P.POID_ID0 = PCT.OBJ_ID0
           AND P.POID_TYPE = '/profile/customer'
           AND P.ACCOUNT_OBJ_ID0 = v_account_poid;
      EXCEPTION
         WHEN NO_DATA_FOUND THEN
            v_serial_number := NULL;
         WHEN INVALID_NUMBER THEN
            v_serial_number := NULL;
      END;

      BEGIN
         SELECT NVL (DC.DESCR, 'NON_DELINQUENT'), LAST_STATE_CHANGE_T
           INTO v_collections_state, v_delinq_last_changed_t
           FROM HNS_DELINQUENCY_T D, HNS_DELINQUENT_CONSTANTS_T DC
          WHERE     D.ACCOUNT_OBJ_ID0 = v_delinq_poid
                AND DC.COLLECTION_STATE = D.COLLECTION_STATE;
      EXCEPTION
         WHEN NO_DATA_FOUND
         THEN
            v_collections_state     := 'NON_DELINQUENT';
            v_delinq_last_changed_t := NULL;
      END;

      INSERT INTO STG_SITE_STATUS_COMP_T (REC_ID,REC_CREATED_DT,REC_STATUS,SAN, ACCOUNT_POID, SERIAL_NUMBER, GL_SEGMENT, SVC_STATUS, SVC_LASTSTAT_CMNT, SVC_LAST_STATUS_DT,
                WS_OPERATION, WS_OPERATION_DT, LUT_CREATED_DT, LUT_ACTION, LUT_REASON_CODE, LUT_STATUS, LUT_RETRIES,
				DED_CREATED_DT, DED_REASON_CODE, DED_STATUS, COLLECTIONS_STATE, DELINQ_LAST_CHANGED_DT)
        VALUES (STG_SITE_STATUS_COMP_SEQ.nextval,sysdate,'R',v_san, v_account_poid, v_serial_number, v_gl_segment, v_svc_status, v_svc_laststat_cmnt, u2d(v_svc_last_status_t),
                v_ws_operation, u2d(v_ws_operation_t), u2d(v_lut_created_t), v_lut_action, v_lut_reason_code, v_lut_status, v_lut_retries,
				u2d(v_ded_created_t), v_ded_reason_code, v_ded_status, v_collections_state, u2d(v_delinq_last_changed_t));
        loop_id := loop_id + 1;
        IF MOD (loop_id, 500) = 0
        THEN
            COMMIT;
        END IF;

   END LOOP;
    COMMIT;

   DBMS_OUTPUT.PUT_LINE ('End of procedure ' || SYSDATE);
   DBMS_OUTPUT.PUT_LINE ('---------------------------------');
END SC_GET_BILLING_DATA;

/
--------------------------------------------------------
--  DDL for Procedure SPINREPORT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."SPINREPORT" 

IS

--------------------------------------------------------------------
--FETCH_CANCEL_DEAL_CURSOR contains all the records of the deal
--cancelled by the customer on the last day (00:00-23:59)
--------------------------------------------------------------------


CURSOR FETCH_CANCEL_DEAL_CURSOR(START_T INTEGER, END_T INTEGER)
IS
SELECT DISTINCT PP.ACCOUNT_OBJ_ID0, MIN(PP.CYCLE_END_T) MIN_CYCLE_END_T
FROM PURCHASED_PRODUCT_T PP , SERVICE_T S
WHERE PP.SERVICE_OBJ_ID0=S.POID_ID0
AND PP.STATUS = 3
AND PP.SERVICE_OBJ_TYPE = '/service/ip'
AND PP.CYCLE_END_T >= START_T AND PP.CYCLE_END_T <= END_T
AND S.CREATED_T < START_T
GROUP BY PP.ACCOUNT_OBJ_ID0;

--------------------------------------------------------------------
--FETCH_PURCHASE_DEAL_CURSOR contains all the records of the deal
--purchased by the same customer (the one who cancelled the deal)
-- on the last day (00:00-23:59)
--------------------------------------------------------------------


CURSOR FETCH_PURCHASE_DEAL_CURSOR(CANCEL_T INTEGER, ACCOUNT_POID INTEGER, END_T INTEGER)
IS
SELECT DISTINCT DEAL_OBJ_ID0,CREATED_T
FROM PURCHASED_PRODUCT_T WHERE CREATED_T <= END_T AND CREATED_T >=  CANCEL_T
AND SERVICE_OBJ_TYPE = '/service/ip' AND ACCOUNT_OBJ_ID0 = ACCOUNT_POID AND STATUS = 1;


--------------------------------------------------------------------
--FETCH_SPIN_REPORT_DATA_CURSOR contains the records for the
--movements among the categories on the last day (00:00-23:59)
--------------------------------------------------------------------

CURSOR FETCH_SPIN_REPORT_DATA_CURSOR(START_T INTEGER, END_T INTEGER)
IS
SELECT COUNT(*) AS NUM_RECORDS,(SELECT CATEGORY_NAME FROM HNS_SUBRPT_CATEGORY_T WHERE POID_ID0=OLD_CATEGORY_POID) AS OLDCATEGORY_ID0,
(SELECT CATEGORY_NAME FROM HNS_SUBRPT_CATEGORY_T WHERE POID_ID0=NEW_CATEGORY_POID) AS NEWCATEGORY_ID0
FROM HNS_SPIN_REPORTS_DATA_T
WHERE RECORD_T>=START_T AND RECORD_T<= END_T
GROUP BY  OLD_CATEGORY_POID,NEW_CATEGORY_POID;


--------------------------------------------------------------------
--FETCH_BEG_SUBS_CURSOR contains the records for the beginning
--subscribers for the different categories on the last day.
--------------------------------------------------------------------


infStartT INTEGER;
infEndT INTEGER;
oldCategoryPoid INTEGER := 0;
newCategoryPoid INTEGER := 0;
oldDealPoid INTEGER;
newDealPoid INTEGER;
accountPoid INTEGER;
oldCategoryName VARCHAR2(255);
newCategoryName VARCHAR2(255);
cancelT INTEGER;
purchaseT INTEGER;
createdT INTEGER;
c1 INTEGER;
c2 INTEGER;
c3 INTEGER;


BEGIN


---------------------------------------------------------------------------
-- Calculating the Start and End date for the script in Portal Format
-- Start date is 00:00 of yesterday
-- End date is 23:59 of yesterday
-- Beginning subscribers will be calculated from the ending subscribers
-- on day before yesterday
-- Both values will be inclusive in all the queries
---------------------------------------------------------------------------

	SELECT date_to_infranet(TRUNC(SYSDATE-1)) INTO infStartT FROM dual;
	DBMS_OUTPUT.PUT_LINE('Start Time is ' || infStartT);
	SELECT (date_to_infranet(TRUNC(SYSDATE))-1) INTO infEndT FROM dual;
	DBMS_OUTPUT.PUT_LINE('End Time is ' || infEndT);

--------------------------------------------------------------------



   FOR FETCH_CANCEL_DEAL_CURSOR_REC IN FETCH_CANCEL_DEAL_CURSOR(infStartT, infEndT)
   LOOP
     	-- Fetching the account poid of customer who cancelled the deal
      	accountPoid := FETCH_CANCEL_DEAL_CURSOR_REC.ACCOUNT_OBJ_ID0;


	FOR FETCH_PURCHASE_DEAL_CURSOR_REC IN FETCH_PURCHASE_DEAL_CURSOR(FETCH_CANCEL_DEAL_CURSOR_REC.MIN_CYCLE_END_T, accountPoid,infEndT)
	LOOP
		SELECT DISTINCT deal_obj_id0 INTO oldDealPoid FROM PURCHASED_PRODUCT_T WHERE cycle_end_t = FETCH_CANCEL_DEAL_CURSOR_REC.MIN_CYCLE_END_T AND account_obj_id0 = FETCH_CANCEL_DEAL_CURSOR_REC.ACCOUNT_OBJ_ID0 AND SERVICE_OBJ_TYPE = '/service/ip';
		newDealPoid := FETCH_PURCHASE_DEAL_CURSOR_REC.DEAL_OBJ_ID0;

		IF oldDealPoid != newDealPoid
		THEN

			SELECT COUNT(*) INTO c1 FROM HNS_SUBRPT_BILLING_DEAL_T WHERE DEAL_OBJ_ID0_ID0=oldDealPoid;
			-- checking if old deal exists in HNS_SUBRPT_BILLING_DEAL_T otherwise it is UnMapped.
			-- oldCategoryPoid will have value '0' in this case

			IF c1>0 THEN
				SELECT OBJ_ID0 INTO oldCategoryPoid FROM HNS_SUBRPT_BILLING_DEAL_T WHERE DEAL_OBJ_ID0_ID0=oldDealPoid;
			END IF;

			SELECT COUNT(*) INTO c2 FROM HNS_SUBRPT_BILLING_DEAL_T WHERE DEAL_OBJ_ID0_ID0=newDealPoid;

			-- checking if new deal exists in HNS_SUBRPT_BILLING_DEAL_T otherwise it is UnMapped.
			-- newCategoryPoid will have value '0' in this case

			IF c2>0 THEN
				SELECT OBJ_ID0 INTO newCategoryPoid FROM HNS_SUBRPT_BILLING_DEAL_T WHERE DEAL_OBJ_ID0_ID0=newDealPoid;
			END IF;

			cancelT := FETCH_CANCEL_DEAL_CURSOR_REC.MIN_CYCLE_END_T;
			purchaseT := FETCH_PURCHASE_DEAL_CURSOR_REC.CREATED_T;

			-- deleting if deal movement data has already been inserted into the table for the day.

			DELETE FROM HNS_SPIN_REPORTS_DATA_T WHERE ACCOUNT_POID = accountPoid AND RECORD_T=infStartT;
			INSERT INTO HNS_SPIN_REPORTS_DATA_T VALUES (accountPoid,oldDealPoid,newDealPoid,oldCategoryPoid,newCategoryPoid,cancelT,purchaseT,infStartT);


		END IF;


	END LOOP;


    END LOOP;

    COMMIT;

    DELETE FROM HNS_SPIN_REPORTS_T WHERE DATA_DATE_T >= infStartT AND DATA_DATE_T <= infEndT;

    COMMIT;

    FOR fetch_spin_report_data_rec IN FETCH_SPIN_REPORT_DATA_CURSOR(infStartT,infEndT)
	LOOP
		SELECT COUNT(*) INTO c3 FROM HNS_SPIN_REPORTS_T WHERE OLD_CATEGORY = fetch_spin_report_data_rec.oldcategory_id0
		AND NEW_CATEGORY = fetch_spin_report_data_rec.newcategory_id0
		AND DATA_DATE_T >= infStartT AND DATA_DATE_T <= infEndT;
		-- Checking if the entry exists for the oldcategory , newcategory  movement for the day.

		-- Checking if both categories are not null and unequal
		IF trim(fetch_spin_report_data_rec.oldcategory_id0) IS NOT NULL AND trim(fetch_spin_report_data_rec.newcategory_id0) IS NOT NULL AND trim(fetch_spin_report_data_rec.oldcategory_id0) != trim(fetch_spin_report_data_rec.newcategory_id0)
		THEN
			IF c3 > 0
			THEN
			-- Updating the already existing entry
				UPDATE HNS_SPIN_REPORTS_T SET TOTAL_MOVEMENTS = fetch_spin_report_data_rec.NUM_RECORDS WHERE OLD_CATEGORY = fetch_spin_report_data_rec.oldcategory_id0
				AND NEW_CATEGORY = fetch_spin_report_data_rec.newcategory_id0
				AND CREATED_T >= infStartT AND CREATED_T <= infEndT;
			ELSE
			-- Creating a new entry
				SELECT date_to_infranet(SYSDATE) INTO createdT FROM dual;
				INSERT INTO HNS_SPIN_REPORTS_T VALUES (fetch_spin_report_data_rec.oldcategory_id0,fetch_spin_report_data_rec.newcategory_id0,fetch_spin_report_data_rec.NUM_RECORDS,infStartT,createdT);

			END IF;

		END IF;

	END LOOP;

   COMMIT;

EXCEPTION
	WHEN OTHERS THEN
		 RAISE_APPLICATION_ERROR(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);

END SpinReport;

/
--------------------------------------------------------
--  DDL for Procedure SPINREPORT_DATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."SPINREPORT_DATE" 
(
rpt_date   IN  VARCHAR2
)
IS

--------------------------------------------------------------------
--FETCH_CANCEL_DEAL_CURSOR contains all the records of the deal
--cancelled by the customer on the last day (00:00-23:59)
--------------------------------------------------------------------


CURSOR FETCH_CANCEL_DEAL_CURSOR(START_T INTEGER, END_T INTEGER)
IS
SELECT DISTINCT PP.ACCOUNT_OBJ_ID0, MIN(PP.CYCLE_END_T) MIN_CYCLE_END_T
FROM PURCHASED_PRODUCT_T PP , SERVICE_T S
WHERE PP.SERVICE_OBJ_ID0=S.POID_ID0
AND PP.STATUS = 3
AND PP.SERVICE_OBJ_TYPE = '/service/ip'
AND PP.CYCLE_END_T >= START_T AND PP.CYCLE_END_T <= END_T
AND S.CREATED_T < START_T
GROUP BY PP.ACCOUNT_OBJ_ID0;

--------------------------------------------------------------------
--FETCH_PURCHASE_DEAL_CURSOR contains all the records of the deal
--purchased by the same customer (the one who cancelled the deal)
-- on the last day (00:00-23:59)
--------------------------------------------------------------------


CURSOR FETCH_PURCHASE_DEAL_CURSOR(CANCEL_T INTEGER, ACCOUNT_POID INTEGER, END_T INTEGER)
IS
SELECT DISTINCT DEAL_OBJ_ID0,CREATED_T
FROM PURCHASED_PRODUCT_T WHERE CREATED_T <= END_T AND CREATED_T >=  CANCEL_T
AND SERVICE_OBJ_TYPE = '/service/ip' AND ACCOUNT_OBJ_ID0 = ACCOUNT_POID AND STATUS = 1;


--------------------------------------------------------------------
--FETCH_SPIN_REPORT_DATA_CURSOR contains the records for the
--movements among the categories on the last day (00:00-23:59)
--------------------------------------------------------------------

CURSOR FETCH_SPIN_REPORT_DATA_CURSOR(START_T INTEGER, END_T INTEGER)
IS
SELECT COUNT(*) AS NUM_RECORDS,(SELECT CATEGORY_NAME FROM HNS_SUBRPT_CATEGORY_T WHERE POID_ID0=OLD_CATEGORY_POID) AS OLDCATEGORY_ID0,
(SELECT CATEGORY_NAME FROM HNS_SUBRPT_CATEGORY_T WHERE POID_ID0=NEW_CATEGORY_POID) AS NEWCATEGORY_ID0
FROM HNS_SPIN_REPORTS_DATA_T
WHERE RECORD_T>=START_T AND RECORD_T<= END_T
GROUP BY  OLD_CATEGORY_POID,NEW_CATEGORY_POID;


--------------------------------------------------------------------
--FETCH_BEG_SUBS_CURSOR contains the records for the beginning
--subscribers for the different categories on the last day.
--------------------------------------------------------------------


infStartT INTEGER;
infEndT INTEGER;
oldCategoryPoid INTEGER := 0;
newCategoryPoid INTEGER := 0;
oldDealPoid INTEGER;
newDealPoid INTEGER;
accountPoid INTEGER;
oldCategoryName VARCHAR2(255);
newCategoryName VARCHAR2(255);
cancelT INTEGER;
purchaseT INTEGER;
createdT INTEGER;
c1 INTEGER;
c2 INTEGER;
c3 INTEGER;


BEGIN


---------------------------------------------------------------------------
-- Calculating the Start and End date for the script in Portal Format
-- Start date is 00:00 of yesterday
-- End date is 23:59 of yesterday
-- Beginning subscribers will be calculated from the ending subscribers
-- on day before yesterday
-- Both values will be inclusive in all the queries
---------------------------------------------------------------------------

	SELECT date_to_infranet(to_date(rpt_date) -1) INTO infStartT FROM dual;
	DBMS_OUTPUT.PUT_LINE('Start Time is ' || infStartT);
	SELECT (date_to_infranet(to_date(rpt_date))-1) INTO infEndT FROM dual;
	DBMS_OUTPUT.PUT_LINE('End Time is ' || infEndT);

--------------------------------------------------------------------



   FOR FETCH_CANCEL_DEAL_CURSOR_REC IN FETCH_CANCEL_DEAL_CURSOR(infStartT, infEndT)
   LOOP
     	-- Fetching the account poid of customer who cancelled the deal
      	accountPoid := FETCH_CANCEL_DEAL_CURSOR_REC.ACCOUNT_OBJ_ID0;


	FOR FETCH_PURCHASE_DEAL_CURSOR_REC IN FETCH_PURCHASE_DEAL_CURSOR(FETCH_CANCEL_DEAL_CURSOR_REC.MIN_CYCLE_END_T, accountPoid,infEndT)
	LOOP
		SELECT DISTINCT deal_obj_id0 INTO oldDealPoid FROM PURCHASED_PRODUCT_T WHERE cycle_end_t = FETCH_CANCEL_DEAL_CURSOR_REC.MIN_CYCLE_END_T AND account_obj_id0 = FETCH_CANCEL_DEAL_CURSOR_REC.ACCOUNT_OBJ_ID0 AND SERVICE_OBJ_TYPE = '/service/ip';
		newDealPoid := FETCH_PURCHASE_DEAL_CURSOR_REC.DEAL_OBJ_ID0;

		IF oldDealPoid != newDealPoid
		THEN

			SELECT COUNT(*) INTO c1 FROM HNS_SUBRPT_BILLING_DEAL_T WHERE DEAL_OBJ_ID0_ID0=oldDealPoid;
			-- checking if old deal exists in HNS_SUBRPT_BILLING_DEAL_T otherwise it is UnMapped.
			-- oldCategoryPoid will have value '0' in this case

			IF c1>0 THEN
				SELECT OBJ_ID0 INTO oldCategoryPoid FROM HNS_SUBRPT_BILLING_DEAL_T WHERE DEAL_OBJ_ID0_ID0=oldDealPoid;
			END IF;

			SELECT COUNT(*) INTO c2 FROM HNS_SUBRPT_BILLING_DEAL_T WHERE DEAL_OBJ_ID0_ID0=newDealPoid;

			-- checking if new deal exists in HNS_SUBRPT_BILLING_DEAL_T otherwise it is UnMapped.
			-- newCategoryPoid will have value '0' in this case

			IF c2>0 THEN
				SELECT OBJ_ID0 INTO newCategoryPoid FROM HNS_SUBRPT_BILLING_DEAL_T WHERE DEAL_OBJ_ID0_ID0=newDealPoid;
			END IF;

			cancelT := FETCH_CANCEL_DEAL_CURSOR_REC.MIN_CYCLE_END_T;
			purchaseT := FETCH_PURCHASE_DEAL_CURSOR_REC.CREATED_T;

			-- deleting if deal movement data has already been inserted into the table for the day.

			DELETE FROM HNS_SPIN_REPORTS_DATA_T WHERE ACCOUNT_POID = accountPoid AND RECORD_T=infStartT;
			INSERT INTO HNS_SPIN_REPORTS_DATA_T VALUES (accountPoid,oldDealPoid,newDealPoid,oldCategoryPoid,newCategoryPoid,cancelT,purchaseT,infStartT);


		END IF;


	END LOOP;


    END LOOP;

    COMMIT;

    DELETE FROM HNS_SPIN_REPORTS_T WHERE DATA_DATE_T >= infStartT AND DATA_DATE_T <= infEndT;

    COMMIT;

    FOR fetch_spin_report_data_rec IN FETCH_SPIN_REPORT_DATA_CURSOR(infStartT,infEndT)
	LOOP
		SELECT COUNT(*) INTO c3 FROM HNS_SPIN_REPORTS_T WHERE OLD_CATEGORY = fetch_spin_report_data_rec.oldcategory_id0
		AND NEW_CATEGORY = fetch_spin_report_data_rec.newcategory_id0
		AND DATA_DATE_T >= infStartT AND DATA_DATE_T <= infEndT;
		-- Checking if the entry exists for the oldcategory , newcategory  movement for the day.

		-- Checking if both categories are not null and unequal
		IF trim(fetch_spin_report_data_rec.oldcategory_id0) IS NOT NULL AND trim(fetch_spin_report_data_rec.newcategory_id0) IS NOT NULL AND trim(fetch_spin_report_data_rec.oldcategory_id0) != trim(fetch_spin_report_data_rec.newcategory_id0)
		THEN
			IF c3 > 0
			THEN
			-- Updating the already existing entry
				UPDATE HNS_SPIN_REPORTS_T SET TOTAL_MOVEMENTS = fetch_spin_report_data_rec.NUM_RECORDS WHERE OLD_CATEGORY = fetch_spin_report_data_rec.oldcategory_id0
				AND NEW_CATEGORY = fetch_spin_report_data_rec.newcategory_id0
				AND CREATED_T >= infStartT AND CREATED_T <= infEndT;
			ELSE
			-- Creating a new entry
				SELECT date_to_infranet(rpt_date) INTO createdT FROM dual;
				INSERT INTO HNS_SPIN_REPORTS_T VALUES (fetch_spin_report_data_rec.oldcategory_id0,fetch_spin_report_data_rec.newcategory_id0,fetch_spin_report_data_rec.NUM_RECORDS,infStartT,createdT);

			END IF;

		END IF;

	END LOOP;

   COMMIT;

EXCEPTION
	WHEN OTHERS THEN
		 RAISE_APPLICATION_ERROR(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);

END SpinReport_date;

/
--------------------------------------------------------
--  DDL for Procedure SPPREPAREDATAFORTRX
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."SPPREPAREDATAFORTRX" 
AS
  	 CURSOR providerCursor IS
	 SELECT provider_id , megabytes
	 FROM hns_trx_summary_vw ;

	 CURSOR trxRateCursor (strProviderId VARCHAR2, rateBandMB NUMBER) IS
	 SELECT provider_id, start_mb, end_mb, start_time, end_time, priority, rate
	 FROM hns_trx_rate_t
	 WHERE provider_id = strProviderId	   AND
		   start_mb <= rateBandMB 		   AND
		   end_mb 	>  rateBandMB ;

	 strProviderId 		  	hns_trx_tank_t.provider_id%TYPE;
	 numRateMB				NUMBER := 0;
	 noOfRemotes			NUMBER := 0;
	 rateBandMB				NUMBER := 0;
	 numAmount				NUMBER := 0;
	 CommitCounter 	   		NUMBER := 0;


BEGIN
	 FOR ProviderRecord IN providerCursor
	 LOOP
	 	 dbms_output.put_line('Provider ID  :'|| ProviderRecord.provider_id);
		 IF ProviderRecord.megabytes > 0 THEN

		 	 strProviderId := ProviderRecord.provider_id;
			 noOfRemotes := fnGetNumberOfRemotes( strProviderId , to_char(sysdate,'mm/dd/yyyy'));
			 rateBandMB    := ProviderRecord.megabytes * noOfRemotes;

		 	 FOR trxRateRecord IN trxRateCursor (strProviderId , rateBandMB )
			 LOOP
			 	 IF to_char(trxRateRecord.start_time,'hh24:mi:ss') = '00:00:00' AND
				    to_char(trxRateRecord.end_time,'hh24:mi:ss') = '00:00:00'
				 THEN
				  	 BEGIN
					  		SELECT sum(bytes/1048576) INTO numRateMB
							FROM hns_trx_tank_vw
							WHERE
								  provider_id = strProviderId	 	     AND
								  priority = trxRateRecord.priority;
					 EXCEPTION
					 		WHEN NO_DATA_FOUND THEN
								  numRateMB := 0 ;
					 	    WHEN OTHERS THEN
								  numRateMB := 0 ;
					 END;
				 ELSE
				  	 BEGIN
					  		SELECT sum(bytes/1048576) INTO numRateMB
							FROM hns_trx_tank_vw
							WHERE
								  provider_id = strProviderId	 	     AND
								  (to_date(to_char(start_t,'hh24:mi:ss'),'hh24:mi:ss') between to_date(to_char(trxRateRecord.start_time,'hh24:mi:ss'),'hh24:mi:ss')  	 AND
								  to_date(to_char(trxRateRecord.end_time,'hh24:mi:ss'),'hh24:mi:ss'))	 	 AND
								  priority = trxRateRecord.priority;
					 EXCEPTION
					 		WHEN NO_DATA_FOUND THEN
								  numRateMB := 0 ;
					 	    WHEN OTHERS THEN
								  numRateMB := 0 ;
					 END;
				 END IF;
				 dbms_output.put_line( 'Rate : '||to_char(trxRateRecord.start_time,'hh24:mi:ss')
				 					   	||'--'||to_char(trxRateRecord.end_time,'hh24:mi:ss')
										||'--'||trxRateRecord.priority
										||'--'||trxRateRecord.provider_id );

				 numAmount := trxRateRecord.rate * numRateMB ;

				 IF numRateMB > 0 THEN
				 	    INSERT INTO hns_trx_uel_feed_data_t
						VALUES
						(
						     strProviderID ,				-- Provider ID
							 rateBandMB    ,				-- MB used to get the rate band
						     trxRateRecord.start_time ,		-- Start Time for the rate band
							 trxRateRecord.end_time   ,		-- End Time for the rate band
							 trxRateRecord.priority ,		-- Priority for the rate band
							 noOfRemotes ,					-- Number of remotes for the provider
							 numRateMB ,					-- Actual MB used
							 trxRateRecord.rate ,			-- Rate used to get the amount
							 numAmount 						-- Amount to be charged for Trx Usage
						);

						COMMIT;
				 END IF; -- numRateMB > 0
			 END LOOP; -- For trxRateCursor
	 	 END IF; --  ProviderRecord.megabytes > 0
	 END LOOP; -- For ProviderCursor
	 COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure STAT_PARTITIONS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."STAT_PARTITIONS" as
	   -- syntax: echo "exec stat_partitions(partition_name);" | sqlplus login/password@tnsname
	   --	Test with PARTITION_NAME = 'P_R_07242006'

	   cursor select_tables_to_stat is
	   SELECT TABLE_NAME, partition_name FROM USER_TAB_PARTITIONS
	   WHERE last_analyzed is null
	       and table_name not like '%BAK'
       --PARTITION_NAME = v_partition_name
	   ORDER BY TABLE_NAME;

BEGIN
	dbms_output.enable(buffer_size => NULL); -- Comment this line out to stop log output;
	dbms_output.put_line('Starting');

        BEGIN
			for a in select_tables_to_stat() loop
			dbms_output.put_line('Stating: '||a.TABLE_NAME);
			SYS.DBMS_STATS.GATHER_TABLE_STATS (
			OwnName        => 'PIN'
			,TabName        => a.TABLE_NAME
			,PartName       => a.partition_name
			,Granularity       => 'PARTITION'
			,Estimate_Percent  => 100
			,Degree            => 4
			,Cascade           => FALSE
			,No_Invalidate     => FALSE);
			end loop;
        END;

dbms_output.put_line('Done');
end STAT_PARTITIONS;

/
--------------------------------------------------------
--  DDL for Procedure STAT_PARTITIONS_DELETE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."STAT_PARTITIONS_DELETE" (v_partition_name VARCHAR2 ) as
	   -- Contact dcook@portal.com for support 800.232.4542
	   -- syntax: echo "exec stat_partitions_delete('partition_name');" | sqlplus login/password@tnsname
	   --	Test with PARTITION_NAME = 'P_R_07242006'

	   cursor select_tables_to_stat is
	   SELECT TABLE_NAME, partition_name
	   FROM USER_TAB_PARTITIONS
	   WHERE PARTITION_NAME = v_partition_name
	   ORDER BY TABLE_NAME;

BEGIN
	dbms_output.enable(buffer_size => NULL); -- Comment this line out to stop log output;
	dbms_output.put_line('Starting');

        BEGIN
			for a in select_tables_to_stat() loop
			dbms_output.put_line('Stating: '||a.TABLE_NAME);
			SYS.DBMS_STATS.DELETE_TABLE_STATS (
			OwnName        => 'PIN'
			,TabName        => a.TABLE_NAME
			,PartName       => a.partition_name
			,cascade_parts  => FALSE  -- cascade to  partitions
			,cascade_indexes => TRUE -- cascade to all indexes
			);
			end loop;
        END;

dbms_output.put_line('Done');
end STAT_PARTITIONS_DELETE;

/
--------------------------------------------------------
--  DDL for Procedure STAT_PARTITIONS_GATHER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."STAT_PARTITIONS_GATHER" (v_partition_name VARCHAR2 ) as
       -- Contact dcook@portal.com for support 800.232.4542
       -- syntax: echo "exec stat_partitions_gather('partition_name');" | sqlplus login/password@tnsname
       --    Test with PARTITION_NAME = 'P_R_07242006'

       cursor select_tables_to_stat is
       SELECT TABLE_NAME, partition_name
       FROM USER_TAB_PARTITIONS
       WHERE PARTITION_NAME = v_partition_name
       ORDER BY TABLE_NAME;

BEGIN
    dbms_output.enable(buffer_size => NULL); -- Comment this line out to stop log output;
    dbms_output.put_line('Starting');

        BEGIN
            for a in select_tables_to_stat() loop
            dbms_output.put_line('Stating: '||a.TABLE_NAME);
            SYS.DBMS_STATS.GATHER_TABLE_STATS (
            OwnName        => 'PIN'
            ,TabName        => a.TABLE_NAME
            ,PartName       => a.partition_name
            ,Granularity       => 'PARTITION'
            ,Estimate_Percent  => 100
            ,Degree            => 4
            ,Cascade           => TRUE
            ,No_Invalidate     => FALSE
            );
            end loop;

        END;

            /*dbms_output.put_line('Deleting: I_EVENT_BI_ITEM_OBJ__ID');
            SYS.DBMS_STATS.DELETE_INDEX_STATS (
            OwnName        => 'PIN'
            ,IndName        => 'I_EVENT_BI_ITEM_OBJ__ID'
            ,PartName       => v_partition_name
            );*/

            dbms_output.put_line('Deleting: L_EVENT_BILLING_CHARGE__CKPT');
            SYS.DBMS_STATS.DELETE_INDEX_STATS (
            OwnName        => 'PIN'
            ,IndName        => 'L_EVENT_BILLING_CHARGE__CKPT'
            ,PartName       => v_partition_name
            );


dbms_output.put_line('Done');
end STAT_PARTITIONS_GATHER;

/
--------------------------------------------------------
--  DDL for Procedure TESTING
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."TESTING" (voipDetail voipArray) IS
type voipObject is record (deviceId varchar2(50), productCode varchar2(50), billingDealName varchar2(50),numberToBePorted varchar2(10));
TYPE voipArray is VARRAY(5) OF voipObject;
voipDetail voipArray := voipArray();

BEGIN

voipDetail.extend(5);
          for i in 1 .. p_inputs.count loop
  DBMS_OUTPUT.PUT_LINE(voipDetail(i).deviceID);
  DBMS_OUTPUT.PUT_LINE(voipDetail(i).productCode);
  
  end loop;
END;

/
--------------------------------------------------------
--  DDL for Procedure TESTING_VOIP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."TESTING_VOIP" (voipDetail in voipArray) IS


BEGIN

          for i in 1 .. voipDetail.count loop
  DBMS_OUTPUT.PUT_LINE(voipDetail(i));
  insert into test values(voipDetail(i));
 
  
  end loop;
END;

/
--------------------------------------------------------
--  DDL for Procedure TESTING_VOIP2
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."TESTING_VOIP2" (createOrder IN VARCHAR2, RET OUT BOOLEAN) IS
  po_obj        JSON_OBJECT_T;
  li_arr        JSON_ARRAY_T;
  li_obj        JSON_OBJECT_T;
  device_ID     VARCHAR2(50);
  san  VARCHAR2(50);
  install_address  JSON_OBJECT_T;
  address1 varchar2(50);
  
  	device_detail_obj 		 JSON_OBJECT_T;
	deviceToLine_arr         JSON_ARRAY_T;
	DEVICE_TO_LINE	 		 VARCHAR2;   --// Device to Line association 
 
BEGIN
  po_obj := JSON_OBJECT_T.parse(createOrder);
  san := po_obj.get_String('SAN');
  DBMS_OUTPUT.PUT_LINE(san);
  li_arr := po_obj.get_Array('voipDetail');
  FOR i IN 0 .. li_arr.get_size - 1 LOOP
    li_obj := JSON_OBJECT_T(li_arr.get(i));
    device_ID := device_ID || '|' || li_obj.get_String('deviceID');
    install_address := JSON_OBJECT_T(po_obj.get('installAddress'));
    address1 := install_address.get_string('address1');
    --unitPrice := li_obj.get_Object('Part').get_Number('UnitPrice');
    
        
    
device_detail_obj := JSON_OBJECT_T(po_obj.get('deviceDetail'));
  deviceToLine_arr := device_detail_obj.get_Array('deviceToLine');
  FOR i IN 0 .. deviceToLine_arr.get_size - 1 LOOP
		DEVICE_TO_LINE := deviceToLine_arr.get(i).to_string;
    DBMS_OUTPUT.PUT_LINE(DEVICE_TO_LINE);
  END LOOP;
  
  
    DBMS_OUTPUT.PUT_LINE(device_ID);
     DBMS_OUTPUT.PUT_LINE(address1);
    insert into test values(device_ID);
    insert into test values(san);
  END LOOP;

ret := TRUE;


COMMIT;

    DBMS_OUTPUT.PUT_LINE('Successfully Executed');
    RET := TRUE;

  EXCEPTION
      WHEN  OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Failure While Execution');
        RET := FALSE;
END;

/
--------------------------------------------------------
--  DDL for Procedure TEST_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."TEST_PROC" 
(
  SAN IN VARCHAR2 
, DEVICE_ID IN VARCHAR2 
, RETVAL OUT VARCHAR2 
) AS
  LINE_ID_VAL VARCHAR2(10);
BEGIN
  
  DBMS_OUTPUT.PUT_LINE('SAN is ' || SAN);
  DBMS_OUTPUT.PUT_LINE('DEVICE_ID is ' || DEVICE_ID);--DSS10000A2
  
  SELECT SUBSTR(DEVICE_ID, -1) INTO LINE_ID_VAL FROM dual;
  
  DBMS_OUTPUT.PUT_LINE('LINE_ID_VAL is ' || LINE_ID_VAL);
  
  RETVAL := '0';
END TEST_PROC;

/
--------------------------------------------------------
--  DDL for Procedure TEST_TUMS_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."TEST_TUMS_PROC" IS
--
--
-- ---------   ------  -------------------------------------------
    decline_obj event_t.poid_id0%TYPE;
    decline_t event_t.end_t%TYPE;
    account_obj event_t.account_obj_id0%TYPE;
    subords_obj event_t.account_obj_id0%TYPE;
    scenario_count INTEGER;
    service_count INTEGER;
    new_pymt_count INTEGER;
    scenario_name VARCHAR2 (255);
    tum_start hns_tum_t.tum_start_days%TYPE;
    tum_end hns_tum_t.tum_end_days%TYPE;
    url_p hns_tum_t.url_parent%TYPE;
    url_c hns_tum_t.url_child%TYPE;
    hit hns_tum_t.hits%TYPE;
    esn hns_profile_customer_t.hns_serial_number%TYPE;
    t_sql_text varchar2(100);
    last_state_change event_t.end_t%TYPE;
    days_in_coll INTEGER;
    account_type cc_decline_t.account_type%TYPE;
    day_in_coll cc_decline_t.DAYSINCOLLECTIONS%TYPE;
    scenario_nm cc_decline_t.SCENARIO_NAME%TYPE;


    --1. Create a cursor to get the list of event poids that declined
    --2. For each event poid, skip if
         -- a. there is a new payment poid after that
         -- b. the account is in collections
         -- c. if there is no bill that is still due and older than the payment attempt
    --3. Load the data corresponding to it in a table


BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');

   --t_sql_text := 'truncate table cc_decline_t';
   --Execute Immediate t_sql_text;

   Execute Immediate 'truncate table cc_decline_table';

   commit;


   --rows_cnt := 0;

   Execute Immediate 'insert /*+ append */ into cc_decline_table   --  1sec
    select ''1'',null,ceil(sysdate - u2d(last_state_change_t))
                   ,last_state_change_t,''NA'',
                   null,null,null,null,null
                   ,account_no
                   ,p2gl(account_obj_id0)
                   ,null,account_obj_id0
                 ,null,1
        from  hns_delinquency_t h
        where collection_state = 1
        and not exists (select 1 from account_t a
                    where a.poid_id0 = h.account_obj_id0
                    and    (a.gl_segment like ''%VAR%''
                    OR    a.gl_segment like ''%GUEST%''
                    OR    a.gl_segment like ''.NAD.KU.ENTERPRISE.GOVT.GSC''))';

    commit;

    Execute Immediate 'merge into cc_decline_table DPT
    using (select bi.account_obj_id0,ccs.scenario_name,ht.tum_start_days,ht.tum_end_days,ht.url_parent,ht.url_child,ht.hits
        from   collections_scenario_t cs, config_collections_scenario_t ccs, hns_tum_t ht , billinfo_t bi
        where  bi.SCENARIO_OBJ_ID0 = cs.POID_ID0
        and    cs.config_scenario_obj_id0 = ccs.obj_id0
        and    ht.coll_scenario = ccs.scenario_name
        ) HCD
    on (hcd.account_obj_id0 = DPT.account_obj_id0
        and dpt.record_type = 1
        and DPT.DAYSINCOLLECTIONS >= hcd.tum_start_days
        and DPT.DAYSINCOLLECTIONS < hcd.tum_end_days)
    when matched then
    update set DPT.TUM_START_DAYS = HCD.TUM_START_DAYS,
        DPT.TUM_END_DAYS = HCD.TUM_END_DAYS,
        DPT.URL_PARENT = HCD.URL_PARENT,
        DPT.URL_CHILD = HCD.URL_CHILD,
        DPT.SCENARIO_NAME = HCD.scenario_name,
        DPT.HITS = HCD.HITS';

    commit;

    Execute Immediate 'insert /*+ append */ into cc_decline_table   --  1sec
    select ''2'',null,c.DAYSINCOLLECTIONS
                   ,c.LAST_STATE_CHANGE,c.scenario_name,
                   c.TUM_START_DAYS,c.TUM_END_DAYS,c.URL_PARENT,c.URL_CHILD,c.HITS
                   ,p2a(gbm.object_id0)
                   ,p2gl(gbm.object_id0)
                   ,null,gbm.object_id0
                 ,null,2
        from  cc_decline_table c, group_t g, group_billing_members_t gbm
        where c.obj_id0 is null
        and   g.account_obj_id0 = c.account_obj_id0
        and   g.poid_id0 = gbm.obj_id0 and
        (select min(status) from service_t s where s.account_obj_id0 = gbm.object_id0 and s.poid_type = ''/service/ip'') = 10100';

    commit;

    Execute Immediate 'delete from cc_decline_table where tum_start_days is null';

    Execute Immediate 'delete from cc_decline_table c
                       where record_type = 1
                       and (select min(status) from service_t s where s.account_obj_id0 = c.account_obj_id0 and s.poid_type = ''/service/ip'') <> 10100';

    commit;


    Execute Immediate 'insert /*+ append */ into cc_decline_table   --  1sec
    select ''1'',null,''NA''
                   ,(select end_t from event_t where poid_id0 = obj_id0),''NA'',
                   null,null,null,null,null
                   ,(select p2a(account_obj_id0) from event_t where poid_id0 = obj_id0)
                   ,(select p2gl(account_obj_id0) from event_t where poid_id0 = obj_id0)
                   ,obj_id0,(select account_obj_id0 from event_t where poid_id0 = obj_id0)
                 ,decode(result,0,1,0),3
            from  event_billing_payment_cc_t
            where result in (0,7)
            and   obj_id0 >= (select d2lp(sysdate-10) from dual)
            and   obj_id0 < (select d2lp(sysdate+1) from dual)';

    commit;

    Execute Immediate 'delete from cc_decline_table where record_type = 3 and obj_id0 in (
    select obj_id0 from (
    SELECT obj_id0, DENSE_RANK()
       OVER (PARTITION BY c.account_obj_id0 ORDER BY c.LAST_STATE_CHANGE desc) AS drank
       FROM cc_decline_table c) where drank <> 1)';


	Execute Immediate 'delete from cc_decline_table where to_be_deleted=1';

	commit;

    Execute Immediate 'update cc_decline_table c set to_be_deleted =  (select count(*) from billinfo_t bi
           where record_type = 3 and bi.account_obj_id0=c.account_obj_id0
           and   (bi.scenario_obj_id0 <> 0 or bi.exempt_from_collections = 1))';

    Execute Immediate 'delete from cc_decline_table where to_be_deleted=1';

	commit;

    Execute Immediate 'update cc_decline_table c set HNS_SERIAL_NUMBER =  (select hns_serial_number from   hns_profile_customer_t hpc, profile_t p
       where  p.poid_id0 = hpc.obj_id0
       and    p.account_obj_id0 = c.account_obj_id0)';

    Execute Immediate 'delete from cc_decline_table where HNS_SERIAL_NUMBER is null';

	commit;

	Execute Immediate 'delete from cc_decline_table c
    where record_type = 3
    and exists (select 1  from billinfo_t b
            where  b.account_obj_id0 = c.account_obj_id0
            and    b.pending_recv <= 0)';

	commit;


    Execute Immediate 'merge into cc_decline_table DPT
    using (select collection_state,tum_start_days, tum_end_days,url_parent,url_child,hits from hns_tum_t
    where collection_state = 8 ) HCD
    on (hcd.collection_state = 8 and dpt.record_type = 3)
    when matched then
    update set DPT.TUM_START_DAYS = HCD.TUM_START_DAYS,
        DPT.TUM_END_DAYS = HCD.TUM_END_DAYS,
        DPT.URL_PARENT = HCD.URL_PARENT,
        DPT.URL_CHILD = HCD.URL_CHILD,
        DPT.HITS = HCD.HITS';

	commit;

    Execute Immediate 'SELECT DISTINCT X.account_type,
                     hpc.HNS_SERIAL_NUMBER,
                     ''NA'' AS daysincollections,
                     0 AS last_state_change,
                     ''NA'' AS scenario_name,
                     ht.tum_start_days,
                     ht.tum_end_days,
                     ht.url_parent,
                     ht.url_child,
                     ht.hits,
                     a.account_no,
                     a.gl_segment,null,null,null,null
       FROM ((SELECT a.poid_id0 PARENT_POID,
                     a.poid_id0 SUBORD_POID,
                     ''1'' ACCOUNT_TYPE,
                     address,
                     PAYINFO_ADDRESS.payinfo_obj_id0
                FROM ( (SELECT p.obj_id0  payinfo_obj_id0,
                               address,
                               city,
                               state,
                               zip
                          FROM payinfo_cc_t p
                         WHERE p.address LIKE ''%BAD ADDRESS%'')
                      UNION
                      (SELECT p.obj_id0  payinfo_obj_id0,
                              --p.account_obj_id0 AS account_obj_id0,
                              address,
                              city,
                              state,
                              zip
                         FROM payinfo_inv_t p
                        WHERE p.address LIKE ''%BAD ADDRESS%'')
                      UNION
                      (SELECT p.obj_id0  payinfo_obj_id0,
                              address,
                              city,
                              state,
                              zip
                         FROM payinfo_dd_t p
                        WHERE   p.address LIKE ''%BAD ADDRESS%'')) PAYINFO_ADDRESS,
                     account_t a,
                     billinfo_t bi
               WHERE     PAYINFO_ADDRESS.payinfo_obj_id0 = bi.PAYINFO_OBJ_ID0
                     AND bi.ACCOUNT_OBJ_ID0 = a.poid_id0
                     AND a.status = 10100
                     AND INSTR (a.lineage,
                                '':'',
                                1,
                                2) = 0
                     AND EXISTS
                            (SELECT 1
                               FROM service_t s
                              WHERE     account_obj_id0 = a.poid_id0
                                    AND poid_type = ''/service/ip''
                                    AND s.status = 10100))) X,
            profile_t p,
            hns_profile_customer_t hpc,
            account_t a,
            hns_delinquency_t hd,
            hns_tum_t ht
      WHERE     a.poid_id0 = X.subord_poid
            AND p.account_obj_id0 = a.poid_id0
            AND p.poid_id0 = hpc.obj_id0
            AND X.parent_poid = hd.ACCOUNT_OBJ_ID0(+)
            AND a.status != 10103
            AND hpc.HNS_SERIAL_NUMBER != ''00000000''
            AND ht.ADDITIONAL_PARAMETER = ''BAD ADDRESS''
                        ';
    --Execute Immediate 'INSERT /*+ append */ INTO CC_DECLINE_T
    --(ACCOUNT_TYPE, DAYSINCOLLECTIONS,
    --       SCENARIO_NAME, TUM_START_DAYS,
    --       TUM_END_DAYS, URL_PARENT, URL_CHILD,
    --       HITS, HNS_SERIAL_NUMBER, LAST_STATE_CHANGE, ACCOUNT_NO, GL_SEGMENT)
    --values (account_type,day_in_coll, scenario_nm,tum_start,tum_end, url_p,url_c,hit,  (select c.esn,c.end_t,p2a(c.account_obj_id0), p2gl(c.account_obj_id0)
    --from cc_decline_table c))';

    commit;

DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending procedure ' || sysdate);

END;

/
--------------------------------------------------------
--  DDL for Procedure THIRD_PARTY_COLLECTION_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."THIRD_PARTY_COLLECTION_PROC" AS

--CURSOR COLLECTION_REPORT_CUR IS
--SELECT account_obj_id0, billinfo_obj_id0, delin_poid_id0
--FROM   TEST_HNS_NEW_BUSINESS_COLL;

CURSOR COLLECTION_REPORT_CUR IS
SELECT account_obj_id0, billinfo_obj_id0, delin_poid_id0
FROM   HNS_NEW_BUSINESS_COLL_ACCOUNTS;



REACTIVATE_DATE NUMBER;
reactivationPossible varchar2(1);
lastDateToRenew NUMBER;
collectionAmountReactivation NUMBER;
equipmentCredits NUMBER;
arBillinfoObj NUMBER;
termFees NUMBER;
activeSites NUMBER;
noRentals NUMBER;

lastChargeDate NUMBER;
lastChargePaymentMethod varchar2(255);
lastChargeEventPoid NUMBER;

lastChargeReason varchar2(255);
vendorResult varchar2(255);
paymentAttempts NUMBER;
accountLogin varchar2(255);
monthsAsCustomer NUMBER;
numWriteoffs NUMBER;
writeoffAmt NUMBER;
--totTimeTaken varchar2(2000);
writeoffReversalAmt NUMBER;

V_COUNTER NUMBER := 0;
DAY_PHONE VARCHAR2(255);
NIGHT_PHONE VARCHAR2(255);
TOTAL_AMOUNT_DUE NUMBER;
ACCOUNT_OBJ ACCOUNT_T.POID_ID0%TYPE;


BEGIN
  DBMS_OUTPUT.PUT_LINE('START  COLLECTION_REPORT_PROC ' || SYSDATE);

  --totTimeTaken := '0:' || substr(to_char(systimestamp),10,16);

  FOR COLLECTION_REPORT_REC IN COLLECTION_REPORT_CUR



    LOOP

    V_COUNTER := V_COUNTER + 1;
    ACCOUNT_OBJ := COLLECTION_REPORT_REC.ACCOUNT_OBJ_ID0;
    arBillinfoObj := COLLECTION_REPORT_REC.BILLINFO_OBJ_ID0;

    DBMS_OUTPUT.PUT_LINE(V_COUNTER || ':account_obj is: ' || ACCOUNT_OBJ);
    --totTimeTaken := totTimeTaken || '1:' || substr(to_char(systimestamp),10,16);

    BEGIN
      --SELECT PHONE INTO DAY_PHONE FROM ACCOUNT_PHONES_T WHERE OBJ_ID0 = COLLECTION_REPORT_REC.ACCOUNT_OBJ_ID0 AND TYPE = 2 AND ROWNUM < 2 ;
      select phone INTO DAY_PHONE from (SELECT PHONE FROM ACCOUNT_PHONES_T WHERE OBJ_ID0 = ACCOUNT_OBJ AND TYPE = 2 order by rec_id desc) where rownum < 2;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
           DAY_PHONE:='0000000000';
    END;

    BEGIN
      --SELECT PHONE INTO NIGHT_PHONE FROM ACCOUNT_PHONES_T WHERE OBJ_ID0 = COLLECTION_REPORT_REC.ACCOUNT_OBJ_ID0 AND TYPE = 1 AND ROWNUM < 2 ;
      select phone INTO NIGHT_PHONE from (SELECT PHONE FROM ACCOUNT_PHONES_T WHERE OBJ_ID0 = ACCOUNT_OBJ AND TYPE = 1 order by rec_id desc) where rownum < 2;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
           NIGHT_PHONE:='0000000000';
    END;

    DBMS_OUTPUT.PUT_LINE(V_COUNTER || 'before REACTIVATE_DATE is: ');
    --totTimeTaken := totTimeTaken || ' 2:' || substr(to_char(systimestamp),10,16);

    BEGIN
        SELECT to_char((trunc(u2d(LAST_STATUS_T))+45),'YYMMDD'),decode(sign(d2i(u2d(LAST_STATUS_T)+45) - d2i(sysdate-1)),1,'Y','N') into lastDateToRenew, reactivationPossible
          FROM SERVICE_T WHERE ACCOUNT_OBJ_ID0 = ACCOUNT_OBJ
          AND POID_TYPE = '/service/ip'
          AND LASTSTAT_CMNT in ('Canceled: 72 Customer (End User)','Collections: C50 Terminated By Collection Monitor');
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
           reactivationPossible:='N';
    END;
    --SELECT decode(sign(lastDateToRenew - d2i(sysdate-1)),1,'Y','N') into reactivationPossible from dual;

    DBMS_OUTPUT.PUT_LINE(V_COUNTER || ':REACTIVATE_DATE is: ' || lastDateToRenew || ' ' || reactivationPossible);
    --totTimeTaken := totTimeTaken || ' 3:' || substr(to_char(systimestamp),10,16);

    --SELECT SUM(DUE) INTO TOTAL_AMOUNT_DUE FROM ITEM_T WHERE AR_BILLINFO_OBJ_ID0=arBillinfoObj AND ITEM_T.STATUS != 1;
    SELECT SUM(DUE) INTO TOTAL_AMOUNT_DUE FROM ITEM_T WHERE AR_BILLINFO_OBJ_ID0=arBillinfoObj;
    --totTimeTaken := totTimeTaken || ' 3a:' || substr(to_char(systimestamp),10,16);

    IF reactivationPossible = 'Y' THEN

        SELECT NVL(SUM(HRCI.VALUE),0) into termFees FROM HNS_REACTIVATE_CREDIT_ITEMS_T HRCI,HNS_REACTIVATE_CREDIT_T HRC
                WHERE HRCI.OBJ_ID0 = HRC.REC_ID AND HRCI.RESOURCE_ID = 840
                AND HRC.ACCOUNT_OBJ_ID0 = ACCOUNT_OBJ AND IS_REACTIVATED = 0;

        collectionAmountReactivation := TOTAL_AMOUNT_DUE - termFees;

        --totTimeTaken := totTimeTaken || ' 3b:' || substr(to_char(systimestamp),10,16);
        SELECT NVL(SUM(HRCI.VALUE),9999999.99) into equipmentCredits FROM HNS_REACTIVATE_CREDIT_ITEMS_T HRCI
                                WHERE HRCI.DEAL_OBJ_ID0 IN (SELECT DT.POID_ID0 FROM DEAL_T DT
                        WHERE DT.NAME IN ('Unreturned Equipment Fee - Rental Modem', 'Unreturned Equipment Fee - Rental Radio'))
                        AND HRCI.OBJ_ID0 IN (SELECT HRC.REC_ID FROM HNS_REACTIVATE_CREDIT_T HRC
                        WHERE HRC.ACCOUNT_OBJ_ID0 = ACCOUNT_OBJ AND HRCI.CREATED_T >
                        (SELECT MAX(HDS.LAST_STATE_CHANGE_T) FROM HNS_DELINQUENCY_STATE_T HDS
                        WHERE HDS.OBJ_ID0 = (SELECT HD.POID_ID0 FROM HNS_DELINQUENCY_T HD WHERE HD.ACCOUNT_OBJ_ID0 = ACCOUNT_OBJ)));

        DBMS_OUTPUT.PUT_LINE(V_COUNTER || ':TOTAL_AMOUNT_DUE is: ' || TOTAL_AMOUNT_DUE || ' termfees:' || termFees || ' equipmentCredits:' || equipmentCredits);
        --totTimeTaken := totTimeTaken || ' 4:' || substr(to_char(systimestamp),10,16);

    ELSE
        lastDateToRenew:=999999;
        collectionAmountReactivation:=9999999.99;
        equipmentCredits:=9999999.99;

    END IF;

    --totTimeTaken := totTimeTaken || ' 4a:' || substr(to_char(systimestamp),10,16);
    select to_char(count(*)) into activeSites
                 from service_t s, account_t a
                 where a.poid_id0 = s.account_obj_id0 and
                         a.poid_id0 in ( (select poid_id0 from account_t where poid_id0 = ACCOUNT_OBJ) union
                         ( select gbm.object_id0
                 from account_t a, group_t g, group_billing_members_t gbm
                 where a.poid_id0 = g.account_obj_id0 and
                         g.poid_id0 = gbm.obj_id0 and
                          a.poid_id0 = ACCOUNT_OBJ ))
                 and s.poid_type in ('/service/ip')
                 and s.status = 10100;
    --totTimeTaken := totTimeTaken || ' 4b:' || substr(to_char(systimestamp),10,16);

    select to_char(count(*)) into noRentals
                 from   event_t e
                 where  e.poid_type = '/event/billing/product/action/cancel'
                 and    e.end_t > (select d2i(sysdate - 1) from dual)
                 and    e.end_t < (select d2i(sysdate) from dual)
                 and    e.service_obj_type = '/service/rental'
                 and    e.account_obj_id0 in ( select object_id0
                                                from   group_billing_members_t gbm, group_t g
                                                where  g.poid_id0 = gbm.obj_id0
                                                and    g.account_obj_id0 = ACCOUNT_OBJ
                                                union
                                                select ACCOUNT_OBJ from dual );

    DBMS_OUTPUT.PUT_LINE(V_COUNTER || ':activeSites is: ' || activeSites || ' noRentals:' || noRentals || ' collectionAmountReactivation:' || collectionAmountReactivation);
    --totTimeTaken := totTimeTaken || ' 5:' || substr(to_char(systimestamp),10,16);

    -- Get the last Charge Attempt
    BEGIN
    select CREATED_T, poid_type, poid_id0 into lastChargeDate, lastChargePaymentMethod, lastChargeEventPoid
                 from event_t where poid_id0 = (
                 SELECT  max(poid_id0) FROM EVENT_T WHERE ACCOUNT_OBJ_ID0= ACCOUNT_OBJ
                 AND POID_TYPE like'/event/billing/payment/%' );
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        lastChargeDate := '693112';
        lastChargeReason := 'Not Attempted';
        lastChargePaymentMethod := 'No Payment Has Been Attempted';
    END;

    DBMS_OUTPUT.PUT_LINE(V_COUNTER || ':lastChargeDate is: ' || lastChargeDate || ' lastChargePaymentMethod:' || lastChargePaymentMethod || ' lastChargeEventPoid:' || lastChargeEventPoid);
    --totTimeTaken := totTimeTaken || ' 6:' || substr(to_char(systimestamp),10,16);

    if lastChargePaymentMethod = '/event/billing/payment/check' then
        lastChargeReason := 'NonPayment';
        vendorResult := 'NA';
    elsif lastChargePaymentMethod = '/event/billing/payment/cash' then
        lastChargeReason := 'NonPayment';
        vendorResult := 'NA';
    else
         if lastChargePaymentMethod = '/event/billing/payment/cc'
         then
            --DBMS_OUTPUT.PUT_LINE(V_COUNTER || '/event/billing/payment/cc if condition ');
            BEGIN
                SELECT nvl(substr(VENDOR_RESULTS,4,3),'000') into vendorResult FROM EVENT_T EVENT,
                 EVENT_BILLING_PAYMENT_CC_T EVENT_CC WHERE POID_ID0=OBJ_ID0
                 AND EVENT.ACCOUNT_OBJ_ID0=ACCOUNT_OBJ
                 and event_cc.OBJ_ID0 = lastChargeEventPoid;
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                vendorResult:='000';
            END;
            BEGIN
                select DESCRIPTION into lastChargeReason
                 from
                 ((select hcrm.DESCRIPTION DESCRIPTION , '1' PRIORITY
                                         from hns_cc_reason_map_t  hcrm
                                         where hcrm.VC_CODE = vendorResult
                                         and rownum < 2 )
                 union ( select 'Failed: Not Defined' DESCRIPTION , '2' PRIORITY from dual ) ) Y
                 where Y.priority in ( select min(priority)
                 from
                 ((select hcrm.DESCRIPTION DESCRIPTION , '1' PRIORITY
                                         from hns_cc_reason_map_t  hcrm
                                         where hcrm.VC_CODE = vendorResult
                                         and rownum < 2 )
                 union ( select 'Failed: Not Defined' DESCRIPTION , '2' PRIORITY from dual ) ) X );
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                lastChargeReason:='Failed: Not Defined';
            END;
        elsif lastChargePaymentMethod = '/event/billing/payment/dd'
        then
            BEGIN
                SELECT nvl(substr(VENDOR_RESULTS,4,3),'000') into vendorResult FROM EVENT_T EVENT,
                 EVENT_BILLING_PAYMENT_DD_T EVENT_CC WHERE POID_ID0=OBJ_ID0
                 AND EVENT.ACCOUNT_OBJ_ID0=ACCOUNT_OBJ
                 and event_cc.OBJ_ID0 = lastChargeEventPoid;
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                vendorResult:='000';
            END;

            BEGIN
                select DESCRIPTION into lastChargeReason
                 from
                 ((select hcrm.DESCRIPTION DESCRIPTION , '1' PRIORITY
                                         from hns_cc_reason_map_t  hcrm
                                         where hcrm.VC_CODE = vendorResult
                                         and rownum < 2 )
                 union ( select 'Failed: Not Defined' DESCRIPTION , '2' PRIORITY from dual ) ) Y
                 where Y.priority in ( select min(priority)
                 from
                 ((select hcrm.DESCRIPTION DESCRIPTION , '1' PRIORITY
                                         from hns_cc_reason_map_t  hcrm
                                         where hcrm.VC_CODE = vendorResult
                                         and rownum < 2 )
                 union ( select 'Failed: Not Defined' DESCRIPTION , '2' PRIORITY from dual ) ) X );
            EXCEPTION
            WHEN NO_DATA_FOUND THEN
                lastChargeReason:='Failed: Not Defined';
            END;

        end if;

        DBMS_OUTPUT.PUT_LINE(V_COUNTER || ':vendorResult is: ' || vendorResult);
        --totTimeTaken := totTimeTaken || ' 7:' || substr(to_char(systimestamp),10,16);

    end if;

    /*select count(*) into paymentAttempts
     from event_t where poid_id0 in (
     SELECT  max(to_char(poid_id0)) FROM EVENT_T WHERE ACCOUNT_OBJ_ID0= ACCOUNT_OBJ
     AND POID_TYPE like'/event/billing/payment/%' );*/

    --DBMS_OUTPUT.PUT_LINE(V_COUNTER || ':vendorResult is: ' || vendorResult || ' lastChargeReason:' || lastChargeReason || ' paymentAttempts:' || paymentAttempts);

    /*if paymentAttempts = 0 THEN
        lastChargeDate := '693112';
        lastChargeReason := 'Not Attempted';
        lastChargePaymentMethod := 'No Payment Has Been Attempted';
    end if;*/

    select X.login into accountLogin
    from
    ( select s.login , decode(s.poid_type,'/service/ip', 1,
                                '/service/dsl', 2, '/service/hardware', 3, 4) SVC_VALUE,
                   s.poid_type
         from service_t s,
         ( (select ACCOUNT_OBJ SUB_POID from dual)
            union
            ( select gbm.object_id0 SUB_POID
            from group_t g, group_billing_members_t gbm
            where g.account_obj_id0 = ACCOUNT_OBJ and
                 g.poid_id0 = gbm.obj_id0 )
          ) X
         where X.SUB_POID = s.account_obj_id0
         order by decode(s.poid_type,'/service/ip', 1, '/service/dsl', 2, '/service/hardware', 3, 4)
    ) X
    where rownum = 1;

    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE,U2D(CREATED_T))) into monthsAsCustomer FROM ACCOUNT_T WHERE POID_ID0 = ACCOUNT_OBJ;

    SELECT COUNT(*) into numWriteoffs FROM HNS_DELINQUENCY_STATE_T WHERE OBJ_ID0=COLLECTION_REPORT_REC.delin_poid_id0 AND COLLECTION_STATE=6;

    if numWriteoffs > 0 then
        SELECT AMOUNT into writeoffAmt FROM HNS_DELINQUENCY_STATE_T
                WHERE OBJ_ID0=COLLECTION_REPORT_REC.delin_poid_id0
                AND REC_ID=(SELECT MAX(REC_ID) FROM HNS_DELINQUENCY_STATE_T WHERE OBJ_ID0=COLLECTION_REPORT_REC.delin_poid_id0 AND COLLECTION_STATE=6);

        SELECT nvl(SUM (item_total),0) into writeoffReversalAmt
        FROM item_t i, event_t e
        WHERE     i.account_obj_id0 = ACCOUNT_OBJ
               AND i.poid_id0 = e.item_obj_id0
               AND e.descr = '[Reverse Writeoff] '
               AND i.effective_t >=
                      (SELECT MAX (effective_t)
                         FROM item_t i1
                        WHERE     i1.account_obj_id0 = i.account_obj_id0
                              AND i1.poid_type = '/item/writeoff');

    else
        writeoffAmt := 0;
                                writeoffReversalAmt := 0;
    end if;

    --totTimeTaken := totTimeTaken || ' 8:' || substr(to_char(systimestamp),10,16);

    UPDATE HNS_NEW_BUSINESS_COLL_ACCOUNTS
    SET homephone=night_phone,
        workphone=day_phone,
        ACTIVE_SITE_COUNT=activeSites,
        amount=TOTAL_AMOUNT_DUE,
        LAST_CHARGE=lastChargeDate,
        REASON=lastChargeReason,
        LOGIN=accountLogin,
        LAST_USED='010169',
        RENTALCOUNT=noRentals,
        REACTIVATION_POSSIBLE=reactivationPossible,
        REACTIVATION_EXP_DATE=lastDateToRenew,
        REACTIVATION_AMOUNT=collectionAmountReactivation,
        EQUIPMENT_CREDITS=equipmentCredits,
        MONTHS_AS_CUSTOMER=monthsAsCustomer,
        --timetaken=totTimeTaken,
        --rec_id=V_COUNTER,
        WRITEOFF_AMOUNT=writeoffAmt,
                                WRITEOFF_REVERSAL_AMT=writeoffReversalAmt
    where account_obj_id0 = ACCOUNT_OBJ;

--totTimeTaken := '0:' || substr(to_char(systimestamp),10,16);

           --IF V_COUNTER = 1000 THEN
             COMMIT;
             --V_COUNTER :=0;
           --END IF;


    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('---------------------------------');
    DBMS_OUTPUT.PUT_LINE('END COLLECTION_REPORT_PROC ' || SYSDATE);

    EXCEPTION

       WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('account_obj is: ' || ACCOUNT_OBJ);
      raise_application_error(-20002,'Unknown Error - '||ACCOUNT_OBJ||' -ERROR- '||SQLERRM);
END THIRD_PARTY_COLLECTION_PROC;

/
--------------------------------------------------------
--  DDL for Procedure TRIM_TOKEN_MD5
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."TRIM_TOKEN_MD5" IS
--
--
-- ---------   ------  -------------------------------------------
    md200 token_md5.md5%TYPE;
    rows INTEGER;
    clear_token token_md5.token%TYPE;

    CURSOR list_account_cur IS
        select md5, token from token_md5;

BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');

    rows := 0;
    FOR account_rec in list_account_cur
    LOOP
     md200 := account_rec.md5;
     clear_token := account_rec.token;

        update token_bin_t set md5 = md200 where token = clear_token;
        rows := rows+1;
        If rows >= 10000 Then
           Commit;
           rows := 0;
        End If;

   END LOOP; -- for each entry.
commit;

DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending procedure ' || sysdate);

END; -- Procedure TRIM_TOKEN_MD5

/
--------------------------------------------------------
--  DDL for Procedure TUMS_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."TUMS_PROC" IS
--
--
-- ---------   ------  -------------------------------------------
    decline_obj event_t.poid_id0%TYPE;
    decline_t event_t.end_t%TYPE;
    account_obj event_t.account_obj_id0%TYPE;
    subords_obj event_t.account_obj_id0%TYPE;
    scenario_count INTEGER;
    service_count INTEGER;
    new_pymt_count INTEGER;
    scenario_name VARCHAR2 (255);
    tum_start hns_tum_t.tum_start_days%TYPE;
    tum_end hns_tum_t.tum_end_days%TYPE;
    url_p hns_tum_t.url_parent%TYPE;
    url_c hns_tum_t.url_child%TYPE;
    hit hns_tum_t.hits%TYPE;
    esn hns_profile_customer_t.hns_serial_number%TYPE;
    t_sql_text varchar2(100);
    last_state_change event_t.end_t%TYPE;
    days_in_coll INTEGER;

    --1. Create a cursor to get the list of event poids that declined
    --2. For each event poid, skip if
         -- a. there is a new payment poid after that
         -- b. the account is in collections
         -- c. if there is no bill that is still due and older than the payment attempt
    --3. Load the data corresponding to it in a table


    CURSOR cc_decline_cur IS
        select obj_id0
               ,(select end_t from event_t where poid_id0 = obj_id0) end_t
               ,(select account_obj_id0 from event_t where poid_id0 = obj_id0) account_obj_id0
        from  event_billing_payment_cc_t
        where result = 7
        and   obj_id0 >= d2lp(sysdate-10)
        and   obj_id0 < d2lp(sysdate+1);

    CURSOR delinq_cur IS
        select account_obj_id0, ceil(sysdate - u2d(last_state_change_t)) coll_days, last_state_change_t
        from  hns_delinquency_t
        where collection_state = 1
        --and   account_no = 'DSS7359420'
        ;

    CURSOR subords_cur (parent_account NUMBER) IS
        select object_id0
        from   group_t g, group_billing_members_t gbm
        where  g.poid_id0 = gbm.obj_id0
        and    g.account_obj_id0 = parent_account;

    CURSOR tum_rec_cur (parent_account NUMBER, daysincoll NUMBER) IS
        select ccs.scenario_name,ht.tum_start_days,ht.tum_end_days,ht.url_parent,ht.url_child,ht.hits
        from   collections_scenario_t cs, config_collections_scenario_t ccs, hns_tum_t ht , billinfo_t bi
        where  bi.SCENARIO_OBJ_ID0 = cs.POID_ID0
        and    cs.config_scenario_obj_id0 = ccs.obj_id0
        and    ht.coll_scenario = ccs.scenario_name
        and    bi.account_obj_id0 = parent_account
        and    daysincoll >= ht.tum_start_days
        and    daysincoll < ht.tum_end_days;

BEGIN

   DBMS_OUTPUT.PUT_LINE('Starting procedure ' || sysdate);
   DBMS_OUTPUT.PUT_LINE('---------------------------------');

   t_sql_text := 'truncate table cc_decline_t';
   Execute Immediate t_sql_text;


   --rows_cnt := 0;


   FOR delinq_rec in delinq_cur
    LOOP
       account_obj := delinq_rec.account_obj_id0;
       days_in_coll := delinq_rec.coll_days;
       last_state_change := delinq_rec.last_state_change_t;

       select count(*) into new_pymt_count from account_t a
       where  a.poid_id0 = account_obj
       and    a.gl_segment not like '%VAR%'
       and    a.gl_segment not like '%GUEST%'
       and    a.gl_segment not like '.NAD.KU.ENTERPRISE.GOVT.GSC';

       if new_pymt_count = 0 then
           -- No TUMS for VAR, gues or GSC accounts
           GOTO end_delinq_loop ;
       end if;

       -- Process subordinates first
       FOR subords_rec in subords_cur ( account_obj )
       LOOP
           subords_obj := subords_rec.object_id0;
           --DBMS_OUTPUT.PUT_LINE('Subord = ' || subords_obj);

           select count(*) into service_count
           from   service_t s
           where  s.account_obj_id0 = subords_obj
           and    poid_type = '/service/ip'
           and    s.status = 10100;
           --DBMS_OUTPUT.PUT_LINE('ip active count = ' || service_count);

           if service_count = 0 then
               -- service IP not active, no TUMS
               GOTO end_subords_delinq_loop ;
           end if;


           select hns_serial_number into esn
           from   hns_profile_customer_t hpc, profile_t p
           where  p.poid_id0 = hpc.obj_id0
           and    p.account_obj_id0 = subords_obj;

           if esn is null then
               --No ESN, no TUMS
               GOTO end_subords_delinq_loop ;
           end if;

           --DBMS_OUTPUT.PUT_LINE('hns_serial_number = ' || esn);

           FOR tum_rec in tum_rec_cur ( account_obj, days_in_coll  )
           LOOP
                scenario_name := tum_rec.scenario_name;
                tum_start := tum_rec.tum_start_days;
                tum_end := tum_rec.tum_end_days;
                url_p := tum_rec.url_parent;
                url_c := tum_rec.url_child;
                hit := tum_rec.hits;
                --DBMS_OUTPUT.PUT_LINE('tumrec = ' || scenario_name);
                INSERT INTO PIN.CC_DECLINE_T (
                     ACCOUNT_TYPE, HNS_SERIAL_NUMBER, DAYSINCOLLECTIONS,
                     LAST_STATE_CHANGE, SCENARIO_NAME, TUM_START_DAYS,
                     TUM_END_DAYS, URL_PARENT, URL_CHILD,
                     HITS, ACCOUNT_NO, GL_SEGMENT)
                VALUES ( '2',esn,days_in_coll,last_state_change, scenario_name,tum_start,tum_end,
                     url_c,url_c,hit,p2a(subords_obj), p2gl(subords_obj) );

                commit;
           END LOOP;

           <<end_subords_delinq_loop>>
           NULL;
       END LOOP;


       select count(*) into service_count
           from   service_t s
           where  s.account_obj_id0 = account_obj
           and    poid_type = '/service/ip'
           and    s.status = 10100;
          --DBMS_OUTPUT.PUT_LINE('ip active count = ' || service_count);
       if service_count = 0 then
           -- service IP not active, no TUMS
           GOTO end_delinq_loop ;
       end if;

       select hns_serial_number into esn
       from   hns_profile_customer_t hpc, profile_t p
       where  p.poid_id0 = hpc.obj_id0
       and    p.account_obj_id0 = account_obj;

       if esn is null then
           -- no ESN, no TUMS
           GOTO end_delinq_loop ;
       end if;

--DBMS_OUTPUT.PUT_LINE('ESN = ' || esn);
       FOR tum_rec in tum_rec_cur ( account_obj, days_in_coll )
       LOOP
            scenario_name := tum_rec.scenario_name;
            tum_start := tum_rec.tum_start_days;
            tum_end := tum_rec.tum_end_days;
            url_p := tum_rec.url_parent;
            url_c := tum_rec.url_child;
            hit := tum_rec.hits;
            --DBMS_OUTPUT.PUT_LINE('ESN = ' || esn);
            INSERT INTO PIN.CC_DECLINE_T (
                 ACCOUNT_TYPE, HNS_SERIAL_NUMBER, DAYSINCOLLECTIONS,
                 LAST_STATE_CHANGE, SCENARIO_NAME, TUM_START_DAYS,
                 TUM_END_DAYS, URL_PARENT, URL_CHILD,
                 HITS, ACCOUNT_NO, GL_SEGMENT)
            VALUES ( '1',esn,days_in_coll,last_state_change, scenario_name,tum_start,tum_end,
                 url_p,url_c,hit,p2a(account_obj), p2gl(account_obj) );

            commit;
       END LOOP;

        --rows_cnt := rows_cnt + 1;

        --if rows_cnt = 10000 then
       --     commit;
       --     rows_cnt := 0;
       -- end if;
       <<end_delinq_loop>>
       NULL;
   END LOOP;


   select tum_start_days, tum_end_days,url_parent,url_child,hits into
            tum_start, tum_end, url_p, url_c, hit
   from hns_tum_t
   where collection_state = 8;

    FOR account_rec in cc_decline_cur
    LOOP
       decline_obj := account_rec.obj_id0;
       decline_t := account_rec.end_t;
       account_obj := account_rec.account_obj_id0;

       select count(*) into scenario_count
       from   billinfo_t bi
       where  bi.account_obj_id0 = account_obj
       and    (bi.scenario_obj_id0 <> 0 or bi.exempt_from_collections = 1);

       if scenario_count <> 0 then
           GOTO end_loop ;
           -- Account is in collections or it is exempt, no decline TUMS
       end if;

       select count(*) into new_pymt_count from event_billing_payment_t ebp, event_t e
       where  e.poid_id0 = ebp.obj_id0
       and    ebp.obj_id0 >= d2lp(sysdate-10)
       and    e.poid_id0 >= d2lp(sysdate-10)
       and    e.account_obj_id0 = account_obj
       and    ebp.command <> 5
       and    e.end_t > decline_t;

       if new_pymt_count > 0 then
           -- A new payment has happened on the account, no decline TUMS
           GOTO end_loop ;
       end if;

       select count(*) into new_pymt_count from bill_t b
       where  b.account_obj_id0 = account_obj
       and    b.due > 0
       and    b.end_t < decline_t;

       if new_pymt_count = 0 then
           -- No open bill older than payment attempt, no decline TUMS
           GOTO end_loop ;
       end if;

       select hns_serial_number into esn
       from   hns_profile_customer_t hpc, profile_t p
       where  p.poid_id0 = hpc.obj_id0
       and    p.account_obj_id0 = account_obj;

       if esn is null then
           -- No ESN, no decline TUMS
           GOTO end_loop ;
       end if;

       INSERT INTO PIN.CC_DECLINE_T (
           ACCOUNT_TYPE, HNS_SERIAL_NUMBER, DAYSINCOLLECTIONS,
           LAST_STATE_CHANGE, SCENARIO_NAME, TUM_START_DAYS,
           TUM_END_DAYS, URL_PARENT, URL_CHILD,
           HITS, ACCOUNT_NO, GL_SEGMENT)
        VALUES ( '1',esn,'NA', decline_t,'NA',tum_start,tum_end,
                url_p,url_c,hit,p2a(account_obj), p2gl(account_obj) );
        commit;

        --rows_cnt := rows_cnt + 1;

        --if rows_cnt = 10000 then
       --     commit;
       --     rows_cnt := 0;
       -- end if;
    <<end_loop>>
    NULL;
   END LOOP;


DBMS_OUTPUT.PUT_LINE('---------------------------------');
DBMS_OUTPUT.PUT_LINE('Ending procedure ' || sysdate);
EXCEPTION  -- exception handlers begin

  WHEN OTHERS THEN  -- handles all other errors
      dbms_output.put_line('Some other kind of error occurred.' || account_obj);
      INSERT INTO PIN.CC_DECLINE_T (
           ACCOUNT_TYPE, HNS_SERIAL_NUMBER, DAYSINCOLLECTIONS,
           LAST_STATE_CHANGE, SCENARIO_NAME, TUM_START_DAYS,
           TUM_END_DAYS, URL_PARENT, URL_CHILD,
           HITS, ACCOUNT_NO, GL_SEGMENT)
        VALUES ( '4',esn,days_in_coll,last_state_change, scenario_name,tum_start,tum_end,
                url_p,url_c,hit,p2a(account_obj), '');
        commit;

END;

/
--------------------------------------------------------
--  DDL for Procedure UPDATECHURNPERCENT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."UPDATECHURNPERCENT" 
IS

CURSOR FETCH_PERCENTAGES
IS
SELECT T1.RPT_DATE,XX.CATEGORY_OBJ_ID0_ID0, XX.CHURNS_CURR_PERIOD, XX.ENDING_SUBS_CURR_PERIOD, ROUND((XX.CHURNS_CURR_PERIOD/XX.ENDING_SUBS_CURR_PERIOD) , 10) CHURNS_PERCENT
FROM HNS_SUBRPT_DAILY_CAT_CHURN_T T1 ,
(SELECT H.RPT_ENDING_DATE, HC.CATEGORY_OBJ_ID0_ID0, HC.churns_curr_period ,HC.ENDING_SUBS_CURR_PERIOD
 FROM HNS_SUBRPT_T H , HNS_SUBRPT_ADJSUBS_BY_CAT_T HC
 WHERE H.POID_ID0 = HC.OBJ_ID0
 and HC.ENDING_SUBS_CURR_PERIOD > 0
 and h.RPT_BEGINING_DATE >= d2u('1/1/2008')) XX
 WHERE T1.CATEGORY_OBJ_ID0_ID0 = XX.CATEGORY_OBJ_ID0_ID0
AND T1.RPT_DATE = XX.RPT_ENDING_DATE;


BEGIN

    FOR FETCH_CHURN_PERCENT_REC IN FETCH_PERCENTAGES
    LOOP

        UPDATE HNS_SUBRPT_DAILY_CAT_CHURN_T SET CHURNS_PERCENT_CURR_DAY = FETCH_CHURN_PERCENT_REC.CHURNS_PERCENT
        WHERE RPT_DATE = FETCH_CHURN_PERCENT_REC.RPT_DATE
        AND CATEGORY_OBJ_ID0_ID0 = FETCH_CHURN_PERCENT_REC.CATEGORY_OBJ_ID0_ID0;
    END LOOP;

    COMMIT;

     EXCEPTION
     WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
    END UPDATECHURNPERCENT;

/
--------------------------------------------------------
--  DDL for Procedure UPDATETZCHANGESINUSAGEDATA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."UPDATETZCHANGESINUSAGEDATA" 
AS
  	   CURSOR UsageDataCursor IS
	   SELECT *
	   FROM HNS_TZ_CHANGE_BUFFER_T
	   FOR UPDATE OF start_t, end_t;

	   dtStartTime 	 	DATE;
	   dtEndTime 		DATE;
	   strTimeZone 		VARCHAR2(10);
	   numShiftFactor	NUMBER := 0;
	   commitCounter	NUMBER :=0;

BEGIN
	  FOR usageDataRecord IN UsageDataCursor
	  LOOP

	  	   dtStartTime := TO_DATE(SUBSTR(UsageDataRecord.start_t,5,2)|| '/' ||
		   			   	   		SUBSTR(UsageDataRecord.start_t,7,2)|| '/' ||
		   			   	  		SUBSTR(UsageDataRecord.start_t,1,4)|| ' ' ||
		   			   	  		SUBSTR(UsageDataRecord.start_t,9,2)|| ':' ||
		   			   	  		SUBSTR(UsageDataRecord.start_t,11,2)|| ':' ||
		   			   	  		SUBSTR(UsageDataRecord.start_t,13,2)
		   			   	  , 'mm/dd/yyyy hh24:mi:ss');
		   dtEndTime   := TO_DATE(SUBSTR(UsageDataRecord.end_t,5,2)|| '/' ||
		   			   	   		SUBSTR(UsageDataRecord.end_t,7,2)|| '/' ||
		   			   	  		SUBSTR(UsageDataRecord.end_t,1,4)|| ' ' ||
		   			   	  		SUBSTR(UsageDataRecord.end_t,9,2)|| ':' ||
		   			   	  		SUBSTR(UsageDataRecord.end_t,11,2)|| ':' ||
		   			   	  		SUBSTR(UsageDataRecord.end_t,13,2)
		   			   	  , 'mm/dd/yyyy hh24:mi:ss');

	  	   -- dbms_output.put_line( 'Loop ' || UsageDataRecord.siteid );

		   -- Getting the Zip Code from Account Nameinfo corresponding to the SiteId of the account
		   BEGIN
		   SELECT NVL(LTRIM(RTRIM(timezone_id)),'EST') INTO strTimeZone
		   FROM SERVICE_T
		   WHERE
		   		 login = UsageDataRecord.siteid;
		   EXCEPTION
		   		 WHEN NO_DATA_FOUND THEN
				 	  strTimeZone := 'EST'; -- Default to EST as current TZ setting
				 WHEN OTHERS THEN
				 	  strTimeZone := 'EST'; -- Default to EST as current TZ setting
		   END;

		   -- Changing the Start and End Time based on TZ data
		   IF (strTimeZone) = 'CST' THEN
		   	  		numShiftFactor := -1 ;
		   ELSIF strTimeZone = 'EST+1' THEN
		   	  		numShiftFactor := 1 ;
		   ELSIF strTimeZone = 'GMT+1' THEN
		   	  		numShiftFactor := +6 ;
		   ELSIF strTimeZone = 'MST' THEN
		   	  		numShiftFactor := -2 ;
		   ELSIF strTimeZone = 'PST' THEN
		   	  		numShiftFactor := -3 ;
		   ELSIF strTimeZone = 'PST-1' THEN
		   	  		numShiftFactor := -4 ;
		   ELSIF strTimeZone = 'PST-2' THEN
		   	  		numShiftFactor := -5 ;
		   ELSIF strTimeZone = 'PST-3' THEN
		   	  		numShiftFactor := -6 ;
		   ELSIF strTimeZone = 'PST-4' THEN
		   	  		numShiftFactor := -7 ;
		   ELSIF strTimeZone = 'PST-5' THEN
		   	  		numShiftFactor := -8 ;
		   ELSIF strTimeZone = 'PST-6' THEN
		   	  		numShiftFactor := -9 ;
		   ELSIF strTimeZone = 'PST-7' THEN
		   	  		numShiftFactor := -10 ;
		   ELSIF strTimeZone = 'EST' THEN
		   	  		numShiftFactor := 0 ;
   		   ELSE
		   	  		numShiftFactor := 0 ;
		   END IF;
 	       -- Do the time shift by the factor in terms of day ( hours/24 )
		   dtStartTime := dtStartTime + ( numShiftFactor/24);
		   dtEndTime := dtEndTime + ( numShiftFactor/24);

		   -- Update changed siteid , start and end times
			   UPDATE HNS_TZ_CHANGE_BUFFER_T
			   SET
			   	   start_t = to_char(dtStartTime,'yyyymmddhh24miss'),
				   end_t = to_char(dtEndTime,'yyyymmddhh24miss')
			   WHERE
			   		 CURRENT OF UsageDataCursor ;

		   commitCounter := commitCounter + 1;
		   IF commitCounter = 200 THEN
			   COMMIT; -- Commit the current record
		  	   -- dbms_output.put_line( 'End Loop ' || UsageDataRecord.siteid );
			   commitCounter := 0 ;
		   END IF;
	  END LOOP;
	  COMMIT;
	  RETURN;
END;

/
--------------------------------------------------------
--  DDL for Procedure UPDATETZCHANGESINUSAGEDATA3
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."UPDATETZCHANGESINUSAGEDATA3" 
AS
  	   CURSOR UsageDataCursor IS
	   SELECT *
	   FROM HNS_TZ_CHANGE_BUFFER_BAJA3_T
	   FOR UPDATE OF start_t, end_t;

	   dtStartTime 	 	DATE;
	   dtEndTime 		DATE;
	   strTimeZone 		VARCHAR2(10);
	   numShiftFactor	NUMBER := 0;
	   commitCounter	NUMBER :=0;

BEGIN
	  FOR usageDataRecord IN UsageDataCursor
	  LOOP

	  	   dtStartTime := TO_DATE(SUBSTR(UsageDataRecord.start_t,5,2)|| '/' ||
		   			   	   		SUBSTR(UsageDataRecord.start_t,7,2)|| '/' ||
		   			   	  		SUBSTR(UsageDataRecord.start_t,1,4)|| ' ' ||
		   			   	  		SUBSTR(UsageDataRecord.start_t,9,2)|| ':' ||
		   			   	  		SUBSTR(UsageDataRecord.start_t,11,2)|| ':' ||
		   			   	  		SUBSTR(UsageDataRecord.start_t,13,2)
		   			   	  , 'mm/dd/yyyy hh24:mi:ss');
		   dtEndTime   := TO_DATE(SUBSTR(UsageDataRecord.end_t,5,2)|| '/' ||
		   			   	   		SUBSTR(UsageDataRecord.end_t,7,2)|| '/' ||
		   			   	  		SUBSTR(UsageDataRecord.end_t,1,4)|| ' ' ||
		   			   	  		SUBSTR(UsageDataRecord.end_t,9,2)|| ':' ||
		   			   	  		SUBSTR(UsageDataRecord.end_t,11,2)|| ':' ||
		   			   	  		SUBSTR(UsageDataRecord.end_t,13,2)
		   			   	  , 'mm/dd/yyyy hh24:mi:ss');

	  	   -- dbms_output.put_line( 'Loop ' || UsageDataRecord.siteid );

		   -- Getting the Zip Code from Account Nameinfo corresponding to the SiteId of the account
		   BEGIN
		   SELECT NVL(LTRIM(RTRIM(timezone_id)),'EST') INTO strTimeZone
		   FROM SERVICE_T
		   WHERE
		   		 login = UsageDataRecord.siteid;
		   EXCEPTION
		   		 WHEN NO_DATA_FOUND THEN
				 	  strTimeZone := 'EST'; -- Default to EST as current TZ setting
				 WHEN OTHERS THEN
				 	  strTimeZone := 'EST'; -- Default to EST as current TZ setting
		   END;

		   -- Changing the Start and End Time based on TZ data
		   IF (strTimeZone) = 'CST' THEN
		   	  		numShiftFactor := -1 ;
		   ELSIF strTimeZone = 'EST+1' THEN
		   	  		numShiftFactor := 1 ;
		   ELSIF strTimeZone = 'GMT+1' THEN
		   	  		numShiftFactor := +6 ;
		   ELSIF strTimeZone = 'MST' THEN
		   	  		numShiftFactor := -2 ;
		   ELSIF strTimeZone = 'PST' THEN
		   	  		numShiftFactor := -3 ;
		   ELSIF strTimeZone = 'PST-1' THEN
		   	  		numShiftFactor := -4 ;
		   ELSIF strTimeZone = 'PST-2' THEN
		   	  		numShiftFactor := -5 ;
		   ELSIF strTimeZone = 'PST-3' THEN
		   	  		numShiftFactor := -6 ;
		   ELSIF strTimeZone = 'PST-4' THEN
		   	  		numShiftFactor := -7 ;
		   ELSIF strTimeZone = 'PST-5' THEN
		   	  		numShiftFactor := -8 ;
		   ELSIF strTimeZone = 'PST-6' THEN
		   	  		numShiftFactor := -9 ;
		   ELSIF strTimeZone = 'PST-7' THEN
		   	  		numShiftFactor := -10 ;
		   ELSIF strTimeZone = 'EST' THEN
		   	  		numShiftFactor := 0 ;
   		   ELSE
		   	  		numShiftFactor := 0 ;
		   END IF;
 	       -- Do the time shift by the factor in terms of day ( hours/24 )
		   dtStartTime := dtStartTime + ( numShiftFactor/24);
		   dtEndTime := dtEndTime + ( numShiftFactor/24);

		   -- Update changed siteid , start and end times
			   UPDATE HNS_TZ_CHANGE_BUFFER_BAJA3_T
			   SET
			   	   start_t = to_char(dtStartTime,'yyyymmddhh24miss'),
				   end_t = to_char(dtEndTime,'yyyymmddhh24miss')
			   WHERE
			   		 CURRENT OF UsageDataCursor ;

		   commitCounter := commitCounter + 1;
		   IF commitCounter = 200 THEN
			   COMMIT; -- Commit the current record
		  	   -- dbms_output.put_line( 'End Loop ' || UsageDataRecord.siteid );
			   commitCounter := 0 ;
		   END IF;
	  END LOOP;
	  COMMIT;
	  RETURN;
END;

/
--------------------------------------------------------
--  DDL for Procedure UPDATETZFORACCOUNTDATA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."UPDATETZFORACCOUNTDATA" 
AS
  	   CURSOR AccountCursor IS
	   SELECT s.login siteid , NVL(an.zip,'99999') zipcode
	   FROM SERVICE_T S , ACCOUNT_NAMEINFO_T AN
	   WHERE
			 s.account_obj_id0 = an.obj_id0 and
			 s.poid_type = '/service/ip' and
			 an.rec_id = 1;


	   strSiteId		SERVICE_T.login%TYPE;
	   strZipCode		VARCHAR2(5);
	   strTimeZone 		VARCHAR2(10);
	   RecordCounter	NUMBER := 0;

BEGIN
	  RecordCounter := 0;
	  FOR AccountDataRecord IN AccountCursor
	  LOOP
	  	   RecordCounter := RecordCounter + 1;

		   -- Getting the TZ for the above Zip Code
		   BEGIN
		   SELECT hns_timezone INTO strTimeZone
		   FROM HNS_TIMEZONE
		   WHERE
		   		 hns_zipcode = AccountDataRecord.zipcode ;
		   EXCEPTION
		   		 WHEN NO_DATA_FOUND THEN
					   BEGIN
					   SELECT hns_timezone INTO strTimeZone
					   FROM HNS_TIMEZONE
					   WHERE
					   		 hns_zipcode = SUBSTR(AccountDataRecord.zipcode,1,4) ;
					   EXCEPTION
					   		 WHEN NO_DATA_FOUND THEN
								   BEGIN
								   SELECT hns_timezone INTO strTimeZone
								   FROM HNS_TIMEZONE
								   WHERE
								   		 hns_zipcode = SUBSTR(AccountDataRecord.zipcode,1,3) ;
								   EXCEPTION
								   		 WHEN NO_DATA_FOUND THEN
										      strTimeZone := 'EST';
									     WHEN OTHERS THEN
										 	  strTimeZone := 'EST';
								   END;
						     WHEN OTHERS THEN
							 	  strTimeZone := 'EST';
						END;
			     WHEN OTHERS THEN
				 	  strTimeZone := 'EST';
		   END;

     	   UPDATE SERVICE_T
		   SET
		   	   timezone_id = strTimeZone
		   WHERE
		   	   login = AccountDataRecord.siteid;

		   IF RecordCounter = 200 THEN
		   	  COMMIT; -- Commit the current set of 200 records
			  RecordCounter := 0;
		   END IF;

	  END LOOP;
	  COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Procedure UPDATEWINBACKS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."UPDATEWINBACKS" 
IS
--------------------------------------------------------------------
--FETCH_STATUS_CHANGE CURSOR contains the minimum and the maximum time
--at which the ip service status for the account got changed on the day
--------------------------------------------------------------------
CURSOR FETCH_STATUS_CHANGE(START_TIME INTEGER, END_TIME INTEGER)
IS
SELECT SERVICE_OBJ_ID0 , MAX(end_t) AS  LAST_TIME,  MIN(end_t) AS FIRST_TIME
FROM  EVENT_T e, EVENT_CUSTOMER_STATUSES_T ecs
WHERE  e.poid_id0 = ecs.obj_id0 AND e.end_t  >= START_TIME AND e.end_t  <= END_TIME
AND service_obj_type='/service/ip' GROUP BY service_obj_id0;

CURSOR FETCH_WINBACK_COUNT(Rpt_T INTEGER) IS
SELECT DEAL_OBJ_ID0, COUNT(*) AS COUNT FROM HNS_SUBRPT_ACT_DETAILS_T WHERE RPT_DATE = Rpt_T AND ACTIVATION_TYPE = 'W'
GROUP BY DEAL_OBJ_ID0;

infStartT INTEGER;
infEndT INTEGER;
initStatus INTEGER;
finalStatus INTEGER;
newDealPoid INTEGER;
accountPoid INTEGER;
accountNo VARCHAR2(255);
procStartT INTEGER;
procEndT INTEGER;
num INTEGER;
cnt INTEGER;

BEGIN

SELECT date_to_infranet(SYSDATE) INTO procStartT FROM dual;

---------------------------------------------------------------------------
-- Calculating the Start and End date for the script in Portal Format
-- Start date is 00:00 of yesterday
-- End date is 23:59 of yesterday
-- Both values will be inclusive in all the queries
---------------------------------------------------------------------------
	SELECT date_to_infranet(TRUNC(SYSDATE-1)) INTO infStartT FROM dual;
	--SELECT date_to_infranet(TRUNC(TO_DATE('01/06/2007','MM/DD/YYYY') -1)) INTO infStartT FROM dual;
	DBMS_OUTPUT.PUT_LINE('Start Time is ' || infStartT);
	SELECT (date_to_infranet(TRUNC(SYSDATE))-1) INTO infEndT FROM dual;
	--SELECT (date_to_infranet(TRUNC(TO_DATE('01/06/2007','MM/DD/YYYY')))-1) INTO infEndT FROM dual;
	DBMS_OUTPUT.PUT_LINE('End Time is ' || infEndT);
--------------------------------------------------------------------
	FOR FETCH_STATUS_CHANGE_REC IN FETCH_STATUS_CHANGE(infStartT, infEndT)
	LOOP
            -- Fetching the initial status of the account at the beginning of the day
			 SELECT status INTO initStatus FROM (SELECT status FROM EVENT_CUSTOMER_STATUSES_T ecs, EVENT_T e
             WHERE obj_id0=poid_id0 AND rec_id=0
             AND e.service_obj_id0=FETCH_STATUS_CHANGE_REC.SERVICE_OBJ_ID0
             AND end_t=FETCH_STATUS_CHANGE_REC.FIRST_TIME ORDER BY status ASC) WHERE ROWNUM = 1;

			 -- Fetching the final status of the account at the end of the day
			 SELECT status INTO finalStatus FROM (SELECT status FROM EVENT_CUSTOMER_STATUSES_T ecs, EVENT_T e
             WHERE obj_id0=poid_id0  AND rec_id=1
             AND e.service_obj_id0=FETCH_STATUS_CHANGE_REC.SERVICE_OBJ_ID0
             AND end_t=FETCH_STATUS_CHANGE_REC.LAST_TIME ORDER BY status ASC) WHERE ROWNUM = 1;

            -- Checking if the initial status was 'Closed' and final status was 'Active or Inactive' ,i.e. 'NOT CLOSED'
			IF (initStatus = 10103 AND finalStatus != 10103) THEN
			    --SELECT COUNT(*) INTO cnt FROM ACCOUNT_PRODUCTS_T WHERE service_obj_id0=FETCH_STATUS_CHANGE_REC.SERVICE_OBJ_ID0 176584193 AND status!=3;
				SELECT  COUNT(*) INTO cnt FROM (SELECT DISTINCT service_obj_id0 FROM PURCHASED_PRODUCT_T WHERE service_obj_id0=FETCH_STATUS_CHANGE_REC.SERVICE_OBJ_ID0 AND status!= 3);
				IF cnt=1 THEN
			 	SELECT DISTINCT deal_obj_id0 , account_obj_id0 ,(SELECT account_no FROM ACCOUNT_T WHERE poid_id0=account_obj_id0) INTO newDealPoid,  accountPoid , accountNo FROM PURCHASED_PRODUCT_T
				WHERE service_obj_id0=FETCH_STATUS_CHANGE_REC.SERVICE_OBJ_ID0
				AND status!=3;
			    INSERT INTO HNS_SUBRPT_ACT_DETAILS_T VALUES(infStartT,newDealPoid,  accountNo , accountPoid , 'W');
				ELSE
				DBMS_OUTPUT.PUT_LINE('ER' || FETCH_STATUS_CHANGE_REC.SERVICE_OBJ_ID0);
				END IF;
			 END IF;

 		END LOOP;

		COMMIT;
		----- Enter the data in HNS_SUBRPT_ACT_BY_DEALS_TEST_T ----------------

		FOR FETCH_WINBACK_COUNT_REC IN FETCH_WINBACK_COUNT(infStartT)
		LOOP
		SELECT COUNT(*) INTO num FROM HNS_SUBRPT_ACTS_BY_DEAL_TEST_T WHERE RPT_DATE = infStartT
		AND DEAL_OBJ_ID0 = FETCH_WINBACK_COUNT_REC.DEAL_OBJ_ID0;

		-- Checking if the entry for the deal already exists in the HNS_SUBRPT_ACTS_BY_DEAL_T table for this day
		-- If it does, then update the WINBACKS column
		IF num = 0 THEN
		INSERT INTO HNS_SUBRPT_ACTS_BY_DEAL_T VALUES (infStartT,FETCH_WINBACK_COUNT_REC.DEAL_OBJ_ID0,0,FETCH_WINBACK_COUNT_REC.COUNT );
		ELSE
		UPDATE HNS_SUBRPT_ACTS_BY_DEAL_T SET WINBACKS = FETCH_WINBACK_COUNT_REC.COUNT WHERE RPT_DATE = infStartT
		AND DEAL_OBJ_ID0 = FETCH_WINBACK_COUNT_REC.DEAL_OBJ_ID0;
		END IF;
		END LOOP;

		COMMIT;


		SELECT date_to_infranet(SYSDATE) INTO procEndT FROM dual;
		DBMS_OUTPUT.PUT_LINE('Execution Start Time is ' || procStartT);
		DBMS_OUTPUT.PUT_LINE('Execution End Time is ' || procEndT);

	 EXCEPTION
	 WHEN OTHERS THEN
		 RAISE_APPLICATION_ERROR(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
	END UPDATEWINBACKS;

/
--------------------------------------------------------
--  DDL for Procedure UPDATEWINBACKS_DATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."UPDATEWINBACKS_DATE" (infOffsetStart INTEGER)
IS
--------------------------------------------------------------------
--FETCH_STATUS_CHANGE CURSOR contains the minimum and the maximum time
--at which the ip service status for the account got changed on the day
--------------------------------------------------------------------
CURSOR FETCH_STATUS_CHANGE(START_TIME INTEGER, END_TIME INTEGER)
IS
SELECT SERVICE_OBJ_ID0 , MAX(end_t) AS  LAST_TIME,  MIN(end_t) AS FIRST_TIME
FROM  EVENT_T e, EVENT_CUSTOMER_STATUSES_T ecs
WHERE  e.poid_id0 = ecs.obj_id0 AND e.end_t  >= START_TIME AND e.end_t  <= END_TIME
AND service_obj_type='/service/ip' GROUP BY service_obj_id0;

CURSOR FETCH_WINBACK_COUNT(Rpt_T INTEGER) IS
SELECT DEAL_OBJ_ID0, COUNT(*) AS COUNT FROM HNS_SUBRPT_ACT_DETAILS_T WHERE RPT_DATE = Rpt_T AND ACTIVATION_TYPE = 'W'
GROUP BY DEAL_OBJ_ID0;

infStartT INTEGER;
infEndT INTEGER;
initStatus INTEGER;
finalStatus INTEGER;
newDealPoid INTEGER;
accountPoid INTEGER;
accountNo VARCHAR2(255);
procStartT INTEGER;
procEndT INTEGER;
num INTEGER;
cnt INTEGER;




BEGIN

SELECT date_to_infranet(SYSDATE) INTO procStartT FROM dual;

---------------------------------------------------------------------------
-- Calculating the Start and End date for the script in Portal Format
-- Start date is 00:00 of yesterday
-- End date is 23:59 of yesterday
-- Both values will be inclusive in all the queries
---------------------------------------------------------------------------
	SELECT date_to_infranet(TRUNC(SYSDATE - 1 - infOffsetStart)) INTO infStartT FROM dual;
	--SELECT date_to_infranet(TRUNC(TO_DATE('01/06/2007','MM/DD/YYYY') -1)) INTO infStartT FROM dual;
	DBMS_OUTPUT.PUT_LINE('Start Time is ' || infStartT);
	SELECT (date_to_infranet(TRUNC(SYSDATE - infOffsetStart))-1) INTO infEndT FROM dual;
	--SELECT (date_to_infranet(TRUNC(TO_DATE('01/06/2007','MM/DD/YYYY')))-1) INTO infEndT FROM dual;
	DBMS_OUTPUT.PUT_LINE('End Time is ' || infEndT);
--------------------------------------------------------------------
	FOR FETCH_STATUS_CHANGE_REC IN FETCH_STATUS_CHANGE(infStartT, infEndT)
	LOOP
            -- Fetching the initial status of the account at the beginning of the day
			 SELECT status INTO initStatus FROM (SELECT status FROM EVENT_CUSTOMER_STATUSES_T ecs, EVENT_T e
             WHERE obj_id0=poid_id0 AND rec_id=0
             AND e.service_obj_id0=FETCH_STATUS_CHANGE_REC.SERVICE_OBJ_ID0
             AND end_t=FETCH_STATUS_CHANGE_REC.FIRST_TIME ORDER BY status ASC) WHERE ROWNUM = 1;

			 -- Fetching the final status of the account at the end of the day
			 SELECT status INTO finalStatus FROM (SELECT status FROM EVENT_CUSTOMER_STATUSES_T ecs, EVENT_T e
             WHERE obj_id0=poid_id0  AND rec_id=1
             AND e.service_obj_id0=FETCH_STATUS_CHANGE_REC.SERVICE_OBJ_ID0
             AND end_t=FETCH_STATUS_CHANGE_REC.LAST_TIME ORDER BY status ASC) WHERE ROWNUM = 1;

            -- Checking if the initial status was 'Closed' and final status was 'Active or Inactive' ,i.e. 'NOT CLOSED'
			IF (initStatus = 10103 AND finalStatus != 10103) THEN
			    --SELECT COUNT(*) INTO cnt FROM ACCOUNT_PRODUCTS_T WHERE service_obj_id0=FETCH_STATUS_CHANGE_REC.SERVICE_OBJ_ID0 176584193 AND status!=3;
				SELECT  COUNT(*) INTO cnt FROM (SELECT DISTINCT service_obj_id0 FROM PURCHASED_PRODUCT_T WHERE service_obj_id0=FETCH_STATUS_CHANGE_REC.SERVICE_OBJ_ID0 AND status!= 3);
				IF cnt=1 THEN
			 	SELECT DISTINCT deal_obj_id0 , account_obj_id0 ,(SELECT account_no FROM ACCOUNT_T WHERE poid_id0=account_obj_id0) INTO newDealPoid,  accountPoid , accountNo FROM PURCHASED_PRODUCT_T
				WHERE service_obj_id0=FETCH_STATUS_CHANGE_REC.SERVICE_OBJ_ID0
				AND status!=3;
			    INSERT INTO HNS_SUBRPT_ACT_DETAILS_T VALUES(infStartT,newDealPoid,  accountNo , accountPoid , 'W');
				ELSE
				DBMS_OUTPUT.PUT_LINE('ER' || FETCH_STATUS_CHANGE_REC.SERVICE_OBJ_ID0);
				END IF;
			 END IF;

 		END LOOP;

		COMMIT;
		----- Enter the data in HNS_SUBRPT_ACT_BY_DEALS_TEST_T ----------------

		FOR FETCH_WINBACK_COUNT_REC IN FETCH_WINBACK_COUNT(infStartT)
		LOOP
		SELECT COUNT(*) INTO num FROM HNS_SUBRPT_ACTS_BY_DEAL_TEST_T WHERE RPT_DATE = infStartT
		AND DEAL_OBJ_ID0 = FETCH_WINBACK_COUNT_REC.DEAL_OBJ_ID0;

		-- Checking if the entry for the deal already exists in the HNS_SUBRPT_ACTS_BY_DEAL_T table for this day
		-- If it does, then update the WINBACKS column
		IF num = 0 THEN
		INSERT INTO HNS_SUBRPT_ACTS_BY_DEAL_T VALUES (infStartT,FETCH_WINBACK_COUNT_REC.DEAL_OBJ_ID0,0,FETCH_WINBACK_COUNT_REC.COUNT );
		ELSE
		UPDATE HNS_SUBRPT_ACTS_BY_DEAL_T SET WINBACKS = FETCH_WINBACK_COUNT_REC.COUNT WHERE RPT_DATE = infStartT
		AND DEAL_OBJ_ID0 = FETCH_WINBACK_COUNT_REC.DEAL_OBJ_ID0;
		END IF;
		END LOOP;

		COMMIT;


		SELECT date_to_infranet(SYSDATE) INTO procEndT FROM dual;
		DBMS_OUTPUT.PUT_LINE('Execution Start Time is ' || procStartT);
		DBMS_OUTPUT.PUT_LINE('Execution End Time is ' || procEndT);

	 EXCEPTION
	 WHEN OTHERS THEN
		 RAISE_APPLICATION_ERROR(-20001,'An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM);
	END UPDATEWINBACKS_DATE;

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_CREDIT_PROFILE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."UPDATE_CREDIT_PROFILE" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
79d 312
TqSwghdyXg39/xRyozpDalPEqOAwg/CJDyATfI6V/kewU5ZeNQte8uxjpNnW1i4GvX6RdNlB
2N7XGvK3K1xV/k+k+f0W7mzz/miGC5os/zbQ59E2N6py0CQPcvyx2ToIKVwAneRzc9LBdOId
wwFu4AL+fCMWHSsaEmbkKxuqkZHmK2bzpPfne6iVCvbkNj4fkffKdfKNUImXAZNuuNGnAZsW
Wj9dvf9kiSZ1Qedh/pcy+eMGCPr7lpHNwamwpMfGN1kOhBimlPGCQZtm6gnKp4xaCf/mW/KV
GBQmBY/ZyyIiNq8j7bIrHnL+E5jNn8edI+cNOumXHloudni0fnrrMgtxSNE/zfOAbpXSDl2w
i9cSgoVpB4O3HQHckEU6eTMBZWirPUtut0ai06O/lxS7O4tUF/OZQWG97Ab+77PDYU2Kkmjb
I0bpQPcUhg1bQjgEWgc8c1xuI5nLWSRc6M5QWXu2eui9KZuvykmaqv2VoI3jOHABBjM3gR5r
I0Xrd0BXxD1ECpl3Aytq/KxcgNLYmkZdJ+sYoZ3GsGHEmBcrE32yEyvAGFrJIrf0CH0onNWy
mQl/lvV8Jg8xZZl91I3uf3AhSD0POFy+k48Tshp9XSs0Qrwz0o8daLyhGVZSTDaXwGaRQ8Cy
E0jwYw+3u2rI4qjKhgj/EHaCjN5/FswJyM+J6Pgh5Isvz0v0xEuQbXyhhlYhh79APe1/RUhF
E1G/IM1FnSMjx8wZUyZFASry7G6n2OOwI8Tofp5cG/Zu7pi1WNmYCQ==

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_DD_PARTITION_FLAG
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."UPDATE_DD_PARTITION_FLAG" AS
        v_errmsg VARCHAR2(200);
        c_partition_migrate_hi_val CONSTANT INT := 17592186044416;
        C_STEP_NAME upg_log_t.step_name%TYPE := 'update_dd_partition_flag';
BEGIN
       /*
        * If event_t table is partitioned, user is using the partition option.
        * Update the Infranet data dictionary to reflect this.
        */

       IF (NOT pin_upg_common.partition_exists ('event_t', 'partition_migrate',
                                                to_char(c_partition_migrate_hi_val), 1, v_errmsg)) THEN

		-- is_partitioned values : 0 ==> The tables for this object is not partitioned.
		--                         1 ==> The tables for this object are partitioned.

                UPDATE dd_objects_t
                SET is_partitioned = 0
                WHERE name like '/event%';

                COMMIT;
       END IF;

EXCEPTION
        WHEN others THEN
                pin_upg_common.log_info (C_STEP_NAME, NULL, NULL,
                         		'E', 'Error updating is_partitioned flag in Infranet data dictionary.', sqlerrm);
END update_dd_partition_flag;

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_SUBORD_BILL_FIELDS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."UPDATE_SUBORD_BILL_FIELDS" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
78d 302
rSOCPgW3m8PlveJadjKrfc7gcH0wgz3DLtATfC/NlD8CIBTTXOt2eNnyG1ms1WTwfrc9M+AB
HyvmGPEWLI2Su/YdN2kVYQDDXBA1R18Xi+2InaKlraImpvUZFx5e4tDBnFWo65aVyYyaGM+3
pLOF6YGoexSJ02GPe57zOONj0KjntSupI9zdQNhLdcZUWSA59xGbbSHhK8TvUY6gq7zYiCzl
QXD7WbJmTVW7gQ8HdJ8P+FsSW28yEr/jP10Qulb66s76M47HntNeTa2joyQ4nqfK1NGn4h3m
uFKoNSlErpORHv+tt56CuqJrmKYQbtwbtylHsjihdR571VmhRpR9RreFqf0yW0PvIDCAuWkt
c2EZjlg6uXJJkRCVM3kHftEgephY7WMI0MC7sQfPEidleDQrV2kSheB3pMFzHZsiMXcZBCYE
e69D83VaUFehFlgL6VfrbFiMh49DaAaDLF8zfnmgmpRYIhCawU1Xq1pkmGqoqgBCarGJWq+m
7dH2G/Jv6rSWEZhyZK/2gAiWf5wKpXi4/dY6x/KKc5zzDnIdDuvbuWbFNRYUNWufiNb/yYfN
rlAx6D+a8Es26maGnOaUd6xDsaBE8PI6Q2ooJ/t8rmhYXtFrwo3m7gtrC+EVnrMDYfEvdyVQ
Ho8+Oe9DVKAS3WqWKuhKfeCEkWPmNYyA1DwMtFomIaui3tp0DtP5/StbMJIQ8bmaFyabeg78
8tCCwcJhM7pSGgGrwPNczdHnUFr/IuSm5mVoSA==

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_TRANSFER_EVENT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."UPDATE_TRANSFER_EVENT" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
aa9 47b
KnfPfuPSYG/pefUP8E4Tqfr5smQwg5UruiDrfI6LPXOUwWLwpy3odBwrQIltBasJScBuy0HY
LZTD3vVeH8jIM4atSuuLvK+2QehFM7/imgitLqJ2UHy2jj8iaIfB/Y27ZL/Qmt8SDToNMUOG
85PVRehx5RTJaxhUxUwVV5MSZlQj4PwRqUmJclFalfmAlJKS7BfVTxj/bJlJcmiXlr0QK8QO
HqdXDD17aYkSP6KECUyDj2PvsloGjuc+ru4G0xuCEHbMGb9u8q5aTU+Ylb4sQuReJgpixzQT
M3FhCReKy9ZpaqjOCDrbuV77MtsaSqgaEukC49k2m1TlQm4IL7hEf8ZUvjZAtX2FKY5E6AP3
rh9f0A5x1yBTtM9oY3QZqqYeih4zuf/CNdHehFFUFQs+XIfxolalFG2+xeSrv6kHPcFhguNh
oHkwU5oZ5eT+ajlh0EtVVWi7/hMTaKtvt2aMdYxFk1nLE+qAzhDf/IamgjwQb4Jl21cVCAuo
nIb/7e6u6m+sBPFmRQRb2EnZQa+pSd6LKOOUGK5xeR0QCrVMYpOia9UdVkRHV6VWGH7jBlc1
CqoeymYxcdU9EVZIXrIOKnZ6u9duSl9QFmN5XXCRQwxi73oyeYxRGmSlC2iOn90yj5B5Jw0R
ebUKVJmG6Q0VVTN/tcYneaK+SFzqiJMIb8SYuxcFz06GilBQsjWBhzwbjt421mZsjeaeYfyR
wqdz8jE+U2Hw2P1FD6XbkbxmBSGdy4aymUls2denBbqJDWdBeGlRVUBrJuJJkBnC7P2COe/1
1f735HIhhRREYaOzyEJTA8IUd0/p4YnLNOwmrXsz0hps9AJY8iZGi4qigR/i66IpPatRq98Q
++i6guAq0teZaW4Kq5+HhExiPvkbTVgSmaf0VwyID2cSfdpQWNLcaz44cTtYyFgfJspKwpSu
D5ZNd8qrWtuBWY4F459AnR1lK8kj3wQhwx7LCUURBHymGynyoe4I9dwC8em985A64ISjOkmc
AGsy9xs+Hai3/0Z+hIFrHQAjsraQ3QxNqJVaXId0QxqmHEWVUluMhh7f8Kva4DEmofivdoBZ
DywRoAtOIs0Z3BnDY0kM66Tt67c5/iP2hQoE1fVHh3P7oZETOA==

/
--------------------------------------------------------
--  DDL for Procedure UPD_CONS_EXCISE_DEAL_MAP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."UPD_CONS_EXCISE_DEAL_MAP" 
AS
    loop_id        INTEGER;

    CURSOR get_purchase_deal_node_cur
    IS
        SELECT pp.node_location, pp.poid_id0
        FROM hns_cons_excise_deal_mapping_t edm, purchased_product_t pp
        WHERE pp.node_location = edm.purchased_deal_node_location;

    CURSOR get_excise_deal_node_cur
    IS
        SELECT pp.node_location, pp.poid_id0
        FROM hns_cons_excise_deal_mapping_t edm, purchased_product_t pp
        WHERE pp.node_location = edm.excise_deal_node_location;
    BEGIN
        Insert Into Ebi_Audit (Total_Count, Ot_Count, proc_name,Start_T,High_Val) Values (0, 0,'upd_cons_excise_deal_map:START',Sysdate,1);
        COMMIT;
        loop_id := 1;
        FOR purchase_deal_node_rec IN get_purchase_deal_node_cur
        LOOP
            UPDATE hns_cons_excise_deal_mapping_t SET purchased_deal_offering_obj_id = purchase_deal_node_rec.poid_id0 WHERE purchased_deal_node_location = purchase_deal_node_rec.node_location;
            IF MOD (loop_id, 1000) = 0
            THEN
                update ebi_audit set total_count = loop_id, end_t = sysdate where proc_name = 'upd_cons_excise_deal_map:START' and high_val = 1;
                COMMIT;
            END IF;
            loop_id := loop_id + 1;
        END LOOP;
        update ebi_audit set total_count = loop_id, end_t = sysdate, proc_name = 'upd_cons_excise_deal_map:DONE' where high_val = 1;
        COMMIT;

        Insert Into Ebi_Audit (Total_Count, Ot_Count, proc_name,Start_T,High_Val) Values (0, 0,'upd_cons_excise_deal_map:START',Sysdate,2);
        COMMIT;
        loop_id := 1;
        FOR excise_deal_node_rec IN get_excise_deal_node_cur
        LOOP
            UPDATE hns_cons_excise_deal_mapping_t SET excise_deal_offering_obj_id = excise_deal_node_rec.poid_id0 WHERE excise_deal_node_location = excise_deal_node_rec.node_location;
            IF MOD (loop_id, 1000) = 0
            THEN
                update ebi_audit set total_count = loop_id, end_t = sysdate where proc_name = 'upd_cons_excise_deal_map:START' and high_val = 2;
                COMMIT;
            END IF;
            loop_id := loop_id + 1;
        END LOOP;
        update ebi_audit set total_count = loop_id, end_t = sysdate, proc_name = 'upd_cons_excise_deal_map:DONE' where high_val = 2;
    COMMIT;
END upd_cons_excise_deal_map;

/
--------------------------------------------------------
--  DDL for Procedure UPD_ENT_DESC_MAP_NODE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."UPD_ENT_DESC_MAP_NODE" 
(
lower_lmt   IN INTEGER,
upper_lmt   IN INTEGER
)
IS
    --descr_id       ent_descriptor_mapping_t.descriptor_id%TYPE;
    --offer_id       ent_descriptor_mapping_t.node_obj_id0%TYPE;
    --pack_id        ent_descriptor_mapping_t.package_id%TYPE;
    loop_id        INTEGER;

    CURSOR get_ent_desc_map_cur
    IS
        SELECT edm.descriptor_id, pp.poid_id0, pp.package_id
        FROM ent_descriptor_mapping_t edm, purchased_product_t pp
        WHERE descriptor_id BETWEEN lower_lmt AND upper_lmt
        AND pp.node_location = edm.node_location
        AND edm.account_obj_id0 = pp.account_obj_id0;
    BEGIN
        Insert Into Ebi_Audit (Total_Count, Ot_Count, proc_name,Start_T,High_Val) Values (0, 0,'upd_ent_desc_map_node:START',Sysdate,upper_lmt);
        COMMIT;
        loop_id := 1;
        FOR ent_desc_map_rec IN get_ent_desc_map_cur
        LOOP
            --offer_id := ent_desc_map_rec.poid_id0;
            --descr_id := ent_desc_map_rec.descriptor_id;
            --pack_id  := ent_desc_map_rec.package_id;
            UPDATE ent_descriptor_mapping_t SET node_obj_id0 = ent_desc_map_rec.poid_id0, package_id = ent_desc_map_rec.package_id WHERE descriptor_id = ent_desc_map_rec.descriptor_id;
            IF MOD (loop_id, 2000) = 0
            THEN
                update ebi_audit set total_count = loop_id, end_t = sysdate where proc_name = 'upd_ent_desc_map_node:START' and high_val = upper_lmt;
                COMMIT;
            END IF;
            loop_id := loop_id + 1;
        END LOOP;
        update ebi_audit set total_count = loop_id, end_t = sysdate, proc_name = 'upd_ent_desc_map_node:DONE' where high_val = upper_lmt;
    COMMIT;
END upd_ent_desc_map_node;

/
--------------------------------------------------------
--  DDL for Procedure UPD_EVT_BAL_IMPACTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."UPD_EVT_BAL_IMPACTS" 
(
Lower_Lmt In Number,
upper_lmt in Number
)
Is
	obj_id		event_bal_impacts_t.obj_id0%TYPE;
	Offer_Id	Event_Bal_Impacts_T.Offering_Obj_Id0%Type;
	Node_Loc	Event_Bal_Impacts_T.Node_Location%Type;
	t_count		Number;
	o_count		number;
    CURSOR get_event_bal_cur
    Is
		Select Obj_Id0, Node_Location From Event_Bal_Impacts_T
		Where Obj_Id0 Between Lower_Lmt And upper_lmt
		and product_obj_id0 <> 0;

    Begin
        Dbms_Output.Put_Line('starting proc: '||Date_To_Infranet(Sysdate));
		Insert Into Ebi_Audit (Total_Count, Ot_Count, proc_name,Start_T,High_Val) Values (0, 0,'upd_evt_bal_impacts:START',Sysdate,Upper_Lmt);
		COMMIT;
        o_Count := 0;
		t_count := 0;
        FOR eb_rec IN get_event_bal_cur
        Loop

			t_count := t_count + 1;
			obj_id := Eb_Rec.obj_id0;
			Node_Loc := Eb_Rec.Node_Location;

		Begin
		select poid_id0 into offer_id from purchased_product_t where node_location = Eb_Rec.Node_Location and rownum < 2;
		EXCEPTION
		When No_Data_Found Then
			Update Ent_Descriptor_Mapping_T Set Node_Obj_Id0 = Eb_Rec.obj_id0 Where Node_Location = Eb_Rec.Node_Location;
			o_count := o_count + 1;
			continue;
		END;
			Update Event_Bal_Impacts_T Set Offering_Obj_Id0 = Offer_Id, Offering_Obj_Db = 1, Offering_Obj_Type = '/purchased_product', Offering_Obj_Rev = 0
		Where Obj_Id0 = Eb_Rec.obj_id0;

			IF MOD (t_count, 100000) = 0
			Then
				update ebi_audit set total_count = t_count, ot_count = o_count, end_t = sysdate where high_val = upper_lmt;
				COMMIT;
			End If;

		End Loop;
    update ebi_audit set total_count = t_count, ot_count = o_count, end_t = sysdate, proc_name = 'upd_evt_bal_impacts:DONE' where high_val = upper_lmt;
    COMMIT;
    Dbms_Output.Put_Line('ending proc: '||Date_To_Infranet(Sysdate));
End Upd_Evt_Bal_Impacts;

/
--------------------------------------------------------
--  DDL for Procedure UPD_EVT_DEAL_INFO_PKG
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."UPD_EVT_DEAL_INFO_PKG" 
(
lower_lmt   IN INTEGER,
upper_lmt   IN INTEGER
)
IS
    loop_id        INTEGER;
    CURSOR get_pp_cur
    IS
        SELECT pp.node_location, pp.package_id
        FROM purchased_product_t pp
        WHERE status <> 3
        and pp.poid_id0 between lower_lmt and upper_lmt;
    BEGIN
        Insert Into Ebi_Audit (Total_Count, Ot_Count, proc_name,Start_T,high_val) Values (0, 0,'upd_evt_deal_info_pkg:START',Sysdate,upper_lmt);
        COMMIT;
        loop_id := 1;
        FOR pp_rec IN get_pp_cur
        LOOP
            UPDATE event_billing_deal_info_t SET package_id = pp_rec.package_id WHERE node_location = pp_rec.node_location;
            IF MOD (loop_id, 500) = 0
            THEN
                update ebi_audit set total_count = loop_id, end_t = sysdate where proc_name = 'upd_evt_deal_info_pkg:START' and high_val = upper_lmt;
                COMMIT;
            END IF;
            loop_id := loop_id + 1;
        END LOOP;
        update ebi_audit set total_count = loop_id, end_t = sysdate, proc_name = 'upd_evt_deal_info_pkg:DONE' where proc_name = 'upd_evt_deal_info_pkg:START' and high_val = upper_lmt;
    COMMIT;
END upd_evt_deal_info_pkg;

/
--------------------------------------------------------
--  DDL for Procedure VALIDATE_CYCLE_FEE_PROCESSING
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."VALIDATE_CYCLE_FEE_PROCESSING" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
601 316
Mdk1GM1FitWUkxOAtABacpPXQPMwg43DLtCDfC/NWA9/EuHFGMIFuvPVRBfhSIR+rcvNQVaO
R9HT4Y7mJBpzCJCRhA4vDh6ZZk4ZE0KCCwxsBCMt5s6tTNHJ60fsXa7CoMlIOzEaHttIxG09
xwr7Q+45hHIRVwB6z/iyhgimXMHnu2Xo8I5oghmPEDBzFAiOJFKU/b78a0GvAMFMiI7cSAYC
CB2/BJCtby3RQqsHTYOPYJQX4HXjhBCOuVx/w/IWakFUqdSAX3T9qPhg+xsVWpjbZp7PKWqw
W8ZSIrZSqYQc38tY73TI3hYJoCJh/WnHWoSK2U1EzvJfNdRCeO/SX8MVbSZiqxqKbqoixXiA
fJ0rTvjn3rcaivEopIBQB/ijdqn9I63iq6OdL80Yr7HkuzLT8Ja/AfJ8Uq4rj57t6QcUxdpD
frtNJZ/zZDP4f5YmNvGkjcToVbzKEDRv/MqbVIN7GtW8mvGtt325Wwlc5g0ZVmx4kslkKP+B
bs2HhnpHEBFcE8+c9qkcODDMF6rMETK7EsEWdGbkLOJexmOzuJ1WJf1f74TErtTsq4wu3YR+
Km3GJ2EMO6F5YQzqn8mL2SmC0hNkZGOSGWz5cBYqH7Wja0OyNciElJD4w9GwuZgJOW6+rT2O
sVMys2lzYrtx23gIv+B4MeDt4VnrMp5tlH7NJRuIAJ3I2L8KdDzHtIolXQFFbMddv2EMwmLk
Iy0mRCNkOA3/cEUxVh+fPFY0i3kTU/v+cfAHo5sM13wYMFeKEM6Zq/kJRA==

/
--------------------------------------------------------
--  DDL for Procedure VALIDATE_GL_SEGMENT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."VALIDATE_GL_SEGMENT" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
161 154
WWpMUrczjhCyfo/16a6neSDiDf4wg1zQNfbWZy8CEj0Pf5xRrL3f6mtLPcwH4pjZuauD6y/j
NqiN5nmqqvBiPbzZdovX+IuICplW2m2lMkXLwet3TkOXLHNDOyywV3Qn+sseb40H6YA4bWC0
hKsVZFCjeb4yKuS/Z/SNfRoHEQScfgTU/nK9PM4W++4VSdihAvtcLyBwXWcyCaxhysw9vDFW
tjA2hBgX3byUln4hjYoPspvQMiKS+LnoLtglHBQA76L4+Ii7/W6zN5RdyAJ/8Z7uodWH8pWY
hKcBKCno4J4Zn3Vd9hJc4VxCMBOAqCaOHEJEi7+aIiZxCQ==

/
--------------------------------------------------------
--  DDL for Procedure VALIDATE_GL_TYPE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."VALIDATE_GL_TYPE" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
179 138
8/67RkvTdyfjlKyWLa69ZZcpjjgwg0xpr56sZy/N/D+V9eXdZ2JmyMu3SmFwCl/2UN69GC9m
e1RQmurgb9qc7u2IGRN4RMHzlZS2esuckjAR3IvPf9dOn6uZfcXXXxkf0gLKjeiJtM0f460X
A2Lry7vIjLLApn9sVAGrYIENjQeSI5h4UK1fG6ljVF7FjbiRJfh06o8d5c5P537gGdMVLUjP
rqcz5Z1LWFhixHWZgCBagfe8lRYMZVSOWF9p2XFY34owqzBBwZiqs0xQcbMU5BBDzcq3ac+S
y4KIjBvrk0DWH7wSulE=

/
--------------------------------------------------------
--  DDL for Procedure VALIDATE_POID_ID
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."VALIDATE_POID_ID" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
136 12c
Dn4jpUxCVJsMy+pfdG/neS333YQwgy7QNW0VZ3QCAP7qXejmjZNkTAJ+STxnkIglJopi54F8
yvyvVZqdxTtVcRUMFf6HrM7xftU2ncbH/Er+txniJut312V91TBhlzx07EwaGBSqLMjjH1V4
XGQoFkPLAUSnYbQ88+gpmxWERWg/uaX1df/7E4ptxZ8gyyCAZHIqBKVly98vtCnWU2iGxPHV
7WwKc6sGSmD/aaxoyODnKpwEMdoQbJBiK9R10OQPuXZRoCGW1JxuENs+whckcNdv77LJlV0o
mPZZBQ==

/
--------------------------------------------------------
--  DDL for Procedure VOIP_WORK_ORDER_PROCESSING
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."VOIP_WORK_ORDER_PROCESSING" (AccountNo IN VARCHAR2,WorkOrder IN VARCHAR2,UserLogin IN VARCHAR2,ResponseDesc OUT VARCHAR2,ResponseStatus OUT NUMBER)
IS
SqlQuery VARCHAR2(1024);
ACCOUNT_POID NUMBER;
GL_SEGMENT VARCHAR2(128);
VOIP_TAX_EXMPT_FLAG NUMBER;
TEMP_ACCOUNT_POID NUMBER;
IS_ERROR NUMBER;
IS_AUDIT NUMBER;
IS_TEMP_ACCOUNT NUMBER;
SERVICE_STATUS NUMBER;
ACCOUNT_STATUS NUMBER;
TEMP_ACCOUNT_NO VARCHAR2(255);
RESORD_INFO VARCHAR2(300);
TEMP_ACCOUNT_STATUS NUMBER;
ACTIVATIONDATE NUMBER;
ADDRESS1 VARCHAR2(255);
CITY VARCHAR2(90);
STATE VARCHAR2(2);
ZIP VARCHAR2(11);
EFFECTIVEDATE NUMBER;
TAXEXEMPTIONFLAG VARCHAR2(1);
SECURITYLABEL VARCHAR2(255);
ACCOUNTNAME VARCHAR2(90);
FIRSTNAME VARCHAR2(90);
LASTNAME VARCHAR2(90);
PHONENUMBER VARCHAR2(75);
PACKAGE VARCHAR2(255);
ERR_CODE NUMBER;
ERR_MSG VARCHAR2(255);
BEGIN
	IS_ERROR := 0;
	IS_AUDIT := 0;
	SERVICE_STATUS := 0;
	ACCOUNT_STATUS := 0;
	IS_TEMP_ACCOUNT := 0;
	ACCOUNT_POID := 0;
	ResponseStatus := 1;
	ResponseDesc := '';
	ACTIVATIONDATE := NULL;
	ADDRESS1 := NULL;
	CITY := NULL;
	STATE := NULL;
	ZIP := NULL;
	EFFECTIVEDATE := NULL;
	TAXEXEMPTIONFLAG := NULL;
	SECURITYLABEL := NULL;
	ACCOUNTNAME := NULL;
	FIRSTNAME := NULL;
	LASTNAME := NULL;
	PHONENUMBER := NULL;
	PACKAGE := NULL;
	RESORD_INFO := WorkOrder||','||AccountNo;

	BEGIN
		SqlQuery := 'SELECT POID_ID0,GL_SEGMENT FROM ACCOUNT_T WHERE ACCOUNT_NO = :1';
		EXECUTE IMMEDIATE SqlQuery INTO ACCOUNT_POID,GL_SEGMENT USING ACCOUNTNO;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			TEMP_ACCOUNT_NO := 'TEMPUFC_'||AccountNo;
			BEGIN
				SqlQuery := 'SELECT POID_ID0,STATUS FROM ACCOUNT_T WHERE ACCOUNT_NO = :1';
				EXECUTE IMMEDIATE SqlQuery INTO TEMP_ACCOUNT_POID,TEMP_ACCOUNT_STATUS USING TEMP_ACCOUNT_NO;
				IF TEMP_ACCOUNT_STATUS = 10100 AND WorkOrder in ('CAN','DCA','SEA','RSE') THEN
					ResponseDesc := 'Temp account is still active';
					IS_ERROR :=1;
					ACCOUNT_POID := TEMP_ACCOUNT_POID;
				END IF;
			EXCEPTION
			WHEN NO_DATA_FOUND THEN
				IF WorkOrder not in ('CAN','DCA','SEA','RSE') THEN
					ResponseDesc := 'Account does not Exist';
					IS_ERROR :=1;
				END IF;
			WHEN OTHERS THEN
				IF WorkOrder not in ('CAN','DCA','SEA','RSE') THEN
					ResponseDesc := 'Account does not Exist';
					IS_ERROR :=1;
				END IF;
			END;
		WHEN OTHERS THEN
    IF WorkOrder not in ('CAN','DCA','SEA','RSE') THEN
			IS_ERROR :=1;
			ResponseDesc := 'Account does not Exist';
      END IF;
	END;
IF IS_ERROR=1 THEN
		ResponseStatus := 0;
		INSERT INTO HNS_VOIP_MSG_QUEUE_T (REC_ID,REC_CREATED_T,RECORD_STR,REC_STATUS,REASON,USERLOGIN) VALUES (HNS_VOIP_MSG_QUEUE_SEQ.nextval, d2i(sysdate), RESORD_INFO, 'E', ResponseDesc,UserLogin);
		COMMIT;
		RETURN;
	END IF ;


	BEGIN
		SqlQuery := 'SELECT S.STATUS,A.STATUS FROM ACCOUNT_T A,SERVICE_T S WHERE A.POID_ID0 = :1 AND S.POID_TYPE = :2 AND A.POID_ID0=S.ACCOUNT_OBJ_ID0';
		EXECUTE IMMEDIATE SqlQuery INTO SERVICE_STATUS,ACCOUNT_STATUS USING ACCOUNT_POID,'/service/voip';
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			IF WorkOrder not in ('CAN','DCA','SEA','RSE') THEN
				IS_ERROR :=1;
				ResponseDesc := 'No VoIP service';
			END IF;
		WHEN OTHERS THEN
			if WORKORDER not in ('CAN','DCA','SEA','RSE') then
			ResponseDesc := 'No VoIP service';
			IS_ERROR :=1;
      END IF;
	END;
	BEGIN
  IF IS_ERROR=0 THEN
    IF WorkOrder = 'DCA' THEN
	  IF (SERVICE_STATUS != 0 and SERVICE_STATUS != 10103) THEN
        ResponseDesc := 'VoIP service is not closed';
        IS_ERROR :=1;
      ELSE
        IS_ERROR :=0;
        ResponseDesc := 'DCA Queued';
      END IF;
    ELSIF WorkOrder = 'CAN' THEN
      IF (SERVICE_STATUS != 0 and SERVICE_STATUS != 10103) THEN
        ResponseDesc := 'VoIP service is not closed';
        IS_ERROR :=1;
      ELSE
        IS_ERROR :=0;
        ResponseDesc := 'CAN Queued';
      END IF;
    ELSIF WorkOrder = 'SDR' THEN
      IF SERVICE_STATUS != 10100 THEN
        ResponseDesc := 'VoIP service is not active';
        IS_ERROR :=1;
      ELSE
        IS_ERROR :=0;
        ResponseDesc := 'SDR Queued';
      END IF;
    ELSIF WorkOrder = 'MOD' THEN
      IF SERVICE_STATUS != 10100 THEN
        ResponseDesc := 'VoIP service is not active';
        IS_ERROR :=1;
      ELSE
        IS_ERROR :=0;
        ResponseDesc := 'MOD Queued';
        SQLQUERY := 'SELECT NVL(MIN(CURRENT_BAL),0) FROM BAL_GRP_SUB_BALS_T BGSB, BAL_GRP_T BG WHERE BG.POID_ID0 = BGSB.OBJ_ID0 AND VALID_TO=0 AND BG.ACCOUNT_OBJ_ID0=:1 AND REC_ID2=:2';
        EXECUTE IMMEDIATE SQLQUERY INTO VOIP_TAX_EXMPT_FLAG USING ACCOUNT_POID,10100026;
        IF GL_SEGMENT LIKE '%GUEST%' OR  GL_SEGMENT LIKE '%SHOWROOM%' OR VOIP_TAX_EXMPT_FLAG > 0 THEN
          TAXEXEMPTIONFLAG := 'Y';
        ELSE
          TAXEXEMPTIONFLAG := 'N';
        END IF;
        SECURITYLABEL := 'SECURITY';
SELECT REPLACE(FIRST_NAME,',',' '),REPLACE(LAST_NAME,',',' '),REPLACE(ADDRESS,',',' '),CITY,STATE,ZIP INTO FIRSTNAME,LASTNAME,ADDRESS1,CITY,STATE,ZIP  FROM ACCOUNT_NAMEINFO_T WHERE OBJ_ID0 = ACCOUNT_POID;
        --SELECT PHONE INTO PHONENUMBER FROM ACCOUNT_PHONES_T WHERE OBJ_ID0 = ACCOUNT_POID AND TYPE = 2;
        SELECT PHONE INTO PHONENUMBER FROM (SELECT MAX(REC_ID) MAX_REC_ID,PHONE FROM ACCOUNT_PHONES_T AP WHERE AP.TYPE = 2 AND AP.OBJ_ID0= ACCOUNT_POID GROUP BY PHONE)X;
        SELECT PACKAGE_NAME INTO PACKAGE FROM HNS_VOIP_PACKAGE_MAPPING_T WHERE DEAL_NAME =
                                                  (SELECT P2D(DEAL_OBJ_ID0) FROM PURCHASED_PRODUCT_T P WHERE ACCOUNT_OBJ_ID0 = ACCOUNT_POID AND SERVICE_OBJ_TYPE = '/service/voip' AND STATUS <> 3);
        SELECT CYCLE_START_T INTO ACTIVATIONDATE FROM PURCHASED_PRODUCT_T P WHERE ACCOUNT_OBJ_ID0 = ACCOUNT_POID AND SERVICE_OBJ_TYPE = '/service/voip' AND STATUS <> 3;
        SELECT ACTG_CYCLE_DOM INTO EFFECTIVEDATE FROM BILLINFO_T WHERE ACCOUNT_OBJ_ID0 = ACCOUNT_POID;
        ACCOUNTNAME := FIRSTNAME || ' ' || LASTNAME;
      END IF;

    ELSIF WorkOrder = 'T' THEN
      IF SERVICE_STATUS = 10103 THEN
        ResponseDesc := 'VoIP service is closed';
        IS_ERROR :=1;
      ELSE
        IS_ERROR :=0;
        ResponseDesc := 'T Queued';
        SELECT REPLACE(ADDRESS,',',' '),CITY,STATE,ZIP INTO ADDRESS1,CITY,STATE,ZIP  FROM ACCOUNT_NAMEINFO_T WHERE OBJ_ID0 = ACCOUNT_POID;
        SELECT CYCLE_START_T INTO ACTIVATIONDATE FROM PURCHASED_PRODUCT_T P WHERE ACCOUNT_OBJ_ID0 = ACCOUNT_POID AND SERVICE_OBJ_TYPE = '/service/voip' AND STATUS <> 3;
      END IF;
    ELSIF WorkOrder = 'RSE' THEN
      IF (SERVICE_STATUS != 0 and SERVICE_STATUS != 10100) THEN
        ResponseDesc := 'VoIP service is not active';
        IS_ERROR :=1;
      ELSE
        IS_ERROR :=0;
        ResponseDesc := 'RSE Queued';
      END IF;
    ELSIF WorkOrder = 'M' THEN
      IF SERVICE_STATUS is null THEN
        ResponseDesc := 'VoIP service not present';
        IS_ERROR :=1;
      ELSE
        IS_ERROR :=0;
        ResponseDesc := 'M Queued';
		SELECT PACKAGE_NAME INTO PACKAGE FROM HNS_VOIP_PACKAGE_MAPPING_T WHERE DEAL_NAME =
                                                  (SELECT P2D(DEAL_OBJ_ID0) FROM PURCHASED_PRODUCT_T P WHERE ACCOUNT_OBJ_ID0 = ACCOUNT_POID AND SERVICE_OBJ_TYPE = '/service/voip' AND STATUS <> 3);
		SELECT CYCLE_START_T INTO ACTIVATIONDATE FROM PURCHASED_PRODUCT_T P WHERE ACCOUNT_OBJ_ID0 = ACCOUNT_POID AND SERVICE_OBJ_TYPE = '/service/voip' AND STATUS <> 3;
		SELECT ACTG_CYCLE_DOM INTO EFFECTIVEDATE FROM BILLINFO_T WHERE ACCOUNT_OBJ_ID0 = ACCOUNT_POID;
      END IF;
    ELSIF WorkOrder = 'SEA' THEN
		--SELECT CYCLE_START_T INTO ACTIVATIONDATE FROM PURCHASED_PRODUCT_T P WHERE ACCOUNT_OBJ_ID0 = ACCOUNT_POID AND SERVICE_OBJ_TYPE = '/service/voip' AND STATUS <> 3;
		SELECT max(CYCLE_START_T) KEEP (DENSE_RANK FIRST ORDER BY created_t desc) INTO ACTIVATIONDATE FROM PURCHASED_PRODUCT_T WHERE ACCOUNT_OBJ_ID0 = ACCOUNT_POID AND SERVICE_OBJ_TYPE = '/service/voip';
    ELSE
      IS_ERROR :=1;
      ResponseDesc := 'No Valid Work Order type';
    END IF;
  END IF;
	IF IS_ERROR=1 THEN
		ResponseStatus := 0;
		INSERT INTO HNS_VOIP_MSG_QUEUE_T (REC_ID,REC_CREATED_T,RECORD_STR,REC_STATUS,REASON,USERLOGIN) VALUES (HNS_VOIP_MSG_QUEUE_SEQ.nextval, d2i(sysdate), RESORD_INFO, 'E', ResponseDesc,UserLogin);
		COMMIT;
		RETURN;
	END IF ;
	IF IS_ERROR=0 THEN
		ResponseStatus := 1;
		INSERT INTO HNS_VOIP_MSG_QUEUE_T (REC_ID,REC_CREATED_T,RECORD_STR,REC_STATUS,REASON,USERLOGIN) VALUES (HNS_VOIP_MSG_QUEUE_SEQ.nextval, d2i(sysdate), RESORD_INFO, 'Q', ResponseDesc,UserLogin);
		IF WorkOrder != 'CAN' OR WorkOrder != 'MOD' OR WorkOrder != 'T'  THEN
			SELECT d2i(sysdate) INTO ACTIVATIONDATE FROM DUAL;
		END IF;

		INSERT INTO HNS_VOIP_REQUEST_T(WORKORDERNO, CREATED_T, MODIFIED_T, SAN, WORKORDERTYPE, STATUS, SOURCE, NUM_ATTEMPTS, TAXEXEMPTIONFLAG, SECURITYLABEL,
                                               ACCOUNTNAME, FIRSTNAME, LASTNAME, ADDRESS1, CITY, STATE, ZIP, PHONENUMBER, PACKAGE, EFFECTIVEDATE, ACTIVATIONDATE)
                                       VALUES (HNS_VOIP_REQUEST_ID.nextval, d2i(sysdate), d2i(sysdate), AccountNo, WorkOrder, 'P','BILLING',0, TAXEXEMPTIONFLAG, SECURITYLABEL,
					      ACCOUNTNAME, FIRSTNAME, LASTNAME, ADDRESS1, CITY, STATE, ZIP, PHONENUMBER, PACKAGE,EFFECTIVEDATE, ACTIVATIONDATE);

		IF WorkOrder = 'CAN' OR WorkOrder = 'DCA' THEN
			UPDATE HNS_VOIP_ACTIVATION_STATUS_T set status = 'X', modified_t = d2i(sysdate) WHERE SAN = AccountNo AND STATUS IN ('H','D');
		END IF;
		COMMIT;
	RETURN;

	END IF ;
	EXCEPTION
	WHEN OTHERS THEN
        ERR_CODE := SQLCODE;
        ERR_MSG := SUBSTR(SQLERRM, 1, 150);
		ResponseStatus := 0;
		ResponseDesc := ResponseDesc || ' - Exception : ' || ERR_CODE || ' : ' || ERR_MSG;
		INSERT INTO HNS_VOIP_MSG_QUEUE_T (REC_ID,REC_CREATED_T,RECORD_STR,REC_STATUS,REASON,USERLOGIN) VALUES (HNS_VOIP_MSG_QUEUE_SEQ.nextval, d2i(sysdate), RESORD_INFO, 'E', ResponseDesc,UserLogin);
		COMMIT;
		RETURN;
	END;
END VOIP_WORK_ORDER_PROCESSING;

/
--------------------------------------------------------
--  DDL for Procedure WHOLESALE_BG_MERGE_CURRENCY_BALANCES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."WHOLESALE_BG_MERGE_CURRENCY_BALANCES" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
d43 4b4
iwlPILCQ287Yl/2FsJAxR4piMwYwg9fqzCCDfC8Zgp0VIKmn3l+hEgQL8bd2r7ct78Zrzbc9
womozGdrPcMmJD+fWubnyzgot2/I45BynJi7z5pYabgo5FSmknP2mNwz/h6iAFY9XvHRtg0w
oeuRAzBcKP4e+NdmMf57Fp3jwB1DmE0/80BUesc1V7BpQh8VrfVKAniV4FQdx/4HZvmPq5jh
i7G+cMdhvSdSYbO6EwMun2L/g2vhZnlOxU1d015DxnAHM9pXxbPH6VIUjXp4Vqimf+Wmecxr
aIvzW+a4a2YOj6EV4V1Sb6FHGi3jvEqzB+5wfM7DxrZvNxHUKB7OV9JSOcSGJLEIqEk/p4SV
U8O2HIKavJvZTetSqMrYIbh7xTpY0koTzgW/d3N1H0aj6AWcTMTQXY7/nJSc3RThAmrI065b
FViX5Ioq0RGyxt5Mg9cAolgHEcRMc8NyZJg2OzMRDZN+MjiWQZjNnxrjayR71jfoiVkhEJ/l
5Vk7PB49i1L4qvGJ2v5yziZf1ZExvzFrXy8zkWl3JhnY5FQNtq8XhWyJ09/uI8+CRDsFk13o
w8ZcreU0kjzWUC8jM+btQajiA2ZmEkjswAnV+MmnRcjoBY7Ntw3Jxw2TUcb1+EaePD2CI3eu
sv5NbRkZyF2X535k04CaJl5uzEJYofh+8MHm7sBKbe43kWImN+eN+fDyUZnbzqChOJAn+0Gz
HlI+Vaeks3VAt/V84qC07nEN0StHzO3wbhwGTa0Z2ZD1wCikXb2l9MNrj7bmrzV0SGM1/Ubf
glsP7lg/xPVl+l8XWHLy2znPdbPIq2GafYZ26wRRPC8jXGCQrKIXac+KlMm3LJkfzIrfTlLO
pHvUXkyAG/g9EkPW20Zg/2Pn8Ju4sDT2D4aV5qbZQpaCjx2Vv+xex5o0iYI+4/0M0aBObgki
W/d5WIsqN1Dwrh/YvRm/kLdSYGAyFRF9KV8iDW5JU2wtsL3pkrobDXeCglURcLgI3kO0hqBn
k1ne+BOeVLUnVdKGad7TidHLFc9T7XEKMfM5VrqbrPL6/CKzgwmk7WQJuKHMoEhDujRR3FjJ
MUN+0v5MBkVIzByS4hHZB+Itg4q3IR6rklaMrqPaDapCfKrpM4HUsyctijzGObag9QTrryDo
buZGPgTOdKKm/Mg2u/+R+4IoUbOYJF1W7mU=

/
--------------------------------------------------------
--  DDL for Procedure WHOLESALE_BTD_MERGE_BALANCES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PIN"."WHOLESALE_BTD_MERGE_BALANCES" wrapped
a000000
367
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
c6a 54e
nOaD8ZLnuGmw7Ul3PwzFMIFdiXMwgz0rmtCreC+5HpvqR/0Ofr1jCSzA7VoZVThyPeDvZJwU
rm++htFaNi9oJuWJJLxhsd+L6vHyeWNoAHByzxxyX51YMSaPrW/wZ85O68kNtHLqmYEIOjUQ
h4pB0ie87GS7H/iHSWvF1Vz3bKHmiEvJ8WtakMM/dVGUcuOFu+MEQkRy+WmgBKz52iRsuJ/J
HgZEsYoSTsFb2Cm2Jt2j1q5jhZ5sulYB0wyOULvIRbdHw+kn3vXcPwuR4cf2Gg1w6ULvw2Dl
75O4VoVp59HD8JSL8cJl+q0KbDglaJ4gSO7Bs7hX5GymPgrMcVtK4UtYb117ubGpE8CjtHrF
1GOrTkCUuAiFIHiQ3EBsAZDbcxT1aJlydJ2dArn2gJmBoAU0fpgQyL8RqfTKoGDp6OsYi4Ni
/4nt7Rf1saShO0UeX6wqngXXmzUAtQ1M3cAo2YFzycS6aCS/utiOsjMyfvQ/Ig4LzcL+ZZ/A
vqNisdATqtckF7ssRclveKHByP+nNml4t0GLSmcbsqqSi5RXNiKvVKW9fQLFlcM9LslGDfHI
PT6RoOUW/ccDY95nKVU4hu6INJiEN9S+fi/Lkpc0PTk538kD79hLU1oaXibEovj1I9KmvBrt
Ak3mHd/9oh+x1scyunA7YUzQrDPKf9QFI0qJ90NO48JkCh6vX8OL7r4NeZjhdcQST4Z3L+mM
9auIuC5szBLmTIbroQ26yfVSxAWKcJ1U3sJWsa6lUwXPOa7FgXTQo/ZNREzOm0QU6ug9gVFW
M16limVue7CO+gEpg6cXtwUNkXtL1Anh5qtKHB4HmbrKJhSQDpdYjiK4gBqMxUV2vzqdOSIP
KeK+c6NoQ4HdKO+F0h5LP0SMV2KfG3COMvCwoRjLtcStCE4+3PrZMzhIglGqi7BYERN9vwFq
xh6qACzPY9obzs3zlHG/fgsk/JMBaKDK0u+auH720GUl6EZSY4YUSEuSUregCzQyXV2LQZhs
MuoayJlWTcNer8agFY4EvMS3r8qgWIhvGFmgEFiD+lVZ2JnyITlo8iFdNgV4P30ZPHB5AHvy
3vzW8gf5mtDinxqHuCTsosGoU/lu5gUuLtSGDcVp06M9JseX33EoUCAcCoyzBGNR3RjPUK9Y
DelS18nsKvGZENpkxSKEOE8V5QxrJCAhmfCMAkHwCBl7HJlHUCSnfXJat52EkkoDHycWsopa
hNkuOBFMuGrbIGrPeOFJCy5cOg2UrLfSnUwQmhadpaQpvDiD4XHi/m2QO2eaSjOWLNfE+fng
Kj/qrexykL+/NBXsw01lk029GNMuTUZDVJrk0nhig9pe

/
