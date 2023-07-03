-- Create Practice DB
CREATE DATABASE Practice;

-- Use Practice DB
USE Practice;

-- Create table
CREATE TABLE 회원테이블 (
회원번호 INT PRIMARY KEY,
이름 VARCHAR(20),
가입일자 DATE NOT NULL,
수신동의 BIT
);


-- PRIMARY KEY : UNIQUE VALUE + NOT NULL

-- GET 회원테이블
SELECT *
FROM 회원테이블;

-- ADD ROW
ALTER TABLE 회원테이블 MODIFY 성별 VARCHAR(20);

-- CHANGE COL NAME
ALTER TABLE 회원테이블 CHANGE 성별 성 VARCHAR(2);

-- CHANGE TABLE NAME
ALTER TABLE 회원테이블 RENAME 회원정보;

SELECT *
FROM 회원정보;

-- DELETE TABLE
DROP TABLE 회원벙보;

SELECT *
FROM 회원정보;


