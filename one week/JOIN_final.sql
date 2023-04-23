-- JOIN ?
�ϳ� �̻��� ���̺�κ��� ���õ� �����͸� �˻����� ���
���� PK�� FK ���� �����ؼ� �����ȴ�
PK FK ������ �������� ���� �������ִٸ� JOIN ������

PK ? table����  �� row(��)�� �ĺ��ϱ����� ����ϴ� �÷� Ȥ�� �÷��� ����
    ���� ��� customer table���� ���� id���� pk�� ������ �� row(��)�� �ĺ��Ҽ� ����
    
FK ? �ٸ� table�� ���踦 �α� ���� column 
    �ٸ� ���̺��� PK�� ������  �ٸ����̺���� ���輳�� , ������ �˻������� 
    �����ϴ�PK�� ������ Ÿ�̺� ��ġ�ؾ��ϰ� �����ϴ�PK�� ���� ��ġ �ؾ���

��- row ? table���� �����ι������� ������ ������ ����
    �ϳ��� ���ڵ带 ��Ÿ�� , ������� s_customer table���� ������ �ϳ��� �������� ����
    A,B,C��� ������ְ� �װ��� human�̶�� table�� �����ҽ� 
    A��� ����� �������(���� column���� ������) 
    �� column(��) �̸�,����,����,������,Ű ���
    
�� column ? s_emp table���� name�� ���� ��������� 
    s_customer table���� �� ������� �����ϸ� ����
    �̸�, ��ȭ��ȣ, �ּ� ,�������� ���
    ������ ���̽����� ���� ������ �����ϸ� ���ϴ�
    
���ڵ� ? column ���̶� ������, ���� �����ϸ� s_customer table���� �ϳ��� ���ڵ��
    �Ѹ��� ���� ��������� ����

select * from s_customer;
select * from s_ORD;
select * from s_Emp;
select * from s_dept;

��¥ ���� ���� JOIN ����..

--1.EQUI JOIN 
--column ���� ������ ���� ��Ȯ�� ��ġ�ϴ� ��쿡 ��� PK,FK ���迡 ����
--JOIN�� where ���

select *from s_Emp;
select * from s_dept;
select * from s_customer;

select e.name, e.start_date , e.title, d.name �μ� 
from s_emp e, s_dept d
where e.dept_id = d.id
order by 2 desc -- 2�� �÷� �������� ����
;

--���̸� ���ּ� �Ǹ��ڻ���̸� �Ǹ��� ���
select c.name ���̸� ,c.address ���ּ�, e.name "�Ǹ� ����̸�" , e.id ��� 
from s_emp e , s_customer c
where e.id = c.sales_rep_id
order by 1 --1�� �÷� �������� ����
;

select * from s_Emp; -- �� ���̺� ��ȸ�ؼ� pk fk ã��
select * from s_dept;
select * from s_region; -- ������ ������� Ȯ��

--����� �̸��� �μ� �μ���
select e.name �̸�, e.dept_id �μ� , d.name �μ���
from s_emp e , s_dept d
where e.dept_id = d.id
order by 2
;

--���� ������ �ٹ��ϴ� ������ ���� �̸��� �ٹ��ϴ� �μ���
select e.name , d.name , d.region_id "�����̶�� 1"
from s_emp e , s_dept d
where e.dept_id = d.id
and d.region_id = 1
;

--2. NON EQUI JOIN
--�� ����� ���� �޿��� (e.salary) �޿������ �˰�ʹ�
--�� ���̺��� �޿��� �޿������ ���� ��ġ�ϴ� �����Ͱ� ��� = �����ڷ� JOIN�Ҽ� ���
--NON _EQUI_JOIN �� ����

--����� ���� �޿��� �޿������� ���
select e.name �̸� ,e.salary �޿� ,g.grade ���
from s_emp e , salgrade g
where e.salary between g.losal and g.hisal
;

select * from s_emp;
select * from salgrade;

--
--3. OUTER_JOIN
--OUTER_JOIN�� (+) ������ ���
--(+) ����� ��ġ�� where������
--JOIN�� �����Ͱ� �������ʿ� // where�Ҷ� ���� �� �ѹ��� ����ְ� ����ϼ�
--in,or ������
--
--�ǸŻ���� �̸��� ��� , ������ �̸�, ��ȭ��ȣ�� ���
--��� ����� ���� ��쵵 ��� ��������� ��������;

select * from s_emp;
select * from s_customer;

select e.name , e.id , c.name ,c.phone
from s_emp e , s_customer c
where e.id(+) = c.sales_rep_id 
order by e.id      
;
--(+) �Ⱦ��� �� 15���� 14�� ��µ�

--�Ǹ� ����� �̸��� ���, ��� ���� �̸��� ����ϵ�
--������ ��� ����� �̸��� ����϶�

select e.name �ǸŻ�� , e.id ��� , c.name ��
from s_emp e , s_customer c
where e.id = c.sales_rep_id(+)
;

4)SELF JOIN
�ϳ��� ���̺��� �������ΰŸ��� ���°�
���̺� ���� alias �� �ٸ��� �����
�÷��� �̸� �տ� alias �ٿ�����

select * from s_emp;

����� �̸��� ��� , �μ����� �̸��� �μ��� ���
select e.name �̸� , e.id ��� , m.name , m.id "���μ��� ���"
from s_emp e , s_emp m
where e.manager_id = m.id
;

-- �����̿� ���� ��å�� ������ ����� �̸��� ��å �޿� �μ���ȣ�� ��Ÿ���ÿ�
select m.name , m.title , m.salary , m.dept_id
from s_emp e , s_emp m
where e.name = '������' .

and e.title = m.title  -- �̸��� ������ �̰� �����̿� ��å�� ���� ��å
;

select * from s_emp;


SET ������
1 ) UNION �� QUERY ����� ������
2 ) UNION ALL �� QUERY����� ������ + ����κ�
3 ) INTERSECT �� QUERY ����� ������ (��ġ�ºκ�)
4 ) MINUS ù��° QUERY����� �ι�° QUERY ����� ������ (A-B)

select name ,dept_id , title
from s_emp
where dept_id = 110
UNION
select name , dept_id , title
from s_emp
where dept_id = 113;


