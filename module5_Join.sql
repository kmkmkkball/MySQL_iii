-- cross join
select ename, dname from employee,department;
-- MySQL寫法
select ename, dname from employee cross join department;
-- ANSI寫法

-- inner join
-- equal join
select ename, dname, salary from employee, department where employee.deptno = department.deptno;
-- MySQL寫法
select e.ename, d.dname, e.salary from employee e,department d where e.deptno = d.deptno;
-- 同上 縮寫寫法
select ename, dname, salary from employee join department on employee.deptno = department.deptno;
-- ANSI寫法
select ename, employee.deptno, dname, salary from employee, department 
where employee.deptno= department.deptno;
select e.ename, e.deptno, d.dname, salary from employee e, department d
where e.deptno = d.deptno;
-- MySQL寫法 如果要顯示相關的表格要宣告
select ename, employee.deptno, dname, salary from employee join department 
on employee.deptno= department.deptno;
-- ANSI寫法 
select ename, employee.deptno, dname, salary from employee join department using(deptno);
-- ANSI寫法
select ename, emp.deptno, dname from emp, dept
where emp.deptno = dept.deptno and title= 'manager';
-- 職稱為manager 的姓名 部門編號 部門名稱
select e.ename,e.deptno,d.dname from emp as e,dept as d
where e.deptno=d.deptno;
-- 用別名連接
select e.ename, d.dname, c.cname from emp e, dept d, city c
where e.deptno = d.deptno and d.cityno = c.cityno;
-- MySQL寫法 3個表格連接
select e.ename, d.dname, c.cname
from emp e join dept d on e.deptno = d.deptno
		   join city c on d.cityno = c.cityno;
-- ANSI寫法 3個表格連接
-- non equal join
select e.ename, e.salary, g.level from emp e, grade g
where e.salary between g.lowest and g.highest;
-- 找出所有員工 姓名 薪資 薪資等級
select e.ename, d.dname, e.salary, g.level from emp e, dept d, grade g
where e.deptno = d.deptno and e.salary between g.lowest and g.highest;
-- 連接equal join 使用
select e.ename, d.deptno, d.dname from emp e left join dept d
on e.deptno = d.deptno; 
-- 左邊有問題
select e.ename, d.deptno, d.dname from emp e right join dept d
on e.deptno = d.deptno; 
-- 右邊有問題

select e.ename, d.deptno, d.dname from emp e left join dept d
on e.deptno = d.deptno 
union
select e.ename, d.deptno, d.dname from emp e right join dept d
on e.deptno = d.deptno; 
-- 有問題都列出來
SET sql_mode='PIPES_AS_CONCAT';
select worker.ename || 'works for' || manager.ename
from emp worker, emp manager
where worker.mgrno = manager.empno;
-- 找出每個員工的老闆
