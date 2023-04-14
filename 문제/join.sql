--EQUIJOIN
--selcet 테이블명.칼럼명 , 테이블명.칼럼명 ...
--from 테이블1, 테이블 2
--where 테이블1.컬럼1 = 테이블2.컬럼2;
--------------------------------------------------------------------------------
--테이블1.컬럼1 = 테이블2.컬럼2  두 테이블간의 논리적으로 값을 연결시키는
--칼럼간의 조건
--------------------------------------------------------------------------------

select * from s_emp;
select * from s_dept;
select * from s_region; 

-- 서울 지역에 근무하는 사원에 대해 각 사원의 이름과 근무하는 부서명을 나타내시오
-- 서울지역 (region_id = 1) , 사원 (title =사원) 
-- 이름 (name ) 부서명 (name)
-- s_emp.name , s_dept.name
select s_emp.name , s_dept.name
from s_emp , s_dept
where title = '사원'
and region_id = 1
and s_emp.dept_id =  s_dept.id
;

-------------------------------------------------------------------------------

-- 사원의 이름과 부서 부서명을 나타내시오
-- 사원(title = 사원) 이름 (name) 부서(dept_id) 부서명 (name) 

-- 이름 (s_emp.name ) 부서 (s_emp.dept_id) 부서명 (s_dept.name)

select s_emp.name 이름 , s_dept.name 부서명 , dept_id 부서
from s_emp , s_dept
where title = '사원'
and s_emp.dept_id =  s_dept.id
;

-- 중복 name이라 앞에 테이블 쓴듯 ?
select s_emp.name , s_dept.name , s_emp.dept_id 
from s_emp , s_dept
where s_emp.dept_id = s_dept.id
and title = '사원'
;

-----------------------------------------------------------------------------

---- NON EQUIJOIN
--select e.name , s.salary , g.grade 급여등급
--from s_emp e , salgrade g 
--where e_salary between g.losal and g.hisal;

--NoN EquiJoin은 한컬럼의 값이 , 다른 컬럼의 값과 정확히 일치하지 않는경우
-- 연산자 외의 다른 연산자를 사용하여 join하는 방법을 말한다

select * from s_emp;
select * from s_dept;
select * from s_region; 
select * from salgrade;    -- grade , losal , hisal

--직원테이블과 급여 테이블을 join하여 
--사원의 이름(s_emp.name)과 급여(s_emp.salary) 해당급여 등급을 나타내시오
select em.name , em.salary , gs.grade
from s_emp em , salgrade gs
where em.salary between gs.losal and gs.hisal
;
select * from s_emp;
select * from s_dept;
select * from s_region; 
select * from salgrade;    -- grade , losal , hisal
select * from s_customer;

--------------------------------------------------------------------------------

---- OUTER JOIN
--직원 (s_emp) 테이블과 고객 (s_customer) 테이블에서 
--사원의 이름과(s_emp.name) 사번 (s_emp.id) ,
--그리고 사원의 담당고객이름(s_customer.name) 을 나타내시오
--고객에 대하여 담당영업 사원이 없더라도 모든 고객의 이름을 나타내고 사번순으로 오름차순 정렬하시오
select * from s_emp;
select * from s_customer;  
-- id , salse_rep_id

select e.name , e.id , c.name
from s_emp e , s_customer c
where e.id = c.sales_rep_id(+)
order by e.id
;


------------------------------------------------------------------------------
---- self join
--하나의 테이블을 마치 여러개인 것처럼 사용가능
--테이블에 대한 alias를 각기 다르게 지정
--컬럼의 이름 앞에 반드시 테이블의 alas를 붙여야함
--self join 의 횟수는 제한되어 있지않음
-----------------------------------------------------------
select * from s_emp;

select w.id 사번 , w.name 사원명 , m.id 부서장사번 , m.name "부서장 이름"
from s_emp w , s_emp m
where w.manager_id = m.id
;
--------------------------------------------------------------
--직원중에 김정미와 같은 직책을 가지는 사원의 이름(name)과 
--직책(title) 급여(salary) 부서번호(dept_id)를 
--나타내시오 self join 사용


---------------------------------------------------------------
----------set 연산자 
--set 연산자 종류 
--1. union : 각 query 결과의 합집합  
--2. intersect : 각 query 결과의 합집합에 공통 부분을 더함
--3. union all : 각 query 결과의 교집합
--4. minus : 각 query 결과와 두번째 query 결과의 차집합
--
--set 연산자 문형---------------

--select 칼럼1 , 칼럼2 ...
--from 테이블 1
--   set 연산자
--select 칼럼1 , 칼럼2...
--from 테이블2
--order by ..
--;

select name, dept_id , title
from s_emp
where dept_id = 110
union -- 결과의 합집합
select name , dept_id , title
from s_emp
where dept_id = 113
order by dept_id
;