USE PRACTICE;

/*****************************Data mart for customer analysis******************************/

/***************Customer purhcase info***************/

/* Create customer purchase info table */
SELECT A.MEM_NO, A.GENDER, A.BIRTHDAY, A.ADDR, A.JOIN_DATE
		,SUM(B.SALES_QTY * C.PRICE) AS 구매금액
        ,COUNT(B.ORDER_NO) AS 구매횟수
        ,SUM(B.SALES_QTY) AS 구매수량
FROM CUSTOMER AS A
	LEFT JOIN SALES AS B
		ON A.MEM_NO = B.MEM_NO
	LEFT JOIN PRODUCT AS C
		ON B.PRODUCT_CODE = C.PRODUCT_CODE
 GROUP BY A.MEM_NO, A.GENDER, A.BIRTHDAY, A.ADDR, A.JOIN_DATE;

/* Create a temp table for customer purchase info */
CREATE TEMPORARY TABLE CUSTOMER_PUR_INFO AS
SELECT A.MEM_NO, A.GENDER, A.BIRTHDAY, A.ADDR, A.JOIN_DATE
		,SUM(B.SALES_QTY * C.PRICE) AS 구매금액
        ,COUNT(B.ORDER_NO) AS 구매횟수
        ,SUM(B.SALES_QTY) AS 구매수량
FROM CUSTOMER AS A
	LEFT JOIN SALES AS B
		ON A.MEM_NO = B.MEM_NO
	LEFT JOIN PRODUCT AS C
		ON B.PRODUCT_CODE = C.PRODUCT_CODE
GROUP BY A.MEM_NO, A.GENDER, A.BIRTHDAY, A.ADDR, A.JOIN_DATE;
 
/* Check the temp table */ 
SELECT  * FROM CUSTOMER_PUR_INFO;
 

/***************Customer age band***************/
 
/* BIRTHDAY -> AGE */
SELECT  *
		,2021-YEAR(BIRTHDAY) + 1 AS 나이
FROM  CUSTOMER;

/* BIRTHDAY -> AGE -> AGE BAND */
SELECT  *
		,CASE WHEN 나이 < 10 THEN '10대 미만'
			WHEN 나이 < 20 THEN '10대'
			WHEN 나이 < 30 THEN '20대'
			WHEN 나이 < 40 THEN '30대'
			WHEN 나이 < 50 THEN '40대'
			ELSE '50대 이상' END AS 연령대         
FROM (
		SELECT  *
				,2021-YEAR(BIRTHDAY) +1 AS 나이
		FROM  CUSTOMER
		) AS A;

/* When using CASE WHEN function, it is applied sequentially */
SELECT  *
		,CASE WHEN 나이 < 50 THEN '40대'
			  WHEN 나이 < 10 THEN '10대 미만'
              WHEN 나이 < 20 THEN '10대'
              WHEN 나이 < 30 THEN '20대'
              WHEN 나이 < 40 THEN '30대'
              ELSE '50대 이상' END AS 연령대         
FROM (
		SELECT  *
				,2021-YEAR(BIRTHDAY) +1 AS 나이
		FROM CUSTOMER
		) AS A; 
 
/* Temp table for customer age band */
CREATE TEMPORARY TABLE CUSTOMER_AGEBAND AS
SELECT A.*
		,CASE WHEN 나이 < 10 THEN '10대 미만'
			WHEN 나이 < 20 THEN '10대'
			WHEN 나이 < 30 THEN '20대'
			WHEN 나이 < 40 THEN '30대'
			WHEN 나이 < 50 THEN '40대'
			ELSE '50대 이상' END AS 연령대         
FROM (
		SELECT  *
				,2021-YEAR(BIRTHDAY) + 1 AS 나이
		FROM CUSTOMER
		) AS A;

/* Check the temp table */ 
SELECT  * FROM CUSTOMER_AGEBAND;


/***************Temp table for customer purchase info & age band***************/
CREATE TEMPORARY TABLE CUSTOMER_PUR_INFO_AGEBAND AS
SELECT  A.*
		,B.연령대
FROM CUSTOMER_PUR_INFO AS A
	LEFT JOIN CUSTOMER_AGEBAND AS B
		ON A.MEM_NO = B.MEM_NO;

/* Check the temp table */ 
SELECT  * FROM CUSTOMER_PUR_INFO_AGEBAND;


/***************Customer's preferred categories***************/

/* Ranking of purchases by customer & category */
SELECT A.MEM_NO
		,B.CATEGORY
		,COUNT(A.ORDER_NO) AS 구매횟수
		,ROW_NUMBER() OVER(PARTITION BY A.MEM_NO ORDER BY COUNT(A.ORDER_NO) DESC) AS 구매횟수_순위
FROM SALES AS A
	LEFT JOIN PRODUCT AS B
		ON A.PRODUCT_CODE = B.PRODUCT_CODE   
GROUP BY A.MEM_NO, B.CATEGORY;


/* Filter only 1st place in the purchase count ranking */
SELECT  *
  FROM  (
		SELECT  A.MEM_NO
				,B.CATEGORY
				,COUNT(A.ORDER_NO) AS 구매횟수
				,ROW_NUMBER() OVER(PARTITION BY A.MEM_NO ORDER BY COUNT(A.ORDER_NO) DESC) AS 구매횟수_순위
		FROM SALES AS A
			LEFT JOIN PRODUCT AS B
				ON A.PRODUCT_CODE = B.PRODUCT_CODE
		GROUP BY A.MEM_NO, B.CATEGORY
		) AS A
 WHERE 구매횟수_순위 = 1;

/* Temp table for customer's preferred categories */
CREATE TEMPORARY TABLE CUSTOMER_PRE_CATEGORY AS
SELECT *
FROM (
		SELECT A.MEM_NO
				,B.CATEGORY
				,COUNT(A.ORDER_NO) AS 구매횟수
				,ROW_NUMBER() OVER(PARTITION BY A.MEM_NO ORDER BY COUNT(A.ORDER_NO) DESC) AS 구매횟수_순위
		FROM SALES AS A
		LEFT JOIN PRODUCT AS B
			ON A.PRODUCT_CODE = B.PRODUCT_CODE
		GROUP BY A.MEM_NO, B.CATEGORY
		) AS A
WHERE 구매횟수_순위 = 1;

/* Check the temp table */ 
SELECT * FROM CUSTOMER_PRE_CATEGORY;


/***************Temp table for customer purchase info + age band + preferred categories***************/
CREATE TEMPORARY TABLE CUSTOMER_PUR_INFO_AGEBAND_PRE_CATEGORY AS
SELECT A.*
		,B.CATEGORY AS PRE_CATEGORY
FROM CUSTOMER_PUR_INFO_AGEBAND AS A
	LEFT JOIN CUSTOMER_PRE_CATEGORY AS B
		ON A.MEM_NO = B.MEM_NO;

/* Check the temp table */ 
SELECT  * FROM CUSTOMER_PUR_INFO_AGEBAND_PRE_CATEGORY;


/***************Create a data mart for customer analysis***************/
CREATE TABLE CUSTOMER_MART AS
SELECT *
FROM CUSTOMER_PUR_INFO_AGEBAND_PRE_CATEGORY;
   
/* Check the temp table */    
SELECT *
FROM CUSTOMER_MART;



/*********************************Data consistency**********************************/

/***************Check for duplicate members in the data mart***************/

SELECT *
  FROM CUSTOMER_MART;

SELECT COUNT(MEM_NO)
		,COUNT(DISTINCT MEM_NO)
FROM CUSTOMER_MART;


/***************Check for any error in the derived variables of the data mart***************/
  
SELECT *
  FROM CUSTOMER_MART;

/* Customer(1000005)'s purchase info */
/* Purchase amount: 408000 / Number of purchases: 3 / Purchased quantity: 14 */

SELECT SUM(A.SALES_QTY * B.PRICE) AS 구매금액
        ,COUNT(A.ORDER_NO) AS 구매횟수
        ,SUM(A.SALES_QTY) AS 구매수량
FROM SALES AS A
	LEFT JOIN PRODUCT AS B
		ON A.PRODUCT_CODE = B.PRODUCT_CODE
WHERE MEM_NO = '1000005';

/* Customer(1000005)'s preferred category */
/* PRE_CATEGORY: home */
SELECT *
FROM SALES AS A
	LEFT JOIN PRODUCT AS B
		ON A.PRODUCT_CODE = B.PRODUCT_CODE
WHERE MEM_NO = '1000005';
 
 
/***************Check for any errors in the purchaser distribution of the data mart***************/

/* Based on the Customer table, LEFT JOIN with the member numbers from the Sales table. */
SELECT  *
FROM  CUSTOMER AS A
	LEFT JOIN  (
		SELECT DISTINCT MEM_NO
		FROM SALES
			) AS B
		ON A.MEM_NO = B.MEM_NO;
   
/* Add purchase status */
SELECT *
		,CASE WHEN B.MEM_NO IS NOT NULL THEN '구매'
			ELSE '미구매' END AS 구매여부
FROM CUSTOMER AS A
	LEFT JOIN (
		SELECT DISTINCT MEM_NO
		FROM SALES
			) AS B
		ON A.MEM_NO = B.MEM_NO;
 
/* Count the number of members by purchase status */
SELECT  구매여부
		,COUNT(MEM_NO) AS 회원수
FROM(
	SELECT A.*
		,CASE WHEN B.MEM_NO IS NOT NULL THEN '구매'
			ELSE '미구매' END AS 구매여부
			FROM  CUSTOMER AS A
				LEFT JOIN (
					SELECT DISTINCT MEM_NO
					FROM SALES
					) AS B
					ON A.MEM_NO = B.MEM_NO
	) AS A
GROUP BY 구매여부; 
 
/* Not Purchased: 1459 / Purchased: 1202 */ 
SELECT COUNT(*)
FROM CUSTOMER_MART
WHERE 구매금액 IS NULL;
 
SELECT COUNT(*)
FROM CUSTOMER_MART
WHERE 구매금액 IS NOT NULL; 