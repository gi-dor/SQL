select * from SUB_PARTY;

insert into  sub_party values('활쏘는 박씨' ,'궁수', '딜러', 3 , 2000 ); 
insert into  sub_party values('검쓰는 김씨', '검방기사' ,'탱커', 4 , 1000 );
insert into  sub_party values('2서클 한씨','마법사', '딜러', 2 , 5000 );
insert into  sub_party values('힐쓰는 노씨','사제' '힐러', 1 , 10000 );
insert into  sub_party values('왈패 정씨','몽크', '탱커', 4 , 1500 );

-- 데이터 부분 입력
insert into sub_party(name , tier)
values('추적자' , 0 );

insert into sub_party (name , job , position , tier)
values ( '테이머' ,'진짜_테이머' , '서브탱커' ,0.5 );

-- 데이터 수정
update sub_party
set name = '가짜 테이머' , tier = 2

where name = '테이머';


update sub_party 
set job = '만류귀종' , position = '진짜 짱쎈 추적자'
where name = '추적자';
-- 스페이스바 공백도 되는걸 확인했음 



-- 데이터 삭제 
-- 삭제를 위해 데이터 하나를 삽입
insert into  sub_party values('사실은 강한 정씨','몽크', '탱커', 1 ,10000);

delete from sub_party
where price = 10000;

-- 데이터 검색

select name
from sub_party;


-- 전체 데이터의 검색
select * from sub_party;

-- 특정 칼럼의 검색
select name , job , tier
from sub_party;

select name ,name , job , price
from sub_party;

--
