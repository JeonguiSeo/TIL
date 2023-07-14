USE PRACTICE;

/***************FROM***************/

/* Check all coulumns on the Customer table */
SELECT *
FROM CUSTOMER;


/***************WHERE***************/

/* Filter the results by gender = 'MAN' */
SELECT *
FROM CUSTOMER
WHERE  GENDER = 'MAN';
 
 
/***************GROUP BY***************/

/* Aggregate the count of members by region */
SELECT ADDR, COUNT(MEM_NO) AS 회원수
FROM CUSTOMER
WHERE GENDER = 'MAN'
GROUP BY ADDR;


/***************HAVING***************/

/* Filter the results by COUNT(MEM_NO) < 100 */
SELECT ADDR, COUNT(MEM_NO) AS 회원수
FROM CUSTOMER
WHERE GENDER = 'MAN'
GROUP BY ADDR
HAVING COUNT(MEM_NO) < 100;


/***************ORDER BY***************/

/* Sort the results in descending order */
SELECT ADDR, COUNT(MEM_NO) AS 회원수
FROM CUSTOMER
WHERE GENDER = 'MAN'
GROUP BY ADDR
HAVING COUNT(MEM_NO) < 100
ORDER BY COUNT(MEM_NO) DESC;


/***************FROM -> (WHERE) -> GROUP BY***************/

SELECT ADDR, COUNT(MEM_NO) AS 회원수
FROM CUSTOMER
/* WHERE  GENDER = 'MAN' */
GROUP BY ADDR;


/***************GROUP BY + Aggregate function***************/
/* Filter the results by ADDR IN ('SEOUL', 'INCHEON') */
/* Group the results by ADDR & GENDER */
SELECT ADDR, GENDER, COUNT(MEM_NO) AS 회원수
FROM CUSTOMER
WHERE ADDR IN ('SEOUL', 'INCHEON')
GROUP BY ADDR, GENDER;

/* "To obtain the columns in a GROUP BY statement as part of the result, 
	they must be included in the SELECT statement." */
SELECT GENDER, COUNT(MEM_NO) AS 회원수
FROM CUSTOMER
WHERE ADDR IN ('SEOUL', 'INCHEON')
GROUP BY ADDR, GENDER;
        

/***************the syntax for writing SQL commands***************/

/* Filter the Customer table /
/ by gender as male /
/ Aggregate the count of members by residential area /
/ Filter the aggregated member count by less than 100 /
/ Retrieve all columns /
/ Sort by the aggregated member count in descending order */

SELECT ADDR, COUNT(MEM_NO) AS 회원수
FROM CUSTOMER
WHERE GENDER = 'MAN'
GROUP BY ADDR
HAVING COUNT(MEM_NO) < 100
ORDER BY COUNT(MEM_NO) DESC;

