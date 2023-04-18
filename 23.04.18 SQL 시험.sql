------ ���� --------

--1. �� �μ��� (s.emp.dept_id)��� �޿� (avg(salary)) �� ���϶�, 
-- ��� �޿��� 2000�̻��� �μ��� ��Ÿ����
select * from s_emp
order by dept_id ;

select dept_id , avg(salary)
from s_emp
group by dept_id
having avg(salary)>= 2000 -- �׷쿡 ���� ����
order by 2 desc
;
------------------------------------------------------------------------
--2. �� ��å ���� (title )�޿��� ���� sum(salary)�� ���϶� , 
-- ��å�� ����� ����� ���� (title <> '���')
--�޿��� ������ 3000 �̻���(sum (salary) >= 3000) ��å(title)�� ��Ÿ����  
--�޿��� ���տ� ���� �������� sum(salary) desc

select title ,sum(salary)
from s_Emp
where title <> '���'   -- <> , != ��� // not like�� ������ ����
group by title
having sum (salary) >= 3000
order by 2 desc
;


--3. ������(title) ������ ����� 2�� ������ �μ���(dept_id) ����� ��Ÿ���� select���� �ۼ�
-----------------------------------------------------------------------------
select dept_id , count(*) 
from s_Emp
where title like '%����%'
group by dept_id
having count(*) <= 2
;

select count(*)
from (select dept_id , count(*) 
from s_Emp
where title like '%����%'
group by dept_id
having count(*) <= 2 )
;

    -- ���� --
-----------------------------------------------------------------------------

--4.��������� (sales_rep_id)�������� ���� ��(s_customer.name)�� 
--��� ��Ÿ���� select�� �ۼ�

select * 
from s_Emp e , s_customer c
where e.id(+) = c.sales_rep_id
;

select c.name
from s_Emp e , s_customer c
where e.id(+) = c.sales_rep_id
and e.name is null
;


select e.name ����� , c.sales_rep_id "���ID" ,c.name ������
from s_emp e, s_customer c
where e.id (+)= c.sales_rep_id
and sales_rep_id = 0
;

select * from s_emp;
select *from s_customer;

----------------------------------------------------------
-- 5. PK�� FK �� ���� �����ÿ�
-- PK - �� ���� �����ǰ� ���ִ� �÷� 
-- FK - �ٸ� ���̺��� PK , PK��  ���� ���� ����Ұ� , ���� ���Ἲ

-- PK �� ���� �����ϴ�
------------------------------------------------------------------------------
--6. CONSTRINT ������ ��� �����ÿ�
pk not null , unique , fk , check


--7. �ڵ����� ������ ���ڰ��� �������ָ� �ַ� �⺻Ű ���� �����ϱ� ���� ��� �ϴ� Object�� ?
-- ������

-----------------------------------------------------------

--8.��ü ����(s_emp)�� ������(salary) ���� ���� ��� 3���� �̸�(name)�� ����(salary)�� 
--���

select * from (select name  , salary
from s_Emp
order by salary desc
) t
where rownum <= 3    --- 
;

--�ڱ���	5000
--������	3500
--��ɼ�	3200

----------------����-------------

--9. �ε����� �����ϱ����� ������ ��츦 ��� ���ÿ�
--�������̳� ���ο��� ���� ���Ǵ� �÷�
--�÷��� ���� ������ ���� ������
--null ���� ���� �÷�
--���̺� �����Ͱ� ���� ��ȸ�Ǵ� ���� ��ü�� 10 ~ 15 % �϶�
--------------------------------------------------------------------------------

--10. �Ʒ� sql ���� ��ȿ�����̴� NOT EXISTS ����ؼ� ȿ�������� �ۼ��Ͻÿ�
select id , name , title 
from s_emp e
where e.title <> '���'
;


select id , name , title 
from s_Emp e
where not EXISTS (
select * from s_emp
where e.title = '���')
;
