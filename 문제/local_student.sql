select * from SUB_PARTY;

insert into  sub_party values('Ȱ��� �ھ�' ,'�ü�', '����', 3 , 2000 ); 
insert into  sub_party values('�˾��� �达', '�˹���' ,'��Ŀ', 4 , 1000 );
insert into  sub_party values('2��Ŭ �Ѿ�','������', '����', 2 , 5000 );
insert into  sub_party values('������ �뾾','����' '����', 1 , 10000 );
insert into  sub_party values('���� ����','��ũ', '��Ŀ', 4 , 1500 );

-- ������ �κ� �Է�
insert into sub_party(name , tier)
values('������' , 0 );

insert into sub_party (name , job , position , tier)
values ( '���̸�' ,'��¥_���̸�' , '������Ŀ' ,0.5 );

-- ������ ����
update sub_party
set name = '��¥ ���̸�' , tier = 2

where name = '���̸�';


update sub_party 
set job = '��������' , position = '��¥ ¯�� ������'
where name = '������';
-- �����̽��� ���鵵 �Ǵ°� Ȯ������ 



-- ������ ���� 
-- ������ ���� ������ �ϳ��� ����
insert into  sub_party values('����� ���� ����','��ũ', '��Ŀ', 1 ,10000);

delete from sub_party
where price = 10000;

-- ������ �˻�

select name
from sub_party;


-- ��ü �������� �˻�
select * from sub_party;

-- Ư�� Į���� �˻�
select name , job , tier
from sub_party;

select name ,name , job , price
from sub_party;

--

select * from s_emp;

select 1 , 'abc', sysdate from dual ;  --printf("%d , %s ,%s", 1 , "abc" , sysdate)

select 1+2 , 'abc', sysdate from dual ;

select length ('�ѱ⼱') from  dual; 
select round from  (12.34567 ,3 ) ;
select sysdate -1 from dual;
select trunc (sysdate , 'month' ) from dual; -- 23 /04/01
select trunc (sysdate , 'month' ) -1 from dual; -- 23/03/31

select '123' - 1 from dual;  
select to_number('123') -1 from dual;
select to_char(300000, '$999,999' ) from dual;
select to_date ('10 9�� 1992' , 'dd month yyyy') from dual; --- ����