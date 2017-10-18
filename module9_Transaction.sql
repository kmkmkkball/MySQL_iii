-- 外顯式交易 
start transaction;
-- 開始交易
insert into department values(601, 'RD', 1001);
insert into department values(602, 'IT', null);
-- 新增資料
select * from department;
-- 查的到資料 但是現在不是在資料庫裡  在另一個暫存區
rollback;
-- 復原
select * from department;
-- 資料不見了
-- --------------------------------------------
-- 如果要在交易 要重新再開始一次
start transaction;
-- 開始交易
insert into department values(601, 'RD', 1001);
insert into department values(602, 'IT', null);
-- 新增資料
select * from department;
-- 查的到資料 但是現在不是在資料庫裡  在另一個暫存區
commit;
-- 把暫存區的移到資料庫
select * from department;
-- --------------------------------------------
-- 隱含式交易
set autocommit = 0;
-- 開始交易
insert into department values (603, 'RD', 1001);
insert into department values (604, 'IT', NULL);
-- 新增資料
select * from department;
-- 看的到資料 但資料在暫存區
rollback;
-- 還原
select * from department;
-- 資料不見了
insert into department values (605, 'RD', 1001);
insert into department values (606, 'IT', NULL);
-- 新增資料 不用重新開始交易
select * from department;
-- 看資料
commit;
-- 把資料從暫存區到資料庫
select * from department;
-- 看資料
set autocommit = 1;
-- 關掉隱含式交易
begin;
select salary
from employee
where empno = 1001;

update employee
set salary = 60001
where empno = 1001;

commit;

select salary
from employee
where empno = 1001;