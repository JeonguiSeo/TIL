USE PRACTICE;

/***************INNER JOIN***************/
/* INNER JOIN: Combine 2 tables based on the common values */

/* Customer + Sales Inner JOIN */
SELECT  *
FROM CUSTOMER AS A
	INNER JOIN SALES AS B
		ON  A.MEM_NO = B.MEM_NO;

/* The Customer and Sales tables have a 1:N relationship based on the mem_no column. */
SELECT *
FROM CUSTOMER AS A
	INNER JOIN SALES AS B
		ON A.MEM_NO = B.MEM_NO
WHERE A.MEM_NO = '1000970';
 
 
/***************LEFT JOIN***************/
/* LEFT JOIN: Match only the common values and assign NULL to the unmatched data on the left table. */

/* Customer + Sales LEFT JOIN */
SELECT *
FROM CUSTOMER AS A
LEFT JOIN SALES AS B
	ON A.MEM_NO = B.MEM_NO;

/*  NULL represents members who have registered but have not placed any orders. */


/***************RIGHT JOIN***************/
/* RIGHT JOIN: Match only the common values and assign NULL to the unmatched data on the right table. */

/* Customer + Sales RIGHT JOIN */
SELECT *
FROM CUSTOMER AS A
RIGHT JOIN SALES AS B
	ON A.MEM_NO = B.MEM_NO
WHERE A.MEM_NO IS NULL;

/* MEM_NO 9999999 represents non-members */


/***************JOIN + SELECT***************/

/* Inner JOIN Customer & Sales tables */
SELECT *
FROM CUSTOMER AS A
INNER JOIN SALES AS B
	ON A.MEM_NO = B.MEM_NO;

/* Create a temporary table */
CREATE TEMPORARY TABLE CUSTOMER_SALES_INNER_JOIN
SELECT A.*, B.ORDER_NO
FROM CUSTOMER AS A
INNER JOIN SALES AS B
    ON A.MEM_NO = B.MEM_NO;

/* Query a temporary table */
SELECT * 
FROM CUSTOMER_SALES_INNER_JOIN;

/* Temporary table is automatically deleted when the server connection is terminated. */
   

/* Filter based on GENDER = 'MANFilter based on GENDER = 'MAN' */
SELECT *
FROM CUSTOMER_SALES_INNER_JOIN
WHERE GENDER = 'MAN';


/* Aggregate the purchase count by residential area. */
SELECT ADDR, COUNT(ORDER_NO) AS 구매횟수
FROM CUSTOMER_SALES_INNER_JOIN
WHERE GENDER = 'MAN'
GROUP BY ADDR;


/* Filter based on ORDER_NO < 100 */
SELECT ADDR, COUNT(ORDER_NO) AS 구매횟수
FROM CUSTOMER_SALES_INNER_JOIN
WHERE GENDER = 'MAN'
GROUP BY ADDR
HAVING COUNT(ORDER_NO) < 100;


/* Query all columns */
/* in ascending order of ORDER_NO */
SELECT ADDR, COUNT(ORDER_NO) AS 구매횟수
FROM CUSTOMER_SALES_INNER_JOIN
WHERE GENDER = 'MAN'
GROUP BY ADDR
HAVING COUNT(ORDER_NO) < 100
ORDER BY COUNT(ORDER_NO) ASC;
    
    
/***************Combine more than 3 tables***************/
/* Based on the Sales table, left join the Customer, Product tables */

SELECT *
FROM SALES AS A
	LEFT JOIN CUSTOMER AS B
		ON A.MEM_NO = B.ME	M_NO
	LEFT JOIN PRODUCT AS C
		ON A.PRODUCT_CODE = C.PRODUCT_CODE;