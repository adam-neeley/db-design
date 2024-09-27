-- Adam Neeley
-- Courtney Rowe
-- Sep 27 2024

spool 325lab5-out.txt

prompt Adam Neeley
prompt Courtney Rowe

prompt lab query 1

select EMPL_LAST_NAME
       from EMPL
       where MGR is null;

prompt lab query 2

select EMPL_LAST_NAME, HIREDATE
       from EMPL
       where JOB_TITLE = 'Sales';

prompt lab query 3

select DEPT_NAME, EMPL.SALARY
       from EMPL, DEPT
       where EMPL.DEPT_NUM = DEPT.DEPT_NUM
             and EMPL.MGR like '%7839%';

prompt lab query 4

select distinct job_title, mgr
       from empl;

prompt lab query 5

select *
       from dept
       where DEPT_LOC in ('Dallas', 'Boston', 'New York');

prompt lab query 6

select EMPL_LAST_NAME, JOB_TITLE, SALARY
       from EMPL
       where SALARY > 3000
             or SALARY < 1000;


prompt lab query 7

select *
       from EMPL
       where HIREDATE
             between TO_DATE('09-01-2018', 'MM-DD-YYYY')
             and TO_DATE('09-30-2018', 'MM-DD-YYYY');

prompt lab query 8

select *
       from EMPL
       where EMPL_LAST_NAME like 'M%';

spool off
