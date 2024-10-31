USE tempdb;
DROP DATABASE sqlDB;
GO
CREATE DATABASE sqlDB;
GO
USE sqlDB;
-- DROP TABLE userTBL;
CREATE  TABLE  userTBL -- ȸ�� ���̺�
( userID	CHAR(8)	NOT NULL  PRIMARY KEY,
  name		NVARCHAR(10) NOT NULL,
  birthYear	INT  NOT  NULL,
  addr		NCHAR(2) NOT NULL,
  mobile1	CHAR(3),
  mobile2	CHAR(8),
  height	SMALLINT, 
  mDate		DATE
);
GO
INSERT INTO userTBL VALUES('LSG', '�̽±�', 1987, '����', '011', '11111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '�����', 1979, '�泲', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '���ȣ', 1971, '����', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '������', 1950, '���', '011', '4444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', '���ð�', 1979, '����', NULL , NULL , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '�����', 1963, '����', '016', '6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '������', 1969, '�泲', NULL , NULL , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', '������', 1972, '���', '011', '8888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', '������', 1965, '���', '018', '9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '�ٺ�Ŵ', 1973, '����', '010', '0000000', 176, '2013-5-5');
GO
SELECT * FROM userTBL;

USE tempdb;
DROP DATABASE sqlDB;
GO
CREATE DATABASE sqlDB;
GO
USE sqlDB;
-- DROP TABLE userTBL;
CREATE  TABLE  userTBL -- ȸ�� ���̺�
( userID	CHAR(8)	NOT NULL  UNIQUE,
  name		NVARCHAR(10) NOT NULL,
  birthYear	INT  NOT  NULL,
  addr		NCHAR(2) NOT NULL,
  mobile1	CHAR(3),
  mobile2	CHAR(8),
  height	SMALLINT, 
  mDate		DATE
);
GO
INSERT INTO userTBL VALUES('LSG', '�̽±�', 1987, '����', '011', '11111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '�����', 1979, '�泲', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '���ȣ', 1971, '����', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '������', 1950, '���', '011', '4444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', '���ð�', 1979, '����', NULL , NULL , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '�����', 1963, '����', '016', '6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '������', 1969, '�泲', NULL , NULL , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', '������', 1972, '���', '011', '8888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', '������', 1965, '���', '018', '9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '�ٺ�Ŵ', 1973, '����', '010', '0000000', 176, '2013-5-5');
GO
SELECT * FROM userTBL;

---------------------
USE tempDB;
CREATE TABLE tbl1 (
  a  INT  PRIMARY KEY,
  b  INT,
  c  INT  );
GO
EXEC  sp_helpindex tbl1;
GO
CREATE TABLE tbl2 (
  a  INT  PRIMARY KEY,
  b  INT  UNIQUE,
  c  INT  UNIQUE,
  d  INT );
GO
EXEC  sp_helpindex tbl2;
GO
CREATE TABLE tbl3 (
  a  INT  PRIMARY KEY NONCLUSTERED,
  b  INT  UNIQUE,
  c  INT  UNIQUE,
  d  INT );
GO
EXEC  sp_helpindex tbl3;
GO
CREATE TABLE tbl4 (
  a  INT  PRIMARY KEY NONCLUSTERED,
  b  INT  UNIQUE CLUSTERED,
  c  INT  UNIQUE,
  d  INT );
GO
EXEC  sp_helpindex tbl4;
GO
CREATE TABLE tbl5 (
  a  INT  PRIMARY KEY NONCLUSTERED,
  b  INT  UNIQUE CLUSTERED,
  c  INT  UNIQUE CLUSTERED,
  d  INT );
GO
EXEC  sp_helpindex tbl5;
GO
CREATE TABLE tbL6 (
  a  INT  PRIMARY KEY,
  b  INT  UNIQUE CLUSTERED,
  c  INT  UNIQUE ,
  d  INT );
GO
EXEC  sp_helpindex tbl6;
GO

-------------------------------------------
USE tempdb;
CREATE TABLE mixedTBL (
	userID CHAR(8) NOT NULL,
	name  NVARCHAR(10) NOT NULL,
	addr NCHAR(2)  );
GO
INSERT INTO mixedTbl VALUES('LSG', N'이승기', N'서울');
INSERT INTO mixedTbl VALUES('KBS', N'김범수', N'경기');
INSERT INTO mixedTbl VALUES('KKH', N'김경호', N'경북');
INSERT INTO mixedTbl VALUES('JYP', N'조용필', N'전남');
INSERT INTO mixedTbl VALUES('SSK', N'성시경', N'경기');
INSERT INTO mixedTbl VALUES('LJB', N'임재범', N'경북');
INSERT INTO mixedTbl VALUES('YJS', N'윤종신', N'충남');
INSERT INTO mixedTbl VALUES('EJW', N'은지원', N'강원');
INSERT INTO mixedTbl VALUES('JKW', N'조관우', N'경남');
INSERT INTO mixedTbl VALUES('BBK', N'바비킴', N'경기');
GO
ALTER TABLE mixedTBL
	ADD CONSTRAINT PK_mixedTBL_userID
		PRIMARY KEY (userID);
GO
ALTER TABLE mixedTBL
	ADD CONSTRAINT UK_mixedTBL_name
		UNIQUE (name);
GO
SELECT addr FROM mixedTBL WHERE name = '�����';

SELECT addr FROM mixedTBL WHERE userID = 'LJB';

SELECT * FROM mixedTBL;

-------------------------------------------
USE sqlDB;
SELECT * FROM userTbl;
GO
USE sqlDB;
GO
EXEC sp_helpindex userTbl;
GO
CREATE INDEX idx_userTbl_addr
	ON userTbl (addr);
GO
EXEC sp_helpindex userTbl;
GO
CREATE UNIQUE INDEX idx_userTbl_birtyYear
	ON userTbl (birthYear);
GO
CREATE UNIQUE INDEX idx_userTbl_name
	ON userTbl (name);
GO
EXEC sp_helpindex userTbl;
GO
INSERT INTO userTbl VALUES('GPS', '�����', 1983, '�̱�', NULL , NULL , 162, NULL);
GO
CREATE NONCLUSTERED INDEX idx_userTbl_name_birthYear
	ON userTbl (name,birthYear);
GO
EXEC sp_helpindex userTbl;
GO
SELECT * FROM userTbl WHERE name = '������' and birthYear = '1969';
GO
CREATE NONCLUSTERED INDEX idx_userTbl_mobile1
	ON userTbl (mobile1);
GO
SELECT * FROM userTbl WHERE mobile1 = '011';
GO
EXEC sp_helpindex userTbl;
GO
DROP INDEX userTbl.idx_userTbl_addr;
DROP INDEX userTbl.idx_userTbl_mobile1;
DROP INDEX userTbl.idx_userTbl_name;
DROP INDEX userTbl.idx_userTbl_name_birthYear;
GO
DROP INDEX userTbl.PK__userTBL__CB9A1CDF7D33610F;

-----------------------------------------------
USE tempdb;
CREATE DATABASE indexDB;
GO
USE indexDB;
GO
CREATE PROCEDURE usp_IndexInfo
	@tablename sysname
AS
SELECT @tablename AS '���̺��̸�',
	I.name AS '�ε����̸�',
	I.type_desc AS '�ε���Ÿ��',
	A.data_pages AS '����������', -- ���� ������ ��������
	A.data_pages * 8 AS 'ũ��(KB)', -- �������� KB(1page = 8KB)�ΰ��
	P.rows AS '�ళ��'
FROM sys.indexes I
	INNER JOIN sys.partitions P
		ON P.object_id = I.object_id
			AND OBJECT_ID(@tablename) = I.object_id
			AND I.index_id = P.index_id
	INNER JOIN sys.allocation_units A
		ON A.container_id = P.hobt_id ;
GO
USE indexDB;
SELECT COUNT(*) FROM AdventureWorks.Sales.Customer;
GO
SELECT TOP(19820) * INTO Cust FROM AdventureWorks.Sales.Customer ORDER BY NEWID();
SELECT TOP(19820) * INTO Cust_C FROM AdventureWorks.Sales.Customer ORDER BY NEWID();
SELECT TOP(19820) * INTO Cust_NC FROM AdventureWorks.Sales.Customer ORDER BY NEWID();
GO
SELECT TOP(5)* FROM Cust;
SELECT TOP(5)* FROM Cust_C;
SELECT TOP(5)* FROM Cust_NC;
GO
EXEC usp_IndexInfo Cust;
EXEC usp_IndexInfo Cust_C;
EXEC usp_IndexInfo Cust_NC;
GO
CREATE CLUSTERED INDEX idx_cust_c ON Cust_C (CustomerID);
CREATE NONCLUSTERED INDEX idx_cust_nc ON Cust_NC (CustomerID);
GO
SELECT TOP(5)* FROM Cust;
SELECT TOP(5)* FROM Cust_C;
SELECT TOP(5)* FROM Cust_NC;
GO
EXEC usp_IndexInfo Cust;
EXEC usp_IndexInfo Cust_C;
EXEC usp_IndexInfo Cust_NC;
GO
USE indexDB;
GO
SELECT * FROM Cust WHERE CustomerID = 100;
GO
SELECT * FROM Cust_C WHERE CustomerID = 100;
GO
SELECT * FROM Cust_NC WHERE CustomerID = 100;
GO

--------------------------------