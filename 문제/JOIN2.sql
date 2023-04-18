
NON EQUI JOIN

각 사원에 대해 급여와 급여등급을 출력
이런경우 사원의 급여랑 급여 등급이 일치하지 않아서 =연산자로 Join 할수 없어서 


직원 테이블 과 급여테이블을 JOIN 해서 사원의 이름과 급여,급여등급을 출력
select *from s_Emp;
select * from salgrade;

select e.name , e.salary , g.grade
from s_emp e , salgrade g
where salary between losal and hisal
;

--OUTER JOIN 
--(+) 연산자를 사용, 위치는 JOIN할 데이터가 부족한 쪽에 위치함
--where 절에서 비교연산자 기준으로 좌측 , 우측 어느 한쪽에 쓰임
--OUTER JOIN에서 IN 이나 OR 사용 할수 없음
--
--사원의 이름 , 사번 , 사원의 담당고객을 나타내시오
--고객을 담당한 사원이 없더라고 모든 고객의 이름을 나타내고 
--사번순으로 오름차순으로 정렬

select * from s_emp;
select * from s_customer;

select e.name 사원 , e.id 사번 , c.name 고객이름
from s_emp e , s_customer c
where e.id (+)= c.sales_rep_id
order by 2 
;

-- set 연산자 예시
select name , dept_id , title
from s_Emp
where dept_id =110
union
select name , dept_id , title
from s_emp
where dept_id = 113
order by 1
;

select name , title , dept_id 
from s_emp
where dept_id = ( select dept_id
                    from s_emp
                    where name = '김정미' );

--
select dept_id 
from s_emp
where name = '김정미'
;

----------------------

--multi row subquery 
--main query 로 전달되는 행이 여러개인경우
------------------------------------------------
select * from s_dept;
select * from s_region;

select id 
from s_dept
where region_id = 3;

select name, dept_id
from s_emp
where dept_id in (select id 
                  from s_dept 
                  where region_id = 3);