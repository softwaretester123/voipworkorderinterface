--------------------------------------------------------
--  File created - Friday-September-22-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Function A2ARBI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."A2ARBI" 
    ( accountNo IN varchar2 )
    RETURN NUMBER IS
poidId NUMBER;
/******************************************************************************
   NAME:       get_account_poid
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        8/20/2007          1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     get_account_poid
      Sysdate:         8/20/2007
      Date and Time:   8/20/2007, 1:09:09 PM, and 8/20/2007 1:09:09 PM
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
   poidId := 0;

   select bi.ar_billinfo_obj_id0 into poidId
   from account_t a, billinfo_t bi
   where account_no = accountNo
   and a.poid_id0 = bi.account_obj_id0;

   RETURN poidId;
END a2arbi;

/
--------------------------------------------------------
--  DDL for Function A2BI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."A2BI" 
    ( accountNo IN varchar2 )
    RETURN NUMBER IS
billinfoPoid NUMBER;
/******************************************************************************
   NAME:       get_account_poid
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        8/20/2007          1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     get_account_poid
      Sysdate:         8/20/2007
      Date and Time:   8/20/2007, 1:09:09 PM, and 8/20/2007 1:09:09 PM
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
   billinfoPoid := 0;

   select bi.poid_id0 into billinfoPoid
   from account_t a, billinfo_t bi
   where account_no = accountNo
   and a.poid_id0 = bi.account_obj_id0;

   RETURN billinfoPoid;
END a2bi;

/
--------------------------------------------------------
--  DDL for Function A2P
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."A2P" 
    ( accountNo IN varchar2 )
    RETURN NUMBER IS
accountPoid NUMBER;
/******************************************************************************
   NAME:       get_account_poid
   PURPOSE:

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        8/20/2007          1. Created this function.

   NOTES:

   Automatically available Auto Replace Keywords:
      Object Name:     get_account_poid
      Sysdate:         8/20/2007
      Date and Time:   8/20/2007, 1:09:09 PM, and 8/20/2007 1:09:09 PM
      Username:         (set in TOAD Options, Procedure Editor)
      Table Name:       (set in the "New PL/SQL Object" dialog)

******************************************************************************/
BEGIN
   accountPoid := 0;
   select poid_id0 into accountPoid from account_t where account_no = accountNo;
   RETURN accountPoid;
END a2p;

/
--------------------------------------------------------
--  DDL for Function ALL_BILL_OBJECTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."ALL_BILL_OBJECTS" wrapped
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
8
694 2de
GqvZWh4sPb2Bd5WG17BZAZsVlCowg9eJLiCMfC9A/kdkdQwBZjtRIYNeaeoGC/EwRN/2Exp4
CmyT9FyrK71VXj/kqwY53/QJIwpsL2CCZAdCLMnsLWnM/4/eA7NyAr6Ncp2xQg1bsfuYTdwQ
r+Q2zT/ubbi5bQix3Dau/ZSYJVQnl47/aXR2N8W2dIoZa5uJYVAJbJ7cHi607SzwnbI03HGF
gjw5n10FyiFkbz9Z77qeIkC0ekLcqYKXg+Cwee0ouCgnSnR2V7phYfodL/R/QJ7ndssfOMFt
XUMeYcDWOJfeGt4hq6a+92DorEkAjR2rxqM3COaz6DCxFk80rXaFpqwFCZGtgDcQ0P2LE8Cd
hymX9b1g25ha9KyiJ0EmIV6Exyl1ZfW9VfnFv5auXMxISci5l8/tI1U7ljplzGl9m66k59ec
dgCI0gBa+V9JMlEN/PIcIuB1PjbsFATMmnqT6rJ65PDFct7zGEO1uF+aB9Zl9BXF6IneAqHl
61lHabHnWjtxHOR9NaxjflyKCuAT6lBmNrIUPPkTq8Qxfe4iN0rNmiSMHiytfWSnPQxcLE44
ojTVQSwHyH9VyL9JziUGxxwEmxRrkP5AxTTn0yKNMCIDe61WZcflVQWII+YzIWhuAbJ9OooK
JjIZKYZ/r2FPdTwh8mganjGApr+Yg9nN6R6hsNfqXi74aePbRj1PKf3Y/WHXIOA/pikQOluc
uY0H

/
--------------------------------------------------------
--  DDL for Function ALL_INVOICE_OBJECTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."ALL_INVOICE_OBJECTS" wrapped
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
8
502 28c
XKkTVMsDHnoCIgJlOS8eqGAOTwwwg5Ver0gFfHRVMQ+v2XBbBBghtCZgKErXGnZW+rddoHhr
DILdhPYo4rFeIj/xjNuH8TIAjgT7HeilHDrSotHyQSfTdrksLC5cnSE9IwvsICTfHrmIUabP
yD7T+rZAIg9sZe2hXYrr56gYvMjQZupAU9Rsl6HKzJzx1nIdCVuDlxbXIXbgD1dFbv8irgbz
0ZRsLKmMmx3nzbPF+j5OCaXRlfmWy4tTFCLjTHQjZO7T0rLA548Wwq1eYIlFFoECc1ncdozI
/Lsu+PWaXC4QROkF2HgonYPXk7VWL8Xr5PVU58QFEHKz7Uq7vzKy61cESIkKJA3/+VE9+BEp
qFICCdoDRI7b8GArdVGJDCECDlmIpPQ6H4Qx9QaikImDgE18xsNqhIFoXIFFHUW4z4BGAo5H
n1S98rN9sdm0+rN32dAjKOQUecTuNucVzp2S+dHth1/8QXux3v50F5KPpOhjYMrUfIzb+c0O
ZNyskuyqiQZhcq43JnBfYMGfK6U2FLYJMDQE78tyimV0vg/DZKjLy/2OaEUt2od8eG2vJNho
8+SZRjzsvPFLwyYZCaYFPAAXEP9zuF3Sk2EyL2ORb4tI7F2+MSg7TPvaaMX5pf0DS2BV

/
--------------------------------------------------------
--  DDL for Function ALL_ITEMS_ARE_CLOSED
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."ALL_ITEMS_ARE_CLOSED" wrapped
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
8
4f9 32b
0a9xTSDr34NxOS6lDbTm2HeJwawwg/CJNdCDfC8CEi4/ldJpbMzq4+kSo6JjLzlLiVcmzWcg
b5km7J7xlL3NbCS8hiE2GH1hWxTaciCKQk/XekM34H8H1z9kTnvawyPHR9KfDysxy3EF4HsI
RP7voCu856e8BAB10FLgcSvT8tdTFUSecm9NCa9rEwVZgzzyDJQ+Cv5F0Gqzt3jf5i+wbokK
ntKI3jSbhN8e/IacpgWztEEGrFKDI8vBVTjh0A6nha9hRZCPQuFK2y8dRMshsr2nQ37ZXsyY
VzBiTpD/v4RksW6+44wKjTHQ2E0ysncD4M0c4vNrrq9Zdiil7jxOwmvky2QTeUxz0KqX4sV1
aPrb0cajlsyPPb7RF7Do+noWD7zEA9nTT3LdKgm6zdiuqYEr/ozBVatobXRCROmThFKDuwAR
XN9N/C4Q5Y9zNkFfWC+TA94UMm7lFFwdkinIUvWkOq3POQdF+LIVfBsjBBqeN+nz/3WujErT
+9BrmOFAIxa123tFB41S9FFOG1/2AsxRt8NWaUl/E6E7aOL2cnYa1y2XMzFhQEyHPUI11sdW
D9BD+7gCcSkmLCdvbD8OTeYgNDm0IQC86N7uhK6KwcSKdUxTOCiLtnQ4XlC2Faqmvm1r6S+Z
fft15JDEZaTEOA307KDnxlvzZHK9ujV26djZq97RzxvzSEET9ykhftzWuX/+yJKcEWSy7P0X
2dn52T19K58wpEWrefR1eua8KduGLXrmh2hzv2UCufhNQo5mZlWghgc2ddFtd7xnpEYt2zHO
VZbGT6OS

/
--------------------------------------------------------
--  DDL for Function ALL_ITEM_OBJECTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."ALL_ITEM_OBJECTS" wrapped
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
8
683 33b
kL3L6S2aIQrJjQGd7w/3KqwVCNUwgzuJLtATfC9AEmKd4CNNpjKUAYwAeYkdqLdMgKkmed8S
AyUUjU3T49MlXj/PWzz77GSfY6S9vRO/hxNYxhxJ92QE0HBhoymgVOIy+YaxwIeK3S3dNust
SWaWooI/CEa1ivQZTAyvhpeVonZa12YCrhZxDA7yojbJfn+TsO0RJuZEMnbwkPhIu6/NxPUi
rlFgtMIgolpelofdYMnVzvwLgTzEQM7bUckDhsmdHVNbgV/zVLjTySDQHUtsOX3VS+64SyJe
tE7PT5TLHttu8CH9MkxLmiIxC69qp8g+dA3hxU/gPSPLvR7AHMthmYrLG278hkQUbne+M9KI
RGHYEb4uQdH1RX0l4kmQC2SXvcETHqwf8KmimOArir+lAaYo3US9Htj1W5OHZ2EPO90N+JHa
q0AJTqKV9PxQjB1vawsDihe8THIYIXIcqBmLTkPgnUxBHebFVH5Oshp7moknTT+5O8I7uaSG
myebEqVUG+ysD4Vq6tK2At0VL4BHjHjr/eapLDF9urLnN+SYle2qxHXp0wJSX5MaJiAtSrYI
RkV+wneX7mqh6/ZT04ArbyniWgNC+7IUaS0441MpCMtxo4lxDdYFXcOPd2iJtIm2SWgvgiyi
R5RUIhWSxKeVRRbwmtcJteF2IL/LszXjP5TPJ1falJJ6dJP2QaVqgvelddvr1eWNXmFwaF/X
jZMDTJoBPKAUOtLl1QhhSCyCt3CeSF7exUncJub50PtIxAH+wgMlBTtlD1ljm2svqPqXmtKs
Z+oHqf+2kI4xtdJb3FrYaw==

/
--------------------------------------------------------
--  DDL for Function ALL_JOURNAL_OBJECTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."ALL_JOURNAL_OBJECTS" wrapped
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
8
731 323
xkjk7EujZzONX0Xx27QNWMhTEkgwgz2Jr0qDfC9AEmyuf5yXNeVQ0fz0ifKoiN0WnwnGN836
UVaNVC2hlUBBMM4yrHihHeADxqPmGGoktbSCD8nsuK4lyGojnequMQjI4v7F+IGgVV2WcLpw
b1z31VPZUIqc4qWL4gQ/3hYVTSFl1Z7g6b7biBi8bGkbrNYxuiHiFafFp1nmDRlfzfiY7rG8
61BCOBX2OGq8b2s/DfUd/BOMj9YHQ7cLgfVRTy3xiThkGBOPX8CZI385faF15yv0Dld+5zKO
WemFylFxoZH3xQ0WpxaXqo31Duqx4KOcC3T+ysGFr6w8Zeos8Dd1HS9XkNGRzenfMX/XzZXK
niZkTaqxW8DvX4nBuYs05zKcaGehUFWnoHqdO9cKuU/cGihtBUiRKoA3TILLadqMZMj4e83+
UlKcRX17LFLRceS9bVx1hRb3HXNe+0MRtuz5/8tyHs+cY+/jyzHJ+DB6fmTAOwJLXjFP5plD
c//X/L/XlLXnYOkOKe6NV89nlvfniX/SJgpPWZiyK2zXSlyM/du1CYLPT6uXKjfULeGC8tt0
XK9A0Wuk3G+kL3/OALmHm0xF+mvJHlkQ15UuEwVQ9d2sZ20HILVbyyxHgeqVOsdI4jN/z27V
em5bjDnmXjqTRtXWK7p9Al+z1BIudofjRgwLfnKzYHT+gbgK/sni6lfqHbGjlKVhwVI1oIHc
PnL76B2inOj1njJN45gEj+5poILtKxAlTdI9EUw1jqzek1JeeOd3/ZKShCVPWorPI0R54JUf


/
--------------------------------------------------------
--  DDL for Function ALL_NEWSFEED_OBJECTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."ALL_NEWSFEED_OBJECTS" wrapped
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
8
2d5 1ff
7KKNiuC+TZWsjw5qKmD7hdp92xwwgxAJLvYVZy/NrZ3g0Wy9ieBjsEAcBsl3YjHQuUh3BSU8
528KyOftXca/8PZZCvXKOMlCu81HE6QfbgTFVzR535+6P7EKwnGDVfgXOi1kqJ7dWw1lXHoB
fR6T5YUhXGqYHOaFK/oHRw1jaI82XHYWIQIGjx6p/ErfA4N8HUxuRowHr6V/3CNXZp4/OTNd
csr1gAMhsFggRB82BVa9YFdreqkk7iCqI0DIwPCXdqOOyj7EOVigwmm2oAlQWbq29LNtYzHK
QEve0Rrc8zxD1Fhb2TLtDyBMwHAsEUvlnw/dUuLG41gqtQpXmLJ5B+N24gOd3hVXWdERU2cJ
BDaXBMkhMjFSwl2X24AsVYWSKp1c4Bk8nGdmBIztx53mcq6s/wVwIunLFVnM3ri1A9kx497V
nu+Zx7siE15KzONcDQpw7QAivrubsbeZEtWd8r8ujAlHr8gXyIu+zXYyHjXg9cBOHRJVZLk=


/
--------------------------------------------------------
--  DDL for Function ALL_NON_PENDING_SEPA_OBJECTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."ALL_NON_PENDING_SEPA_OBJECTS" wrapped
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
8
257 217
90jpinBCG7H9bUmfU6NC2hSl8IMwgxDMLiAFfHRVPZKUijhLHXTpuoohjFvGi9PLPMYUrc3w
haPE2citApA4nOTOJeLzinyJqUaACITQ0A/9XmDCOWH4AL8HSg+DuVKxAE5QvH46pYbq+Lh2
yl69LdU0PiEbExWcHhWazwl8/S0yXrcxcaR1WduUkgKbBP0gcDOURI1+V6Kkt8ewipL8i05m
LB1jeV+i+SnKchYwXnfD7RC3jxD0tpc90+qRw2XERpbEyPG9fYbOa0SAQO8nxuII1ZEXJp52
gpjk1MNMYsoAkBpXoQefltYVhkhXuXv7CwZ1+65z7ng29UTGx8Ln897seLewA3ywXkWppqqq
YRCZ7sBXSNCqOVNTAh7DyS8lVN/zN6DUGJ41IG5O9HMh/lokz2QkIxJ4OgtNoKPr48mkwXdx
kOlpv/YhcIarEKa+6UonJh0FG0Ubh5fu7HTJPjNzawdM/rni61IotTsfyX3tp1fsnhhFyQuy
2lKF2DAlWvWVZUDkatWKkbBi

/
--------------------------------------------------------
--  DDL for Function ALL_TMP_ITEM_TO_ROLLUP_OBJECTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."ALL_TMP_ITEM_TO_ROLLUP_OBJECTS" wrapped
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
8
40b 2cd
w0uQT2NCKDz2lWZ7Yg8G9m4gUJkwgwK3LtCDfC9AEi4/ldJpbFrV21FBb1Ln+qbi09oNpH3X
UZlcXvs1qE2c5M5KAxlWmFXQWvfUWFixQk8twUTQKrZ23/jt3stJXt+Y1t7FXur4c0OR5U+q
n/7XiOaaCxvQFNBl0iv3X5z3dprOjxzJohn6U0mujThxhuFD3ZxNmfqvOxDozyABif+gsdUC
xIwIsa/bG+DMuJdxPlAXGjCUY1ZCtNRqLH+fs9tP7qxSkpg6665Z7m/S063OQQW9uegvFll/
PC9nBQkVTqz4/MB+5ip6XEM8iQWzDnJExz7CCvIMyV4k1gvj3B1GogNI61ArhCj60az7TRNJ
14HTbIf05e6+MSGcgs9BFRbKnIdl2YnzAv+ZABqxGl8LBE27KaQ2Gv6PleBmpgQfqzcBiBtW
UYWIbMnhdumZ0Vxy+l8P72pT5ikjx9Tw1FZ4QqgfEcCv0wH1FsmadAxWZsGLNAXr+ql5QkiX
70RhUCvdZEV7qRs3Wqtg8mCZ7+ns7GZ4RSCdObFhAGFhDVCPu7tM7da1++0BEiU6KVm6hKKK
bY4egOeHVsJfrXZa9oh/AqUGaTEhrqnXPriAYcG0T3iqeSntfYrIkiBZclxFvTYh7dzmadDD
u5/gTOoqicYoueiNz0w3fA6JiEM7LeNgcMbAALarvbKnSALsz5Jbc0/96A==

/
--------------------------------------------------------
--  DDL for Function APPEND_DATE_RANGE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."APPEND_DATE_RANGE" (START_DATE DATE, END_DATE DATE, ARRAY1 IN OUT DATE_ARRAY) RETURN DATE_ARRAY IS
DATE_RANGE DATE_ARRAY := DATE_ARRAY();
I NUMBER := 1;
J NUMBER := 1;
COUNTER NUMBER;
TEMP_RESULT DATE_ARRAY := DATE_ARRAY();
BEGIN
IF(ARRAY1.COUNT <> 0) THEN
TEMP_RESULT := GET_DATE_RANGE_ARRAY(START_DATE,END_DATE);
COUNTER := ARRAY1.COUNT+TEMP_RESULT.COUNT;
  FOR I IN ARRAY1.COUNT+1..COUNTER LOOP
    ARRAY1.EXTEND;
    ARRAY1(I):= TEMP_RESULT(J);
    J:=J+1;
  END LOOP;
ELSE
ARRAY1 := GET_DATE_RANGE_ARRAY(START_DATE,END_DATE);
END IF;
RETURN ARRAY1;
END APPEND_DATE_RANGE;

/
--------------------------------------------------------
--  DDL for Function BILLTYPE_AT_THAT_TIME
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."BILLTYPE_AT_THAT_TIME" (i_effective_date in number ,i_accnt_poid in number )
return number
as

   v_num_records_processed  NUMBER;
   v_bypass_other_records   NUMBER;
   v_earlier_not_found      NUMBER;
   v_commit_count           NUMBER;
   v_inp_accnt_poid         NUMBER;
   v_inp_effective_t        NUMBER;
   v_bill_type              NUMBER;




CURSOR c2 (i_effective_t  item_t.effective_t%TYPE , i_accnt_poid item_t.account_obj_id0%TYPE) IS

            SELECT e.poid_type , e.created_t , e.effective_t , ecb.bill_type ,ecb.next_bill_t ,ecb.parent_id0
            FROM event_t e , event_customer_billinfo_t ecb
            WHERE e.account_obj_id0 =c2.i_accnt_poid
                 and
                  e.poid_type = '/event/customer/billinfo'
                and
                  e.created_t < c2.i_effective_t
                and
                  ecb.rec_id = 1
                and
                  e.poid_id0 = ecb.obj_id0
            ORDER BY e.created_t desc;

CURSOR c3 (i_effective_t  item_t.effective_t%TYPE , i_accnt_poid item_t.account_obj_id0%TYPE) IS

            SELECT e.poid_type , e.created_t , e.effective_t , ecb.bill_type ,ecb.next_bill_t ,ecb.parent_id0
            FROM event_t e , event_customer_billinfo_t ecb
            WHERE e.account_obj_id0 =c3.i_accnt_poid
                 and
                  e.poid_type = '/event/customer/billinfo'
                and
                  e.created_t > c3.i_effective_t
                and
                  ecb.rec_id = 0
                and
                  e.poid_id0 = ecb.obj_id0
            ORDER BY e.created_t ;


r2 c2%ROWTYPE;
r3 c3%ROWTYPE;


BEGIN

   v_num_records_processed := 0;

   v_commit_count := 0;

      v_num_records_processed := v_num_records_processed + 1;

      v_bypass_other_records := 0;

      v_earlier_not_found := 1;

      v_inp_accnt_poid := i_accnt_poid ;

      v_inp_effective_t := i_effective_date;

      FOR r2 in c2(v_inp_effective_t , v_inp_accnt_poid)
      LOOP

        IF (v_bypass_other_records = 0)
        THEN

           v_bypass_other_records :=1;

           v_earlier_not_found := 0;

            return(r2.bill_type);

        END IF;

      END LOOP;

      IF (v_earlier_not_found = 1)
      THEN

         FOR r3 in c3(v_inp_effective_t , v_inp_accnt_poid)
         LOOP

           v_earlier_not_found := 0;

           IF (v_bypass_other_records = 0)
           THEN

               return(r3.bill_type);

              v_earlier_not_found := 0;

              v_bypass_other_records :=1;

           END IF;

         END LOOP;

      END IF;

      IF (v_earlier_not_found = 1)
      THEN

           v_bill_type := 0;

           SELECT bill_type
           INTO v_bill_type
           FROM account_t
           WHERE poid_id0 =v_inp_accnt_poid ;

            return(v_bill_type);


      END IF;
END;

/
--------------------------------------------------------
--  DDL for Function BLOB_TO_CLOB
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."BLOB_TO_CLOB" (p_data  IN  BLOB)
  RETURN CLOB
AS
  l_clob         CLOB;
  l_dest_offset  PLS_INTEGER := 1;
  l_src_offset   PLS_INTEGER := 1;
  l_lang_context PLS_INTEGER := DBMS_LOB.default_lang_ctx;
  l_warning      PLS_INTEGER;
BEGIN

  DBMS_LOB.createTemporary(
    lob_loc => l_clob,
    cache   => TRUE);

  DBMS_LOB.converttoclob(
   dest_lob      => l_clob,
   src_blob      => p_data,
   amount        => DBMS_LOB.lobmaxsize,
   dest_offset   => l_dest_offset,
   src_offset    => l_src_offset,
   blob_csid     => DBMS_LOB.default_csid,
   lang_context  => l_lang_context,
   warning       => l_warning);

   RETURN l_clob;
END;

/
--------------------------------------------------------
--  DDL for Function BOOLEAN_TO_VARCHAR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."BOOLEAN_TO_VARCHAR" (FLAG IN BOOLEAN)
RETURN VARCHAR2 IS
         BEGIN
                  RETURN
                          CASE FLAG
                                WHEN TRUE THEN 'TRUE'
                                 WHEN FALSE THEN 'FALSE'
                                 ELSE 'NULL'
            END;
END BOOLEAN_TO_VARCHAR;

/
--------------------------------------------------------
--  DDL for Function CHECK_CONNECTION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."CHECK_CONNECTION" RETURN VARCHAR2 IS

    check_status VARCHAR2(5);

BEGIN

  SELECT count(*) into check_status  FROM dual;


  RETURN to_char(check_status);

  EXCEPTION
  WHEN NO_DATA_FOUND
  THEN RETURN 'Connection Down';

END check_connection;

/
--------------------------------------------------------
--  DDL for Function CHECK_FOR_ANY_CC_FRAUD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."CHECK_FOR_ANY_CC_FRAUD" (
          in_ACCOUNT_OBJ_ID0 IN NUMBER,
          in_DECLINED_PYMT_FLAG    IN NUMBER )
RETURN VARCHAR2 IS
/****************************************************************************************************************************************************************************
   FUNCTION NAME      : CHECK_FOR_ANY_CC_FRAUD (ACCOUNT_OBJ_ID0,COUNTRY_FLAG)
   PURPOSE            : The customer will be flagged as fraudulent under the following specific scenarios:
   Scenario S1:
   The customer has declined with Invalid cards more than twice in rolling 12 month period with more than two cards. (201, 591, 825)
   Scenario S2:
   The customer has declined with invalid CVV more than 10 times within a rolling 12 month period, regardless of the number of cards or 3 times in one day. (813,531,503)
   Scenario S3:
   The customer has declined with a fraudulent or Lost\Stolen credit card more than once with more than one card within  a rolling 12 month period. (502,596,534)
   Scenario S4:
   The customer has already entered cards from two different countries into our system in the past 12 months and is attempting to enter a card in from a 3rd Country

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ----------------------------------------------------------
   1.0        06/06/2013  Om Bisht        1. Created for fraud prevention feature (DSS 9.4 Release)
   2.0        23/08/2013  Om Bisht        1: Added Logic for rolling period consideration for already revoked customers with rolling period
   3.0        29/11/2013  Om Bisht        1: Also consider the pin_collect credit card declines for fraud identification
   Note :
   in_DECLINED_PYMT_FLAG = 0 -> Failed CC Payment
   in_DECLINED_PYMT_FLAG = 1 -> Successful CC Payment
****************************************************************************************************************************************************************************/
  REASON_CODE VARCHAR2(30);
  FRAUD_IDENTIFIED NUMBER;
  START_DATE NUMBER;
  LAST_REVOKED_DATE NUMBER;
  ROLLING_PERIOD_MONTHS CONSTANT NUMBER := 12;
  FRAUD_REVOKED_FLAG_VALUE CONSTANT NUMBER := 0;
  FRAUD_DURING_CC_PAYMENT CONSTANT NUMBER := 10003;
  -- Fraud Phase III
  FRAUD_IDENTIFIED_FLAG_VALUE CONSTANT NUMBER := 1;
  NEXT_SEQUENCE_NO NUMBER;
  FRAUD_REMARK_CC_IDENTIFIED CONSTANT VARCHAR2(50) := 'Fraud Identified during Credit Card Payment';
  FRAUD_ACTION_STATUS_PENDING CONSTANT VARCHAR2(1) := 'P';
  FRAUD_CC_DECLINE_RECID_INVALID CONSTANT NUMBER := -1;
  FRAUD_CC_DECLINE_RECID_VALID CONSTANT NUMBER := 0;


  i_SCENARIO_CODE           HNS_FRAUDULENT_SCENARIOS_T.SCENARIO_CODE%TYPE;
  i_REASON_CODE             HNS_FRAUDULENT_SCENARIOS_T.REASON_CODE%TYPE;
  i_DECLINED_OCCURRENCE     HNS_FRAUDULENT_SCENARIOS_T.DECLINED_OCCURRENCE%TYPE;
  i_TOTAL_CARDS             HNS_FRAUDULENT_SCENARIOS_T.TOTAL_CARDS%TYPE;
  i_ROLLING_PERIOD_MONTH    HNS_FRAUDULENT_SCENARIOS_T.ROLLING_PERIOD_MONTH%TYPE;
  i_ROLLING_PERIOD_DAY      HNS_FRAUDULENT_SCENARIOS_T.ROLLING_PERIOD_DAY%TYPE;

-- Cursor to fetch the configuration parameters for Credit-Card Fraud Identification based on Decline Codes
CURSOR CC_FRAUD_CONF_CUR IS
SELECT SCENARIO_CODE,REASON_CODE,DECLINED_OCCURRENCE,TOTAL_CARDS,ROLLING_PERIOD_MONTH,ROLLING_PERIOD_DAY
FROM HNS_FRAUDULENT_SCENARIOS_T
WHERE SCENARIO_CODE IN (SELECT DISTINCT SCENARIO_CODE FROM HNS_FRAUDULENT_DECLINE_CODE_T)
ORDER BY SCENARIO_CODE DESC;

-- Cursor to fetch the configuration parameters for country specific restrictions (Scenario S4)
CURSOR COUNTRY_FRAUD_CONF_CUR IS
SELECT SCENARIO_CODE,REASON_CODE,DECLINED_OCCURRENCE,ROLLING_PERIOD_MONTH
FROM HNS_FRAUDULENT_SCENARIOS_T
WHERE SCENARIO_CODE NOT IN (SELECT DISTINCT SCENARIO_CODE FROM HNS_FRAUDULENT_DECLINE_CODE_T);

BEGIN
        -- Check if the Account is already fraud-revoked in rolling period of last 12 months
        -- It will return the last revoked timestamp OR 0 (if no fraud-revoked)
        SELECT NVL(MAX(MODIFIED_T),0) INTO LAST_REVOKED_DATE FROM HNS_FRAUDULENT_CUSTOMERS_T
        WHERE ACCOUNT_OBJ_ID0=in_ACCOUNT_OBJ_ID0
        AND FRAUD_FLAG=FRAUD_REVOKED_FLAG_VALUE
        AND FRAUD_PAY_TYPE=FRAUD_DURING_CC_PAYMENT
        AND CREATED_T >= DATE_TO_INFRANET(ADD_MONTHS(SYSDATE,-ROLLING_PERIOD_MONTHS));

        DBMS_OUTPUT.PUT_LINE('Last Revoked date :'|| LAST_REVOKED_DATE);

        IF in_DECLINED_PYMT_FLAG = 0 THEN
            -- Executed Rule Engine for Declined Codes related Fraud Starting for S3 i.e. Identity Theft (I93)
            -- Fetch the Cursor data one by one to execute the query to identify any potential fraud
            FOR FRAUD_ENGINE_CUR_REC IN CC_FRAUD_CONF_CUR
            LOOP
              i_SCENARIO_CODE           := FRAUD_ENGINE_CUR_REC.SCENARIO_CODE;
              i_REASON_CODE             := FRAUD_ENGINE_CUR_REC.REASON_CODE;
              i_DECLINED_OCCURRENCE     := FRAUD_ENGINE_CUR_REC.DECLINED_OCCURRENCE;
              i_TOTAL_CARDS             := FRAUD_ENGINE_CUR_REC.TOTAL_CARDS;
              i_ROLLING_PERIOD_MONTH    := FRAUD_ENGINE_CUR_REC.ROLLING_PERIOD_MONTH;
              i_ROLLING_PERIOD_DAY      := FRAUD_ENGINE_CUR_REC.ROLLING_PERIOD_DAY;

                  IF i_ROLLING_PERIOD_DAY IS NOT NULL THEN
                    --Scenario S2 (3 times in one day ):
                    SELECT DECODE(COUNT(*),1,1,0) INTO FRAUD_IDENTIFIED FROM (
                      SELECT COUNT(*) TOTAL,COUNT(DISTINCT DEBIT_NUM) AS TOTAL_CARDS
                      FROM HNS_CUST_CC_DECLINE_DATA_T
                      WHERE ACCOUNT_OBJ_ID0 = in_ACCOUNT_OBJ_ID0
                      AND VCCODE IN (SELECT VC_CODE FROM HNS_FRAUDULENT_DECLINE_CODE_T WHERE SCENARIO_CODE=i_SCENARIO_CODE)
                      AND DECLINED_T >= DATE_TO_INFRANET(TRUNC(SYSDATE))
                      AND DECLINED_T < DATE_TO_INFRANET(SYSDATE)
                      AND FRAUD_REC_ID = FRAUD_CC_DECLINE_RECID_VALID
                    )WHERE TOTAL_CARDS > i_TOTAL_CARDS AND TOTAL > i_DECLINED_OCCURRENCE;

                  ELSE
                    -- If LAST_REVOKED_DATE found then execute the rule engine starting from the last fraud-revoked date
                    -- Else execute the rule engine for configured rolling period
                      IF LAST_REVOKED_DATE = 0 THEN
                          START_DATE := DATE_TO_INFRANET(ADD_MONTHS(SYSDATE,-i_ROLLING_PERIOD_MONTH));
                      ELSE
                          START_DATE := LAST_REVOKED_DATE;
                      END IF;
                      --Scenario S1,S2,S3
                      SELECT DECODE(COUNT(*),1,1,0) INTO FRAUD_IDENTIFIED FROM (
                        SELECT COUNT(*) TOTAL,COUNT(DISTINCT DEBIT_NUM) AS TOTAL_CARDS
                        FROM HNS_CUST_CC_DECLINE_DATA_T
                        WHERE ACCOUNT_OBJ_ID0 = in_ACCOUNT_OBJ_ID0
                        AND VCCODE IN (SELECT VC_CODE FROM HNS_FRAUDULENT_DECLINE_CODE_T WHERE SCENARIO_CODE=i_SCENARIO_CODE)
                        AND DECLINED_T >= START_DATE
                        AND FRAUD_REC_ID = FRAUD_CC_DECLINE_RECID_VALID
                      )WHERE TOTAL_CARDS > i_TOTAL_CARDS AND TOTAL > i_DECLINED_OCCURRENCE;
                  END IF;

                  IF FRAUD_IDENTIFIED = 1 THEN
                    SELECT SEQ_FRAUD_CUST_RECID.NEXTVAL INTO NEXT_SEQUENCE_NO FROM DUAL;
                    -- Insert Data into Fraud Table
                    INSERT INTO HNS_FRAUDULENT_CUSTOMERS_T (ACCOUNT_NO,ACCOUNT_OBJ_ID0,CREATED_T,MODIFIED_T,FRAUD_FLAG,FRAUD_PAY_TYPE,STATUS,REASON_CODE,USERLOGIN,REMARKS,REC_ID)
                    VALUES (P2A(in_ACCOUNT_OBJ_ID0),in_ACCOUNT_OBJ_ID0,D2I(SYSDATE),D2I(SYSDATE),FRAUD_IDENTIFIED_FLAG_VALUE,FRAUD_DURING_CC_PAYMENT,FRAUD_ACTION_STATUS_PENDING,i_REASON_CODE,'Fraud : BWS Payment',FRAUD_REMARK_CC_IDENTIFIED,NEXT_SEQUENCE_NO);

                    -- Update the Corresponding FRAUD_REC_ID in HNS_CUST_CC_DECLINE_DATA_T Table
                    UPDATE HNS_CUST_CC_DECLINE_DATA_T
                    SET FRAUD_REC_ID = NEXT_SEQUENCE_NO,MODIFIED_T = D2I(SYSDATE)
                    WHERE ACCOUNT_OBJ_ID0 = in_ACCOUNT_OBJ_ID0
                    AND FRAUD_REC_ID = FRAUD_CC_DECLINE_RECID_VALID
                    AND VCCODE IN (SELECT VC_CODE FROM HNS_FRAUDULENT_DECLINE_CODE_T WHERE SCENARIO_CODE=i_SCENARIO_CODE);

                    -- Invalidate the Rest of FRAUD_REC_ID in HNS_CUST_CC_DECLINE_DATA_T Table
                    UPDATE HNS_CUST_CC_DECLINE_DATA_T
                    SET FRAUD_REC_ID = FRAUD_CC_DECLINE_RECID_INVALID,MODIFIED_T = D2I(SYSDATE)
                    WHERE ACCOUNT_OBJ_ID0 = in_ACCOUNT_OBJ_ID0
                    AND FRAUD_REC_ID = FRAUD_CC_DECLINE_RECID_VALID;

                    -- Return the Reason Code
                    RETURN i_REASON_CODE;
                  END IF;
          END LOOP;
          END IF;
              -- Executed Rule Engine for Scenario S4 i.e. Multiple Country Fraud whether the payment for Successfull or Failed
              FOR FRAUD_ENGINE2_CUR_REC IN COUNTRY_FRAUD_CONF_CUR
              LOOP
                  i_SCENARIO_CODE           := FRAUD_ENGINE2_CUR_REC.SCENARIO_CODE;
                  i_REASON_CODE             := FRAUD_ENGINE2_CUR_REC.REASON_CODE;
                  i_DECLINED_OCCURRENCE     := FRAUD_ENGINE2_CUR_REC.DECLINED_OCCURRENCE;
                  i_ROLLING_PERIOD_MONTH    := FRAUD_ENGINE2_CUR_REC.ROLLING_PERIOD_MONTH;

                  -- If LAST_REVOKED_DATE found then execute the rule engine starting from the last fraud-revoked date
                  -- Else execute the rule engine for configured rolling period
                  IF LAST_REVOKED_DATE = 0 THEN
                      START_DATE := DATE_TO_INFRANET(ADD_MONTHS(SYSDATE,-i_ROLLING_PERIOD_MONTH));
                  ELSE
                      START_DATE := LAST_REVOKED_DATE;
                  END IF;

                  -- Execute the Query to find any potential fraud
                  SELECT DECODE(COUNT(*),1,1,0) INTO FRAUD_IDENTIFIED FROM (
                      SELECT COUNT(DISTINCT B.COUNTRY) TOTAL_OCCURRENCE
                      FROM HNS_AUTHORIZE_CC_RESP_T R,BIN_T B
                      WHERE ACCOUNT_OBJ_ID0 = in_ACCOUNT_OBJ_ID0
                      AND R.BIN = B.BIN
                      AND R.CREATED_T >= START_DATE
                  )WHERE TOTAL_OCCURRENCE > i_DECLINED_OCCURRENCE;

                  IF FRAUD_IDENTIFIED = 1 THEN
                    SELECT SEQ_FRAUD_CUST_RECID.NEXTVAL INTO NEXT_SEQUENCE_NO FROM DUAL;
                    -- Insert Data into Fraud Table
                    INSERT INTO HNS_FRAUDULENT_CUSTOMERS_T (ACCOUNT_NO,ACCOUNT_OBJ_ID0,CREATED_T,MODIFIED_T,FRAUD_FLAG,FRAUD_PAY_TYPE,STATUS,REASON_CODE,USERLOGIN,REMARKS,REC_ID)
                    VALUES (P2A(in_ACCOUNT_OBJ_ID0),in_ACCOUNT_OBJ_ID0,D2I(SYSDATE),D2I(SYSDATE),FRAUD_IDENTIFIED_FLAG_VALUE,FRAUD_DURING_CC_PAYMENT,FRAUD_ACTION_STATUS_PENDING,i_REASON_CODE,'Fraud : BWS Payment',FRAUD_REMARK_CC_IDENTIFIED,NEXT_SEQUENCE_NO);

                    -- Invalidate any FRAUD_REC_ID (if exist) in HNS_CUST_CC_DECLINE_DATA_T Table
                    UPDATE HNS_CUST_CC_DECLINE_DATA_T
                    SET FRAUD_REC_ID = FRAUD_CC_DECLINE_RECID_INVALID,MODIFIED_T = D2I(SYSDATE)
                    WHERE ACCOUNT_OBJ_ID0 = in_ACCOUNT_OBJ_ID0
                    AND FRAUD_REC_ID = FRAUD_CC_DECLINE_RECID_VALID;

                    -- Return the Reason Code
                    RETURN i_REASON_CODE;
                  END IF;
               END LOOP;
        -- If No fraud is identified then Return 0
         RETURN '0';
   EXCEPTION
        WHEN NO_DATA_FOUND THEN
                RETURN '0:No Configuration data';
        WHEN OTHERS THEN
                RETURN '0:Exception Occurred';
END CHECK_FOR_ANY_CC_FRAUD;

/
--------------------------------------------------------
--  DDL for Function CHECK_FOR_DUPLICATE_VCC_REQ
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."CHECK_FOR_DUPLICATE_VCC_REQ" (

 in_UPFRONT_KEY_CODE IN VARCHAR2,
 in_DELAYED_INTERVAL  IN NUMBER
)

RETURN VARCHAR2 IS

LAST_REQUEST_TIME NUMBER;

UPDATE_COUNT Number;
BEGIN
BEGIN
   SELECT LAST_REQUEST_T into LAST_REQUEST_TIME  FROM HNS_UPFRONT_CHARGE_HISTORY_T WHERE UPFRONT_KEY_CODE=in_UPFRONT_KEY_CODE;

   DBMS_OUTPUT.PUT_LINE('LAST_REQUEST_TIME :'|| LAST_REQUEST_TIME);


   UPDATE HNS_UPFRONT_CHARGE_HISTORY_T set LAST_REQUEST_T = date_to_infranet(sysdate) where UPFRONT_KEY_CODE=in_UPFRONT_KEY_CODE AND LAST_REQUEST_T <= (date_to_infranet(sysdate) - in_DELAYED_INTERVAL) AND LAST_REQUEST_T= LAST_REQUEST_TIME;
   UPDATE_COUNT := sql%rowcount;
   DBMS_OUTPUT.PUT_LINE('Updated Rows :'|| UPDATE_COUNT);

   IF UPDATE_COUNT > 0 THEN
      RETURN '1';
   ELSE
      RETURN '0';
  END IF;

 EXCEPTION
      WHEN NO_DATA_FOUND THEN
      INSERT INTO HNS_UPFRONT_CHARGE_HISTORY_T(UPFRONT_KEY_CODE,LAST_REQUEST_T) VALUES(in_UPFRONT_KEY_CODE,date_to_infranet(sysdate));
      DBMS_OUTPUT.PUT_LINE('Inserted :'||sql%rowcount);
      RETURN '2';

  END;
  EXCEPTION
      WHEN DUP_VAL_ON_INDEX THEN
      DBMS_OUTPUT.PUT_LINE('Unique Key Error Ocuurred');
      RETURN '0';
      WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Exception Occurred');
      RETURN '0';

END CHECK_FOR_DUPLICATE_VCC_REQ;

/
--------------------------------------------------------
--  DDL for Function CHECK_FOR_EBB
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."CHECK_FOR_EBB" 
(
SAN IN VARCHAR2 
)
RETURN VARCHAR2 
IS
msg Varchar2(2000);
BEGIN
  select value into msg from hns_config_billing_param_t where name  = 'EBBMessage';
  if true
    then
    RETURN msg;
  end if;
END CHECK_FOR_EBB ;

/
--------------------------------------------------------
--  DDL for Function CREATE_WHOLESALE_AR_ITEM
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."CREATE_WHOLESALE_AR_ITEM" wrapped
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
8
19b8 804
dwzq872g7dE1b5QqRYfrgvA3IE8wgz1UVSAF3y+aCtLqpdff5SpKxH60NMsObJfMqLfioq3N
t48bSB6v8B3Gr4eSxrta92aBQ1dAbeBAhuP+CIYIMHpB0UdNcu9gs81IDWhkm6qdfngKxkPJ
jZa/OiOdkoO/kBbGvHJll8ffQhOAry+UT+Nm7NcbFAj8Za82DZdZuG6utzo1drrotkkYhuNA
R+Epp3/KLhO3301IWNESS3KwQl9eQU65vkZ0bLso2c56/gMUqHe1uFrJq8E+WP/nQ2DJN7a1
q0nvPlyp3XGzX/XXb1Jl2dZfV9yZkEl16KihWlDUslH1QVKPDeVlSoZ7SUN1F97W8hlD5Gp2
WU1UD90hKcc50dGfCyc1smhGpVZrERVUWXzpzBhxF8zdaclnkowKCq9TkUQUgbff4pPPShdo
Psk1qrw1hPo8CpxHG3jvzXQFrTIcoliR6q5gPmxGWvF8yFE+oVNxnXIWMJTmyqwkZ5JCIXbL
gGOR3yil+68P1OLaqOvjReJe5L92zugUGyJb/q3/buk3fNSU4otZJaun4X9ZtFllbUQV69cq
zv9w45CiIMgNZKwC3qnTnx32Nhlj6Hde8GkKs6BNTy9WnzeMnZkmmy/fbPnmjbZ9UUrQUMXm
XP9xeidTfNReNbXN/P4k3XJn0XaxrLYCTQ/w6i2F+waxRvLq+50grTZT7Zn3IJanv7V6ALmd
4rn+7TchsGTXplgPWzlR05XguhK0TUpjRnQ34O/SuY7WiU1bxkZ73brW6oUU5yhYUJRIf9bl
d1+96pmdXCXQB7RuaSXUTsh0yEZWqVwivOacAjIbSlkhrHDv50OHVxTcrvUefYpIRKqm4s5z
T60lzi098L8exgewc+W/hQ838a0PdKuD8xygAq5SkZxJrtCFK64i4jP41/JEkcSCXu+fz6Um
+KGiDj8h++gWxjAJdO1e3ylf+4puL924NIy4aKecOIDj/51ywfSGxxWTcke/5/3N8WWpcca8
S+mlU8EokP/2Yfk6zK9D/FDA0L1W8yRjLPoST0eVCrcVDuOvnxQmMYlwZQzHp1KlMfbO2Wue
ynMcMc1h2tLSuMRoZLskjHOclNP9E7uzPzpSHcxluSvcmpVpBdeJ48UjhHR/YmJRNxb5oEyF
XJ/MMFKvdsGojsw3Ia5BPkzSKWpQTNhXSpffgHarQsQrxW+Zi+OYPSaOl+bUcV+GjIYmzGqx
N11ZB/8xN2zwP3fxdxOVbbEl8alB7WHa8N8/KqyQvEjnnXoNpMdJn/3V1Ekx3ptjjLtfnHbW
nECFMcS72q2DM9l/3CR2oMbNWu6fAAMQmswbIehGnDHswrwpxU16rdBNygFGkl0NL+hdGwf7
mXArjU748Ea7KrnIFRJmNR+TXrz07zoncXVoZDxJ/Dzzp03GcOBIZijMdE0C8s2ysYQ9SKMy
caaDjvvqpj17fhzlYevlhuGF6FRnRcEByH4YRsK9ntkbiHy4d2abofQB0Pv6HPJ2E2kqJkYW
Ww4PIgxDwJEhXChkw2HGDiAobEYuLxZRNY5i40Xh5Q5cST30wLsnIQ2qKuUtYYqjTQnGXqS9
KPvvL1Uv8RWPGzdN64ybO+vi13qiFcjOcXX/LkIasMwQYChYSFEl6EeEn5VssOA4FlalH2d8
jcrLGckmz/FV8wKQ3b2OXMn/W5VClVJgJbwigWKAO1leHOX+8QD1KajaeCahq/Br3z0ZlZsz
n/g2iFndEZXUfyb+kO0ZlcZDyUKqmJcku2GuKFx5ChdWXC6qVH07eBOBc7A7Y+EJpWOTdhJq
8SHSReeEA90af5MNLExYclRULnHXLctNh2heJAFR0Uw75n2IfPbVWR6jeUZVsNE46X49Trz1
0L0dtkxnt9ff9uzC+rBOuGMvuxaVqGZSiRWSi05Xmy3I/wGcoA8e5eX0doA9KR74xj3cb/zl
WrU22wfNksuBUMQgo7TuVh9iXYtiZS9bPut4zAPJsemY5FxZa3yfoTGdRyDik1kJdrbwIvkp
JMZqkwQ=

/
--------------------------------------------------------
--  DDL for Function D2U
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."D2U" (v_date IN CHAR)
-- This function converts local date string format into unix/infranet time taking daylight savings time into consideration
-- Change v_region := 'America/new_york' to your region as found in SELECT tzname, tzabbrev, tz_offset(tzname) FROM V$TIMEZONE_NAMES;
-- for support contact dcook@portal.com 1-800-232-4542
-- input format is select d2u('11/01/2004 10:00') from dual;
-- PROOF: select d2u('11/02/2004 00:00')-d2u('11/01/2004 00:00') "RegularDay", d2u('4/4/2005 00:00')-d2u('4/3/2005 00:00') "SpringFoward", d2u('11/01/2004 00:00')-d2u('10/31/2004 00:00') "FallBack" from dual;
RETURN INTEGER
IS
v_converted_date INTEGER;
v_region VARCHAR2(30);
v_date2 VARCHAR(30);
BEGIN
IF length(v_date) < 12
   THEN v_date2 := (v_date || ' 00:00');
   ELSE v_date2 := (v_date);
END IF;
v_region := 'US/Eastern';
v_converted_date := ((to_date(TO_CHAR(TO_TIMESTAMP_TZ(v_date2||v_region,'MM/DD/YYYY HH24:MI TZR'),'MMDDYYYY TZH'),'MMDDYYYY hh24:mi')-(to_date('01011970','ddmmyyyy')))*86400);
RETURN v_converted_date;
END;

/
--------------------------------------------------------
--  DDL for Function DATE_TO_HIGH_POID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."DATE_TO_HIGH_POID" ( in_date date) return number is

   unix_start_time date;
  begin
  unix_start_time := to_date('01-JAN-1970', 'DD-MON-YYYY');

 if ((in_date - unix_start_time ) > 12260) then
   return (in_date - unix_start_time + 1)* power(2,44);
 else
   return 107000000;
 end if;

end;

/
--------------------------------------------------------
--  DDL for Function DATE_TO_INFRANET
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."DATE_TO_INFRANET" ( in_date DATE) RETURN INTEGER IS
   gmt_offset_hours NUMBER; /* hours offset from GMT */
   unix_start_time DATE;
   dt_dylight_start DATE;
   dt_dylight_end DATE;
   vc_current_year VARCHAR2(4);
   vc_dylight_start VARCHAR2(10);
   vc_dylight_end VARCHAR2(10);
BEGIN
  SELECT TO_CHAR(in_date,'YYYY')
    INTO vc_current_year
    FROM DUAL;
    vc_dylight_start := '03/07/' || vc_current_year;
    vc_dylight_end := '10/31/' || vc_current_year;
  SELECT NEXT_DAY(TO_DATE(vc_dylight_start || ' 02:00:00','mm/dd/yyyy hh:mi:ss'),'SUNDAY'),
         NEXT_DAY(TO_DATE(vc_dylight_end || ' 02:00:00','mm/dd/yyyy hh:mi:ss'),'SUNDAY')
     INTO dt_dylight_start,
          dt_dylight_end
     FROM DUAL;
  IF in_date > dt_dylight_start AND in_date < dt_dylight_end THEN
    gmt_offset_hours := -4;
  ELSE
    gmt_offset_hours := -5;
  END IF;
  unix_start_time := TO_DATE('01-JAN-1970', 'DD-MON-YYYY') + gmt_offset_hours/24 ;
  RETURN ( in_date - unix_start_time ) * 60 * 60 *24;
END;

/
--------------------------------------------------------
--  DDL for Function DATE_TO_LOW_POID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."DATE_TO_LOW_POID" ( in_date date) return number is

   unix_start_time date;
  begin
  unix_start_time := to_date('01-JAN-1970', 'DD-MON-YYYY');

 if ((in_date - unix_start_time ) > 12260) then
   return (in_date - unix_start_time)* power(2,44);
 else
   return 8225;
 end if;

end;

/
--------------------------------------------------------
--  DDL for Function EP2D
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."EP2D" (event_poid NUMBER)
   RETURN VARCHAR2
IS
   offer_id       event_bal_impacts_t.offering_obj_id0%TYPE;
   Node_Loc       Event_Bal_Impacts_T.Node_Location%TYPE;
   account_poid   event_t.account_obj_id0%TYPE;
   deal_name      deal_t.name%TYPE;
BEGIN
    SELECT Offering_Obj_Id0, Node_Location, account_obj_id0
    INTO Offer_Id, Node_Loc, account_poid
    FROM Event_Bal_Impacts_T
    WHERE Obj_Id0 = Event_Poid AND ROWNUM < 2;


    IF Offer_Id IS NULL
    Then
       IF Node_Loc IS NULL
        THEN
            return deal_name;
        END IF;

        Node_Loc := SUBSTR (Node_Loc, 0, INSTR (Node_Loc, ':')) || '%';

        SELECT name
        INTO deal_name
        FROM deal_t
        WHERE poid_id0 = (SELECT deal_obj_id0
                            FROM event_billing_deal_info_t
                            WHERE node_location LIKE node_loc and rownum < 2);
    ELSE
    IF offer_id > 0
    THEN
        SELECT name
        INTO deal_name
        FROM deal_t
        WHERE poid_id0 = (SELECT deal_obj_id0
                            FROM purchased_product_t
                            WHERE poid_id0 = offer_id and rownum < 2);
    ELSE
        IF Node_Loc IS NULL
        then
            SELECT descr
            INTO deal_name
            FROM event_t
            WHERE poid_id0 = event_poid;
        else
            Node_Loc := SUBSTR (Node_Loc, 0, INSTR (Node_Loc, ':')) || '%';

        SELECT name
        INTO deal_name
        FROM deal_t
        WHERE poid_id0 = (SELECT deal_obj_id0
                            FROM event_billing_deal_info_t
                            WHERE node_location LIKE node_loc and rownum < 2);
        end if;
    END IF;
end if;
   RETURN deal_name;
End;

/
--------------------------------------------------------
--  DDL for Function EXPAND_COMPACTED_EVENTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."EXPAND_COMPACTED_EVENTS" (
      query IN VARCHAR2 )
    RETURN NUMBER
  AS
    language java name 'com.oracle.brm.ExpandCompactEventSet.expandMatchingEvents(java.lang.String) return java.lang.Int';

/
--------------------------------------------------------
--  DDL for Function GENERATE_TOKEN_FOR_CC
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GENERATE_TOKEN_FOR_CC" (ccNum varchar2) return varchar2
IS
PRAGMA AUTONOMOUS_TRANSACTION;

tokenNum cc_alias_map_t.cc_num%TYPE;
recordCount INTEGER;
digitCount INTEGER;
BEGIN

select length(ccNum) into digitCount from dual;

select count(alias_num) into recordCount from cc_alias_map_t where cc_num = ccNum;

if recordCount = 1
then
     select alias_num into tokenNum from cc_alias_map_t where cc_num = ccNum;
elsif digitCount = 19 then
       select substr(ccNum,1,1) || CC_ALIAS_11_DIGIT_SEQ.nextVal || substr(ccNum,16,4) into tokenNum from dual;
     insert into cc_alias_map_t (created_t, mod_t, CC_NUM, ALIAS_NUM) values(date_to_infranet(sysdate), date_to_infranet(sysdate), ccNum, tokenNum);

elsif digitCount = 16 then
       select substr(ccNum,1,1) || CC_ALIAS_11_DIGIT_SEQ.nextVal || substr(ccNum,13,4) into tokenNum from dual;
     insert into cc_alias_map_t (created_t, mod_t, CC_NUM, ALIAS_NUM) values(date_to_infranet(sysdate), date_to_infranet(sysdate), ccNum, tokenNum);

elsif digitCount = 15 then
     select substr(ccNum,1,1) || CC_ALIAS_10_DIGIT_SEQ.nextVal || substr(ccNum,12,4) into tokenNum from dual;
     insert into cc_alias_map_t (created_t, mod_t, CC_NUM, ALIAS_NUM) values(date_to_infranet(sysdate), date_to_infranet(sysdate), ccNum, tokenNum);

end if;

commit;

return tokenNum;
END;

/
--------------------------------------------------------
--  DDL for Function GET_ACCNO_FROM_INVNO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_ACCNO_FROM_INVNO" (invNum varchar2) return varchar2
IS
accNum varchar2(30);

BEGIN
select p2a(account_obj_id0) into accNum from ent_invoice_t where invoice_rec_id=(select invoice_rec_id from ent_invoice_version_t where invoice_no=invNum);
return accNum;
END;

/
--------------------------------------------------------
--  DDL for Function GET_ACCOUNT_STATUS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_ACCOUNT_STATUS" ( siteId IN VARCHAR2 )
    RETURN VARCHAR2 IS
    accountStatus VARCHAR2(20) := 'Account Not Found';

BEGIN

  SELECT decode(status, 10100, '10100(Active)', 10102, '10102(Inactive)', '10103(Closed)' ) INTO accountStatus FROM account_t WHERE poid_id0 = a2p(siteId);

  IF accountStatus IS NULL THEN
    accountStatus := 'Account Not Found';
  END IF;

  RETURN accountStatus;

  EXCEPTION
  WHEN NO_DATA_FOUND
  THEN RETURN 'Account Not Found';
END get_account_status;

/
--------------------------------------------------------
--  DDL for Function GET_AMOUNT_DUE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_AMOUNT_DUE" ( siteId IN VARCHAR2 )
                RETURN VARCHAR2 IS
    sum1 NUMBER := 0;

BEGIN

  SELECT SUM(due) into sum1
  FROM   item_t i
  WHERE  i.account_obj_id0 = a2p(siteId) and status != 1
  and    i.effective_t > d2i(sysdate - 181);

  IF sum1 IS NULL THEN
    sum1 := 0;
  END IF;

  RETURN to_char(sum1);

  EXCEPTION
  WHEN NO_DATA_FOUND
  THEN RETURN 'Account Not Found';

END get_amount_due;

/
--------------------------------------------------------
--  DDL for Function GET_AR_ITEM_NO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_AR_ITEM_NO" wrapped
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
8
63e 2fe
rk+qR1z3V8dq3xIwqTa4s++jiAAwg2PDLiCDZy/NMnPVi2+Me9NTl2zjWv2C3fIwsTFMSc3e
AqNJGHdGdzIojZuGmAtLOnzcPTkvQDowgrvXiv/AWFRrFHqOjbqNuS3FQWhOe3R1uDkgbnPx
qAuPD8RxSZnihjUOs4ujYTkvG3DE3FRZkMNfKjN8vFMEX/oqQ6eYRJs+J0lOib3e2p8LgSZZ
cRh37x5eSzmC4r5cAP8TdgGs3Fkxut3RXkB52uY7jbs2nH0q98fU02zwQyWs/mpDNv+G7rhX
J+9OR4J9KOQhy+Gn3iKuraVoxSYJjf0XKpxAseXQqOfiUtGR3WEoYSbL2g1mtD6Od5DFfVqr
NYAuLNrrxQKDfnOdmEQnNvpeRr2K6AxS8oTXRCYL5G5wYFV5wBQWHoKyziBl3tF0e0EBDPe4
nscNBO73MPcoARdUpx7TP2+abWQ9hk4daJweSc5h5SvirPiDTmpcnQ+edW6vHtVjiqtt3fx2
3nEWsHdU77PoPaR/1vgjQsCkQo/vX5KUMHgpySgzrbUjCCH0m7XCLsP8H4k/eRmQ++tBYjtv
3rRS80evp17Y+mTtCv12r4Wqez71fBYuhUHY7bTnBmLbGSbPmMnPpmkf2gdTzVHQJySPf+ws
Oo9MGhaTR8p63J2s7g4xbdYSi2Rmv72x7O4lyuTvtJ/MZ0cRhIMFnMLkTF2/IWgiy2cmAp8i
1n3SNah9ixgguBDz5d+AHlNI8Cz5pkDrT7o=

/
--------------------------------------------------------
--  DDL for Function GET_BILLING_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_BILLING_DATE" ( siteId IN VARCHAR2 ) RETURN VARCHAR2 IS

    billing_day VARCHAR2(2):= 0;

BEGIN

  SELECT actg_cycle_dom INTO billing_day
  FROM   billinfo_t bi
  WHERE  bi.account_obj_id0 = a2p(siteId);


  IF billing_day IS NULL THEN
    billing_day := 0;
  END IF;

  RETURN to_char(billing_day);

  EXCEPTION
  WHEN NO_DATA_FOUND
  THEN RETURN 'Account Not Found';
END get_billing_date;

/
--------------------------------------------------------
--  DDL for Function GET_CC_FROM_TOKEN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_CC_FROM_TOKEN" (tokenNum varchar2) return varchar2
IS
ccNum cc_alias_map_t.cc_num%TYPE;
BEGIN
select cc_num into ccNum from cc_alias_map_t where alias_num = tokenNum;
return ccNum;
END;

/
--------------------------------------------------------
--  DDL for Function GET_DATE_RANGE_ARRAY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_DATE_RANGE_ARRAY" (START_DATE DATE, END_DATE DATE) RETURN DATE_ARRAY IS
DATE_RANGE DATE_ARRAY := DATE_ARRAY();
DATE_COUNTER DATE := START_DATE -1;
I NUMBER := 1;
BEGIN


  WHILE DATE_COUNTER < END_DATE
  LOOP
    SELECT (DATE_COUNTER + 1) INTO DATE_COUNTER FROM DUAL;
    DATE_RANGE.EXTEND;
    DATE_RANGE(I) := DATE_COUNTER;
    I := I + 1;
  END LOOP;
  RETURN DATE_RANGE;
END GET_DATE_RANGE_ARRAY;


/* CREATE FUNCTION GET_DATE_RANGE_INTERSECTION*/

/
--------------------------------------------------------
--  DDL for Function GET_DATE_RANGE_INTERSECTION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_DATE_RANGE_INTERSECTION" (A DATE_ARRAY, B DATE_ARRAY) RETURN DATE_ARRAY IS C DATE_ARRAY:= DATE_ARRAY();
AI NUMBER:=1;
BI NUMBER:=1;
CI NUMBER:=1;
BEGIN
  WHILE AI <= A.COUNT AND BI <= B.COUNT
  LOOP
     IF A(AI) < B(BI) THEN
     AI := AI + 1;
     ELSIF A(AI) > B(BI) THEN
        BI := BI + 1;
     ELSE
        IF CI = 1 OR A(AI) <> C(CI - 1) THEN
          C.EXTEND;
          C(CI) := A(AI);
          CI:=CI+1;
        END IF;
        AI:=AI+1;
        BI:=BI+1;
    END IF;
  END LOOP;
  RETURN C;
END GET_DATE_RANGE_INTERSECTION;

/* CREATE FUNCTION APPEND_DATE_RANGE*/

/
--------------------------------------------------------
--  DDL for Function GET_DUE_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_DUE_DATE" ( siteId IN VARCHAR2 ) RETURN VARCHAR2 IS

  due_date VARCHAR2(25):= 'Account Not Found';

BEGIN

  SELECT decode(to_char(u2d(max(b.due_t)), 'mm/dd/yyyy'), NULL, 'No Due') INTO due_date
  FROM   bill_t b
  WHERE  b.account_obj_id0 = a2p(siteId)
  and    b.end_t > d2i(sysdate - 180)
  and    b.due != 0;



  RETURN due_date;

  EXCEPTION
  WHEN NO_DATA_FOUND
  THEN RETURN 'Account Not Found';

END get_due_date;

/
--------------------------------------------------------
--  DDL for Function GET_EXPIRED_REC_DEALS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_EXPIRED_REC_DEALS" (
    san IN VARCHAR2
) RETURN SYS_REFCURSOR AS
    getexpireddealcursor   SYS_REFCURSOR;
BEGIN
    OPEN getexpireddealcursor FOR SELECT
        p2pr(product_obj_id0),
        t.*
                                  FROM
        (
            SELECT
                DENSE_RANK() OVER(
                    PARTITION BY product_obj_id0
                    ORDER BY
                        nvl(step_max,9999999) DESC
                ) my_rank,
                ( (
                    SELECT
                        SUM(current_bal)
                    FROM
                        bal_grp_t bg,
                        bal_grp_sub_bals_t bgsb
                    WHERE
                        bg.poid_id0 = bgsb.obj_id0
                        AND   bgsb.rec_id2 = step_resource
                        AND   bg.account_obj_id0 = a2p(san)
                        AND   valid_to = 0
                ) ) curr_bal,
                product_obj_id0,
                nvl(step_min,-9999999) highest_tier_min,
                nvl(step_max,9999999) highest_tier_max,
                step_resource,
                fix_amount,
                scaled_amount
            FROM
                rate_plan_t rp,
                rate_t r,
                rate_quantity_tiers_t rqt,
                rate_bal_impacts_t rbi
            WHERE
                rp.poid_id0 = r.rate_plan_obj_id0
                AND   r.poid_id0 = rbi.obj_id0
                AND   r.poid_id0 = rqt.obj_id0
                AND   rp.product_obj_id0 IN (
                    SELECT
                        product_obj_id0
                    FROM
                        purchased_product_t
                    WHERE
                        account_obj_id0 = a2p(san)
                        AND   status <> 3
                        AND   (
                            service_obj_type LIKE '%promo%'
                            OR    service_obj_type LIKE '%credit%'
                        )
                )
                AND   rp.event_type = '/event/billing/product/fee/cycle/cycle_forward_monthly'
                AND   step_type = 2
                AND   rbi.element_id = 840
        ) t
                                  WHERE
        my_rank = 1
        AND   (
            (
                curr_bal >= highest_tier_min
                AND   curr_bal < highest_tier_max
            )
            AND   ( fix_amount + scaled_amount ) = 0
            OR    curr_bal >= highest_tier_max
        );
    RETURN Getexpireddealcursor;
END get_expired_rec_deals;

/
--------------------------------------------------------
--  DDL for Function GET_HARDSHIP_INFO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_HARDSHIP_INFO" 
(
  SAN IN VARCHAR2 
) 
RETURN VARCHAR2 IS

INFO VARCHAR2(255);
BILLINFO_POID NUMBER;
CUR_TIME NUMBER;
DETAILS VARCHAR2(255);

TOTAL_PAID_AMT NUMBER;
MIN_AMOUNT_TO_PAY NUMBER;
CURRENT_BALANCE NUMBER;
CREDIT_TO_BE_GIVEN NUMBER;
DISABLE_SUBMIT VARCHAR2(20) := 'FALSE';

BEGIN

SELECT AR_BILLINFO_OBJ_ID0 INTO BILLINFO_POID FROM BILLINFO_T WHERE ACCOUNT_OBJ_ID0=A2P(SAN) AND bill_info_id = 'Account Billinfo';

SELECT DATE_TO_INFRANET(PIN_VIRTUAL_TIME()) INTO CUR_TIME FROM DUAL;

-- SETTING TOTAL_PAID_AMT IN LAST 30 min
select nvl(sum(item_total), 0) INTO TOTAL_PAID_AMT from item_t where 
ar_billinfo_obj_id0 = BILLINFO_POID and poid_type = '/item/payment' and effective_t >= (CUR_TIME - 1800) and effective_t < CUR_TIME ;

--SETTING MIN_AMOUNT_TO_PAY
select nvl(sum(item_total),0) INTO MIN_AMOUNT_TO_PAY from item_t where item_no like (select bill_no||',%' from bill_t where account_obj_id0 
= A2P(SAN) and end_t = (select max(end_t) from bill_t 
where account_obj_id0 = A2P(SAN) and name = 'PIN Bill') and name = 'PIN Bill');

--SETTING CURRENT BALANCE
select nvl(sum(due), 0) INTO CURRENT_BALANCE from item_t where ar_billinfo_obj_id0 = BILLINFO_POID  and due <> 0;

--SETTING CREDIT_TO_BE_GIVEN
IF(TOTAL_PAID_AMT = 0) THEN        
    CREDIT_TO_BE_GIVEN := 0;
END IF;

IF(ABS(TOTAL_PAID_AMT) < MIN_AMOUNT_TO_PAY) THEN
    CREDIT_TO_BE_GIVEN := 0;
    DISABLE_SUBMIT := 'TRUE';
END IF;

IF(ABS(TOTAL_PAID_AMT) >= MIN_AMOUNT_TO_PAY) THEN
    CREDIT_TO_BE_GIVEN := -(CURRENT_BALANCE + MIN_AMOUNT_TO_PAY);
END IF;

--SETTEING RESPONSE
    INFO      :=CURRENT_BALANCE || ':' || MIN_AMOUNT_TO_PAY || ':' || ABS(TOTAL_PAID_AMT) || ':' || CREDIT_TO_BE_GIVEN || ':' || DISABLE_SUBMIT;
    DBMS_OUTPUT.PUT_LINE('HNARDSHIP INFO RESPONSE = ' || INFO);

RETURN INFO;

END GET_HARDSHIP_INFO;

/
--------------------------------------------------------
--  DDL for Function GET_IP_STATUS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_IP_STATUS" ( siteId IN VARCHAR2 )
    RETURN VARCHAR2  IS
    ipStatus VARCHAR2(20) := 'Account Not Found';
BEGIN
  SELECT decode(status, 10100, '10100(Active)', 10102, '10102(Inactive)', '10103(Closed)' ) INTO ipStatus FROM service_t WHERE poid_type = '/service/ip' AND account_obj_id0 = a2p(siteId) AND ROWNUM < 2;

  IF ipStatus IS NULL THEN
    ipStatus := 'Account Not Found';
  END IF;

  RETURN ipStatus;

  EXCEPTION
  WHEN NO_DATA_FOUND
  THEN RETURN 'Account Not Found';
END get_ip_status;

/
--------------------------------------------------------
--  DDL for Function GET_LAST_CC_RESULT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_LAST_CC_RESULT" (account_no    IN VARCHAR2)
    RETURN VARCHAR2 IS
    last_cc_charge_t    INTEGER := NULL;
    value        VARCHAR2(1023);
    result        INTEGER := NULL;

BEGIN
    BEGIN
        SELECT
            max(created_t)
        INTO
            last_cc_charge_t
        FROM
            event_t
        WHERE
            poid_type = '/event/billing/payment/cc' AND
            account_obj_id0 = a2p(account_no);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            last_cc_charge_t := NULL;
        WHEN TOO_MANY_ROWS THEN
            last_cc_charge_t := NULL;
    END;
    if last_cc_charge_t > 0 then

        SELECT min(result) INTO result
        FROM event_t e, event_billing_payment_cc_t ebpc
        WHERE e.poid_id0 = ebpc.obj_id0
        AND e.poid_type = '/event/billing/payment/cc'
        AND e.created_t = last_cc_charge_t
        AND account_obj_id0 = a2p(account_no);
    else
        --DBMS_OUTPUT.PUT_LINE(222);
        result := NULL;
    end if;

    RETURN    result;

END get_last_cc_result;

/
--------------------------------------------------------
--  DDL for Function GET_LAST_PAYMENT_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_LAST_PAYMENT_DATE" ( siteId IN VARCHAR2 ) RETURN VARCHAR2 IS

last_payment_date VARCHAR2(25) := 'Account Not Found';

BEGIN

  SELECT to_char(u2d(max(i.effective_t)), 'mm/dd/yyyy') INTO last_payment_date
  FROM   item_t i
  WHERE  i.account_obj_id0 = a2p(siteId)
  and    i.poid_type = '/item/payment'
  and    i.effective_t > d2i(sysdate - 181);

  IF last_payment_date IS NULL THEN
    last_payment_date := 'No Payment Found';
  END IF;

  RETURN last_payment_date;

  EXCEPTION
  WHEN NO_DATA_FOUND
  THEN RETURN 'No Payment Found';
END get_last_payment_date;

/
--------------------------------------------------------
--  DDL for Function GET_MAX_REC_ID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_MAX_REC_ID" (poid_id0 in INTEGER)
        RETURN NUMBER IS
        m_rec_id        INTEGER := 0;
BEGIN
        SELECT nvl(max(rec_id) + 1, 0)
          INTO m_rec_id
          FROM ledger_report_accts_t
         WHERE obj_id0 = poid_id0;

        RETURN m_rec_id;

END get_max_rec_id;

/
--------------------------------------------------------
--  DDL for Function GET_PAYMENT_TYPE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_PAYMENT_TYPE" ( siteId IN VARCHAR2 ) RETURN VARCHAR2 IS
    payment_type VARCHAR2(15) := 0;

BEGIN

  SELECT decode(pay_type, 10001, 'Invoice', 10003, 'Credit Card', 10005, 'E-Check', 'Undefined') INTO payment_type
  FROM   billinfo_t bi
  WHERE  bi.account_obj_id0 = a2p(siteId);


  IF payment_type IS NULL THEN
    payment_type := 'Account Not Found';
  END IF;

  RETURN payment_type;

  EXCEPTION
  WHEN NO_DATA_FOUND
  THEN RETURN 'Account Not Found';

END get_payment_type;

/
--------------------------------------------------------
--  DDL for Function GET_POID_ID0_FOR_GL_SEGMENT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_POID_ID0_FOR_GL_SEGMENT" (
	gl_segment	IN VARCHAR2)
	RETURN INTEGER IS

	config_poid_id0	INTEGER := NULL;
	value		VARCHAR2(1023);

BEGIN
	BEGIN
		SELECT
			value
		INTO
			value
		FROM
			config_t
		WHERE
			poid_type = '/config/gl_segment' AND
			name = gl_segment;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			value := '';
		WHEN TOO_MANY_ROWS THEN
			value := '';
	END;

	-- get poid_id0 from the value column
	-- the value column will be like: '0.0.0.1 /config/glid 10001 0'
	IF (LENGTH(value) > 0) THEN
		value := SUBSTR(value, INSTR(value, 'glid ') + LENGTH('glid '),
			LENGTH(value));
		value := SUBSTR(value, 1, INSTR(value, ' ') - 1);
		config_poid_id0 := TO_NUMBER(value);
	END IF;

	RETURN	config_poid_id0;

END get_poid_id0_for_gl_segment;

/
--------------------------------------------------------
--  DDL for Function GET_POID_LIST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_POID_LIST" wrapped
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
8
180 158
meCDHORn2cPtUcs/d4tdisZVo1Ywgy7If/bbfHQCmJed5gyok/IptFCvMl3byKMmO2hMSZa/
idbmme21rpBXGoh0m+vrsAeKXfBXM85CvmNPux6tEEyqIJRFjpoHFiCs/4Y1W+sepUYq5Wdl
RNDvmN++M3/0DkqeXQsUdDnd6XSRs1mowBGOdgk+qHVDeCjJnB/8TdK6YqtwKM8/MU4KRcxk
d61kqYCX3itmg+RhbogqfNCe3fF1+ZqN6n+n7TEd9cCsxj/Gvv5Wp0mdoAxuW3u9zQInPS4z
oQBbaOMxB06Lcew373loVtjGxWrw7Duk+mVYOR9jvvgdSg2RLA==

/
--------------------------------------------------------
--  DDL for Function GET_PREMIUM_SERVICE_INFO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_PREMIUM_SERVICE_INFO" (
      San In Varchar2, Service_TYPE In Varchar2
    ) Return Varchar2 As

    Service_Name Varchar(255);
    Service_Purchase_Date Varchar2(255);
    Service_Activation_Date Varchar(255);
    Service_End_Date Varchar(255);
    All_Service_Info Varchar2(2048);
    Delim char ;
    Begin
    Delim := '~';

    Select * Into All_Service_Info From (Select Pp.Service_Obj_Type || Delim ||  to_char(u2d(pp.Purchase_Start_T),'DD-MON-YYYY')
    || Delim ||  to_char(u2d(pp.Cycle_Start_T),'DD-MON-YYYY') || Delim ||  decode(pp.cycle_end_t,0,'null',to_char(u2d(pp.cycle_end_t),'DD-MON-YYYY'))
    || Delim || p2d(pp.deal_obj_id0) || Delim ||  to_char(u2d(s.last_status_t),'DD-MON-YYYY') || Delim || pp.status
    From Purchased_Product_T Pp , Service_t s
    Where pp.service_obj_type  = Service_TYPE
    And Pp.Account_Obj_Id0 = A2p(San)
    and s.poid_id0=pp.service_obj_id0
    Order By Pp.Created_T Desc) Where Rownum =1;

    RETURN All_Service_Info;
END get_premium_service_info;

/
--------------------------------------------------------
--  DDL for Function GET_SATELLITE_ID_FROM_SAN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_SATELLITE_ID_FROM_SAN" (
    acc_no IN VARCHAR
) RETURN VARCHAR IS
    satellite_id  VARCHAR(20);
BEGIN
    SELECT
        HTIT.SATELLITE_ID INTO satellite_id
    FROM
       HNS_TRANSPORT_INFO_TYPE_T HTIT
    WHERE
        HTIT.status =1 and
         HTIT.SAN = acc_no;

    return(satellite_id);
END;

/
--------------------------------------------------------
--  DDL for Function GET_TOKEN_ACCOUNT_POID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_TOKEN_ACCOUNT_POID" (Account_Poid Number) Return Number IS
Token_Account_Poid Number;
Gl_Segment  Varchar2(60);
List_Of_Gl_Segment Varchar2(2000);
Should_Token_Account_Exist Integer;
PARENT_ACCOUNT_POID NUMBER;

Begin

  Select Gl_Segment Into Gl_Segment From Account_T Where Poid_Id0 = Account_Poid;
  Select Value Into List_Of_Gl_Segment From Hns_Config_T Where Parameter = 'LIST_OF_GL_SEGMENT_FOR_TOKEN_ACCOUNT';
  Execute Immediate 'SELECT COUNT(*) FROM DUAL WHERE ''' || Gl_Segment || ''' IN (' || List_Of_Gl_Segment || ' )' Into Should_Token_Account_Exist;
  If Should_Token_Account_Exist != 0 Then
    Begin
      Select G.Account_Obj_Id0 Into Parent_Account_Poid  From Group_Billing_Members_T Gb, Group_T G   Where Gb.Obj_Id0 = G.Poid_Id0 And Gb.Object_Id0 = Account_Poid;
        Exception
          When No_Data_Found Then
            PARENT_ACCOUNT_POID := ACCOUNT_POID;
    End;
    Begin
      Select Token_Account_Obj Into Token_Account_Poid  From Hns_Account_Token_Map_T Where Account_Obj = Parent_Account_Poid;
      Exception
        When No_Data_Found Then
          Token_Account_Poid := Account_Poid;
    END;
  Else
    TOKEN_ACCOUNT_POID := ACCOUNT_POID;
  END IF;

  RETURN TOKEN_ACCOUNT_POID;

END GET_TOKEN_ACCOUNT_POID;

/
--------------------------------------------------------
--  DDL for Function GET_VOIP_ACT_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_VOIP_ACT_DATE" 
    (
      ACC_NO IN VARCHAR2
    ) RETURN VARCHAR2 AS
    VOIP_ACT_DATE varchar(255);
    BEGIN
      SELECT nvl(datetime,'null') into VOIP_ACT_DATE  from ( SELECT datetime  from hns_voip_notification_t where san=ACC_NO and typeofnotification='Activate' order by created_t desc) where rownum < 2;

      RETURN VOIP_ACT_DATE;
      exception
      when NO_DATA_FOUND
      then return 'null';
    END GET_VOIP_ACT_DATE;

/
--------------------------------------------------------
--  DDL for Function GET_VOIP_CUST_SELECT_PHN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_VOIP_CUST_SELECT_PHN" 
    (
      ACC_NO IN VARCHAR2
    ) RETURN VARCHAR2 AS
    VOIP_SEL_PHN varchar(20);
    BEGIN

      SELECT nvl(telephonenumber,'null') into VOIP_SEL_PHN from ( SELECT telephonenumber from hns_voip_notification_t where san=ACC_NO and typeofnotification='Activate' order by created_t desc) where rownum < 2;

      RETURN VOIP_SEL_PHN;
      exception
      when NO_DATA_FOUND
      then return 'null';
    END GET_VOIP_CUST_SELECT_PHN;

/
--------------------------------------------------------
--  DDL for Function GET_VOIP_INFO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_VOIP_INFO" 
    (
      ACC_NO IN VARCHAR2, DELIM IN CHAR
    ) RETURN VARCHAR2 AS

    VOIP_STATUS varchar(100);
    ALL_VOIP_INFO varchar2(2048);
    VOIP_ACT_DATE varchar(255);
    VOIP_SEL_PHN varchar(20);
    VOIP_PORT_REQ_DATE varchar(255);
    VOIP_PORT_REQ_TN varchar(20);
    VOIP_PORT_ACT_STATUS varchar(50);
    VOIP_PORT_STATUS_DATE varchar(255);
    VOIP_PORT_ACT_DATE varchar(255);
    VOIP_PH_LAT varchar(20);
    TRIAL_END_DATE varchar(30);
    BEGIN

      --1. VOIP Status
      --Latest status of the VOIP account as per HNS Billing (Null or varchar2)
      select GET_VOIP_SRV_STATUS(ACC_NO,DELIM) into VOIP_STATUS from dual;

      --2. Activation Date � The date on which the VOIP account was activated (Null or datetime)
      select get_voip_act_date(ACC_NO) into VOIP_ACT_DATE from dual;

      --3. Customer selected Phone number � The original phone number assigned to the customer upon activation (Null or number)
      select GET_VOIP_CUST_SELECT_PHN(ACC_NO) into VOIP_SEL_PHN from dual;

      --4. Port requested date � The date the customer requested a number porting (Null or datetime)
      select GET_VOIP_PORT_REQUESTED_DATE(ACC_NO) into VOIP_PORT_REQ_DATE from dual;

      --5. Port requested phone number � The number to port to requested by customer (Null or number)
      select GET_VOIP_PORT_REQUESTED_TN(ACC_NO) into VOIP_PORT_REQ_TN from dual;

      --6. Port activation status � One of the following 5 states (null or varchar2)
      select GET_VOIP_PORT_ACT_STATUS(ACC_NO) into VOIP_PORT_ACT_STATUS from dual;

      --7. Port status date � Date corresponding to the response in 6 (null or datetime)
      select GET_VOIP_PORT_STATUS_DATE(ACC_NO) into VOIP_PORT_STATUS_DATE from dual;

      --8. Port activation date � date when port activation was complete (null or datetime)
      select GET_VOIP_PORT_ACT_DATE(ACC_NO) into VOIP_PORT_ACT_DATE from dual;

      --9. Phone number � the latest phone number assigned to customer, cumulative of Activate, TNChangeActivate, PortRequest (null or number)
      select GET_VOIP_PHONE_NUMBER(ACC_NO) into VOIP_PH_LAT from dual;

      --10. Trial Period end date
      select GET_VOIP_TRIAL_END_DATE(ACC_NO,DELIM) into TRIAL_END_DATE from dual;

      ALL_VOIP_INFO := VOIP_STATUS || DELIM || VOIP_ACT_DATE || DELIM || VOIP_SEL_PHN || DELIM || VOIP_PORT_REQ_DATE || DELIM || VOIP_PORT_REQ_TN || DELIM || VOIP_PORT_ACT_STATUS || DELIM || VOIP_PORT_STATUS_DATE || DELIM || VOIP_PORT_ACT_DATE || DELIM || VOIP_PH_LAT || DELIM || TRIAL_END_DATE;


      RETURN ALL_VOIP_INFO;
    END GET_VOIP_INFO;

/
--------------------------------------------------------
--  DDL for Function GET_VOIP_PHONE_NUMBER
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_VOIP_PHONE_NUMBER" 
    (
      ACC_NO IN VARCHAR2
    ) RETURN VARCHAR2 AS
    VOIP_TN varchar(20);
    BEGIN

      SELECT nvl(telephonenumber,'null') into VOIP_TN from (SELECT telephonenumber from hns_voip_notification_t where san=ACC_NO and typeofnotification in ('Activate' , 'PortActivate', 'TNChangeActivate') order by created_t desc) where rownum < 2;

      RETURN VOIP_TN;
      exception
      when NO_DATA_FOUND
      then return 'null';
    END GET_VOIP_PHONE_NUMBER;

/
--------------------------------------------------------
--  DDL for Function GET_VOIP_PORT_ACT_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_VOIP_PORT_ACT_DATE" 
    (
      ACC_NO IN VARCHAR2
    ) RETURN VARCHAR2 AS
    VOIP_PORT_ACT_DATE varchar(255);
    BEGIN

      SELECT nvl(datetime,'null') into VOIP_PORT_ACT_DATE  from (SELECT datetime from hns_voip_notification_t where san=ACC_NO and typeofnotification in ('PortActivate') order by created_t desc) where rownum < 2;

      RETURN VOIP_PORT_ACT_DATE;
      exception
      when NO_DATA_FOUND
      then return 'null';
    END GET_VOIP_PORT_ACT_DATE;

/
--------------------------------------------------------
--  DDL for Function GET_VOIP_PORT_ACT_STATUS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_VOIP_PORT_ACT_STATUS" 
    (
      ACC_NO IN VARCHAR2
    ) RETURN VARCHAR2 AS
    VOIP_PORT_ACT_STATUS varchar(50);
    BEGIN

      SELECT nvl(typeofnotification,'null') into VOIP_PORT_ACT_STATUS from (SELECT typeofnotification  from hns_voip_notification_t where san=ACC_NO and typeofnotification in ('PortRequest' , 'PortActivate', '3PVRequest', '3PVComplete', '3PVFailed') order by created_t desc) where rownum < 2;

      RETURN VOIP_PORT_ACT_STATUS;
      exception
      when NO_DATA_FOUND
      then return 'null';
    END GET_VOIP_PORT_ACT_STATUS;

/
--------------------------------------------------------
--  DDL for Function GET_VOIP_PORT_REQUESTED_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_VOIP_PORT_REQUESTED_DATE" 
    (
      ACC_NO IN VARCHAR2
    ) RETURN VARCHAR2 AS
    VOIP_PORT_REQ_DATE varchar(255);
    BEGIN


      SELECT nvl(datetime,'null') into VOIP_PORT_REQ_DATE from ( SELECT datetime  from hns_voip_notification_t where san=ACC_NO and typeofnotification='PortRequest' order by created_t desc) where rownum < 2;

      RETURN VOIP_PORT_REQ_DATE;
      exception
      when NO_DATA_FOUND
      then return 'null';
    END GET_VOIP_PORT_REQUESTED_DATE;

/
--------------------------------------------------------
--  DDL for Function GET_VOIP_PORT_REQUESTED_TN
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_VOIP_PORT_REQUESTED_TN" 
    (
      ACC_NO IN VARCHAR2
    ) RETURN VARCHAR2 AS
    VOIP_PORT_REQ_TN varchar(20);
    BEGIN

        SELECT nvl(telephonenumber,'null') into VOIP_PORT_REQ_TN from ( SELECT telephonenumber from hns_voip_notification_t where san=ACC_NO and typeofnotification='PortRequest' order by created_t desc) where rownum < 2;

      RETURN VOIP_PORT_REQ_TN;
      exception
      when NO_DATA_FOUND
      then return 'null';
    END GET_VOIP_PORT_REQUESTED_TN;

/
--------------------------------------------------------
--  DDL for Function GET_VOIP_PORT_STATUS_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_VOIP_PORT_STATUS_DATE" 
    (
      ACC_NO IN VARCHAR2
    ) RETURN VARCHAR2 AS
    VOIP_PORT_STATUS_DATE varchar(255);
    BEGIN

      SELECT nvl(datetime,'null') into VOIP_PORT_STATUS_DATE  from (SELECT datetime from hns_voip_notification_t where san=ACC_NO and typeofnotification in ('PortRequest' , 'PortActivate', '3PVRequest', '3PVComplete', '3PVFailed') order by created_t desc) where rownum < 2;

      RETURN VOIP_PORT_STATUS_DATE;
      exception
      when NO_DATA_FOUND
      then return 'null';
    END GET_VOIP_PORT_STATUS_DATE;

/
--------------------------------------------------------
--  DDL for Function GET_VOIP_SRV_STATUS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_VOIP_SRV_STATUS" 
    (
      ACC_NO IN VARCHAR2 , DELIM IN CHAR
    ) RETURN VARCHAR2 AS
    VOIP_STATUS varchar(20);
        BEGIN

      --Latest status of the VOIP account as per HNS Billing (Null or varchar2)
      SELECT decode (status, 10100, 'ACTIVE', 10102, 'INACTIVE', 'CLOSED') into VOIP_STATUS  from service_t where poid_type='/service/voip' and account_obj_id0=a2p(ACC_NO) and rownum <2;

      RETURN VOIP_STATUS  ;
      exception
      when NO_DATA_FOUND
      then return 'null';
    END GET_VOIP_SRV_STATUS;

/
--------------------------------------------------------
--  DDL for Function GET_VOIP_TRIAL_END_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."GET_VOIP_TRIAL_END_DATE" (
	  ACC_NO IN VARCHAR2 ,
	  DELIM  IN CHAR )
	RETURN VARCHAR2
  AS
	TRIAL_END_DATE VARCHAR(30);
  BEGIN
	SELECT DECODE(status,'D', TO_CHAR(infranet_to_date(activation_t) + 30,'MM/DD/YYYY'), TO_CHAR(infranet_to_date(created_t) + 45, 'MM/DD/YYYY') ) TRIAL_END_DATE
	INTO TRIAL_END_DATE
	FROM
	  (SELECT *
	  FROM hns_voip_activation_status_t
	  WHERE san = ACC_NO
	  ORDER BY created_t DESC
	  )
	WHERE rownum < 2;
	RETURN TRIAL_END_DATE ;
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
	RETURN 'null';
  END GET_VOIP_TRIAL_END_DATE;

/
--------------------------------------------------------
--  DDL for Function HNS_GET_BILLING_DATA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."HNS_GET_BILLING_DATA" 
(San In Varchar)
return varchar2
IS

  qryCtx DBMS_XMLGEN.ctxHandle;
  res CLOB;
  Resvchar Varchar2(2000);
  Payinfotable Varchar2(30);
  Payinfopoid Number;
  Bcountry Varchar2(30);
  bcity varchar2(30);
  Bstate Varchar2(30);
  baddress varchar2(300);
  Bzip Varchar2(30);
  Paytype Varchar2(30);
  Due Number;
  Duedate Varchar2(30);
  lpdate varchar2(30);
  Apoid Number;
  bpoid number;
  Astatus Varchar2(10);
  Tstatus Varchar2(20);
  bdate varchar2(20);
  Errormessage Varchar2(300);
  application_error Exception;


  BEGIN


BEGIN
   BEGIN
    Select Poid_Id0, Decode(Status,10100,'Active',10102,'Inactive',10103,'Closed') Into Apoid,Astatus From Account_T Where Account_No = San;
    Exception
  When No_Data_Found
  Then Errormessage := 'Account not found';
  Raise Application_Error;
  End;
    Select Decode(Min(Status),10100,'Active',10102,'Inactive',10103,'Closed','No Transport') Into Tstatus From Service_T Where Account_Obj_Id0 = Apoid And Poid_Type In ('/service/ip','/service/dsl') And Login Not Like 'DUP%' And Rownum < 2;

    Select Poid_Id0,To_Char(U2d(Actg_Next_T),'MM/DD/YYYY'),Decode(Pay_Type,10001,'Payinfo_Inv_T',10003,'payinfo_cc_t',10005,'payinfo_dd_t'),Payinfo_Obj_Id0,Decode(Pay_Type,10001,'Invoice',10003,'Credit-Card',10005,'E-Check',10007,'Child','Unknown') Into Bpoid,Bdate,Payinfotable, Payinfopoid,Paytype From Billinfo_T Where Account_Obj_Id0 = Apoid;
    If Paytype = 'Child' Then
      Errormessage := 'Child Account - cannot get payment information';
      Raise Application_Error;
    ElsIf Paytype = 'Unknown' Then
      Errormessage := 'Unknown payment type - cannot get payment information';
      Raise Application_Error;
    end if;
    execute immediate 'select address, city, state, zip, country from '||payinfoTable||' where obj_id0 = '||Payinfopoid into baddress, bcity, bstate, bzip, bcountry ;
    Select Sum(Due) Into Due From Item_T Where Ar_Billinfo_Obj_Id0 = Bpoid;
    Select nvl(to_char(u2d(max(effective_t)),'MM/DD/YYYY'),' ') Into lpdate From Item_T Where Ar_Billinfo_Obj_Id0 = bpoid and poid_type = '/item/payment' and item_total <> 0;
    select to_char(u2d(min(due_t)),'MM/DD/YYYY') into dueDate From bill_t Where account_obj_id0 = apoid and due <> 0;
    Qryctx := Dbms_Xmlgen.Newcontext(
      'select '''||Paytype||''' as PaymentType
      , '''||bdate||''' as BillingDate
      , '''||due||''' as AmountDue
      , '''||dueDate||''' as DueDate
      , '''||lpdate||''' as LastPaymentDate
      , '''||tstatus||''' as TransportStatus
      , '''||astatus||''' as AccountStatus
      , '''||baddress||''' as Address
      , '''||bcity||''' as City
     , '''||bstate||''' as State
      , '''||bzip||''' as Zip
      , '''||bcountry||''' as Country from dual');

Exception
When Application_Error
Then
DBMS_XMLGEN.CLOSECONTEXT (
   Qryctx);
  Qryctx := Dbms_Xmlgen.Newcontext('select '''||Errormessage||''' as ErrorMessage from dual');

End;
Dbms_Xmlgen.Setrowtag(Qryctx, NULL);
    dbms_xmlgen.setRowSetTag(qryCtx, 'Billing_Data');
    Res := Dbms_Xmlgen.Getxml(Qryctx);
    Resvchar := To_Char(Res);
DBMS_XMLGEN.CLOSECONTEXT (
   Qryctx);
Return resvchar;
End HNS_GET_BILLING_DATA;

/
--------------------------------------------------------
--  DDL for Function HNS_GET_INVOICE_LIST
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."HNS_GET_INVOICE_LIST" 
(San In Varchar , noOfInvoice In Number)
return varchar2
IS



  qryCtx DBMS_XMLGEN.ctxHandle;
  res CLOB;
  resvchar varchar2(2000);
  maxVal Number := 6;
  BEGIN



   maxVal := 6;




    BEGIN
    qryCtx := DBMS_XMLGEN.newContext(
        'select * from ( select bill_no , u2d(start_t)   || '' To '' || u2d(end_t) as period, total_due from bill_t where account_obj_id0 = a2p('''||San||''') and ar_billinfo_obj_id0 = billinfo_obj_id0 and end_t !=0 and (total_due != 0 or current_total != 0 or previous_total != 0) order by end_t desc) where  rownum <= '|| maxVal||'');
    DBMS_XMLGEN.setRowTag(qryCtx, 'INVOICE');
    dbms_xmlgen.setRowSetTag(qryCtx, 'INVOICES');
    res := DBMS_XMLGEN.getXML(qryCtx);
    resvchar := to_char(res);
    DBMS_XMLGEN.CLOSECONTEXT (
   qryCtx);
      END;
    return resvchar;
END HNS_GET_INVOICE_LIST;

/
--------------------------------------------------------
--  DDL for Function HNS_IS_INVOICE_IN_CBRM
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."HNS_IS_INVOICE_IN_CBRM" 
(San In Varchar)
return Varchar
IS
accountExist Number;
BEGIN

select count(*) into accountExist from bill_t where account_obj_id0 = a2p(San) and ar_billinfo_obj_id0 = billinfo_obj_id0 and end_t !=0;
if accountExist > 0 then return 'CBRM';
else return 'NONE';
end if;
END HNS_IS_INVOICE_IN_CBRM;

/
--------------------------------------------------------
--  DDL for Function I2PA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."I2PA" 
    ( item_obj IN NUMBER )
    RETURN varchar2 IS
accountNo varchar2 (255);
BEGIN
    BEGIN
   select p2a(b.account_obj_id0) into accountNo from billinfo_t b, item_t i
    where b.poid_id0 = i.ar_billinfo_obj_id0
        and i.poid_id0 = item_obj;
   EXCEPTION
    when OTHERS then
    select p2a(e.account_obj_id0) into accountNo from event_t e
    where e.item_obj_id0 = item_obj;
   END;
   RETURN accountNo;
END i2pa;

/
--------------------------------------------------------
--  DDL for Function INDEX_EXISTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."INDEX_EXISTS" (i_index_name IN VARCHAR2)
RETURN BOOLEAN AS
        v_dummy VARCHAR2(1);
BEGIN
        SELECT '*' INTO v_dummy
        FROM user_indexes
        WHERE index_name = UPPER(i_index_name);

        RETURN true;
EXCEPTION
        WHEN no_data_found THEN
                RETURN false;
        WHEN others THEN
                RETURN false;
END index_exists;

/
--------------------------------------------------------
--  DDL for Function INF2_LOCALTZ_DAYS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."INF2_LOCALTZ_DAYS" wrapped
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
8
1e1 1d6
8Pnbhz6hIf3+TTJyG6idD1vfExswg+nMLiAVfHRVjfmemoMRAZmUg4Czy94TJVoul9MfOZzn
eexn4AU4mH6dP9z7OK0JdgW7ANoyIPLDkDdzwRKLKA9kBWpyT6oF+T9Jl3ccjacOdJe+oHTY
2xmrfO3RGkRDUfNuX2UMs+YWvxbS4SueE6hGLhddVqvwpxx4hM0JtMLz3wxl/8nMqMGXbus6
tlcpdim9O8H/tlds9gXe5Qzy7nyv/+rhAdOuHLs6da6FN07PpVcCMC7fPCNxXFAhMSGxxb/R
ybiynLNI7u5Il60d7tEGk6tyKglj3dnnLzZBd0ZsL/hSKPQemQffhb0LbIAN2w9cNwBNqVVK
ziQzfwxC7H9vcGY6CZfpVABESycaN8v93qFbVWq6XBHBmBwfABlQCDtlZVJyO6ArKC/BtY+A
el6zrj1YIJgJoFNrQ9hVivwsnu4wxA==

/
--------------------------------------------------------
--  DDL for Function INFRANET_TO_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."INFRANET_TO_DATE" (v_seconds IN INTEGER)
-- This function converts unix/infranet time into local date string format taking daylight savings time into consideration
-- Change v_region := 'America/new_york' to your region as found in SELECT tzname, tzabbrev, tz_offset(tzname) FROM V$TIMEZONE_NAMES;
-- for support contact dcook@portal.com 1-800-232-4542
RETURN DATE
IS
v_converted_date DATE;
v_region VARCHAR2(30);
BEGIN
v_region := 'US/Eastern';
v_converted_date := FROM_TZ(CAST(to_timestamp_tz('01-Jan-1970 GMT', 'DD-MON-YYYY TZR')+(v_seconds/86400) AS TIMESTAMP),'GMT') AT TIME ZONE v_region;
RETURN v_converted_date;
END;

/
--------------------------------------------------------
--  DDL for Function IS_ACCOUNT_HAVE_BAD_ADDRESS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."IS_ACCOUNT_HAVE_BAD_ADDRESS" (accountNo VARCHAR2) RETURN INTEGER AS
ACCOUNT_POID INTEGER;

BEGIN
  BEGIN

    SELECT
                    B.ACCOUNT_OBJ_ID0 INTO ACCOUNT_POID
    FROM
                    billinfo_t b
    Where
                    b.account_obj_Id0  = A2P(accountNo) AND BILL_INFO_ID = 'Account Billinfo' AND
                    (
                                    EXISTS
                                    (
                                                    SELECT
                                                                    1
                                                    FROM
                                                                    PAYINFO_CC_T P
                                                    WHERE
                                                                    P.OBJ_iD0 = B.PAYINFO_OBJ_iD0 AND
                                                                    P.ADDRESS LIKE '%BAD ADDRESS%'
                                    )
                    OR
                                    EXISTS
                                    (
                                                    SELECT 1
                                                    FROM
                                                                    PAYINFO_DD_T P
                                                    WHERE
                                                                    P.OBJ_iD0 = B.PAYINFO_OBJ_iD0 AND
                                                                    P.ADDRESS LIKE '%BAD ADDRESS%'
                                    )
                    OR
                                    EXISTS
                                    (
                                                    SELECT 1
                                                    FROM
                                                                    PAYINFO_INV_T P
                                                    WHERE
                                                                    P.OBJ_iD0 = B.PAYINFO_OBJ_iD0 AND
                                                                    P.ADDRESS LIKE '%BAD ADDRESS%'
                                    )
                    );

      EXCEPTION
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No Bad Address on the Account');
        ACCOUNT_POID := 0;


    END;

    IF ACCOUNT_POID =0 THEN
      RETURN 0;
    ELSE
      RETURN 1;
    END IF;



END IS_ACCOUNT_HAVE_BAD_ADDRESS;

/
--------------------------------------------------------
--  DDL for Function IS_BUNDLED
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."IS_BUNDLED" (accNum IN VARCHAR2) RETURN VARCHAR2 AS
isBundled  integer ;

BEGIN
  select count(*) into isBundled from ENT_INVOICE_BUNDLE_SERVICES_T eibs, ENT_INVOICE_BUNDLE_T eib
  where eibs.bundle_rec_id = eib.rec_id
  and eib.status = 1
  and eib.account_no = accNum;

	IF isBundled > 0
	THEN
					RETURN 'TRUE';
	ELSE
					RETURN 'FALSE';
	END IF;
END IS_BUNDLED;

/
--------------------------------------------------------
--  DDL for Function IS_ELIGIBLE_FOR_HARDHIP_RELIEF
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."IS_ELIGIBLE_FOR_HARDHIP_RELIEF" 
(
  SAN IN VARCHAR2 
) 
RETURN VARCHAR2 IS

INVOICE_COUNT number;
IS_ELIGIBLE VARCHAR2(20) := 'false';
ALREADY_EXISTS NUMBER;

BEGIN

--CHECKING FOR THE OLDEST INVOICE FOR DUE>0 FOR MORE THAN 31 DAYS
SELECT COUNT(BILL_NO) INTO INVOICE_COUNT FROM 
(SELECT BILL_NO, poid_id0, END_T,TOTAL_DUE, DUE FROM BILL_T 
WHERE ACCOUNT_OBJ_ID0 = A2P(SAN) AND END_T >0 AND END_T <= DATE_TO_INFRANET(PIN_VIRTUAL_TIME() - 31) AND DUE > 0
and name = 'PIN Bill'
AND BILL_NO IS NOT NULL ORDER BY END_T ASC) 
WHERE ROWNUM < 2 ;

--CHECKING IF THE ACCOUNT HAS ALREADY AVAILED THE OFFER OR NOT
SELECT COUNT(ACCOUNT_NO) INTO ALREADY_EXISTS FROM HNS_FIN_ASSIST_T WHERE ACCOUNT_NO = SAN AND STATUS NOT IN ('D','R');

IF(INVOICE_COUNT>0 and ALREADY_EXISTS=0) THEN
    IS_ELIGIBLE := 'true';
END IF;
  RETURN IS_ELIGIBLE ;

END IS_ELIGIBLE_FOR_HARDHIP_RELIEF;

/
--------------------------------------------------------
--  DDL for Function IS_EXXON_SPECIAL_INVOICE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."IS_EXXON_SPECIAL_INVOICE" (InvoiceNo IN VARCHAR2) RETURN VARCHAR2 AS
ExxonAccountNo  VARCHAR(60);
ExxonInvoiceId  VARCHAR(255);
accountNo VARCHAR(60);
invoiceId VARCHAR(60);

BEGIN
                SELECT VALUE INTO ExxonAccountNo FROM ENT_CONFIG_T WHERE PARAMETER='EXXON_ACCOUNT_NO' ;
                SELECT VALUE INTO ExxonInvoiceId FROM ENT_CONFIG_T WHERE PARAMETER ='EXXON_SPECIAL_PRICING_INVOICEID';

                SELECT INVOICE_ID , P2A(ACCOUNT_OBJ_ID0) INTO invoiceId, accountNo
                FROM ENT_INVOICE_T EI, ENT_INVOICE_VERSION_T EIV
                WHERE EI.INVOICE_REC_ID = EIV.INVOICE_REC_ID
                AND EIV.INVOICE_NO = InvoiceNo;

                IF accountNo = ExxonAccountNo AND invoiceId=ExxonInvoiceId
                THEN
                                RETURN 'TRUE';
                ELSE
                                RETURN 'FALSE';
                END IF;
END IS_EXXON_SPECIAL_INVOICE;

/
--------------------------------------------------------
--  DDL for Function IS_EXXON_SPECIAL_PURCHASE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."IS_EXXON_SPECIAL_PURCHASE" (AccountNo in VARCHAR2,DealName in VARCHAR2) RETURN VARCHAR2 AS
ACCTNO VARCHAR2(30);
ACCTLIST VARCHAR2(255);
SERVICELIST VARCHAR2(255);
SERVICE_TYPE VARCHAR2(255);
   CURSOR c1
    IS
       SELECT PERMITTED FROM DEAL_T WHERE NAME= Dealname;

BEGIN
 open c1;
 fetch c1 into SERVICE_TYPE;

 if c1%notfound then
     return 'false';
end if;

 ACCTNO:= SUBSTR(AccountNo,1,3);
 SELECT VALUE INTO ACCTLIST FROM ENT_CONFIG_T WHERE PARAMETER='EXXON_SITE_PREFIX_LIST';

 SELECT VALUE INTO SERVICELIST FROM ENT_CONFIG_T WHERE PARAMETER='EXXON_SPECIAL_PRICING_SERVICE_TYPE';


 IF INSTR(ACCTLIST,ACCTNO) !=0  AND SERVICELIST=TRIM(SERVICE_TYPE)
 THEN RETURN 'TRUE';
 ELSE RETURN 'FALSE';
 END IF;
 END IS_EXXON_SPECIAL_PURCHASE;

/
--------------------------------------------------------
--  DDL for Function IS_HARD_DECLINED
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."IS_HARD_DECLINED" (San In Varchar2) Return Varchar2 As
Endt Number;
retVal varchar2(20);

Begin
               Retval := 'FALSE';
               Select Max(End_T) Into Endt From Event_T Where Account_Obj_Id0 = A2p(San) And Poid_Type = '/event/billing/payment/cc';
               If Endt Is NULL Then
                Return Retval;
              end if;

               Select Decode(Result, 8,'TRUE', 'FALSE') Into Retval From Event_Billing_Payment_Cc_T
                Where Obj_Id0 = (Select Poid_Id0  From Event_T Where Account_Obj_Id0 = A2p(San) And Poid_Type = '/event/billing/payment/cc' And End_T = Endt);

                Return Retval;
End Is_Hard_Declined;

/
--------------------------------------------------------
--  DDL for Function IS_IN_EBRM
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."IS_IN_EBRM" (SAN IN VARCHAR2) RETURN VARCHAR2 AS
SANCOUNT number;
SPECALPREFIX number;
ISENTSAN number;

BEGIN
                SELECT count(*) into SANCOUNT  FROM HNS_BMR_PREFIXES_T where prefix = substr(SAN,1,3) and FIELD = 'SAN';
                SELECT count(*) into SPECALPREFIX from HNS_BMR_SPECIAL_ENT_PREFIX_T where account_prefix = substr(SAN,1,3);
                select count(*) into ISENTSAN from HNS_BMR_ENTERPRISE_SAN_T Where SAN=Is_In_EBRM.SAN and status='A';

                dbms_output.put_line('SANCOUNT ' ||SANCOUNT);
                dbms_output.put_line('SPECALPREFIX ' ||SPECALPREFIX);
                dbms_output.put_line('ISENTSAN ' ||ISENTSAN);

                IF (SANCOUNT = 1 and SPECALPREFIX =1 and ISENTSAN =1 )
                THEN  RETURN 'TRUE';

                ELSIF (SANCOUNT = 1 and SPECALPREFIX =1 and ISENTSAN !=1)
                THEN RETURN 'FALSE';

                ELSIF (SANCOUNT = 1 and SPECALPREFIX !=1 )
                THEN RETURN 'TRUE';

                ELSE
                RETURN 'FALSE';
                END IF;

END Is_In_EBRM;

/
--------------------------------------------------------
--  DDL for Function MOD_ADD_MONTHS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."MOD_ADD_MONTHS" (date_in IN DATE, months_shift IN
NUMBER)
   RETURN DATE
IS
   return_value DATE;
   day_of_month VARCHAR2(2);
   month_year VARCHAR2(6);
   end_of_month DATE;
BEGIN
   return_value := ADD_MONTHS (date_in, months_shift);
       /* Pull out the day number of the original date */
      day_of_month := TO_CHAR (date_in, 'DD');
      /* Grab the month and year of the new date */
      month_year := TO_CHAR (return_value, 'MMYYYY');
   /* Is original date the last day of its month? */
   IF date_in = LAST_DAY (date_in)
   THEN
      /* Combine these components into an actual date */
      BEGIN
         end_of_month := TO_DATE (month_year || day_of_month, 'MMYYYYDD');
         /*
         || Return the earliest of (a) the normal result of ADD_MONTHS
         || and (b) the same day in the new month as in the original month.
         */
         return_value := LEAST (return_value, end_of_month);
		        EXCEPTION
             WHEN OTHERS THEN NULL;
      END;
		  IF  day_of_month  !=  TO_CHAR(return_value,'DD')
		 THEN
		 	 return_value := return_value + 1;
         END IF;
  ELSE
  	  IF  day_of_month  !=  TO_CHAR(return_value,'DD')
		 THEN
		 	 return_value := return_value + 1;
         END IF;
   END IF;
   /* Return the shifted date */
   RETURN return_value;
END mod_add_months;

/
--------------------------------------------------------
--  DDL for Function P2A
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."P2A" 
    ( accountPoid IN NUMBER )
    RETURN varchar2 IS
accountNo varchar2 (255);

BEGIN

   select account_no into accountNo from account_t where poid_id0 = accountPoid;
   RETURN accountNo;
END p2a;

/
--------------------------------------------------------
--  DDL for Function P2D
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."P2D" 
    ( dealPoid IN NUMBER )
    RETURN varchar2 IS
dealName varchar2 (255);

BEGIN

   select name into dealName from deal_t where poid_id0 = dealPoid;
   RETURN dealName;
END p2d;

/
--------------------------------------------------------
--  DDL for Function P2GL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."P2GL" 
    ( accountPoid IN NUMBER )
    RETURN varchar2 IS
glSegment varchar2 (255);

BEGIN

   select gl_segment into glSegment from account_t where poid_id0 = accountPoid;
   RETURN glSegment;
END p2gl;

/
--------------------------------------------------------
--  DDL for Function P2PR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."P2PR" 
    ( prodPoid IN NUMBER )
    RETURN varchar2 IS
prodName varchar2 (255);

BEGIN

   select name into prodName from product_t where poid_id0 = prodPoid;
   RETURN prodName;
END p2pr;

/
--------------------------------------------------------
--  DDL for Function P2UL
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."P2UL" 
    ( event_poid IN NUMBER )
    RETURN VARCHAR2 IS
userLogin service_t.login%TYPE;

BEGIN
   userLogin := null;
   select login into userLogin from service_t where poid_id0 = (select userid_id0 from event_t where poid_id0 = event_poid);
   RETURN userLogin;
END p2ul;

/
--------------------------------------------------------
--  DDL for Function PARENT_AT_THAT_TIME
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."PARENT_AT_THAT_TIME" (i_effective_date in number ,i_accnt_poid in number )
return number
as

   v_num_records_processed  NUMBER;
   v_bypass_other_records   NUMBER;
   v_earlier_not_found      NUMBER;
   v_commit_count           NUMBER;
   v_del_accnt_poid         NUMBER;
   v_add_accnt_poid         NUMBER;

   v_input_effective_date   NUMBER;
   v_input_accnt_poid       NUMBER;
   v_parent_accnt           NUMBER;
   v_not_subordinate        NUMBER;




CURSOR c2 (i_effective_t  number , i_accnt_poid number) IS

           SELECT *
           FROM event_t
           WHERE poid_id0 IN
               (
                SELECT obj_id0
                FROM event_group_members_t
                WHERE object_id0 = c2.i_accnt_poid
               )
              and
                created_t >= c2.i_effective_t
              and
                sys_descr = 'Billing Group Member(s) Deleted'
           ORDER BY created_t;

CURSOR c3 (i_effective_t  number , i_accnt_poid number) IS

           SELECT *
           FROM event_t
           WHERE poid_id0 IN
               (
                SELECT obj_id0
                FROM event_group_members_t
                WHERE object_id0 = c3.i_accnt_poid
               )
              and
                created_t <= c3.i_effective_t
              and
                sys_descr = 'Billing Group Member(s) Added'
           ORDER BY created_t desc;

r2 c2%ROWTYPE;
r3 c3%ROWTYPE;


BEGIN

   v_num_records_processed := 0;

   v_not_subordinate := 0;

   v_parent_accnt := 0;

   dbms_output.ENABLE( 100000 );
   v_commit_count := 0;

      v_input_effective_date := i_effective_date;

      v_input_accnt_poid  := i_accnt_poid;


      v_num_records_processed := v_num_records_processed + 1;

      v_bypass_other_records := 0;

      v_earlier_not_found := 1;

      FOR r2 in c2(v_input_effective_date , v_input_accnt_poid)
      LOOP

        v_earlier_not_found := 0;

        IF (v_bypass_other_records = 0)
        THEN

             BEGIN

                 v_add_accnt_poid := 0;

                 SELECT account_obj_id0
                 INTO v_add_accnt_poid
                 FROM event_t
                 WHERE poid_id0 IN
                      (
                       SELECT obj_id0
                       FROM event_group_members_t
                       WHERE object_id0 = v_input_accnt_poid
                      )
                     and
                       created_t <= r2.created_t
                     and
                       created_t > v_input_effective_date
                     and
                       sys_descr = 'Billing Group Member(s) Added'
                     and
                       account_obj_id0 = r2.account_obj_id0
                     and rownum = 1;

               EXCEPTION
                   WHEN NO_DATA_FOUND THEN

		       return  r2.account_obj_id0;
                       v_bypass_other_records := 1;
                       v_add_accnt_poid := 0;

                END ;

                IF (v_add_accnt_poid = r2.account_obj_id0)
                THEN

		   return  v_input_accnt_poid;
                   v_bypass_other_records := 1;

                END IF;

         END IF;

      END LOOP;

      IF (v_earlier_not_found = 1)
      THEN

         FOR r3 in c3(v_input_effective_date , v_input_accnt_poid)
         LOOP

           v_earlier_not_found := 0;

           IF (v_bypass_other_records = 0)
           THEN

              BEGIN

                 v_del_accnt_poid := 0;

                 SELECT account_obj_id0
                 INTO v_del_accnt_poid
                 FROM event_t
                 WHERE poid_id0 IN
                      (
                       SELECT obj_id0
                       FROM event_group_members_t
                       WHERE object_id0 = v_input_accnt_poid
                      )
                     and
                       created_t >= r3.created_t
                     and
                       created_t < v_input_effective_date
                     and
                       sys_descr = 'Billing Group Member(s) Deleted'
                     and
                       account_obj_id0 = r3.account_obj_id0
                     and rownum = 1;

               EXCEPTION
                   WHEN NO_DATA_FOUND THEN

		       return r3.account_obj_id0;
                       v_bypass_other_records := 1;
                       v_del_accnt_poid := 0;

                END ;


                IF (v_del_accnt_poid = r3.account_obj_id0)
                THEN

                    dbms_output.PUT_LINE('The Parent for this account is :- '||v_input_accnt_poid);
                    v_bypass_other_records := 1;

                END IF;


            END IF;

          END LOOP;

        END IF;

        IF (v_earlier_not_found = 1)
        THEN

           BEGIN

               SELECT ar_account_obj_id0
               INTO v_parent_accnt
               FROM payinfo_subord_t
               WHERE obj_id0 =
                      ( SELECT poid_id0
                        FROM payinfo_t
                        WHERE account_obj_id0 = v_input_accnt_poid );

           EXCEPTION

               WHEN NO_DATA_FOUND THEN

		  return v_input_accnt_poid;
                  v_not_subordinate := 1;

           END;

           IF ( v_not_subordinate = 0)
           THEN

	      return v_parent_accnt;

           END IF;


        END IF;

END;

/
--------------------------------------------------------
--  DDL for Function PAYTYPE2STRING
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."PAYTYPE2STRING" 
	( paytype IN NUMBER )
RETURN VARCHAR2 IS payTypeString VARCHAR2(60);

BEGIN
	IF paytype = 10001 THEN
		payTypeString := 'Invoice';
	ELSIF paytype = 10003 THEN
		payTypeString := 'CC';
	ELSIF paytype = 10005 THEN
		payTypeString := 'ECheck';
	ELSIF paytype = 10007 THEN
		payTypeString := 'Subord';
	ELSE
		payTypeString := 'Unknown';
	END IF;
	RETURN payTypeString;
END paytype2String;

/
--------------------------------------------------------
--  DDL for Function PIN_ROUND
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."PIN_ROUND" (amt in number, adjust in number,
                                        rounding in number)
        RETURN NUMBER IS
BEGIN
        IF amt = 0.0 then return 0.0;
        ELSE RETURN(ROUND(amt + adjust, rounding));
        END IF;

END pin_round;

/
--------------------------------------------------------
--  DDL for Function PIN_ROUND_BEID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."PIN_ROUND_BEID" wrapped
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
8
e0f 477
ckMG3sOcHjzsa60S71MxNIjfbMkwg5XquiCDfI4ZCjqUGV62no7lzWOT1ViPaQyv9G5n/skN
RC5a1cPtNAiGwYYU3IUC5jzeJ9XKwTOQcpqt6BlumH+ZVz+HIF3ZMxADiSgKgSX8yhv6VnVO
BIJKOs/f6OH+fHpv/ClGCCZ0RDKTNq90Pwt7O5JHrL1i7HkBbyFBmbchFKzOIoFsQ5GK1cFN
6zWohmV0Zm8DRJVI3Yx1FhRrLPpWsz0qHK3077BewFAtZHraEfcOUbegf4nhacuExnWCUBbw
gJd06Rt3/d0edcKhBj4g9Lv6Qk0L/QlgfpfMvS4teN2Nc1aRj0Lz8FKt9EnjIozyM1beJqll
n9T1l1Oh/3puLBcans4iSiA+u8oU521NFDh9gpxnlKEC50Zciq3eePScVvEvT1OBwzn1YWSQ
1diaZHidpXO3I/5ALLt4E839P1QplxcAdm2tlWH8N5L31CuwJmFX75zO0hR1ZND+neqwDlnD
VW/Kok9Gu96YeufQrnxOZ/KeYwGNUvkRJbtfUv1b5j3i22gh1MhPYVVhAbzKvJf19dmxznS7
n5QGv9qkbbFkBARCEKo/Gbw0O6eBbpFqRIzn6/tkK9+ynzgwr1rUzLMrMZ6PXqyGjrDYihlT
2nok56LUjMt3zjPEhMlkhLPIv9NoUj22WqdBbyYfWO475o/616EGxrVNNVpzmhNHqZEAiWQf
Z2tPVFdeVGQ/65CGDFDuQS/ZMW7cmZTkLhL1NUIZoyOC3nDpZzrH2c99ao7AsXtoDXlq+jJS
BGjMOPBA7aNJ3eLE7Pr5XFUg1ru0SKiQ5Lzflz75Qx95vnLxKU0zynQyJPzi4Wu48MHpltGQ
e6mLXizOoe+YnL3ePvbUgLPJjF8Dl5yQ095r52hm3jErfzQQiQ5BMi8UJdb+re9XKMcC35BV
+yVKe8as4S598AbCDp3P50DW915QXRnRBD9on/x0QkBbPJ4Ji126vQBTv1kVxxCRhWwp7mva
jfgw7Ou2d+N8HGGh9+m6aq94Dbt0FzMCWMiSVRHEJjnALrMzPcLONKsyx/cfq6ST58v/pefm
WhkqvS8fPQlJB9InzTxxq4tPO6u2FNeda/sQ/5wkPg0Oxw==

/
--------------------------------------------------------
--  DDL for Function PIN_ROUND_ON_SCALE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."PIN_ROUND_ON_SCALE" wrapped
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
8
5ca 270
bKRvC/NMDeNnHI7UTPkLk/Bv6dEwgw2Js0iMfC/p+Bid4Bnh0/xbidfyy3QmbHyFZ0UgK6tQ
nj43TaH4idC7dWx5hEUvO6DT0+GaEoq+M1dWGk9tohW8SNIM+IOJRXnSOAMZK98DRotSCYV2
RjaT25nDj6w6O30gyl0JsJ4Q94ipfK5K2fYubjbOMrRrOAJCayIOZgtHo0x72APkOMsmyHvd
pRk0HxasJPJzhYxpHybGtOGc5tOERnAFaiaqcc4do7hHjBzzmSlnUXUBTDE/SjHOlsY35PNs
rZQfiCdB6Pelvr1ejAn0wp2DEv1SDcjVHMyykIVsnSqYy7VrBcjCg3eYgW9FLUU6sphh2HDL
gleQcFMZ6yYLNRCp6AAV7jKdIA9KXK3HqOpErIZ/mQGmZtLi6+iJWENOdAdU4CLMWO+T0phQ
Y38tXutLvf9i48pC8Ywv71MtVnHuV9nn6JM4iRQnies+SDbeHEPrfIxFYtihGZOiV1994+Tp
PCyKuYlCEIIVpW7XSWilZHmUtyVHm52DJwNIWboA6kveE8SX9W92upLi2QxQ/nM8DzBPbd9j
BcGZPAK7ucO/dRyoWDU/CRaNR8HzI7+7G3SMGQ==

/
--------------------------------------------------------
--  DDL for Function PIN_VIRTUAL_TIME
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."PIN_VIRTUAL_TIME" 
RETURN DATE
IS
pvt DATE;
BEGIN
select infranet_to_date(date_to_infranet(sysdate)+offset) into pvt from PIN_VIRTUAL_TIME_T;
RETURN pvt;
END;

/
--------------------------------------------------------
--  DDL for Function POID_TO_DATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."POID_TO_DATE" ( in_poid number) return date is
  begin
  	   return infranet_to_date(( trunc(in_poid/power(2,44),0) * 60*60*24) + 4*3600);
end;

/
--------------------------------------------------------
--  DDL for Function POID_TO_INFRANET
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."POID_TO_INFRANET" ( in_poid number) return number is
  begin
  	   return ( trunc(in_poid/power(2,44),0) * 60*60*24) + 4*3600;
end;

/
--------------------------------------------------------
--  DDL for Function R2C
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."R2C" 
  ( input varchar2 )
  return varchar2
  deterministic
  parallel_enable
  aggregate using stragg_type
;

/
--------------------------------------------------------
--  DDL for Function SETEMAILPREFERENCES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."SETEMAILPREFERENCES" ( SAN IN VARCHAR2,CURPREFERENCES IN VARCHAR2 )RETURN VARCHAR2 AS

 INDEXCOUNT                   NUMBER;
 TOKEN                        VARCHAR2(255);
 EVENTLIST                    VARCHAR2(255);
 BGFLAG                       BOOLEAN;
 PFFLAG                       BOOLEAN;
 PDFLAG                       BOOLEAN;
 PPFLAG                       BOOLEAN;
 NOTIFICATION_ENTRY_EXIST     NUMBER;
 BG_NOTIFICATION_ENTRY_EXIST  NUMBER;
 PF_NOTIFICATION_ENTRY_EXIST  NUMBER;
 PD_NOTIFICATION_ENTRY_EXIST  NUMBER;
 PP_NOTIFICATION_ENTRY_EXIST  NUMBER;
 PD_ENTRY_EXIST               NUMBER;
 PDDAYS                       NUMBER;
 ICOUNT                       NUMBER;
 POID_ID                      NUMBER;

BEGIN

      EVENTLIST :=CURPREFERENCES;
      BGFLAG :=FALSE;
      PFFLAG :=FALSE;
      PDFLAG :=FALSE;
      PPFLAG :=FALSE;
      POID_ID :=0;

      DBMS_OUTPUT.PUT_LINE ('START OF SETEMAILPREFERENCES ' || DATE_TO_INFRANET(SYSDATE));
      IF SAN IS NULL  THEN
      DBMS_OUTPUT.PUT_LINE ('MANDATORY PARAMETER MISSING ' );
      RETURN 'BILLING:MANDATORY PARAMETER MISSING ';

      END IF ;

      BEGIN

      SELECT POID_ID0 INTO POID_ID FROM ACCOUNT_T WHERE ACCOUNT_NO=SAN;

      DBMS_OUTPUT.PUT_LINE ('POID_ID ' || POID_ID);
      EXCEPTION
      WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE ('ACCOUNT NOT FOUND ' );

      RETURN 'BILLING:ACCOUNT NOT FOUND';

      END;


      /*If customer removed all notification then marking all the existing records as obselete */
      IF CURPREFERENCES IS NULL  THEN
          SELECT COUNT(*) INTO NOTIFICATION_ENTRY_EXIST FROM HNS_NOTIFY_SUBSCRIPTION_T WHERE ACCOUNT_OBJ_ID0=POID_ID;

          IF NOTIFICATION_ENTRY_EXIST >0 THEN
             UPDATE HNS_NOTIFY_SUBSCRIPTION_T SET STATUS ='O',MOD_T=DATE_TO_INFRANET(SYSDATE) WHERE  ACCOUNT_OBJ_ID0=POID_ID;
             UPDATE HNS_NOTIFY_SUBSCRIPTION_PD_T SET STATUS ='O' WHERE  ACCOUNT_OBJ_ID0=POID_ID ;
             commit;
          END IF;

      END IF ;

      /*traversing through event list */

      LOOP
         INDEXCOUNT := INSTR(EVENTLIST,',');


        IF INDEXCOUNT > 0 THEN

            TOKEN := SUBSTR(EVENTLIST,1,INDEXCOUNT-1);

            IF TOKEN ='BG' THEN
             BGFLAG :=TRUE;
            END IF;

            IF TOKEN ='PF'THEN
            PFFLAG :=TRUE;
            END IF;

            IF TOKEN ='PP'THEN
             PPFLAG :=TRUE;
            END IF;

            IF TOKEN LIKE 'PD%'THEN
            PDFLAG :=TRUE;
            ICOUNT := INSTR(TOKEN,'\');
            PDDAYS := SUBSTR(TOKEN,-2,ICOUNT-1);

            END IF;

            EVENTLIST := SUBSTR(EVENTLIST,INDEXCOUNT+1);

        ELSE
            TOKEN := EVENTLIST;

            IF TOKEN ='BG' THEN
             BGFLAG :=TRUE;
            END IF;

            IF TOKEN ='PF'THEN
            PFFLAG :=TRUE;
            END IF;

            IF TOKEN ='PP'THEN
             PPFLAG :=TRUE;
            END IF;

            IF TOKEN LIKE 'PD%'THEN
            PDFLAG :=TRUE;

            ICOUNT := INSTR(TOKEN,'\');
            --PDDAYS := SUBSTR(TOKEN,-2,ICOUNT-1);
            PDDAYS := SUBSTR(TOKEN,ICOUNT+1);


            END IF;

            EXIT;
        END IF;
    END LOOP;

   DBMS_OUTPUT.PUT_LINE ('BGFLAG '||SYS.DIUTIL.BOOL_TO_INT(BGFLAG) );
   DBMS_OUTPUT.PUT_LINE ('PFFLAG ' || SYS.DIUTIL.BOOL_TO_INT(PFFLAG) );
   DBMS_OUTPUT.PUT_LINE ('PDFLAG ' || SYS.DIUTIL.BOOL_TO_INT(PDFLAG) );
   DBMS_OUTPUT.PUT_LINE ('PPFLAG ' || SYS.DIUTIL.BOOL_TO_INT(PPFLAG) );

  IF PDFLAG = TRUE AND PDDAYS > 20 THEN
   DBMS_OUTPUT.PUT_LINE ('PAYMENT DUE DAYS CANNOT BE GREATER THEN 20 ' );
   RETURN 'BILLING:PAYMENT DUE DAYS CANNOT BE GREATER THEN 20 ';
  END IF;

 DBMS_OUTPUT.PUT_LINE ('PDDAYS ' || PDDAYS );

    /* Event Notification for Bill Generation*/

   IF BGFLAG =TRUE THEN

      SELECT COUNT(*) INTO BG_NOTIFICATION_ENTRY_EXIST FROM HNS_NOTIFY_SUBSCRIPTION_T WHERE ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='BG';

      IF BG_NOTIFICATION_ENTRY_EXIST>0 THEN
         UPDATE HNS_NOTIFY_SUBSCRIPTION_T SET STATUS ='A',MOD_T=DATE_TO_INFRANET(SYSDATE) WHERE  ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='BG';
      ELSE
         INSERT INTO HNS_NOTIFY_SUBSCRIPTION_T (ACCOUNT_OBJ_ID0,EVENT_KEY,CREATED_T,STATUS) VALUES (POID_ID,'BG',DATE_TO_INFRANET(SYSDATE),'A');
      END IF;

     ELSE
     SELECT COUNT(*) INTO BG_NOTIFICATION_ENTRY_EXIST FROM HNS_NOTIFY_SUBSCRIPTION_T WHERE ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='BG';

       IF BG_NOTIFICATION_ENTRY_EXIST>0 THEN
          UPDATE HNS_NOTIFY_SUBSCRIPTION_T SET STATUS ='O',MOD_T=DATE_TO_INFRANET(SYSDATE) WHERE  ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='BG';
       END IF;

   END IF;


  /* Event Notification for Payment Failure */

  IF PFFLAG =TRUE THEN

     SELECT COUNT(*) INTO PF_NOTIFICATION_ENTRY_EXIST FROM HNS_NOTIFY_SUBSCRIPTION_T WHERE ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='PF';

     IF PF_NOTIFICATION_ENTRY_EXIST > 0 THEN
        UPDATE HNS_NOTIFY_SUBSCRIPTION_T SET STATUS ='A',MOD_T=DATE_TO_INFRANET(SYSDATE) WHERE  ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='PF';
     ELSE
         INSERT INTO HNS_NOTIFY_SUBSCRIPTION_T (ACCOUNT_OBJ_ID0,EVENT_KEY,CREATED_T,MOD_T,STATUS) VALUES (POID_ID,'PF',DATE_TO_INFRANET(SYSDATE),NULL,'A');
     END IF;

   ELSE
       SELECT COUNT(*) INTO PF_NOTIFICATION_ENTRY_EXIST FROM HNS_NOTIFY_SUBSCRIPTION_T WHERE ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='PF';

       IF PF_NOTIFICATION_ENTRY_EXIST > 0 THEN
        UPDATE HNS_NOTIFY_SUBSCRIPTION_T SET STATUS ='O',MOD_T=DATE_TO_INFRANET(SYSDATE) WHERE  ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='PF';
       END IF;

   END IF;



    /* Event Notification for Payment Processed */

    IF PPFLAG =TRUE THEN

     SELECT COUNT(*) INTO PP_NOTIFICATION_ENTRY_EXIST FROM HNS_NOTIFY_SUBSCRIPTION_T WHERE ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='PP';

     IF PP_NOTIFICATION_ENTRY_EXIST > 0 THEN
        UPDATE HNS_NOTIFY_SUBSCRIPTION_T SET STATUS ='A',MOD_T=DATE_TO_INFRANET(SYSDATE) WHERE  ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='PP';
     ELSE
         INSERT INTO HNS_NOTIFY_SUBSCRIPTION_T (ACCOUNT_OBJ_ID0,EVENT_KEY,CREATED_T,MOD_T,STATUS) VALUES (POID_ID,'PP',DATE_TO_INFRANET(SYSDATE),NULL,'A');
     END IF;

   ELSE
       SELECT COUNT(*) INTO PP_NOTIFICATION_ENTRY_EXIST FROM HNS_NOTIFY_SUBSCRIPTION_T WHERE ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='PP';

       IF PP_NOTIFICATION_ENTRY_EXIST > 0 THEN
        UPDATE HNS_NOTIFY_SUBSCRIPTION_T SET STATUS ='O',MOD_T=DATE_TO_INFRANET(SYSDATE) WHERE  ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='PP';
       END IF;

   END IF;



   /* Event Notification for Payment Due */
   IF PDFLAG =TRUE THEN

     SELECT COUNT(*) INTO PD_NOTIFICATION_ENTRY_EXIST FROM HNS_NOTIFY_SUBSCRIPTION_T WHERE ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='PD';
     SELECT COUNT(*) INTO PD_ENTRY_EXIST FROM HNS_NOTIFY_SUBSCRIPTION_PD_T WHERE ACCOUNT_OBJ_ID0=POID_ID AND DAYS=PDDAYS ;

     IF PD_NOTIFICATION_ENTRY_EXIST > 0 AND PD_ENTRY_EXIST > 0 THEN

        UPDATE HNS_NOTIFY_SUBSCRIPTION_T SET STATUS ='A',MOD_T=DATE_TO_INFRANET(SYSDATE) WHERE  ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='PD';
        UPDATE HNS_NOTIFY_SUBSCRIPTION_PD_T SET STATUS ='O' WHERE  ACCOUNT_OBJ_ID0=POID_ID;
        UPDATE HNS_NOTIFY_SUBSCRIPTION_PD_T SET STATUS ='A' WHERE  ACCOUNT_OBJ_ID0=POID_ID AND DAYS=PDDAYS ;

      ELSIF  PD_NOTIFICATION_ENTRY_EXIST>0 AND PD_ENTRY_EXIST =0 THEN

        UPDATE HNS_NOTIFY_SUBSCRIPTION_T SET STATUS ='A',MOD_T=DATE_TO_INFRANET(SYSDATE) WHERE  ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='PD';
        UPDATE HNS_NOTIFY_SUBSCRIPTION_PD_T SET STATUS ='O' WHERE  ACCOUNT_OBJ_ID0=POID_ID ;
        INSERT INTO HNS_NOTIFY_SUBSCRIPTION_PD_T (ACCOUNT_OBJ_ID0,STATUS,DAYS,CREATED_T) VALUES (POID_ID,'A',PDDAYS,DATE_TO_INFRANET(SYSDATE));

       ELSE

          INSERT INTO HNS_NOTIFY_SUBSCRIPTION_T (ACCOUNT_OBJ_ID0,EVENT_KEY,CREATED_T,MOD_T,STATUS) VALUES (POID_ID,'PD',DATE_TO_INFRANET(SYSDATE),NULL,'A');
          INSERT INTO HNS_NOTIFY_SUBSCRIPTION_PD_T (ACCOUNT_OBJ_ID0,STATUS,DAYS,CREATED_T) VALUES (POID_ID,'A',PDDAYS,DATE_TO_INFRANET(SYSDATE));
     END IF;

   ELSE
      SELECT COUNT(*) INTO PD_NOTIFICATION_ENTRY_EXIST FROM HNS_NOTIFY_SUBSCRIPTION_T WHERE ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='PD';

      IF PD_NOTIFICATION_ENTRY_EXIST>0 THEN

          UPDATE HNS_NOTIFY_SUBSCRIPTION_T SET STATUS ='O',MOD_T=DATE_TO_INFRANET(SYSDATE) WHERE  ACCOUNT_OBJ_ID0=POID_ID AND EVENT_KEY='PD';
          UPDATE HNS_NOTIFY_SUBSCRIPTION_PD_T SET STATUS ='O' WHERE  ACCOUNT_OBJ_ID0=POID_ID;
      END IF;



   END IF;

   COMMIT;
   DBMS_OUTPUT.PUT_LINE ('END OF SETEMAILPREFERENCES ' || DATE_TO_INFRANET(SYSDATE));
    RETURN 'SUCCESS' ;

END SETEMAILPREFERENCES;

/
--------------------------------------------------------
--  DDL for Function TABLE_EXISTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."TABLE_EXISTS" (i_table_name IN VARCHAR2)
RETURN BOOLEAN AS
        v_dummy VARCHAR2(1);
BEGIN
        SELECT '*' INTO v_dummy
        FROM user_tables
        WHERE table_name = UPPER(i_table_name);

        RETURN true;
EXCEPTION
        WHEN no_data_found THEN
                RETURN false;
        WHEN others THEN
                RETURN false;
END table_exists;

/
--------------------------------------------------------
--  DDL for Function TO_ORADATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."TO_ORADATE" (
	v_seconds IN INTEGER )
RETURN DATE
	IS	v_converted_date DATE;
BEGIN
	v_converted_date := new_time(TO_DATE('01011970','MMDDRRRR') +
v_seconds / (60*60*24), 'GMT','EDT');
	RETURN v_converted_date;

END;

/
--------------------------------------------------------
--  DDL for Function U2D
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."U2D" (v_seconds IN INTEGER)
-- This function converts unix/infranet time into local date string format taking daylight savings time into consideration
-- Change v_region := 'America/new_york' to your region as found in SELECT tzname, tzabbrev, tz_offset(tzname) FROM V$TIMEZONE_NAMES;
-- for support contact dcook@portal.com 1-800-232-4542
RETURN DATE
IS
v_converted_date DATE;
v_region VARCHAR2(30);
BEGIN
v_region := 'US/Eastern';
v_converted_date := FROM_TZ(CAST(to_timestamp_tz('01-Jan-1970 GMT', 'DD-MON-YYYY TZR')+(v_seconds/86400) AS TIMESTAMP),'GMT') AT TIME ZONE v_region;
RETURN v_converted_date;
END;

/
--------------------------------------------------------
--  DDL for Function U2DT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."U2DT" (v_seconds IN INTEGER)
-- This function converts unix/infranet time into local date string format taking daylight savings time into consideration
-- Change v_region := 'America/new_york' to your region as found in SELECT tzname, tzabbrev, tz_offset(tzname) FROM V$TIMEZONE_NAMES;
-- for support contact dcook@portal.com 1-800-232-4542
RETURN VARCHAR2
IS
v_converted_date DATE;
v_region VARCHAR2(30);
BEGIN
v_converted_date := FROM_TZ(CAST(to_timestamp_tz('01-Jan-1970 GMT', 'DD-MON-YYYY TZR')+(v_seconds/86400) AS TIMESTAMP),'GMT');
RETURN to_char(v_converted_date,'DD-MON-YYYY HH:MI:SS AM');
END;

/
--------------------------------------------------------
--  DDL for Function VOIPRATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PIN"."VOIPRATE" 
    ( accountNo IN varchar2 )
    RETURN NUMBER IS
voipCharge NUMBER;
BEGIN
   voipCharge := 0;
   with lst as
(Select
                        (SELECT SUM (current_bal)
                           FROM bal_grp_sub_bals_t s,
                                bal_grp_t b
                          WHERE b.poid_id0 = s.obj_id0
                            AND s.valid_to = 0
                            AND b.account_obj_id0 = ap.account_obj_id0
                                      and s.rec_id2 = RDV.STEP_RESOURCE )
                                                           AS current_balance,
                        case when rdv.event_type = '/event/billing/product/fee/cancel' then  rdv.scaled_amount
                        When rdv.rate_plan_obj_id0 <> (select max(rs.rate_plan_obj_id0) from voip_tbl rs where rs.product_obj_id0 = rdv.product_obj_id0 and rs.event_type = rdv.event_type)
                        and ap.status_flags in (33554432, 33554440, 50331648, 50331656) then 0 else
                              ROUND (  (DECODE (ap.status_flags,
                                                33554432, ap.cycle_fee_amt,
                                                33554440, ap.cycle_fee_amt,
                                                50331648, ap.cycle_fee_amt,
                                                50331656, ap.cycle_fee_amt,
                                                  rdv.scaled_amount
                                               )
                                       )
                                     - (  DECODE (ap.status_flags,
                                                  33554432, ap.cycle_fee_amt,
                                                  33554440, ap.cycle_fee_amt,
                                                  50331648, ap.cycle_fee_amt,
                                                  50331656, ap.cycle_fee_amt,
                                                    rdv.scaled_amount
                                                 )
                                        * ap.cycle_discount
                                       ),
                                     2
                                    ) end
                            - ap.cycle_disc_amt + rdv.FIX_AMOUNT
                            AS charge_amount,
                           rdv.rate_plan_obj_id0, rdv.STEP_MIN, rdv.STEP_MAX, rdv.TAX_CODE, rdv.STEP_RESOURCE,
                            (Select  max(RDV.STEP_MIN) term
                                                                                                     from voip_tbl rdv
                                                                                                     where RDV.PRODUCT_OBJ_ID0 = ap.product_obj_id0 and
                                                                                                     RDV.RPT_ELEMENT_ID = 840
                                                                                                     and not exists (select 1 from voip_tbl ldv where LDV.PRODUCT_OBJ_ID0 = RDV.PRODUCT_OBJ_ID0 and LDV.STEP_MIN = RDV.STEP_MAX and RDV.ELEMENT_ID = LDV.ELEMENT_ID)
                                                                                                     and RDV.STEP_RESOURCE not in (0,101000099)
                                                                                                     and RDV.STEP_MAX is not null) high_min,
                            /* Add 20150310 low_min*/
                        (SELECT min (nvl(rdv.step_min,-10000)) AS term
from voip_tbl rdv
where RDV.PRODUCT_OBJ_ID0 = ap.product_obj_id0 and
RDV.RPT_ELEMENT_ID = 840
and RDV.STEP_RESOURCE not in (0,101000099)
and RDV.STEP_MAX is not null) low_min,
                            Nvl(RDV.TERM,
                            (Select  max(RDV.STEP_MAX) term
from voip_tbl rdv
where RDV.PRODUCT_OBJ_ID0 = ap.product_obj_id0 and
RDV.RPT_ELEMENT_ID = 840
and not exists (select 1 from voip_tbl ldv where LDV.PRODUCT_OBJ_ID0 = RDV.PRODUCT_OBJ_ID0 and LDV.STEP_MIN = RDV.STEP_MAX and RDV.ELEMENT_ID = LDV.ELEMENT_ID)
and RDV.STEP_RESOURCE not in (0,10100009,101000099)
and RDV.STEP_MAX is not null)) term,
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
                             ) AS charge_by, rdv.event_type, rdv.ELEMENT_ID
from purchased_product_t ap
Join voip_tbl rdv On ap.product_obj_id0 = rdv.product_obj_id0 AND RDV.RPT_ELEMENT_ID = 840 and AP.STATUS !=3
                    and sysdate >= nvl(RDV.RATE_PLAN_START,sysdate) and sysdate <=nvl(RDV.RATE_PLAN_END,sysdate)
                  WHERE ap.account_obj_id0 = a2p(accountNo) --and rdv.TAX_CODE = 'VO'
)Select sum(charge_amount) into voipCharge
from lst
WHERE ( round(nvl(current_balance,0),2)  between nvl(step_min,nvl(current_balance,0)) and nvl(step_max,nvl(current_balance,0)+1)-.001
or current_balance >= term and step_min = high_min
/* Add logic below low tier 20150310 */
or step_min = low_min and current_balance < step_min
/* New logic override recurring charge > term 20150224*/
or charge_by = 'override' and current_balance >= step_max and step_max = term and
    decode((lst.current_balance - lst.step_max)- abs(lst.current_balance - lst.step_max),0,'Over','Under') = 'Over' and lst.event_type != '/event/billing/product/fee/cancel' and lst.event_type != '/event/billing/product/fee/purchase'
   or  step_resource = 10100009 and current_balance > high_min and high_min = step_min
  );
   RETURN voipCharge;
END voipRate;

/
