select * from s_emp;

-- 정렬한 결과에서 하위 10명 조회
-- 1. 정렬
-- 2. 하위 10명 조회

-- 10명조회
select * 
from s_emp 
where rownum between 1 and 10;

-- 에러 구절순서 때문
select * 
from s_emp
order by start_date desc
where rownum between 1 and 10;

select * 
from (  select * 
        from s_emp 
        order by start_date desc)
where rownum between 1 and 10;


--- 연봉 2000 이상인 사람만 조회
select * from s_emp
where salary <= 2000;

-- 직원 평균 연봉 구하라
select avg(salary)
from s_emp
;

-- 부서별 평균 연봉
select dept_id , avg(salary)
from s_Emp
group by dept_id
;

-- 평균 연봉 그 이상인 사람
select * 
from s_emp
where salary >= ( select avg(salary)from s_emp)
;
-------------------------------------------------------------
-- Single Row SubQUERY
-- '김정미'와 같은 부서의 사람들 이름과 직급 부서번호

select * from s_emp;

select name , title , dept_id
from s_emp
where name = '김정미';


select name , title , dept_id
from s_emp
where dept_id = (select dept_id 
                    from s_emp
                     where name = '김정미');

select m.name , m.title , m.dept_id
from s_emp e , s_emp m
where e.name = '김정미'
and e.dept_id = m.dept_id
;


select name , title, salary , dept_id
from s_emp
where dept_id  = ( select dept_id
                     from s_emp
                      where dept_id = 110);
--  에러:  단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.                   
-- 메인문장으로 넘어가는 행이 여러개라서 뜨는 에러 라고함

select dept_id from s_emp where dept_id =110;
-- dept_id = 110 4개 행인가 확인

-- 해결방법
select name , title , salary , dept_id
from s_emp
where dept_id = (select distinct dept_id
                    from s_emp
                    where dept_id = 110);
-- distinct 사용해서 중복행 제거 해서 
-- 메인쿼리로 넘어가는 행이 1개만 발생하게했음

select distinct dept_id
                    from s_emp
                    where dept_id = 110;
---------------------------------------------------  

--Multi ROw Sub QEUERY
-- 전달되는 행이 여러개


select * from s_emp where dept_id = 103 and dept_id = 111;
-- 왜 출력안함 ?
--dept_id가 103 그리고 111인 행이 없음

-- 해결방법 and 대신 OR 사용
select * from s_emp where dept_id = 103 or dept_id = 111;


-- 지역번호(region_id)가 3인 부서번호(dept_id)를 조회
select * from s_dept;
select * from s_dept where region_id = 3;
-- 지역번호 3인(region_id = 3) 부서(dept_id)에 속한 직원들에 이름과 직급 부서번호 연봉을 조회

select e.name, e.title, e.dept_id, e.salary
from s_emp e
where e.dept_id in (select id
                    from s_dept
                    where region_id = 3);
                    
-------------------------------------------------------------------------------
-- Multi column SubQuery
-- where에서 비교하는 컬럼이 2개
select * from s_emp;
select name , dept_id ,title from s_emp where dept_id =111;

select e.name, e.title, e.dept_id,d.name
from s_emp e , s_dept d
where e.dept_id = d.id 
and (e.name ,e.dept_id) in (select name, dept_id
                    from s_emp
                    where dept_id = 111 or dept_id = 106);
--- 에러                  
-- 1. 관계 연산자가 부적합합니다
-- and (e.name ,e.dept_id) in () 로 묶어줘야한다고함
-- e.name , e.dept_id가 각각 개별적인 조건으로 해석

-- 2. 수치가 부적합합니다
--  and (e.name ,e.dept_id) in (select dept_id,name
-- 순서가 바뀌어서 에러

-------------------------------------------------------------------
-- 이름 부서번호 직급 연봉 조회
-- 단 각 부서별 최소 연봉자만 

-- 1. 부서별 최소 연봉금액
select min(salary),dept_id
from s_Emp 
group by dept_id
order by dept_id;

-- 2. 이름 , 부서, 직급 , 연봉
select e.name , e.title , e.salary , e.dept_id ,d.name
from s_emp e, s_dept d
where e.dept_id = d.id
and (salary , dept_id) in (select min(salary),dept_id
                                    from s_Emp 
                                    group by dept_id
                                    )
order by dept_id;       

select * from s_emp;
select * from s_dept;
------------------------------------------------------------------------

                            
                            