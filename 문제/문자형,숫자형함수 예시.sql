--논리 연산자의 사용예 , 연산자 우선순위
select name , salary , dept_id
from s_emp
where (dept_id =110 or dept_id =113)
and salary >= 2000
;

--우선순위 
--1. 모든 비교연산자 
--2. and
--3. or
-------------------------------------------------------------------------------
-- 문자형 함수
SELECT upper ('oracle SERVER') 
from dual;

select lower ('ORACLE server')
from dual;

select initcap ('Oracle Server')
from dual;

select concat('Oracle','SERver')
from dual;

select substr('경기도 남양주시' , 5 , 2)
from dual;

select length ('한기선')
from dual;

select lpad ('한기선' , 10 ,'+')
from dual;

select rpad ('킹갓기선',10,'*')
from dual;

select ltrim ('XXABAX','X')
from dual;

select translate ('AABBA' , 'B' ,'C')
from dual;

select replace ('jack and jue' ,'j' , 'bl')
from dual;



---------------------------------------------------------------
-- 숫자형 함수


select round (35.735,2)
from dual;

select mod(7,2) 
from dual;

select power (3,2)
from dual;

select sign(-15)
from dual;

select chr(65)
from dual;