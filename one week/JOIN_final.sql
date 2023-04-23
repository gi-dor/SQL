-- JOIN ?
하나 이상의 테이블로부터 관련된 데이터를 검색오는 방법
보통 PK와 FK 값의 연관해서 성립된다
PK FK 관계없어도 논리적으로 값의 연관이있다면 JOIN 성립됨

PK ? table에서  각 row(행)을 식별하기위해 사용하는 컬럼 혹은 컬럼의 조합
    예를 들면 customer table에서 고객의 id값을 pk로 설정해 각 row(행)을 식별할수 있음
    
FK ? 다른 table과 관계를 맺기 위한 column 
    다른 테이블의 PK를 참조함  다른테이블과의 관계설정 , 데이터 검색등을함 
    참조하는PK와 데이터 타이빙 일치해야하고 참조하는PK와 값이 일치 해야함

행- row ? table에서 ㄱ가로방향으로 구성된 데이터 단위
    하나의 레코드를 나타냄 , 예를들면 s_customer table에서 한행은 하나의 고객정보를 뜻함
    A,B,C라는 사람이있고 그것을 human이라는 table로 지정할시 
    A라는 사람의 모든정보(여러 column으로 구성됨) 
    각 column(열) 이름,나이,성별,몸무게,키 등등
    
열 column ? s_emp table에서 name에 대한 모든정보들 
    s_customer table에서 각 정보라고 생각하면 편함
    이름, 전화번호, 주소 ,거주지역 등등
    데이터 베이스에서 세로 정보로 생각하면 편하다
    
레코드 ? column 행이랑 같은말, 쉽게 설명하면 s_customer table에서 하나의 레코드는
    한명의 고객의 모든정보를 뜻함

select * from s_customer;
select * from s_ORD;
select * from s_Emp;
select * from s_dept;

진짜 이제 부터 JOIN 시작..

--1.EQUI JOIN 
--column 간의 값들이 서로 정확히 일치하는 경우에 사용 PK,FK 관계에 의함
--JOIN시 where 사용

select *from s_Emp;
select * from s_dept;
select * from s_customer;

select e.name, e.start_date , e.title, d.name 부서 
from s_emp e, s_dept d
where e.dept_id = d.id
order by 2 desc -- 2번 컬럼 내림차순 정렬
;

--고객이름 고객주소 판매자사원이름 판매자 사번
select c.name 고객이름 ,c.address 고객주소, e.name "판매 사원이름" , e.id 사번 
from s_emp e , s_customer c
where e.id = c.sales_rep_id
order by 1 --1번 컬럼 오름차순 정렬
;

select * from s_Emp; -- 두 테이블 조회해서 pk fk 찾기
select * from s_dept;
select * from s_region; -- 서울이 몇번인지 확인

--사원의 이름과 부서 부서명
select e.name 이름, e.dept_id 부서 , d.name 부서명
from s_emp e , s_dept d
where e.dept_id = d.id
order by 2
;

--서울 지역에 근무하는 직원에 대한 이름과 근무하는 부서명
select e.name , d.name , d.region_id "서울이라면 1"
from s_emp e , s_dept d
where e.dept_id = d.id
and d.region_id = 1
;

--2. NON EQUI JOIN
--각 사원에 대한 급여와 (e.salary) 급여등급이 알고싶다
--각 테이블의 급여와 급여등급의 값이 일치하는 데이터가 없어서 = 연산자로 JOIN할수 없어서
--NON _EQUI_JOIN 을 쓴다

--사원에 대한 급여와 급여에대한 등급
select e.name 이름 ,e.salary 급여 ,g.grade 등급
from s_emp e , salgrade g
where e.salary between g.losal and g.hisal
;

select * from s_emp;
select * from salgrade;

--
--3. OUTER_JOIN
--OUTER_JOIN은 (+) 연산자 사용
--(+) 사용할 위치는 where절에서
--JOIN할 데이터가 부족한쪽에 // where할때 양쪽 다 한번씩 집어넣고 출력하셈
--in,or 사용금지
--
--판매사원의 이름과 사번 , 담당고객의 이름, 전화번호를 출력
--담당 사원이 없는 경우도 출력 사번순으로 오름차순;

select * from s_emp;
select * from s_customer;

select e.name , e.id , c.name ,c.phone
from s_emp e , s_customer c
where e.id(+) = c.sales_rep_id 
order by e.id      
;
--(+) 안쓰면 고객 15명중 14명만 출력됨

--판매 사원의 이름과 사번, 담당 고객의 이름을 출력하되
--담당고객이 없어도 사원의 이름을 출력하라

select e.name 판매사원 , e.id 사번 , c.name 고객
from s_emp e , s_customer c
where e.id = c.sales_rep_id(+)
;

4)SELF JOIN
하나의 테이블을 여러개인거마냥 쓰는것
테이블에 대한 alias 을 다르게 써야함
컬럼의 이름 앞에 alias 붙여야함

select * from s_emp;

사원의 이름과 사번 , 부서장의 이름과 부서장 사번
select e.name 이름 , e.id 사번 , m.name , m.id "담당부서장 사번"
from s_emp e , s_emp m
where e.manager_id = m.id
;

-- 김정미와 같은 직책을 가지는 사원의 이름과 직책 급여 부서번호를 나타내시오
select m.name , m.title , m.salary , m.dept_id
from s_emp e , s_emp m
where e.name = '김정미' .

and e.title = m.title  -- 이름은 김정미 이고 김정미에 직책과 같은 직책
;

select * from s_emp;


SET 연산자
1 ) UNION 각 QUERY 결과의 합집합
2 ) UNION ALL 각 QUERY결과의 합집합 + 공통부분
3 ) INTERSECT 각 QUERY 결과의 교집합 (겹치는부분)
4 ) MINUS 첫번째 QUERY결과와 두번째 QUERY 결과의 차집합 (A-B)

select name ,dept_id , title
from s_emp
where dept_id = 110
UNION
select name , dept_id , title
from s_emp
where dept_id = 113;


