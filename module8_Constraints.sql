insert into dept
values (600, 'Public Relations', default);
-- 新增資料 用預設值
update dept
set cityno = default
where deptno = 500;
-- 修改資料也可以用預設值
create table emp1(
empno		decimal(4)	primary key,
ename		varchar(30)	not null,
hiredate	date		not null,
email		varchar(30)	unique,
deptno		decimal(3)	not null,
salary		int,
title		varchar(20)	not null default 'engineer',
constraint emp_deptno_fk foreign key (deptno)
references department (deptno)
);

insert into emp1 value (1001, '李大仁', '2017/05/08', 'lee@gmail.com', 200, 47000, 'engineer');
insert into emp1 value (1001, '李大仁', '2017/05/08', 'lee@gmail.com', 200, 47000, 'engineer');
-- 重複輸入primary key
insert into emp1 value (1002, '李大仁', '2017/05/08', 'lee@gmail.com', 200, 47000, 'engineer');
-- 重複輸入Unique欄位email
insert into emp1 value (1002, '李大仁', '2017/05/08', 'lee1@gmail.com', 201, 47000, 'engineer');
-- 部門編號不存在
delete from department where deptno = 200;
-- 還有對應資料所以不能刪跟修改
alter table emp1
drop foreign key emp_deptno_fk;
-- 要先刪除連結
alter table emp1
add constraint emp1_deptno_fk foreign key (deptno)
references department (deptno);
-- 新增連結(foreign key)
alter table emp1
add constraint emp_deptno_fk foreign key (deptno) 
references department (deptno) on delete cascade on update cascade;
-- 新增連結 設定模式 restrict:不做任何處理 預設 同no action,cascade 一併跟著刪除或更新 set null:設定成null值
update department set deptno = 201 where deptno = 200;
-- 改成cascade後 資料才能改 而且有關聯的都會跟著改 
delete from department where deptno = 201;
-- 有關聯的資料也會跟著刪除

-- 用工具修改 在表格案右鍵→ALTER TABLE→foreign key→點連結→foreign key options
create table men(
	memno int	primary key 	auto_increment,
    mname		varchar(30)		not null);
-- 新增一個表格 自動編號
insert into men (mname) 
values('David Ho'),('Maria Wang'),('Pam Pan'),('Tina Lee'),('Jean Tsao');
-- 輸入值測試
create table men2(
	memno int	primary key 	auto_increment,
    mname		varchar(30)		not null)
auto_increment = 100;
-- 新增一個表格 自動編號從100開始
insert into men2 (mname) 
values('David Ho'),('Maria Wang'),('Pam Pan'),('Tina Lee'),('Jean Tsao');
-- 輸入值測試

select last_insert_id();
-- 找最後一筆輸入的ID
-- 但是如果一次輸入好幾筆
-- 只會顯示該次的第一筆    