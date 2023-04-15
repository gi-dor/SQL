--23.04.15 ���� �����ϱ�
-- '���'�� �̸��� ���� �μ� ���� ��ȸ
select name as �̸� ,title as ���� , dept_id �μ�
from s_emp
where title = '���'
;
select name , title, dept_id
from s_emp
where title like '���'
;

-- �ٹ����� �̸� , ���� , ���� , ���ʽ� (����5��)
select name �̸� ,title ����, salary ���� , salary*5 as ���ʽ�
from s_emp
;
-- �ٹ����� �̸� ,����, ���� , ���ʽ� (����5��) '�����'
select name �̸� ,title ���� , salary ���� , salary * 5 ���ʽ�
from s_emp
where title like '���'
;
-- �ٹ����� �̸� , ���� ,���� , ���ʽ� (����5��) '���常'
select name �̸� , title ���� , salary ���� , salary*5 ���ʽ�
from s_emp
where title = '����'
;
--�ռ� ������ || �̿��ؼ� '�̸� ����'���� ���
select name || ' ' || title 
from s_emp
;
select name || '  '|| title "�̸�          ����"
from s_emp
;

--������ 500 ~2500 �� ����� �̸��� ������ ǥ�� �Ͻÿ� , �� �����
select name , title , salary
from s_emp
where title = '���'
and salary between 500 and 2500
;
-- ������ 500 ~3000�� ����� �̸��� ���� ������������ ��ȸ
select name , title , salary
from s_emp
where salary BETWEEN 500 and 3000
order by salary
;
-- ������ 1500 �̻��� ����� �̸��� ���� ������ ��ȸ�Ͻÿ�
select * from s_emp;  -- ���� ���� ������ ��ü ��ȸ��
select name , salary , title
from s_emp
where salary >= 1500
;
-- ������ 2000 �̻��� ����� �̸��� ���� �μ� ���� ��ȸ
select name , title , dept_id , salary
from s_emp
where salary >= 2000
;
-- �Ի� ��¥�� 16/12/31 ������ �Ի��� ����� �̸��� ���� �Ի� ��¥ �� ���
select name , title , start_date
from s_emp
where start_date <= '16/12/31'
;
-- �Ի� ��¥�� 15/12/31 ���Ŀ� �Ի��� ����� �̸��� ���� �Ի� ��¥ ��ȸ
select name �̸�, title ���� , start_date "�Ի� ��¥"
from s_emp
where start_date >= '15/12/31'
;

-- �̸��� ���� �μ� �� ��ȸ �ϴµ� �μ��� 110 ,113�� ����� ��ȸ 
select name �̸� , title ���� , dept_id �μ�
from s_emp
where dept_id in(110,113)
;

-- �̸��� ���� �μ� ��ȸ �μ��� 110 , 113, 111 �� �������ȸ
select name , title , dept_id
from s_emp
where dept_id in(110,113,111)
;
-- �̸��� ���� �μ� ��ȸ �μ��� 110 , 113, 111 �� �������ȸ �ϴµ� '�����'
select name , title , dept_id 
from s_emp
where dept_id in (110 , 113, 111)
and title = '���'
;
-- �̸� �Ի� ��¥ ������ ��ȸ �ϴµ� �Ի糯¥�� 17�Ͽ� �Ի��� �����
select name ,title , start_date
from s_emp
where start_date like '%17%'
;
-- �̸� ,�Ի� ��¥ ,���� ,�μ� ��ȸ �ϴµ� �Ի糯¥�� 17�Ͽ� �Ի��� ���, �� '�����'
select name , start_date ,title, dept_id
from s_emp
where start_date like '%17%'
and title = '���'
;
-- �� �μ��� ��ձ޿��� ����ؼ� ��ȸ
select dept_id ,avg(salary)
from s_emp
group by dept_id
;
-- �� �μ����� ������ ����� ������� ��� �޿��� ��ȸ����
select dept_id , avg(salary) "�μ��� �������"
from s_emp
where title = '���'
group by dept_id
;

-- �� �μ����� ������ ������ ������� ��� �޿�
select dept_id , avg(salary)
from s_emp
where title = '����'
group by dept_id
;

-- �� �������� ��� �μ��� �ִ��� ��ȸ
select * from s_region;
select * from s_emp;
select * from s_dept; -- 1�������� �μ� 4��, 2���μ� 2���ִ°� Ȯ��

select region_id , count(name)
from s_dept
group by region_id
;

-- �� �μ����� ��� �޿��� ���϶� , ��� �޿��� 2000�̻��� �μ��� ��Ÿ����
select dept_id , avg(salary) 
from s_emp
group by dept_id
having avg(salary) >= 2000
;

-- �� ��å���� �޿��� ������ ���ϵ� ��å�� ������ ����� ����
select title , sum(salary)
from s_emp
group by title
having title not like '%����'
;
-- �� �޿��� ������ 8000 �̻��� ��å�� ��Ÿ���� �޿� ���տ� ���� ������������ ����
select title , sum(salary)
from s_emp
group by title
having title not like '%����'
and sum(salary) >= 8000
order by sum (salary)
;
-- �� �μ����� ������ ����� ����鿡 ���� ��� �޿��� ������
select dept_id �μ� , avg(salary) �޿����
from s_emp
where title = '���'
group by dept_id
;

-- �� �μ�(dept_id)���� ���޺�title �� ����� �ο�count���ִ��� ��Ÿ���ÿ�
select dept_id , title , count(*)
from s_emp
group by dept_id ,title
;

-- �� �μ����� ����� ������ �ٹ��ϴ��� ��ȸ
select dept_id , count (*)
from s_emp
group by dept_id
;
-- �� �μ���dep_id�� �޿��� �ּҰ� min(salary)�� �ִ밪�� max(salary) ���³���
select dept_id , min(salary) , max (salary)
from s_emp
group by dept_id 
;
-- �� �μ����� �޿��� �ּҰ��� �ִ밪�� ��Ÿ���ְ� , �ּҰ��� �ִ밪�� ���� �μ��� ���������

--select dept_id , min (salary) , max (salarty)
--from s_emp
--where min(salary) != max(salary)
--group by dept_id
----;  ���� 
-------------------------------------------
-- max (salarty) ��Ÿ => max (salary)
-- min , max�� having ���� ������ ��?
-- where�� true false �� ������

select dept_id , min(salary) , max(salary)
from s_emp
group by dept_id
having min (salary) != max (salary)
;