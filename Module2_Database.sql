SHOW DATABASES;
-- 看資料庫狀態

create DATABASE db01;
-- 增加資料庫 db01
CREATE SCHEMA db01;
-- 增加資料庫 db01
-- database = schema

SHOW CHAR SET;
-- 看字元集

SHOW CHAR SET LIKE 'big5%';
-- 看字元集 只顯示big5類的

SHOW COLLATION;
--  看大小排序順序的字元

SHOW COLLATION LIKE 'big5%';
-- 只看big5

DROP DATABASE db02;
-- 刪除db02

ALTER DATABASE db02
CHARSET utf16
COLLATE ucs2_general_ci;
-- 修改db02 的字體
-- ci AaBbCcDd
-- cs ABCDabcd

USE db01;
-- 預設資料庫
 
