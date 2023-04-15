--23.04.15 예제 복습하기
-- '사원'의 이름과 직급 부서 연봉 조회
select name as 이름 ,title as 직급 , dept_id 부서
from s_emp
where title = '사원'
;
select name , title, dept_id
from s_emp
where title like '사원'
;

-- 근무자의 이름 , 직급 , 연봉 , 보너스 (연봉5배)
select name 이름 ,title 직급, salary 연봉 , salary*5 as 보너스
from s_emp
;
-- 근무자의 이름 ,직급, 연봉 , 보너스 (연봉5배) '사원만'
select name 이름 ,title 직급 , salary 연봉 , salary * 5 보너스
from s_emp
where title like '사원'
;
-- 근무자의 이름 , 직급 ,연봉 , 보너스 (연봉5배) '과장만'
select name 이름 , title 직급 , salary 연봉 , salary*5 보너스
from s_emp
where title = '과장'
;
--합성 연산자 || 이용해서 '이름 직급'으로 출력
select name || ' ' || title 
from s_emp
;
select name || '  '|| title "이름          직급"
from s_emp
;

--연봉이 500 ~2500 인 사람의 이름과 직급을 표기 하시오 , 단 사원만
select name , title , salary
from s_emp
where title = '사원'
and salary between 500 and 2500
;
-- 연봉이 500 ~3000인 사람의 이름과 직급 오름차순으로 조회
select name , title , salary
from s_emp
where salary BETWEEN 500 and 3000
order by salary
;
-- 연봉이 1500 이상인 사람의 이름과 연봉 직급을 조회하시오
select * from s_emp;  -- 연봉 구간 보려고 전체 조회함
select name , salary , title
from s_emp
where salary >= 1500
;
-- 연봉이 2000 이상인 사람의 이름과 직급 부서 연봉 조회
select name , title , dept_id , salary
from s_emp
where salary >= 2000
;
-- 입사 날짜가 16/12/31 이전에 입사한 사람의 이름과 직급 입사 날짜 를 출력
select name , title , start_date
from s_emp
where start_date <= '16/12/31'
;
-- 입사 날짜가 15/12/31 이후에 입사한 사람의 이름과 직급 입사 날짜 조회
select name 이름, title 직급 , start_date "입사 날짜"
from s_emp
where start_date >= '15/12/31'
;

-- 이름과 직급 부서 를 조회 하는데 부서가 110 ,113인 사람만 조회 
select name 이름 , title 직급 , dept_id 부서
from s_emp
where dept_id in(110,113)
;

-- 이름과 직급 부서 조회 부서가 110 , 113, 111 인 사람만조회
select name , title , dept_id
from s_emp
where dept_id in(110,113,111)
;
-- 이름과 직급 부서 조회 부서가 110 , 113, 111 인 사람만조회 하는데 '사원만'
select name , title , dept_id 
from s_emp
where dept_id in (110 , 113, 111)
and title = '사원'
;
-- 이름 입사 날짜 직급을 조회 하는데 입사날짜에 17일에 입사한 사람만
select name ,title , start_date
from s_emp
where start_date like '%17%'
;
-- 이름 ,입사 날짜 ,직급 ,부서 조회 하는데 입사날짜에 17일에 입사한 사람, 단 '사원만'
select name , start_date ,title, dept_id
from s_emp
where start_date like '%17%'
and title = '사원'
;
-- 각 부서별 평균급여를 계산해서 조회
select dept_id ,avg(salary)
from s_emp
group by dept_id
;
-- 각 부서별로 직급이 사원인 사람들의 평균 급여를 조회해줘
select dept_id , avg(salary) "부서내 사원연봉"
from s_emp
where title = '사원'
group by dept_id
;

-- 각 부서별로 직급이 과장인 사람들의 평균 급여
select dept_id , avg(salary)
from s_emp
where title = '과장'
group by dept_id
;

-- 각 지역별로 몇개의 부서가 있는지 조회
select * from s_region;
select * from s_emp;
select * from s_dept; -- 1번지역에 부서 4개, 2번부서 2개있는거 확인

select region_id , count(name)
from s_dept
group by region_id
;

-- 각 부서별로 평균 급여를 구하라 , 평균 급여가 2000이상인 부서만 나타내줘
select dept_id , avg(salary) 
from s_emp
group by dept_id
having avg(salary) >= 2000
;

-- 각 직책별로 급여의 총합을 구하되 직책이 부장인 사람은 제외
select title , sum(salary)
from s_emp
group by title
having title not like '%부장'
;
-- 단 급여의 총합이 8000 이상이 직책만 나타내고 급여 총합에 대해 오름차순으로 정렬
select title , sum(salary)
from s_emp
group by title
having title not like '%부장'
and sum(salary) >= 8000
order by sum (salary)
;
-- 각 부서별로 직급이 사원인 사람들에 대해 평균 급여를 구해줘
select dept_id 부서 , avg(salary) 급여평균
from s_emp
where title = '사원'
group by dept_id
;

-- 각 부서(dept_id)내에 직급별title 로 몇명의 인원count이있는지 나타내시오
select dept_id , title , count(*)
from s_emp
group by dept_id ,title
;

-- 각 부서내의 몇명의 직원이 근무하는지 조회
select dept_id , count (*)
from s_emp
group by dept_id
;
-- 각 부서별dep_id로 급여의 최소값 min(salary)과 최대값을 max(salary) 나태내줘
select dept_id , min(salary) , max (salary)
from s_emp
group by dept_id 
;
-- 각 부서별로 급여의 최소값과 최대값을 나타내주고 , 최소값과 최대값이 같은 부서는 출력하지마

--select dept_id , min (salary) , max (salarty)
--from s_emp
--where min(salary) != max(salary)
--group by dept_id
----;  에러 
-------------------------------------------
-- max (salarty) 오타 => max (salary)
-- min , max는 having 절로 가야함 왜?
-- where은 true false 만 구분함

select dept_id , min(salary) , max(salary)
from s_emp
group by dept_id
having min (salary) != max (salary)
;