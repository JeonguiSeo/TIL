-- Use Practice DB
USE Practice;

-- Create table
-- Create 회원테이블
CREATE TABLE 회원테이블 (
회원번호 INT PRIMARY KEY,
이름 VARCHAR(20),
가입일자 DATE NOT NULL,
수신동의 BIT
);


-- Insert data
INSERT INTO 회원테이블 VALUES (1001, '홍길동', '2020-01-02', 1);
INSERT INTO 회원테이블 VALUES (1002, '이순신', '2020-01-03', 0);
INSERT INTO 회원테이블 VALUES (1003, '장영실', '2020-01-04', 1);
INSERT INTO 회원테이블 VALUES (1004, '유관순', '2020-01-05', 0);

-- Get 회원테이블
SELECT  *  FROM  회원테이블;


-- Data type 위반 시, 삽입 불가

 
-- Get data  
-- Select all row 
SELECT  *  
  FROM  회원테이블;
 
-- Select specific col  
SELECT  회원번호,
		이름
  FROM  회원테이블;

-- Select specific col with alias
SELECT  회원번호,
		이름 AS 성명
  FROM  회원테이블;


-- Modify table
/* Modify all col data */
UPDATE 회원테이블
   SET 수신동의 = 0;
  
SELECT  *
  FROM  회원테이블;

-- Modify col data of specific row
UPDATE 회원테이블
   SET 수신동의 = 1
 WHERE 이름 = '홍길동';
 
SELECT  *
  FROM  회원테이블;
  
  
-- Delete data
-- Delete specific data 
DELETE 
  FROM 회원테이블
 WHERE 이름 = '홍길동';
 
SELECT  *
  FROM  회원테이블;
  
-- Delete all data
DELETE 
  FROM 회원테이블;

SELECT  *
  FROM  회원테이블;
  
  
  