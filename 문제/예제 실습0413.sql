select * from s_dept;
select * from s_emp;

-- group 을 subgroup으로 세분화 하기 
-- group by 절 이하에 group으루 나누고자 하는 칼럼을 
-- 여러개 씀 으로써 그룹을 세분화 할수 있다
select dept_id , title ,count(*)
from s_emp
group by dept_id,title
;

select dept_id , title
from s_emp
where dept_id = 118
;        -- 118번에 정말 2명있는지 확인하려고

-- 각부서내에서(dept_id), 각직책별로 (title) 몇명의 인원이(count(?)) 근무하는지 
select dept_id,title , count(*)   --일단 모르니 * 찍음
from s_emp -- s_emp에 정보가 title , dept_id 다있음
group by dept_id,title
;

-- 각 부서내에서 (dept_id), 몇명의 직원이(count()) 근무 하는지 
select dept_id, count(*)
from s_emp
group by dept_id
;

-- 각 부서별(dept_id)로 급여(salary)의 최소값(min(salary)) 과 최대값(max(salary))을 나타 내시오 
-- 최소값과 최소값이 같은 부서는 출력하지 마시오 having  not in (min,max)? 

select dept_id ,min(salary),max(salary)
from s_emp 
group by dept_id 
having (min(salary) != max(salary) )
;

select dept_id,min(salary),max(salary)
from s_emp 
group by dept_id
having (min(salary) = max(salary) )
;


