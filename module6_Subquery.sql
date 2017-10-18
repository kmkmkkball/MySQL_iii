select ename, salary from employee
where salary > (select salary 
				from employee
				where ename = '潘麗珍');
-- 薪水比潘麗珍高
select deptno, min(salary) 'Minimum Salary' from employee
group by deptno having min(salary) > (select min(salary)
									  from employee
                                      where deptno = 200);
-- 最低薪資比部門代號為200最低薪資高的部門
select ename, title, salary from employee
where title = (select title
			   from employee
               where empno = 1002)
and salary > (select salary
			  from employee
              where empno = 1005);
-- 職稱和1002一樣 薪水比1005高

select ename, salary, deptno
from employee e
where salary = (select min(salary)
				from employee
                where deptno = e.deptno);
-- 每個部門薪水最低的

select empno, ename
from employee
where salary = (select min(salary)
				from employee
                group by deptno);
-- Error Code: 1242. Subquery returns more than 1 row
-- 條件用( =, >, <, >=, <=, !=, <>)時 只能回傳一個答案

select ename, title, salary,
	   round(salary*100/
       (select sum(salary)
       from employee
       where deptno = 100),1) as 'Percentage'
from employee
where deptno = 100;
-- 部門代號100的每位員工薪資百分比
select ename, title, salary,
	   round(salary * 100 / t.total,1)
       as 'Percentage'
from employee,(select sum(salary) total
			   from employee
               where deptno = 100) t
where deptno = 100;
-- 同上 不一樣寫法 部門代號100的每位員工薪資百分比

select ename, title, salary
from employee
where salary < ANY
			   (select salary
				from employee
                where title = 'senior engineer')
and title <>'senior engineer';
-- 職稱不是senior engineer 且薪資比senior engineer最高薪的低
-- < ANY 小於最大的
select ename, title, salary
from employee
where salary < ALL
			   (select salary
                from employee
                where title = 'senior engineer')
and title <> 'senior engineer';
-- 職稱不是senior engineer 且薪資比senior engineer最低薪的低
-- < ALL 小於最小的
select e.ename
from emp e
where e.empno in 
			  (select distinct m.mgrno
               from emp m);
-- 是主管的員工 x = 1003 or x = 1004 or x = NULL
select e.ename
from emp e
where e.empno not in 
			  (select distinct m.mgrno
               from emp m);
-- 找不到
-- x <> 1003 and x <> 1004  <> and x <> NULL
select ename
from emp
where empno not in
			(select distinct mgrno
             from emp 
             where mgrno is not NULL);
-- 上面的解法
select e.ename, e.title, e.salary,
	   round(salary*100/
       (select sum(salary)
       from employee
       where deptno = e.deptno),1) as 'Percentage'
from employee e
where e.deptno = 100;
-- 百分比寫法 可跟上面百分比寫法比較
select ename, salary, deptno
from employee e
where salary in
			 (select min(salary)
              from employee
              group by deptno
              having deptno = e.deptno);
-- 每個部門薪水最低員工
-- 這邊一定要加having 不然會出問題
create table emp100 as
select empno, ename, salary*12 annualSalary, hiredate
from employee
where deptno = 100;
-- 新增一個表格 內容有 empno, ename, salary*12 annualSalary, hiredate