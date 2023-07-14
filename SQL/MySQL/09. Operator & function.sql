USE PRACTICE;

/************************************Operators***********************************/

/***************Comparison operators***************/

/* = : equal to */
SELECT *
FROM CUSTOMER
WHERE GENDER = 'MAN';
 
/* <> or != : not equal to */ 
SELECT *
FROM CUSTOMER
WHERE GENDER <> 'MAN';

/* >= : greater than or equal to */  
SELECT *
FROM CUSTOMER
WHERE YEAR(JOIN_DATE) >= 2020;

/* <= : less than or eqaul to */  
SELECT *
FROM CUSTOMER
WHERE YEAR(JOIN_DATE) <= 2019;
 
/* > : greater than */  
SELECT *
FROM CUSTOMER
WHERE YEAR(JOIN_DATE) > 2019;
 
/* < : less than */  
SELECT *
FROM CUSTOMER
WHERE YEAR(JOIN_DATE) < 2020;
 
/***************Logical operators***************/

/* AND : TRUE if all the conditions separated by AND is TRUE */
SELECT *
FROM CUSTOMER
WHERE GENDER = 'MAN'
AND ADDR = 'Gyeonggi';

/* NOT : Displays a record if the condition(s) is NOT TRUE */ 
SELECT *
FROM CUSTOMER
WHERE NOT GENDER = 'MAN'
AND ADDR = 'Gyeonggi';

/* OR : TRUE if any of the conditions separated by OR is TRUE */    
SELECT *
FROM CUSTOMER
WHERE GENDER = 'MAN'
OR ADDR = 'Gyeonggi';

/* BETWEEN a AND b : TRUE if the operand is within the range of comparisons */
SELECT *
FROM CUSTOMER
WHERE YEAR(BIRTHDAY) BETWEEN 2010 AND 2011;

/* NOT BETWEEN a AND b : TRUE if the operand is out of the range of comparisons */
SELECT *
FROM CUSTOMER
WHERE YEAR(BIRTHDAY) NOT BETWEEN 1950 AND 2020;

/* IN (List) : TRUE if the operand is equal to one of a list of expressions */ 
SELECT *
FROM CUSTOMER
WHERE YEAR(BIRTHDAY) IN (2010,2011);
 
/* NOT IN (List) : TRUE if the operand is not equal to one of a list of expressions */  
SELECT *
FROM CUSTOMER
WHERE YEAR(BIRTHDAY) NOT IN (2010, 2011);

/* LIKE Operator */   
SELECT *
FROM CUSTOMER
WHERE ADDR LIKE 'D%'; /* Finds any values that starts with 'D' */

SELECT *
FROM CUSTOMER
WHERE ADDR LIKE '%N'; /* Finds any values that ends with 'N' */
 
SELECT *
FROM CUSTOMER
WHERE ADDR LIKE '%EO%'; /* Finds any values that have 'EO' in any position */

/* NOT LIKE Operator */
SELECT *
FROM CUSTOMER
WHERE ADDR NOT LIKE '%EO%'; /* Finds any values that does not have 'EO' in any position */ 
 
/* IS NULL : NULL */   
SELECT *
FROM CUSTOMER AS A
	LEFT JOIN SALES AS B
		ON A.MEM_NO = B.MEM_NO
WHERE B.MEM_NO IS NULL;
 
/* Check the result */ 
SELECT *
FROM SALES
WHERE MEM_NO = '1001736';
 
/* IS NOT NULL : NOT NULL */   
SELECT *
FROM CUSTOMER AS A
	LEFT JOIN  SALES AS B
		ON A.MEM_NO = B.MEM_NO
WHERE B.MEM_NO IS NOT NULL;
 
 
/***************Arithmetic Operators***************/
  
SELECT *, A.SALES_QTY * PRICE AS 결제금액
FROM  SALES AS A
	LEFT JOIN  PRODUCT AS B
		ON  A.PRODUCT_CODE = B.PRODUCT_CODE;
    
    
 /***************Set Operators***************/
 
CREATE TEMPORARY TABLE SALES_2019
SELECT *
FROM SALES
WHERE YEAR(ORDER_DATE) = '2019';
 
/* 1235 rows */
SELECT Count(*)
FROM SALES_2019;

/* 3115 rows */
SELECT Count(*)
FROM SALES;

/* UNION : Removing duplicate rows from two or more tables, while ensuring the set has matching column count and data types. */
SELECT COUNT(*)
FROM (
		SELECT *
		FROM SALES_2019
		UNION
		SELECT *
		FROM SALES) AS A;

/* UNION ALL: Combining two or more tables without removing duplicate rows, ensuring the set has matching column count and data types. */
SELECT 3115 + 1235;

SELECT COUNT(*)
FROM (
		SELECT *
		FROM SALES_2019
		UNION ALL
		SELECT *
		FROM SALES) AS A;
		  
  
/********************************Single row functions***********************************/

/***************Numeric functions***************/

/* ABS(Int) : Returns the absolute value of a number */
SELECT ABS(- 200); 

/* ROUND(Int, N) : Rounds a number to a specified number of decimal places */
SELECT ROUND(2.18, 1); 

/* SQRT(Int) : Returns the square root of a number */
SELECT SQRT(9);
 

/***************String functions***************/

/* LOWER(Text) / UPPER(Text) : Converts a string to lower/upper-case */
SELECT LOWER('AB');
SELECT UPPER('ab');

/* LEFT(Text, N) / RIGHT(Text, N) : Extracts a number of characters from a string (starting from left/right)
SELECT LEFT('AB', 1); 
SELECT RIGHT('AB', 1); 

/* LENGTH(Text) : Returns the length of a string (in bytes) */
SELECT LENGTH('AB');


/***************Date functions***************/

/* YEAR / MONTH / DAY(Datetime) : 	Returns the day of the year/month/day for a given date */
SELECT YEAR('2022-12-31');
SELECT MONTH('2022-12-31');
SELECT DAY('2022-12-31');

/* DATE_ADD(Datetime, INTERVAL) : Adds a time/date interval to a date and then returns the date */
SELECT DATE_ADD('2022-12-31', INTERVAL -1 MONTH);

/* DATEDIFF(Datetime_a, Datetime_b) : Returns the number of days between two date values */
SELECT DATEDIFF('2022-12-31', '2022-12-1');


/***************Format functions***************/

/* DATE_FORMAT(Datetime, FORMAT) : Formats a date */
SELECT DATE_FORMAT('2022-12-31', '%m-%d-%y');
SELECT DATE_FORMAT('2022-12-31', '%M-%D-%Y');

/* CAST(value, FORMAT) : Converts a value (of any type) into a specified datatype */
SELECT CAST('2022-12-31 12:00:00' AS DATE);


/***************Advanced functions***************/

/* IFNULL(A, B) : Return a specified value if the A is NULL, otherwise return the B */
SELECT IFNULL(NULL, 0);
SELECT IFNULL('NOT NULL', 0);

/* 
CASE WHEN [Cond1] THEN [Return1]
 	 WHEN [Cond2] THEN [Return2]
     ELSE [Rest] END
: Assign return values based on the conditions
*/
SELECT *, 
		CASE WHEN GENDER = 'MAN' THEN '남성'
		ELSE '여성' END
FROM CUSTOMER;
  
  
/***************Nested function***************/
  
SELECT *
		,YEAR(JOIN_DATE) AS 가입연도
        ,LENGTH( YEAR(JOIN_DATE) ) AS 가입연도_문자수
FROM CUSTOMER;
  
  
/********************************Multiple row funcitions***********************************/
  
/***************Aggregate functions***************/

SELECT  COUNT(ORDER_NO) AS 구매횟수 /* The number of rows */
		,COUNT(DISTINCT MEM_NO) AS 구매자수 /* The number of unique rows  */
        ,SUM(SALES_QTY) AS 구매수량 /* SUM */
        ,AVG(SALES_QTY) AS 평균구매수량 /* MEAN value*/
        ,MAX(ORDER_DATE) AS 최근구매일자 /* MAX value */
        ,MIN(ORDER_DATE) AS 최초구매일자 /* MIN value */
FROM  SALES;
    
/* DISTINCT: Returns unique rows */   

 
/***************Group functions***************/

/* WITH ROLLUP : produce the summary output, including extra rows that represent super-aggregate (higher-level) summary operations*/
SELECT  YEAR(JOIN_DATE) AS 가입연도
		,ADDR
        ,COUNT(MEM_NO) AS 회원수
FROM CUSTOMER
GROUP BY YEAR(JOIN_DATE), ADDR
WITH ROLLUP;


/***************Aggregate function + GROUP BY***************/

SELECT MEM_NO
        ,SUM(SALES_QTY) AS 구매수량
FROM SALES
GROUP BY MEM_NO;
    
/* Check the result */
SELECT *
FROM SALES
WHERE MEM_NO = '1000970';
 
 
 
/********************************Window functions************************************/
  
/***************Ranking functions***************/ 
/* ROW_NUMBER: returns the sequential number for each row within its partition (1,2,3,4,5...) */
/* RANK: assigns a rank for every row within a partition or result set with gaps (1,2,3,3,5...) */
/* DENSE_RANK: assigns a rank for every row within a partition or result set without any gaps (1,2,3,3,4...) */

SELECT ORDER_DATE
		,ROW_NUMBER() OVER (ORDER BY ORDER_DATE ASC) AS 고유한_순위_반환
        ,RANK() OVER (ORDER BY ORDER_DATE ASC) AS 동일한_순위_반환
        ,DENSE_RANK() OVER (ORDER BY ORDER_DATE ASC) AS 동일한_순위_반환_하나의등수
FROM SALES;

/* Ranking function + PARTITION BY: Rank by groups */

SELECT MEM_NO
		,ORDER_DATE
		,ROW_NUMBER() OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 고유한_순위_반환
        ,RANK() OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 동일한_순위_반환
        ,DENSE_RANK() OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 동일한_순위_반환_하나의등수
FROM SALES;

/***************Aggregate function(accumulated)***************/ 

SELECT ORDER_DATE
		,SALES_QTY
        ,'-' AS 구분
        ,COUNT(ORDER_NO) OVER (ORDER BY ORDER_DATE ASC) AS 누적_구매횟수
		,SUM(SALES_QTY) OVER (ORDER BY ORDER_DATE ASC) AS 누적_구매수량
        ,AVG(SALES_QTY) OVER (ORDER BY ORDER_DATE ASC) AS 누적_평균구매수량
        ,MAX(SALES_QTY) OVER (ORDER BY ORDER_DATE ASC) AS 누적_가장높은구매수량
		,MIN(SALES_QTY) OVER (ORDER BY ORDER_DATE ASC) AS 누적_가장낮은구매수량    
FROM SALES;
  
/* Aggregate function(accumulated) + PARTITION BY: Aggregate function by group (accumulated) */

SELECT MEM_NO
		,ORDER_DATE
		,SALES_QTY
        ,'-' AS 구분
        ,COUNT(ORDER_NO) OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 누적_구매횟수        
		,SUM(SALES_QTY) OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 누적_구매수량
        ,AVG(SALES_QTY) OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 누적_평균구매수량
        ,MAX(SALES_QTY) OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 누적_가장높은구매수량
		,MIN(SALES_QTY) OVER (PARTITION BY MEM_NO ORDER BY ORDER_DATE ASC) AS 누적_가장낮은구매수량       
FROM  SALES;
  
  
  