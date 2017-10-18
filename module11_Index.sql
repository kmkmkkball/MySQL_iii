create index ename_idx on employee (ename);
-- 新增index
show index from employee;
-- 看有甚麼index
drop index ename_idx on employee;
-- 刪除index
alter table employee drop index ename_idx ;
-- 刪除index
drop index ename_idx on employee
-- 刪除index