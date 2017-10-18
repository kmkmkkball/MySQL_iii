insert into department (deptno, dname, mgrno)
values				   (400,'Research',1001);
-- 新增欄位資料
insert into department
values	(500,'Personnel',1001);
-- 可以不打欄位 但是資料數目位置要對到
insert into department (deptno, dname)
values (601,'IT');
insert into department
values (602,'IT',NULL);
-- 如果不給欄位 就要給NULL值
insert into department (deptno, dname, mgrno)
values (603,'HRD',1003),(604,'STK',NULL);
-- 一次新增多筆資料
insert into employee
values (1009,'孫悟空',sysdate(),
		56000,100,'senior engineer');
-- 日期函數 curdate()可以只更新日期
insert into employee
values (1010,'李大文','2013/11/10',
		89000,200,'manager');
-- 數字可加單引號 可不加 但字元一定要加
create table emp_copy(
empno		decimal(4)	primary key,
ename		varchar(30)	not null,
hiredate	date		not null,
salary		int			not null,
deptno		decimal(3)	not null,
title		varchar(20) not null
);
-- 要複製前要先新增表格
insert into emp_copy select * from employee;
-- 複製表格內容
create table emp_copy1(
empno		decimal(4)	primary key,
ename		varchar(30)	not null,
hiredate	date		not null,
salary		int			not null,
deptno		decimal(3)	not null
);

insert into emp_copy1 (empno, ename, hiredate, salary, deptno)
select empno, ename, hiredate, salary, deptno
from employee
where title not like '%SA%';
-- 複製的內容沒有全部的話 就要打欄位出來
-- 常見錯誤
-- 設定not null的欄位沒給值
-- 資料型態不相容
-- 值的長度超過範圍
-- 唯一限制條件的欄位給予重複的值
update emp_copy
set salary = 45000
where empno = 1008;

update emp_copy
set salary = 55000
where ename = '李大文';

set sql_safe_updates=0;
-- 改資料要加WHERE 不加的話要打這行 1=關閉
update emp_copy1
set hiredate = curdate();

update emp_copy
set salary = (select salary
			  from emp_copy
              where empno = 1006)
where empno = 1007;
-- MySQL不允許subquery中所使用的表格與update的表格是相同的
update emp_copy
set	   deptno=(select deptno
			   from employee
               where empno = 1003)
where salary = (select salary
				from employee
                where empno = 1001);
-- 將與員工編號1001相同薪水的員工 將其部門代號改為與1003相同
delete from emp_copy where empno = 1007;
-- 刪除1007
delete from emp_copy1;
-- 刪除emp_copy1的資料
delete from department
where deptno between 601 and 604;
-- 刪除 601-604的資料
delete from emp_copy
where deptno = (select deptno
			    from department
                where dname = 'Accounting');
-- 
truncate emp_copy;
-- 刪除表格的所有紀錄