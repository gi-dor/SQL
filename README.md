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
    
     
     
    

    
