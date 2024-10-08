-----------------CLAUSE------------------

--1)WHERE               --FILTERING ROWS BEFORE GROUPING DATA IN TABLE
--2)ORDERED BY          --SORTING A COLUMN VALUES(ASCENDING OR DECEDING ORDER)
--3)GROUP BY            --GROUPING SIMILAR DATA BASED ON CCOLUMNS
--4)HAVING              --FILTERING ROWS AFTER GROUPING DATA IN TABLE
--5)ROLLUP              --TO FIND SUBS AND GRAND TOTAL BASED ON 'SINGLE COLUMN'
--6)CUBE                --TO FIND SUBS AND GRAND TOTAL BASED ON 'MULTIPLE COLUMN'

----------------WHERE-----------------------------

--IS USED IN THREE COMMAND 'SELECT','UPDATE' AND 'DELETE'COMMANDS ONLY.

SELECT * FROM EMP;

SELECT * FROM EMP WHERE EMPNO=7788;


------------------ORDER BY-------------------------------
--BY DEFAULT ORDER BY CLAUSE ARRANGING VALUES IN ASCENDING ORDER.
--BUT BUT WHEN WE WANT ARRANGE VALUES IN DESCENDING ORDER THEN USE 'DESC' KEYWORD
--'ORDERBY BY' CLAUSE IS USED IN ONLY 'SELECT' COMMAND

SELECT * FROM EMP ORDER BY SAL;

SELECT * FROM EMP ORDER BY SAL DESC;

SELECT * FROM EMP WHERE DEPTNO=20 ORDER BY SAL DESC;

SELECT * FROM EMP ORDER BY DEPTNO,SAL DESC;

SELECT * FROM EMP ORDER BY 6;

SELECT * FROM EMP ORDER BY 6 DESC;

SELECT * FROM EMP ORDER BY COMM ;

SELECT * FROM EMP ORDER BY COMM NULLS FIRST;

SELECT * FROM EMP ORDER BY COMM DESC;


-----------------------GROUP BY-------------------------
--GROUPING SIMILAR DATA
--WHEN WE USE GROUP BY WE SHOULD USE 'GROUPING FUNCTIONS'
    --EX: SUM(),AVG(),MIN(),MAX(),COUNT()
    --SYNTAX: SELECT <COLUMN NAME1>,<COLUMN NAME2>,.....<GROUPING FUNCTION1>,.....FROM <TN> GROUP BY <COLUMN NAME1>,<COLUMN NAME2>,....;
SELECT * FROM EMP GROUP BY JOB;     --ERROR    
SELECT JOB FROM EMP GROUP BY JOB;   

SELECT JOB, COUNT(*) FROM EMP GROUP BY JOB; 

SELECT DEPTNO, COUNT(*) NO_OF_EMPLOYEES,SUM(SAL) SUM_OF_SAL,
AVG(SAL) AVG_SAL,MAX(SAL) MAX_SAL,MIN(SAL) MIN_SAL FROM EMP GROUP BY DEPTNO;

SELECT DEPTNO, COUNT(*) NO_OF_EMPLOYEES,SUM(SAL) SUM_OF_SAL,
AVG(SAL) AVG_SAL,MAX(SAL) MAX_SAL,MIN(SAL) MIN_SAL FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO;


--------------------------------HAVING--------------------------------
--FILTERING ROWS AFTER GROUPING DATA IN TABLE.
--CAN BE USED ALONG WITH 'GROUP BY' CLAUSE ONLY
    --SYNTAX: SELECT <COLUMN NAME1>,<COLUMN NAME2>,.....<GROUPING FUNCTION1>,.....FROM <TN> 
    --                                  GROUP BY <COLUMN NAME1>,<COLUMN NAME2>,....HAVING<FILTERING CONDITION>;
    
    
SELECT DEPTNO,COUNT(*) FROM EMP GROUP BY DEPTNO HAVING COUNT(*)>3;    

SELECT DEPTNO,COUNT(*) FROM EMP GROUP BY DEPTNO HAVING COUNT(*)>3 ORDER BY DEPTNO;


-------------------------------------ROLLUP---------------------------------

--SYNTAX: SELECT <COLUMN NAME1>,<COLUMN NAME2>,.....<GROUPING FUNCTION1>,.....FROM <TN> 
    --                                  GROUP BY ROLLUP(<COLUMN NAME1>,<COLUMN NAME2>,....);
    
SELECT DEPTNO,COUNT(*) FROM EMP GROUP BY ROLLUP(DEPTNO);   

SELECT DEPTNO,JOB,COUNT(*) FROM EMP GROUP BY ROLLUP(DEPTNO,JOB);  

SELECT JOB,DEPTNO,COUNT(*) FROM EMP GROUP BY ROLLUP(JOB,DEPTNO);  

-----------------------------------CUBE-----------------------------------


--SYNTAX: SELECT <COLUMN NAME1>,<COLUMN NAME2>,.....<GROUPING FUNCTION1>,.....FROM <TN> 
    --                                  GROUP BY CUBE(<COLUMN NAME1>,<COLUMN NAME2>,....);
    
SELECT DEPTNO,COUNT(*) FROM EMP GROUP BY CUBE(DEPTNO);    

SELECT DEPTNO,COUNT(*) FROM EMP GROUP BY CUBE(DEPTNO) ORDER BY DEPTNO;  

SELECT DEPTNO,JOB,COUNT(*) FROM EMP GROUP BY CUBE(DEPTNO,JOB) ORDER BY DEPTNO;  

