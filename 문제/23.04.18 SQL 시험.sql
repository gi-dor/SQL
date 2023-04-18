------ 문제 --------

--1. 각 부서별 (s.emp.dept_id)평균 급여 (avg(salary)) 를 구하라, 
-- 평균 급여가 2000이상인 부서만 나타내라
select * from s_emp
order by dept_id ;

select dept_id , avg(salary)
from s_emp
group by dept_id
having avg(salary)>= 2000 -- 그룹에 대한 조건
order by 2 desc
;
------------------------------------------------------------------------
--2. 각 직책 별로 (title )급여의 총합 sum(salary)을 구하라 , 
-- 직책이 사원인 사람은 제외 (title <> '사원')
--급여의 총합이 3000 이상인(sum (salary) >= 3000) 직책(title)만 나타내고  
--급여의 총합에 대한 내림차순 sum(salary) desc

select title ,sum(salary)
from s_Emp
where title <> '사원'   -- <> , != 사용 // not like는 성능이 느림
group by title
having sum (salary) >= 3000
order by 2 desc
;


--3. 직급이(title) 부장인 사람이 2명 이하인 부서가(dept_id) 몇개인지 나타내는 select문을 작성
-----------------------------------------------------------------------------
select dept_id , count(*) 
from s_Emp
where title like '%부장%'
group by dept_id
having count(*) <= 2
;

select count(*)
from (select dept_id , count(*) 
from s_Emp
where title like '%부장%'
group by dept_id
having count(*) <= 2 )
;

    -- 포기 --
-----------------------------------------------------------------------------

--4.담당직원이 (sales_rep_id)배정되지 않은 고객(s_customer.name)을 
--모두 나타내는 select문 작성

select * 
from s_Emp e , s_customer c
where e.id(+) = c.sales_rep_id
;

select c.name
from s_Emp e , s_customer c
where e.id(+) = c.sales_rep_id
and e.name is null
;


select e.name 담당사원 , c.sales_rep_id "사원ID" ,c.name 고객성명
from s_emp e, s_customer c
where e.id (+)= c.sales_rep_id
and sales_rep_id = 0
;

select * from s_emp;
select *from s_customer;

----------------------------------------------------------
-- 5. PK와 FK 에 대해 적으시오
-- PK - 한 행을 구별되게 해주는 컬럼 
-- FK - 다른 테이블의 PK , PK에  없는 값은 저장불가 , 참조 무결성

-- PK 도 변경 가능하다
------------------------------------------------------------------------------
--6. CONSTRINT 종류를 모두 적으시오
pk not null , unique , fk , check


--7. 자동으로 고유한 숫자값을 생성해주며 주로 기본키 값을 생성하기 위해 사용 하는 Object는 ?
-- 시퀀스

-----------------------------------------------------------

--8.전체 직원(s_emp)중 연봉이(salary) 제일 높은 사람 3명의 이름(name)과 연봉(salary)을 
--출력

select * from (select name  , salary
from s_Emp
order by salary desc
) t
where rownum <= 3    --- 
;

--박구곤	5000
--이은선	3500
--김심선	3200

----------------포기-------------

--9. 인덱스를 생성하기위해 적절한 경우를 모두 고르시오
--조건절이나 조인에서 자주 사용되는 컬럼
--컬럼이 넓은 범위의 값을 가질때
--null 값이 맣은 컬럼
--테이블에 데이터가 많고 조회되는 행이 전체의 10 ~ 15 % 일때
--------------------------------------------------------------------------------

--10. 아래 sql 문은 비효율적이다 NOT EXISTS 사용해서 효율적으로 작성하시오
select id , name , title 
from s_emp e
where e.title <> '사원'
;


select id , name , title 
from s_Emp e
where not EXISTS (
select * from s_emp
where e.title = '사원')
;
