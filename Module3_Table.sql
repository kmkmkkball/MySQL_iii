show table status in db01;
-- 看表格狀態
desc employee;
-- 看表格欄位
-- drop刪除  
-- alter 修改
create table t1 (a smallint, b varchar(20));
-- 新增表格t1 裡面有欄位a,b
alter table t1 add c float;
-- 增加欄位C在t1內
alter table t1 modify c double;
-- 修改欄位c的資料型態
alter table t1 change c d int;
-- 改變c的名稱變成d 改變資料型態
alter table t1 drop d;
-- 刪除d
alter table t1 rename t2;
-- 改名
create table t3 like t2;
-- 複製t2的結構 到t3
create table employee(
empno		decimal(4)	primary key,
ename		varchar(30)	not null,
hiredate	date		not null,
salary		int			not null,
deptno		decimal(3)	not null,
title		varchar(20) not null
);
-- 新增表格內容
create table department(
deptno	decimal(3)	primary key,
dname	varchar(30)	not null,
mgrno	decimal(4)	
);