--select count(title) 
--select count(name)
--select avg(salary) 평균 연봉
--select sum (salary) 연봉 합계

-- group by having 절


select title
from s_emp
group by title
;
-- 직책만 표기

select  dept_id
from s_emp
group by dept_id
;

-- 부서 확인
select *
from s_dept
;
-- 근무자들 이름 부서 직책 확인
select name , dept_id  ,title
from s_emp
;
--사원 부서별 직급 연봉평균
select dept_id ,avg(salary)
from s_emp
where title ='사원'
group by dept_id
;

-- 각 부서별 평균급여 
select dept_id,avg(salary)
from s_emp
group by dept_id
;
-- 각 부서별dept_id로 직책이 사원인 직급들의 평균 급여
select dept_id , avg(salary)
from s_emp
where title = '사원 '
group by dept_id
;

select name
from s_emp
where name like '김_'  -- 이름 검색안됨
;
select name
from s_emp
where name like '김__' -- 이름 검색됨
;

select name 
from s_emp
where name like '김%'  -- 이름 검색됨
;

select name
from s_emp
where name like '%김%'  -- 검색됨
;

-- select절에서 group함수 잘못사용
 select region_id , count(name)
 from s_dept
;  -- 왜 에러 일까 ? , count는 그룹 함수인데 group by 절이 없음 
-- group by region_id
-- 
select name
from s_dept
;

select * 
from s_dept 
;
-- 각 지역region_id 별로 몇개의 부서가 있는지 나타내시오
select region_id , count(name)
from s_dept
group by region_id
;
select *
from s_dept
;
select * from s_customer;
select * from s_region;
select * from s_dept;
select * from s_emp;

-- 각 부서(dept_id)별로 평균 급여(avg(salary))를 구하라 , 대신 평균 급여가 2000이상인 부서만 나타내시오
select * from s_emp;

select name , avg(salary)
from s_dept
where avg(salary) >= 2000
group by name  -- 에러 왜  ? where대신 having 써야한다? group으로 한 각 부서의 평균급여를 구하니 having 사용 ?
; 

select * from s_dept;

select name , avg(salary)
from s_dept
group by name
having avg(salary) >= 2000
;-------------------having 했는데 또 왜 안되는걸까?
-------------------- dept 테이블 내에 avg(salary) 정보를 끌어올수 없어서 ?                  
------------ avg(salary)를 쓰려면 s_emp 테이블 써야하는데 부서 이름name 을 조회 해달라해서 ?
-----------------------s_ emp에서 name은 사람 이름이니 문제고 ...


select dept_id , avg(salary)
from s_emp
group by dept_id
having avg(salary) >= 2000
;

select *
from s_dept
;

select *
from s_emp
;

-- having 절 사용 예제
-- 직급별로 평균 연봉 몇명인지 조회
select title, avg(salary) , count(*)
from s_emp
group by title
-- having count(*)>2 -- 2명 이상인 사람만 볼수있는 조건식
; -- 조건 없이 전부다 조회


select *
from s_dept
;

-- 각 직책(title)별로 급여의 총합sum(salary)을 구하라
-- 직책이 부장 (title != '부장') 인 사람은 제외
-- 급여의 총액이 8000이상인(sum(salary)) 직책만 나타내며 
-- 급여 총합에 대해 오름차순(order by )으로 정렬하시오 
select * 
from s_emp
;
select title, sum(salary) 
from s_emp
--where title not like '%부장'
group by title
-- having title not like '%부장'
having sum(salary) >= 8000
order by sum(salary)
;

-- 각 부서별(dept_id)로 직책(title)이 사원인 직원들에 대해 평균급여 avg(salary)를 구하라

select * from s_customer;
select * from s_region;
select * from s_dept;
select * from s_emp;

select dept_id, avg(salary)
from s_emp
where title = '사원'
group by dept_id
;