# SQL

-----

oracle db

oracle SQL

-----------


## 테이블 생성 

    CREATE TABLE emp
    ( 
    id  naumber (5),
    name  char (25),
    salary number (7,2),
    title char (25) default '사원' ,
    in_date date  default sysdate ,
    dept_name char (25)
    );
    
    create table 테이블이름
    ( 칼럼이름1 data type  default형식,
      칼럼이름2 data type default형식
      );
      

------------------

## sql 명령어 기본

* 데이터 검색 , 조회

   select
 
* 데이터 조작어 
 
   insert , update , delete
 
* 데이터 정의어 - 데이터 구조변경
  
  create , alter , drop , rename , truncate , comment
  
## 데이터 조작어 설명
  
  * insert - 테이블에 새로운 행 삽입  -  입력되는 행은 보통 테이블 맨 마지막 행
  * update - 테이블에 있는 행을 변경
  * delete - 테이블로부터 행을 삭제

## 데이터 입력 insert

    insert into 테이블 이름 ( 컬럼1 , 컬럼 2, 컬럼3 ...)
    values ( 값1 , 값 2 , 값3....);
      
    
    insert into emp  ( id , name )
    values (26, '기선' );
    
    insert into emp ( 28, '기선2', 'gidor' , 30 );
    
## 데이터 수정 update

    update 테이블 이름
    set 칼럼1 = 값1 
    where 조건식
    ;
    
    update emp
    set name = '한기선1'
    where name = '한기선'
    ;
    
## 데이터 삭제 delete

    delete from  테이블이름
    where  조건식 ;
    
    delete from sub_party
    where price = 10000 
    ;
    
--------   
    
## select구문의 기본문법

    select (distinct) 컬럼이름 (alias)
    from 테이블 이름;
 
select - 검색하고자 하는 컬럼 나열

distinct - 중복핵 제거

alias - 컬럼 별명만들기

from  - 선택한 컬럼이 있는 테이블
---


#### 전체데이터 검색
     select * from s_emp;

#### 특정 칼럼의 검색
    select name , title , date 
    from s_emp;
    
#### 산술식을 이용한 검색
    select name , title , salary *10 , salart *18
    from s_emp;
    
#### 컬럼에 alias 부여
    select name , salary*10 as '연봉10배'
    from s_emp;

#### 컬럼의 합성
    select name || ' ' || title
    from s_emp;
    
#### 정렬순서 지정
    select 컬럼1, 컬럼2 , 컬럼3
    from 테이블이름
    order by 컬럼 asc 또는 desc
    
    --  asc : 오름차순 정렬
    --  desc: 내림차순 정렬
        
#### 특정 행의 검색 - where
    select 컬럼이름 , 컬럼이름2 , 컬럼이름3 
    from 테이블이름
    where  조건식
    order by 컬럼1
    ;
    
#### where 절에 사용되는 연산자
    where 형식 연산자 값
    
    where title = '사원'
    where salary between 1000 and 2000
    
#### 조건의 부정

1 ) 논리 비교 연산자  :  !=  , <>

2 ) SQL 비교 연산자 : not in , not like , is not null 
    not in (x,y)  --- x,y 아닌것
    not like '사원' --- 사원 빼고
    is not null -- null 이 아닌 값을 검색
    
#### 비교연산자 사용예시 
    
    select name , salary
    from s_emp
    where salary >= 2000
    ;
    
    
    select name , date,dapt_id
    from s_emp
    where date < '16/12/31'
    '
    
    select name , salary 
    from s_emp
    where salary between 1000 and 2000
    ;
    
    select name , title , dept_id
    from s_emp
    where dept_id in (110,113)
    ;
    
    select name , date, title
    from s_emp
    where date like '%17%'
    ;
