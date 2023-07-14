/***************Check user***************/
/* Use the MYSQL Database */
USE MYSQL;

/* Query the user table */
SELECT  *
  FROM  USER;
  
/***************Add new user***************/

/* Create user ID & PW */
CREATE USER 'TEST'@LOCALHOST IDENTIFIED BY 'TEST';
-- @LOCALHOST : Local access only
-- IDENTIFIED BY 'PW'

/* Query the user table */
SELECT  *
  FROM  USER;
  
/* Change the user PW */
SET PASSWORD FOR 'TEST'@LOCALHOST = '1234';

  
/***************Grant & revoke rights***************/ 
/** RIGHTS: CREATE, ALTER, DROP, INSERT, DELETE, UPDATE, SELECT, etc.  **/

/* Grant SELECT, DELETE rights */
GRANT SELECT, DELETE ON PRACTICE.회원테이블 TO 'TEST'@LOCALHOST;
-- ON 회원테이블 from PRACTICE database

/* Revoke DELETE rights */
REVOKE DELETE ON PRACTICE.회원테이블 FROM 'TEST'@LOCALHOST;

/* Grant all rights */
GRANT ALL ON Practice.회원테이블 TO 'TEST'@LOCALHOST;

/* Revoke all rights */
REVOKE ALL ON Practice.회원테이블 FROM 'TEST'@LOCALHOST;


/***************Delete user***************/ 

/* Drop the user */
DROP USER 'TEST'@LOCALHOST;

/* Query user table */
SELECT  *
  FROM  USER;


