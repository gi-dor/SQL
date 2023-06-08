
select min(salary),dept_id 
from s_emp 
group by dept_id;

--From절에서 SubQuery
-- A라는 테이블의 데이터의 양이 많은 경우 from절에 테이블 전체를 기술하려 사용하면 효율이 떨어짐
-- 그래서 일부 행,컬럼을 선택해서 테이블을 만들어서 
-- from 절에서 SubQuery 로 효율 적인 검색이 가능 이것을 INLINE VIEW 라고함



-- 이름 부서명 , 직급 , 단 사원들만
select * from s_emp;
select * from s_dept;

-- 1. 테이블 전체 컬럼을 사용하기에 데이터 양이 많아서 효율 적이지 못하다고함
select e.name , e.title , d.name 
from s_emp e, s_dept d
where e.dept_id = d.id
and e.title = '사원';


-- 2. 일부 컬럼, 행을 선택해서 테이블 만들어서 사용 효율 굿
SELECT e.name 이름 , e.title 직급, d.name 부서
from
    (select name , title , dept_id
    from s_emp
    where title = '사원') e , s_dept d
where e.dept_id = d.id;


-- Hanving절에서의 SubQuery
select avg(salary) 
from s_emp
where dept_id = 113;

select dept_id , avg(salary)
from s_Emp
group by dept_id
having avg(salary) >  (select avg(salary) 
                        from s_emp
                        where dept_id = 113);

-- 가장 적은 평균 급여 (avg(salary))를 받는 직책(title)에 대해 
-- 그 직책과 평균 급여를 나타내시오

-- 직급별로 평균급여
select title ,avg(salary)
from s_emp
group by title
;
-- 제일적은 평균연봉
select min(avg(salary))
from s_emp
group by title
;
        
--
select title , avg(salary)
from s_emp
group by title
having avg(salary) = ( select min(avg(salary)) -- min(avg)는 
                        from s_emp
                        group by title);
                        

