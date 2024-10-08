SELECT * FROM TAB;

-----------------------TABLE NAME -----------------------

SELECT * FROM COUNTRIES;

-----------------------DDL(DATA DEFINATION LANGUAGE)----------------------------------
--CREATE
--ALTER
--RENAME
--TRUNCATE
--DROP
-----------------------CREATE TABLE--------------------------

CREATE TABLE KIRAN (KID INT,KNAME CHAR(20),KPOSITION CHAR(20) );

DESC KIRAN;


----------------------ALTER(MODIFICATION OF STRUCTURE)-------------
--ALTER-MODIFY
--ALTER-ADD
--ALTER-RENAME
--ALTER-DROP


--ALTER-MODIFY
--CHANGE DATATYPE AND SIZE OF DATATYPE OF A COLUMN
    --SYNTAX: ALLTER TABLE <TABLE NAME> MODIFY <COLUMN NAME> <NEW DATATYPE> [NEW SIZE]

ALTER TABLE KIRAN MODIFY KNAME VARCHAR2(20) ;

DESC KIRAN;


--ALTER-ADD
--ADDING NEW COLUMN TO TABLE
    --SYNTAX: ALTER TABLE <TABLE NAME> ADD <NEW COLUMN NAME> <DATATYPE>[SIZE];

ALTER TABLE KIRAN ADD KSALARY NUMBER;

DESC KIRAN;

ALTER TABLE KIRAN MODIFY KSALARY NUMBER(20) ;

DESC KIRAN;

--ALTER-RENAME
--CHANGING COLUMN NAME
    --SYNTAX: ALTER TABLE <TABLE NAME> RENAME COLUMN <OLD COLUMN NAME> TO <NEW COLUMN NAME>;

ALTER TABLE KIRAN RENAME COLUMN KPOSITION TO POSITION;

DESC KIRAN;    
    
--ALTER-DROP
--DELETING COLUMN 
    --SYNTAX: ALTER TABLE <TABLE NAME> DROP COLUMN <COLUMN NAME>;

ALTER TABLE KIRAN DROP COLUMN POSITION;

DESC KIRAN; 

---------------------------RENAME----------------------
--CHANGE TABLE NAME
    --SYNTAX: RENAME <TABLE NAME> TO <NEW TABLE NAME>;

RENAME KIRAN TO KINGRK; 

DESC KIRAN; ---ORA-04043: object KIRAN does not exist

DESC KINGRK;


---------------------TRUNCATE-------------------------
--DELETTING ALL ROWS
    --SYNTAX: TRUNCATE TABLE <TABLE NAME>;

TRUNCATE TABLE KINGRK;


------------------------DROP-------------------------
--TO DROP A TABLE ROWS AND COLUMNS FROM DB.
    --SYNTAX: DROP TABLE <TABLE NAME>
 
DROP TABLE KINGRK;    

------------------------------------------------
--RECYCLEBIN
--FLASHBACK
--PURGE

--------------------RECYCLENBIN-----------------
    --PREDEFINED TABLE(SYSTEM).
    --STORE DROPED TABLES INFORMATION.
    
DESC RECYCLEBIN;

SELECT OBJECT_NAME, ORIGINAL_NAME FROM RECYCLEBIN;

-------------------FLASHBACK--------------------------
    --COMMAND IS USED TO RESTORE A TABLE INTO DATABASE
    --SYNTAX: FLASHBACK TABLE <TABLE NAME> TO BEFORE DROP;
    
FLASHBACK TABLE KINGRK TO BEFORE DROP;    

DESC KINGRK;

------------------PURGE----------------------
    --THIS COMMAND IS USED TO DROP A TABLE PERMANENTLY
    -- SYNTAX: PURGE TABLE <TABLE NAME>;
PURGE TABLE KIRAN;    

SELECT OBJECT_NAME, ORIGINAL_NAME FROM RECYCLEBIN;

PURGE RECYCLEBIN;           --DELETE ALL TABLE FROM RECYCLEBIN

DROP TABLE EMPLOYEES PURGE;  --DROP TABLE FROM DB PERMANENTLY

