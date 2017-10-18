create view empvu100
as select empno, ename, salary
from employee
where deptno = 100;
-- 新增一個表格 只有100的部門 的編號 名字 薪水
create view salvu100
as select empno id, ename name, salary*12 annual_salary
from employee where deptno = 100;
-- 可以多原本沒有的
create view salary100_1(id, name, annual_salary)
as select empno, ename, salary*12
from employee
where deptno = 100;
-- 把別名寫在上面
create view dept_sum_vw (name, minsal, maxsal, avgsal)
as select d.dname, min(e.salary), max(e.salary), avg(e.salary)
from employee e, department d 
where e.deptno = d.deptno group by d.dname;
-- 新的表格包含每個部門的最低薪資 最高薪資 平均薪資
update empvu100
set ename = '孫悟淨' where empno = 1009;
-- 可以用VIEW修改資料 VIEW的表格不能包含計算或函式的欄位 也不能有join
update empvu100
set ename = '孫大為' where empno = 1003;
-- 不會顯式錯誤 也不會做任何修改
update empvu100
set title = 'SA' where empno = 1009;
-- Error Code: 1054. Unknown column 'title' in 'field list' 
-- 不在VIEW的欄位無法修改
delete from empvu100 where empno = 1009;
-- 可以新增 移除 修改

create view emp_sal_vw
as select empno, ename, salary
from employee
where salary <= 40000
with check option;
-- with check option 加這行的話 改超過WHERE的就無法改
update emp_sal_vw
set salary = 40001
where empno = 1002;
-- 因為超過上面的限制條件 所以無法改
update emp_sal_vw
set salary = 10000
where empno = 1002;
-- 這就可以改符合條件