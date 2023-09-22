SELECT D2I(SYSDATE) FROM PIN_VIRTUAL_TIME_T;

SELECT SYSDATE FROM PIN_VIRTUAL_TIME_T;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YY';

commit;

SELECT * FROM all_users;

SELECT 
    owner,
    object_name,
    object_type
FROM 
    all_objects
WHERE
    object_name like '%D2I%';
    
CREATE SYNONYM D2I
FOR DATE_TO_INFRANET;

commit;


