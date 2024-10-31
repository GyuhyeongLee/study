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
INSERT INTO userTbl VALUES('KBS', N'김범수', 1979, N'경북', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTBL VALUES('LSG', N'이승기', 1987, N'서울', '011', '11111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KKH', N'김경호', 1971, N'경기', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', N'조용필', 1950, N'전남', '011', '4444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', N'성시경', 1979, N'경기', NULL , NULL , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', N'임재범', 1963, N'충북', '016', '6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', N'윤종신', 1969, N'강원', NULL , NULL , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', N'은지원', 1972, N'경기', '011', '8888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', N'조규완', 1965, N'전남', '018', '9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', N'바비킴', 1973, N'경북', '010', '0000000', 176, '2013-5-5');
GO
INSERT INTO buyTBL VALUES('KBS', N'김범수', NULL, 30 , 2);
INSERT INTO buyTbl VALUES('KBS', N'김범수', N'컴퓨터', 1000, 1);
INSERT INTO buyTbl VALUES('JYP', N'조용필', N'신발', 200, 1);
INSERT INTO buyTbl VALUES('BBK', N'바비킴', N'바지', 200, 5);
INSERT INTO buyTbl VALUES('KBS', N'김범수', N'펜', 50, 3);
INSERT INTO buyTbl VALUES('BBK', N'바비킴', N'마우스', 80, 10);
INSERT INTO buyTbl VALUES('SSK', N'성시경' , N'연필', 15, 5);
INSERT INTO buyTbl VALUES('EJW', N'은지원' , N'연필', 15, 2);
INSERT INTO buyTbl VALUES('EJW', N'은지원', N'펜', 50, 1);
INSERT INTO buyTbl VALUES('BBK', N'바비킴', NULL , 30, 2);
INSERT INTO buyTbl VALUES('EJW', N'은지원' , N'연필', 15, 1);
INSERT INTO buyTbl VALUES('BBK', N'바비킴', NULL , 30, 2);
GO
SELECT * FROM userTBL;
SELECT * FROM buyTBL;

