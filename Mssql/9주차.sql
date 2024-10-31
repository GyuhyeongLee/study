CREATE DATABASE tableDB;
USE tableDB;

CREATE TABLE userTBL (
	userID	CHAR(8),
	name	NVARCHAR(10),
	birthYear	SMALLINT,
	addr	NCHAR(2),
	mobile1	CHAR(3),
	mobile2 CHAR(8),
	height	TINYINT,
	mDate	DATE );
GO
CREATE TABLE buyTBL (
	num	INT,
	userid	CHAR(8),
	prodName	NCHAR(6),
	groupName	NCHAR(4),
	price	INT,
	amount	SMALLINT );
GO

DROP TABLE buyTBL, userTBL;
GO
CREATE TABLE userTBL (
	userID	CHAR(8) NOT NULL,
	name	NVARCHAR(10) NOT NULL,
	birthYear	SMALLINT NOT NULL,
	addr	NCHAR(2) NOT NULL,
	mobile1	CHAR(3) NULL,
	mobile2 CHAR(8) NULL,
	height	TINYINT NULL,
	mDate	DATE NULL );
GO
CREATE TABLE buyTBL (
	num	INT NOT NULL,
	userid	CHAR(8) NOT NULL,
	prodName	NCHAR(6) NOT NULL,
	groupName	NCHAR(4) NULL,
	price	INT NOT NULL,
	amount	SMALLINT NOT NULL);
GO

DROP TABLE buyTBL;
GO
CREATE TABLE buyTBL (
	num	INT IDENTITY(1,1) NOT NULL,
	userid	CHAR(8) NOT NULL,
	prodName	NCHAR(6) NOT NULL,
	groupName	NCHAR(4) NULL,
	price	INT NOT NULL,
	amount	SMALLINT NOT NULL);
GO

DROP TABLE buyTBL, userTBL;
GO
CREATE TABLE userTBL (
	userID	CHAR(8) NOT NULL PRIMARY KEY,
	name	NVARCHAR(10) NOT NULL,
	birthYear	SMALLINT NOT NULL,
	addr	NCHAR(2) NOT NULL,
	mobile1	CHAR(3) NULL,
	mobile2 CHAR(8) NULL,
	height	TINYINT NULL,
	mDate	DATE NULL );
GO
CREATE TABLE buyTBL (
	num	INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	userid	CHAR(8) NOT NULL,
	prodName	NCHAR(6) NOT NULL,
	groupName	NCHAR(4) NULL,
	price	INT NOT NULL,
	amount	SMALLINT NOT NULL);
GO

DROP TABLE buyTBL;
GO
CREATE TABLE buyTBL (
	num	INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	userid	CHAR(8) NOT NULL  
		FOREIGN KEY REFERENCES userTBL(userID),
	prodName	NCHAR(6) NOT NULL,
	groupName	NCHAR(4) NULL,
	price	INT NOT NULL,
	amount	SMALLINT NOT NULL);
GO

INSERT INTO userTBL VALUES('LSG', '�̽±�', 1987,'����', '011', '11111111', 182, '2008-8-8');
INSERT INTO userTBL VALUES('KBS', '�����', 1979,'�泲', '011', '22222222', 173, '2012-4-4');
INSERT INTO userTBL VALUES('KKH', '���ȣ', 1971,'����', '010', '33333333', 177, '2007-7-7');

INSERT INTO buyTBL VALUES('KBS', '�ȭ', NULL, 30, 2);
INSERT INTO buyTBL VALUES('KBS', '��Ʈ��', '����', 1000, 1);
INSERT INTO buyTBL VALUES('JYP', '�����', '����', 200, 1);

---------------------------------------

USE tableDB;
DROP TABLE buyTBL, userTBL;
GO
CREATE TABLE userTbl 
( userID  char(8) NOT NULL PRIMARY KEY, 
  name    nvarchar(10) NOT NULL, 
  addr	NCHAR(2) NOT NULL
);

EXEC sp_help userTbl;
GO
DROP TABLE  userTBL;
GO
CREATE TABLE userTbl 
( userID  char(8) NOT NULL 
		CONSTRAINT PK_userTbl_userID PRIMARY KEY , 
  name    nvarchar(10) NOT NULL, 
  addr	NCHAR(2) NOT NULL
);
GO
DROP TABLE  userTBL;
GO
CREATE TABLE userTbl 
( userID  char(8) NOT NULL, 
  name    nvarchar(10) NOT NULL, 
  addr	NCHAR(2) NOT NULL
);
GO
ALTER TABLE userTbl
	ADD CONSTRAINT PK_userTbl_userID
	PRIMARY KEY (userID);
GO
------------------------------------

CREATE TABLE prodTbl
( prodCode NCHAR(3) NOT NULL,
  prodID   NCHAR(4)  NOT NULL,
  prodDate SMALLDATETIME  NOT NULL,
  prodCur  NCHAR(10) NULL
);
GO
ALTER TABLE prodTbl
	ADD CONSTRAINT PK_prodTbl_proCode_prodID 
	PRIMARY KEY (prodCode, prodID) ;
GO
EXEC sp_help prodTbl;

-----------------------------------------
USE tempdb;
CREATE DATABASE sparseDB;
GO
USE sparseDB;
CREATE TABLE charTbl ( id int identity, data char(100) NULL);
CREATE TABLE sparseCharTbl ( id int identity, data char(100) SPARSE NULL);
GO

DECLARE @i INT = 0
WHILE @i < 10000
BEGIN
	INSERT INTO charTbl VALUES(null); -- null��3ȸ
	INSERT INTO charTbl VALUES(null);
	INSERT INTO charTbl VALUES(null);
	INSERT INTO charTbl VALUES(REPLICATE('A',100)); -- ���� ������ 1ȸ
	INSERT INTO sparseCharTbl VALUES(null); -- null��3ȸ
	INSERT INTO sparseCharTbl VALUES(null);
	INSERT INTO sparseCharTbl VALUES(null);
	INSERT INTO sparseCharTbl VALUES(REPLICATE('A',100)); -- ���� ������ 1ȸ
	SET @i += 1
END


GO

TRUNCATE TABLE charTbl;  -- ��ü �� �����ͻ���
TRUNCATE TABLE sparseCharTbl; -- ��ü �� �����ͻ���
GO
DECLARE @i INT = 0
WHILE @i < 40000
BEGIN
	INSERT INTO charTbl VALUES(REPLICATE('A',100)); 
	INSERT INTO sparseCharTbl VALUES(REPLICATE('A',100)); 
	SET @i += 1
END

GO

--------------------------------------------------
-- ����â 1
USE tableDB;
CREATE TABLE #tempTbl (ID  INT,  txt NVARCHAR(10));
GO
CREATE TABLE ##tempTbl (ID  INT,  txt NVARCHAR(10));
GO
INSERT INTO #tempTbl VALUES(1, N'�����ӽ����̺�');
INSERT INTO ##tempTbl VALUES(2, N'�����ӽ����̺�');
GO
SELECT * FROM #tempTbl ;
SELECT * FROM ##tempTbl;

GO

USE master;
SELECT * FROM #tempTbl ;
SELECT * FROM ##tempTbl ;

GO
-- ����â 2
SELECT * FROM ##tempTbl;

SELECT * FROM #tempTbl;
GO
BEGIN TRAN
	INSERT INTO ##tempTbl VALUES (2,  N'�� ����â���� �Է�');


GO

SELECT * FROM ##tempTbl;
GO

COMMIT TRAN;
SELECT * FROM ##tempTbl;

GO

--------------------------------------------
USE tableDB;
DROP TABLE buyTbl, userTbl;
GO
CREATE TABLE userTbl 
( userID  char(8), 
  name    nvarchar(10),
  birthYear   int,  
  addr	  nchar(2), 
  mobile1	char(3), 
  mobile2   char(8), 
  height    smallint, 
  mDate    date 
);
GO
CREATE TABLE buyTbl 
(  num int IDENTITY,
   userid  char(8),
   prodName nchar(6),
   groupName nchar(4),
   price     int ,
   amount    smallint
);
GO

INSERT INTO userTbl VALUES('LSG', N'�̽±�', 1987, N'����', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', N'�����', NULL, N'�泲', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', N'���ȣ', 1871, N'����', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', N'������', 1950, N'���', '011', '4444444', 166, '2009-4-4');
GO
INSERT INTO buyTbl VALUES('KBS', N'�ȭ', NULL   , 30,   2);
INSERT INTO buyTbl VALUES('KBS', N'��Ʈ��', N'����', 1000, 1);
INSERT INTO buyTbl VALUES('JYP', N'�����', N'����', 200,  1);
INSERT INTO buyTbl VALUES('BBK', N'�����', N'����', 200,  5);
GO

ALTER TABLE userTbl
	ADD CONSTRAINT PK_userTbl_userID
	PRIMARY KEY (userID);

GO

ALTER TABLE userTbl
	ALTER COLUMN userID	char(8) NOT NULL ;
GO
ALTER TABLE userTbl
	ADD CONSTRAINT PK_userTbl_userID
	   PRIMARY KEY (userID) ;
GO
ALTER TABLE buyTbl
	ADD CONSTRAINT PK_buyTbl_num
	   PRIMARY KEY (num) ;

GO

ALTER TABLE buyTbl
	ADD CONSTRAINT FK_userTbl_buyTbl
		FOREIGN KEY (userID)
		REFERENCES userTbl (userID);

GO


ALTER TABLE buyTbl WITH NOCHECK
	ADD CONSTRAINT FK_userTbl_buyTbl
		FOREIGN KEY (userID)
		REFERENCES userTbl (userID);

GO

INSERT INTO buyTbl VALUES('KBS', N'û����', N'�Ƿ�', 50,   3);
GO

INSERT INTO buyTbl VALUES('BBK', N'�޸�', N'����', 80,  10);
GO

ALTER TABLE buyTbl 
	NOCHECK CONSTRAINT FK_userTbl_buyTbl ;
GO
INSERT INTO buyTbl VALUES('BBK', N'�޸�', N'����', 80,  10);
INSERT INTO buyTbl VALUES('SSK', N'å'    , N'����', 15,   5);
INSERT INTO buyTbl VALUES('EJW', N'å'    , N'����', 15,   2);
INSERT INTO buyTbl VALUES('EJW', N'û����', N'�Ƿ�', 50,   1);
INSERT INTO buyTbl VALUES('BBK', N'�ȭ', NULL   , 30,   2);
INSERT INTO buyTbl VALUES('EJW', N'å'    , N'����', 15,   1);
INSERT INTO buyTbl VALUES('BBK', N'�ȭ', NULL   , 30,   2);
GO
ALTER TABLE buyTbl 
	CHECK CONSTRAINT FK_userTbl_buyTbl;
GO

ALTER TABLE userTbl
	ADD CONSTRAINT CK_birthYear
	CHECK  
          (birthYear >= 1900 AND birthYear <= YEAR(GETDATE())) ;

GO

ALTER TABLE userTbl
    WITH NOCHECK
	ADD CONSTRAINT CK_birthYear
	CHECK  
          (birthYear >= 1900 AND birthYear <= YEAR(GETDATE())) ;

GO

INSERT INTO userTbl VALUES('SSK', '���ð�', 1979, '����', NULL  , NULL , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '�����', 1963, '����', '016', '6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '������', 1969, '�泲', NULL  , NULL , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', '������', 1972, '���', '011', '8888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', '������', 1965, '���', '018', '9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '�ٺ�Ŵ', 1973, '����', '010', '0000000', 176, '2013-5-5');

GO

UPDATE userTbl SET userID = 'VVK' WHERE userID='BBK';
GO

ALTER TABLE buyTbl 
	NOCHECK CONSTRAINT FK_userTbl_buyTbl;
GO
UPDATE userTbl SET userID = 'VVK' WHERE userID='BBK';
GO
ALTER TABLE buyTbl 
	CHECK CONSTRAINT FK_userTbl_buyTbl;

GO

SELECT B.userid, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS [����ó]
   FROM buyTbl B
     INNER JOIN userTbl U
        ON B.userid = U.userid ;

GO

SELECT COUNT(*) FROM buyTbl;
GO

SELECT B.userid, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS [����ó]
   FROM buyTbl B
     LEFT OUTER JOIN userTbl U
        ON B.userid = U.userid
   ORDER BY B.userid ;

GO

ALTER TABLE buyTbl 
	NOCHECK CONSTRAINT FK_userTbl_buyTbl;
GO
UPDATE userTbl SET userID = 'BBK' WHERE userID='VVK';
GO
ALTER TABLE buyTbl 
	CHECK CONSTRAINT FK_userTbl_buyTbl;

GO

ALTER TABLE buyTbl
	DROP CONSTRAINT FK_userTbl_buyTbl;
GO
ALTER TABLE buyTbl WITH NOCHECK
	ADD CONSTRAINT FK_userTbl_buyTbl
		FOREIGN KEY (userID)
		REFERENCES userTbl (userID)
		ON UPDATE CASCADE;
GO

UPDATE userTbl SET userID = 'VVK' WHERE userID='BBK';
GO
SELECT B.userid, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2  AS [����ó]
FROM buyTbl B
  INNER JOIN userTbl U
     ON B.userid = U.userid
  ORDER BY B.userid;

GO

DELETE userTbl WHERE userID = 'VVK';
GO

ALTER TABLE buyTbl
	DROP CONSTRAINT FK_userTbl_buyTbl ;
GO
ALTER TABLE buyTbl WITH NOCHECK
	ADD CONSTRAINT FK_userTbl_buyTbl
		FOREIGN KEY (userID)
		REFERENCES userTbl (userID)
		ON UPDATE CASCADE
		ON DELETE CASCADE ;
GO

DELETE userTbl WHERE userID = 'VVK' ;
GO
SELECT * FROM buyTbl ;

GO

ALTER TABLE userTbl
	DROP COLUMN birthYear ;

GO

ALTER TABLE userTbl
	DROP CK_birthYear ;
GO
ALTER TABLE userTbl
	DROP COLUMN birthYear ;
GO

------------------------------------------------
USE tempdb;
CREATE  DATABASE  schemaDB;

GO

USE  schemaDB;
GO
CREATE SCHEMA  userSchema;
GO
CREATE SCHEMA  buySchema;

GO

CREATE TABLE userSchema.userTBL (id  int);
CREATE TABLE buySchema.buyTBL (num  int);
CREATE TABLE buySchema.prodTBL (pid  int);

GO

SELECT * FROM userTBL;
GO

USE tempdb;
DROP DATABASE schemaDB;

GO
----------------------------------

USE sqlDB;
GO
CREATE VIEW v_userbuyTbl
AS
   SELECT U.userid AS [USER ID], U.name AS [USER NAME], B.prodName AS [PRODUCT NAME], 
		U.addr, U.mobile1 + U.mobile2  AS [MOBILE PHONE]
      FROM userTbl U
	INNER JOIN buyTbl B
	 ON U.userid = B.userid;
GO
SELECT [USER ID],[USER NAME] FROM v_userbuyTbl;

GO

ALTER VIEW v_userbuyTbl
AS
   SELECT U.userid AS [����� ���̵�], U.name AS [�̸�], B.prodName AS [��ǰ �̸�], 
		U.addr, U.mobile1 + U.mobile2  AS [��ȭ ��ȣ]
      FROM userTbl U
          INNER JOIN buyTbl B
             ON U.userid = B.userid ;
GO
SELECT [�̸�],[��ȭ ��ȣ] FROM v_userbuyTbl;

GO

DROP VIEW v_userbuyTbl;
GO

USE sqlDB;
GO
CREATE VIEW v_userTbl
AS
	SELECT userid, name, addr FROM userTbl;

GO

SELECT * FROM sys.sql_modules ;
GO

SELECT OBJECT_NAME(object_id) AS [�� �̸�], definition FROM sys.sql_modules ;
GO

ALTER VIEW v_userTbl
	WITH ENCRYPTION
AS
	SELECT userid, name, addr FROM userTbl ;
GO
SELECT OBJECT_NAME(object_id) AS [�� �̸�], definition FROM sys.sql_modules ;

GO

UPDATE v_userTbl SET addr = N'�λ�' WHERE userid='JKW' ;
GO

INSERT INTO v_userTbl(userid, name, addr) VALUES('KBM','�躴��','���') ;
GO

CREATE VIEW v_sum
AS
	SELECT userid AS [userid], SUM(price*amount) AS [total]  
	   FROM buyTbl GROUP BY userid;
GO
SELECT * FROM v_sum;

GO

CREATE VIEW v_height177
AS
	SELECT * FROM userTbl WHERE height >= 177 ;
GO
SELECT * FROM v_height177 ;

GO

DELETE v_height177 WHERE height < 177 ;
GO


INSERT INTO v_height177 VALUES('KBM', '�躴��', 1977 , '���', '010', '5555555', 158, '2019-01-01') ;
GO

ALTER VIEW v_height177
AS
	SELECT * FROM userTbl WHERE height >= 177
	    WITH CHECK OPTION ;
GO
INSERT INTO v_height177 VALUES('WDT', '�����', 2006 , '����', '010', '3333333', 155, '2019-3-3') ;

GO
CREATE VIEW v_userbuyTbl
AS
  SELECT U.userid, U.name, B.prodName, U.addr, U.mobile1 + U.mobile2 AS mobile
   FROM userTbl U
      INNER JOIN buyTbl B
         ON U.userid = B.userid ;
GO
DROP TABLE buyTbl, userTbl;
GO

SELECT * FROM v_userbuyTbl;
GO

EXEC sp_depends userTbl ;
GO



























