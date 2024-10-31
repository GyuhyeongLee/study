USE tempdb;
GO
CREATE DATABASE sqlDB;
GO
USE sqlDB;
-- DROP TABLE userTBL;
CREATE  TABLE  userTBL -- ȸ�� ���̺�
( userID	CHAR(8)	NOT NULL  PRIMARY KEY,
  name		NVARCHAR(10) NOT NULL,
  birthYear	INT  NOT  NULL,f
  addr		NCHAR(2) NOT NULL,
  mobile1	CHAR(3),
  mobile2	CHAR(8),
  height	SMALLINT, 
  mDate		DATE
);
GO
-- DROP TABLE buyTBL;
CREATE TABLE buyTBL
( num	INT  IDENTITY  NOT NULL PRIMARY KEY, 
  userID  CHAR(8) NOT NULL   
	FOREIGN KEY REFERENCES userTBL(userID),
  prodName	NCHAR(6) NOT NULL,
  groupName	NCHAR(4),
  price	INT  NOT NULL,
  amount	SMALLINT  NOT NULL
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
INSERT INTO buyTBL VALUES('KBS' , '�ȭ', NULL, 30 , 2);
INSERT INTO buyTbl VALUES('KBS', '��Ʈ��', '����', 1000, 1);
INSERT INTO buyTbl VALUES('JYP', '�����', '����', 200, 1);
INSERT INTO buyTbl VALUES('BBK', '�����', '����', 200, 5);
INSERT INTO buyTbl VALUES('KBS', 'û����', '�Ƿ�', 50, 3);
INSERT INTO buyTbl VALUES('BBK', '�޸�', '����', 80, 10);
INSERT INTO buyTbl VALUES('SSK', 'å' , '����', 15, 5);
INSERT INTO buyTbl VALUES('EJW', 'å' , '����', 15, 2);
INSERT INTO buyTbl VALUES('EJW', 'û����', '�Ƿ�', 50, 1);
INSERT INTO buyTbl VALUES('BBK', '�ȭ', NULL , 30, 2);
INSERT INTO buyTbl VALUES('EJW', 'å' , '����', 15, 1);
INSERT INTO buyTbl VALUES('BBK', '�ȭ', NULL , 30, 2);
GO
SELECT * FROM userTBL;
SELECT * FROM buyTBL;

