-- 부서별 평균 급여
select * from s_emp;

select dept_id, avg(salary) from s_emp 
where title = '사원'
group by dept_id
order by dept_id
;

---select절에서 group 함수 잘못된사용
-- 각 지역별 (region)으로 부서 (dept_id)가 몇개인지 나타내시오
select region_id , count(id) from s_dept
group by region_id
order by region_id;


--- 각 부서별로(dept_id) 평균 급여 avg(salary)를 구하는데 평균 급여가 2000 이상
select dept_id ,avg(salary) 
from s_emp  ----- 1번
group by dept_id  --- 3 번
having  avg(salary) >= 2000 ---- group 조건식 
--- having dept_id = 101 and avg(salary) >= 2000
order by dept_id
;

--- 각 직책 별 (title)로 급여의 총합 sum(salary)을 구하되, 직책이 부장 이상은 제외
--- 급여 총합이 8000 이상인 sum(salary) >= 8000 직책만 나타내며 
--- 급여 총합에 대한 오름차순으로 정렬
select *
from s_emp
where title not like '%부장'
group by title
having sum (salary)>=8000
order by sum
;


select * from s_emp
where title not like '%부장'
group by title --- 각 직책 title 별로 
having sum (salary) >= 8000 --- sum (salary) >= 8000
;






