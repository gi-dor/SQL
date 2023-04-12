--1. 직책이 사원인 직원을 조회 하시오  사원조회
select *  -- 모든내용 조회
from s_emp
where title = '사원'
;

select name, title -- 이름과 직급만 조회
from s_emp 
where title = '사원';

-- 연봉이 3000인 직원을 조회 하시오 
select *
from s_emp
where salary = 3000
;
-- 부서가 113인 직원 이름과 부서, 직책을 조회
select name , dept_id ,title
from s_emp
where dept_id = 113;

-- 직책이 영업대표이사 이고  연봉이 4000인 직원을 조회
select* 
from s_emp
where title = '영업대표이사' and salary = 4000
;
-- 직책이 영업대표이사 , 연봉이 4000 인 사람을 이름과 입사날짜, 직책, 연봉 조회 
select name , start_date , title , salary
from s_emp
where title = '영업대표이사' and salary = 4000
;
--select* 
--from s_emp 
--where salary && title  = 4000 && '영업대표이사';

-- 직책이 사원이고 부서가 100인 직원을 조회
select *  
from s_emp
where title = '사원' and dept_id = 110
;
-- 이름과 부서 번호 연봉 조회
-- 부서가 113이고 연봉이 2300 인사람
select name , dept_id , salary
from s_emp 
where dept_id = 113 and salary = 2300
;

-- 연봉이 2000 ~ 3000 사람을 내림차순으로 조회
select * 
from s_emp
where salary between 2000 and 3000
order by salary desc
;

-- 연봉이 2000 ~ 4000인 사람 중 직책과 연봉조회
select title, salary
from s_emp 
where salary between 2000 and 4000 
group by title, salary
;

-- 연봉이 300 ~1500 인 사람중 직책이 사원인데
-- 직책과 이름 연봉만 조회
select title, name, salary
from s_emp
where salary between 300 and 1500 and title = '사원'
;
-- 모든정보 조회
select * 
from s_emp
where salary between 500 and 1000 and title = '사원'
;


select *
from s_emp 
where title = '%부장%'
;
