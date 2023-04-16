--JOIN ?
--하나이상의 테이블로부터 연관된 데이터 검색하는 방법
--pk fk 로 연관되어 join
--pk fk 연관없어도 논리적인 값들의 연관으로도 join 가능
select * from e_emp;
select * from s_dept;
--equi join  
--컬럼 간의 값들이 서로 정확히 일치할경우 사용 

--직원 테이블 , 부서 테이블을 join  하여 사원의 이름과 부서 부서명을 나타내시오

select e.name , e.dept_id , d.name
from s_emp e , s_dept d
;

--- alias 
select e.name 이름 , e.dept_id 부서 , d.name 부서명
from s_emp e , s_dept d
;

--- non equi join
--한컬럼의 값이 다른 컬럼의 갑솨 정확히 일치하지 않는경우

--직원 테이블과 급여 테이블을 join 하여 
--사원의 이름과 급여 해당 급여등급을 나타내시오
select * from s_emp;
select * from salgrade;

select e.name , e.salary , g.grade
from s_emp e, salgrade g
where e.salary between g.losal and g.hisal
;

select e.name 이름 , e.salary 연봉 , g.grade 등급
from s_emp e , salgrade g 
where e.salary between g.losal and g.hisal
;



--- outer join 
--join 조건 만족하지않는경우 ㅡ 모든행들을 보려고 할때

--사원 이름 , 고객이름
select * from s_emp;
select *from s_customer;

select e.name "담당 직원" , c .name "고객 성명"
from s_emp e , s_customer c
where e.id (+)= c.sales_rep_id
;
--
--직원테이블과 고객 테이블에서 
--사원의 이름 name, 사번id  사원의 담당고객이름 customer.name 조회
--고객에 담당영업 사원이 없더라도 고객의 이름을 나타내고
--사번 순으로 오름차순으로 정렬

select * from s_emp;
select * from s_customer;

select e.id 사번 , e.name 이름, c.name  담당고객
from s_emp e , s_customer c
where e.id (+)= c.sales_rep_id
order by e.id
;

--self join
--하나의 테이블을 마치 여러개인거마냥 사용가능
--테이블에 대한alias는 다르게 설정
--컬럼이름앞에 테이블의 alias 써야함

select * from s_emp;

select s.id , s.name , e.manager_id , e.name 
from s_emp s , s_emp e
where s.manager_id = e.id
;

--직원중에 '김정미'와 같은 직책을 가지는 사원의 '이름'과 '직책' '급여' '부서번호'를 나타내시오
--self join 사용

select s.name 이름, s.title 직급, s.salary 연봉 , s.dept_id 부서번호 
from s_emp s, s_emp e
where s.title = e.title
and s.title = '과장'
;

SELECT s.name, s.title, s.salary, s.dept_id
FROM s_emp s , s_emp e
where s.title = e.title
and s.title LIKE '%과장%'
;

----------------------------

select name , dept_id , title
from s_emp 
where dept_id =110
union
select name , dept_id , title
from s_emp 
where dept_id =113
order by 1;

select name , dept_id , title
from s_emp 
where dept_id =110
union all
select name , dept_id , title
from s_emp 
where dept_id =113
order by 1;


select name , dept_id , title
from s_emp 
where dept_id =110
intersect
select name , dept_id , title
from s_emp 
where dept_id =113
order by 1;

select name , dept_id , title
from s_emp 
where dept_id =110
minus
select name , dept_id , title
from s_emp 
where dept_id =113
order by 1;

select name , title , dept_id
from s_emp 
where dept_id = (select dept_id 
                    from s_emp 
                    where name ='김정미');
                    
                    
select name , dept_id
from s_emp
where dept_id  in (select id 
                    from s_dept
                    where region_id =3);
                