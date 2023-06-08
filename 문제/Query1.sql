select * from s_emp;

-- ������ ������� ���� 10�� ��ȸ
-- 1. ����
-- 2. ���� 10�� ��ȸ

-- 10����ȸ
select * 
from s_emp 
where rownum between 1 and 10;

-- ���� �������� ����
select * 
from s_emp
order by start_date desc
where rownum between 1 and 10;

select * 
from (  select * 
        from s_emp 
        order by start_date desc)
where rownum between 1 and 10;


--- ���� 2000 �̻��� ����� ��ȸ
select * from s_emp
where salary <= 2000;

-- ���� ��� ���� ���϶�
select avg(salary)
from s_emp
;

-- �μ��� ��� ����
select dept_id , avg(salary)
from s_Emp
group by dept_id
;

-- ��� ���� �� �̻��� ���
select * 
from s_emp
where salary >= ( select avg(salary)from s_emp)
;
-------------------------------------------------------------
-- Single Row SubQUERY
-- '������'�� ���� �μ��� ����� �̸��� ���� �μ���ȣ

select * from s_emp;

select name , title , dept_id
from s_emp
where name = '������';


select name , title , dept_id
from s_emp
where dept_id = (select dept_id 
                    from s_emp
                     where name = '������');

select m.name , m.title , m.dept_id
from s_emp e , s_emp m
where e.name = '������'
and e.dept_id = m.dept_id
;


select name , title, salary , dept_id
from s_emp
where dept_id  = ( select dept_id
                     from s_emp
                      where dept_id = 110);
--  ����:  ���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�.                   
-- ���ι������� �Ѿ�� ���� �������� �ߴ� ���� �����

select dept_id from s_emp where dept_id =110;
-- dept_id = 110 4�� ���ΰ� Ȯ��

-- �ذ���
select name , title , salary , dept_id
from s_emp
where dept_id = (select distinct dept_id
                    from s_emp
                    where dept_id = 110);
-- distinct ����ؼ� �ߺ��� ���� �ؼ� 
-- ���������� �Ѿ�� ���� 1���� �߻��ϰ�����

select distinct dept_id
                    from s_emp
                    where dept_id = 110;
---------------------------------------------------  

--Multi ROw Sub QEUERY
-- ���޵Ǵ� ���� ������


select * from s_emp where dept_id = 103 and dept_id = 111;
-- �� ��¾��� ?
--dept_id�� 103 �׸��� 111�� ���� ����

-- �ذ��� and ��� OR ���
select * from s_emp where dept_id = 103 or dept_id = 111;


-- ������ȣ(region_id)�� 3�� �μ���ȣ(dept_id)�� ��ȸ
select * from s_dept;
select * from s_dept where region_id = 3;
-- ������ȣ 3��(region_id = 3) �μ�(dept_id)�� ���� �����鿡 �̸��� ���� �μ���ȣ ������ ��ȸ

select e.name, e.title, e.dept_id, e.salary
from s_emp e
where e.dept_id in (select id
                    from s_dept
                    where region_id = 3);
                    
-------------------------------------------------------------------------------
-- Multi column SubQuery
-- where���� ���ϴ� �÷��� 2��
select * from s_emp;
select name , dept_id ,title from s_emp where dept_id =111;

select e.name, e.title, e.dept_id,d.name
from s_emp e , s_dept d
where e.dept_id = d.id 
and (e.name ,e.dept_id) in (select name, dept_id
                    from s_emp
                    where dept_id = 111 or dept_id = 106);
--- ����                  
-- 1. ���� �����ڰ� �������մϴ�
-- and (e.name ,e.dept_id) in () �� ��������Ѵٰ���
-- e.name , e.dept_id�� ���� �������� �������� �ؼ�

-- 2. ��ġ�� �������մϴ�
--  and (e.name ,e.dept_id) in (select dept_id,name
-- ������ �ٲ� ����

-------------------------------------------------------------------
-- �̸� �μ���ȣ ���� ���� ��ȸ
-- �� �� �μ��� �ּ� �����ڸ� 

-- 1. �μ��� �ּ� �����ݾ�
select min(salary),dept_id
from s_Emp 
group by dept_id
order by dept_id;

-- 2. �̸� , �μ�, ���� , ����
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

                            
                            