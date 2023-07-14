-- Create the Practice DB
CREATE DATABASE Practice;

-- Use the Practice DB
USE Practice;

-- Create a table
CREATE TABLE 회원테이블 (
회원번호 INT PRIMARY KEY,
이름 VARCHAR(20),
가입일자 DATE NOT NULL,
수신동의 BIT
);


-- PRIMARY KEY : UNIQUE VALUE + NOT NULL

-- Query the table
SELECT *
FROM 회원테이블;

-- Add a row
ALTER TABLE 회원테이블 MODIFY 성별 VARCHAR(20);

-- Change the col name
ALTER TABLE 회원테이블 CHANGE 성별 성 VARCHAR(2);

-- Change the table name
ALTER TABLE 회원테이블 RENAME 회원정보;

SELECT *
FROM 회원정보;

-- Delete the table
DROP TABLE 회원벙보;

SELECT *
FROM 회원정보;


