-- CMD
cd C:\Program Files\MySQL\MySQL Server 5.7\bin
-- 去MySQL的資料夾
mysql -uroot -p;
-- 登入
use db01;
-- 切換到db01
module3_tabledata2.sql
-- 將寫好的資料庫匯入
-- 執行
-- ----------
SELECT *
from employee;
-- 看employee的所有東西

SELECT deptno, dname, mgrno
from department;
-- 秀出department中deptno, dname, mgrno的值

SELECT 17/4 'expr(/)',17%4'expr(%)',17 div 4 'expr(div)',17*null'expr(null)';
-- 算術運算 17/4=2.25 17%4=1 17div4=4 17+-*/null=null

SELECT ename AS '員工姓名',salary*12 AS '年薪' 
FROM employee;
-- 新增別名 與運算式


SELECT 'Hello' || 'MySQL';
-- 串接
SET sql_mode='PIPES_AS_CONCAT';
-- 要||前須打這個
SET sql_mode='';
-- 還原
SELECT ename||'is a'||title 員工 FROM employee;
-- 串接
SELECT empno||SPACE(1)||ename 員工 FROM employee;
-- SPACE() 中間加()格
SELECT concat(ename,' is a ',title)員工 FROM employee;
-- 串接函數寫法
SELECT empno, ename, salary,
	salary * IF(salary >= 50000, 2, 1.5)bonus
FROM employee;
-- IF用法 IF 薪水大於50000 獎勵2倍 ELSE 1.5倍
SELECT empno, ename, format(salary,'#,###') as salary,
	format(salary * IF(salary >= 50000, 2, 1.5),'#,###') as bonus
FROM employee;
-- 新增千位數逗點
SELECT empno, ename, salary,
	CASE
		WHEN salary BETWEEN 70000 AND 1000000 THEN 'A'
        WHEN salary BETWEEN 50000 AND 69999 THEN 'B'
        WHEN salary BETWEEN 30000 AND 49999 THEN 'C'
        ELSE 'D'
	END Grade
    FROM employee;
-- SWITCH CASE 
SELECT title || SPACE(2)||ename 員工 FROM employee;
-- SPACE() 中間加()格
SELECT title || SPACE(2)||SUBSTRING(ename, 1, 1) 員工 FROM employee;
-- 從第1個位置開始取  只取1個字
SELECT CONVERT(empno, char(4))||SPACE(1)||ename 員工 FROM employee;
SELECT CAST(empno AS char(4))||SPACE(1)||ename 員工 FROM employee;
-- 字元變字串連接
SELECT empno||ename 員工 FROM employee;
-- MySQL可以直接連接
SELECT sysdate() + interval 5 day AS '日期';
-- 5天後
SELECT curdate() || space(2) ||curtime() AS '日期';
-- 現在時間 年月日跟時間分開打再串接
SELECT sysdate(), sleep(2), sysdate();
-- 現在時間 過兩秒 兩秒後
SELECT now(), sleep(2), now();
-- 現在時間 過兩秒 現在時間
SELECT now() - interval 2 month as '日期';
-- 兩個月前
SELECT empno, ename, datediff(sysdate(),hiredate) div 365 'year', (datediff(sysdate(),hiredate) % 365) div 30 as 'month' FROM employee;
-- datediff 兩個時間相減 單位:天
SELECT empno, ename, hiredate, YEAR(hiredate)'year',MONTH(hiredate)'month',DAY(hiredate)'day' FROM employee;
-- 把年月日分開寫

SELECT round(466.446,1);
-- ROUND=4捨5入  後面是小數點第幾位
SELECT round(466.446,2);
SELECT round(466.446,3);
SELECT round(466.446,-1);

select  distinct deptno from employee;
-- 不重複的部門編號 
select deptno from department;
-- 所有職位FROM DEPARTMENT(有可能會有之前的職位)  
select deptno from employee;
-- 所有職位FROM EMPLOYEE
select distinct deptno, title from employee;
-- 組合之後不重複的
select * from employee where deptno = 100;
-- 條件 deptno=100
select * from employee where title = 'engineer';
-- 條件 用單引號
select * from employee where hiredate = '2007/07/06';
-- 條件 日期用單引號
select * from employee where salary >= 50000;
-- =, >, >=, <, <=, <>不等於, !=不等於
select * from employee where salary between 30000 and 40000;
-- 包含30000~40000
select * from employee where title in ('manager','engineer');
-- title 有manager跟engineer的
select * from department where mgrno is null;
-- 空值
select * from employee where ename like '林%';
-- 開頭是林的
select * from employee where ename like '%生';
-- 最後一個是生
select * from employee where ename like '_麗%';
-- 第二個字是麗
select * from employee where ename like '%麗%';
-- 名字有麗的
select * from employee where title like '%SA\_%';
select * from employee where title like '%SA/_%' escape '/';
-- 值稱有SA開頭
select * from employee where salary >= 45000 and ename like '林%';
-- 薪水>45000且姓林
select * from employee where salary >= 45000 or ename like '林%';
-- 薪水>45000或姓林
select * from employee where title not in ('manager', 'engineer');
-- 職稱不是manager跟engineer的
select * from department where mgrno is not null;
-- 不為空
select * from employee where salary not between 40000 and 60000;
-- 薪水不在40000~60000
select * from employee where ename not like '林%';
-- 不姓林
select * from employee order by hiredate DESC;
-- 年資 降冪
select * from employee order by deptno, salary desc;
-- deptno 是預設 所以是升冪ASC salary才降冪
select * from employee order by deptno desc, salary desc;
-- 都是降冪
select ename, salary*12 as 'Annual' from employee order by Annual;
-- 可用別名排序
select ename, salary*12 as 'Annual' from employee order by salary*12;
-- 可用運算式排序
select ename, salary  from employee order by salary*12;
-- test
select ename, deptno, salary from employee order by 3;
-- 依欄位編號3排序
select * from employee order by 3;
-- 依欄位編號排序
select * from employee limit 3;
-- 只取前三筆資料
select * from employee limit 4,3;
-- 跳過4 取3筆
select * from employee order by hiredate limit 3;
-- 找年資 前三資深
select * from employee order by salary desc limit 3;
-- 前三薪資最高
select count(*) from employee;
-- 傳回所有筆數值
select count(deptno) from employee;
-- 傳回非null的值
select count(distinct deptno) from employee;
-- 傳回所有非null且不重複的比數
select count(*), sum(salary), avg(salary),max(salary),min(salary) from employee;
--    所有筆資料 薪水總和      薪水平均    最高薪     最低薪   
select count(mgrno) as 'count' from department;
-- 有主管的部門 不包含null值
select deptno, avg(salary) as 'Average' from employee
group by deptno;
-- 不同部門的平均薪資
select deptno, avg(salary) as 'Average' from employee
group by deptno order by avg(salary);
-- 不同部門的平均薪資 並以平均薪資排序
select count(*) as 'Number' from employee;
select count(deptno) as 'Number' from employee;
-- 員工人數
select count(distinct deptno) as 'Number' from employee;
-- 不同部門的數量(共有幾個部門)
select deptno, count(*) as 'Count' from employee 
group by deptno;
-- 每個部門有多少人
select deptno, title, sum(salary) as 'Total' from employee
group by deptno, title;
-- 不同部門不同職稱的員工總薪資
select deptno, title, sum(salary) as 'Total' from employee
group by deptno, title with rollup;
-- with rollup 為每個群組多一列統計分析資料
select deptno, avg(salary) as 'Average' from employee
group by deptno having avg(salary) > 50000;
-- having 限制group by的條件
select title,sum(salary) as 'Total' from employee
where title not like '%SA%' 
group by title having sum(salary)>100000 order by sum(salary);
-- 找出不同職稱的總薪資,不包含有"SA"這些字的職稱,
-- 且總薪資必須超過100000,最後結果以總薪資排序