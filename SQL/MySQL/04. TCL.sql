/* User the practice DB*/
USE Practice;

/***************Create a table***************/
/* Drop the existing table */
DROP TABLE 회원테이블;

/* Create a new table */
CREATE TABLE 회원테이블 (
회원번호 INT PRIMARY KEY,
이름 VARCHAR(20),
가입일자 DATE NOT NULL,
수신동의 BIT
);

/* Query the table */
SELECT  *  FROM  회원테이블;


/***************BEGIN + ROLLBACK*******************/  
/* Begin a transaction */
BEGIN;

/* Insert a new record */
INSERT INTO 회원테이블 VALUES (1001, '홍길동', '2020-01-02', 1);

/* Query the table */
SELECT  *  FROM  회원테이블;

/* Rollback */
ROLLBACK;


/* Query the table */
SELECT  *  FROM  회원테이블;


/***************BEGIN + COMMIT*******************/  
/* Begin a transaction */
BEGIN;

/* Insert a new record */
INSERT INTO 회원테이블 VALUES (1005, '장보고', '2020-01-06', 1);

/* Commit */
COMMIT;

/* Query the table */
SELECT  *  FROM  회원테이블;


/***************SAVEPOINT*******************/ 
/* Drop the existing table */
DELETE FROM 회원테이블;

/* Query the table */
SELECT  *  FROM  회원테이블;

/* Begin a new transaction */
BEGIN;

/* Insert a new record */
INSERT INTO 회원테이블 VALUES (1005, '장보고', '2020-01-06', 1);

/* Assign savepoint S1 */
SAVEPOINT S1;

/* Update a new record */
UPDATE  회원테이블
   SET  이름 = '이순신';
 
/* Assign savepoint S2 */
SAVEPOINT S2;

/* Delete the record */
DELETE 
  FROM  회원테이블;
 
/* Assign savepoint S3 */
SAVEPOINT S3;

/* Query the table */
SELECT  *  FROM  회원테이블;

/* Rollback to savepoint S2 */
ROLLBACK TO S2;
 
/* Query the table */
SELECT  *  FROM  회원테이블;

/* Commit */
COMMIT;

/* Query the table */
SELECT  *  FROM  회원테이블;
