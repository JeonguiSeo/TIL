USE PRACTICE;

/*********************************RFM anaylsis***********************************/

/***************Data mart for RFM analysis***************/
CREATE TABLE RFM AS
SELECT A.*
		,B.구매금액
        ,B.구매횟수
FROM CUSTOMER AS A
LEFT JOIN (
		SELECT A.MEM_NO
				,SUM(A.SALES_QTY * B.PRICE) AS 구매금액 /* Monetary */
				,COUNT(A.ORDER_NO) AS 구매횟수 /* Frequency */
		FROM SALES AS A
		LEFT JOIN PRODUCT AS B
			ON A.PRODUCT_CODE = B.PRODUCT_CODE
		WHERE YEAR(A.ORDER_DATE) = '2020' /* Recency */
		 GROUP BY  A.MEM_NO
		) AS B
	ON A.MEM_NO = B.MEM_NO;

/* Check the result */
SELECT *
FROM RFM;


/* 1. Number of members by RFM segment */

SELECT *
		,CASE WHEN 구매금액 > 5000000 THEN 'VIP'
			WHEN 구매금액 > 1000000 OR 구매횟수 > 3 THEN '우수회원'
			WHEN 구매금액 > 0 THEN '일반회원'
			ELSE '잠재회원' END AS 회원세분화
FROM RFM;

SELECT 회원세분화
		,COUNT(MEM_NO) AS 회원수
FROM (
		SELECT *
				,CASE WHEN 구매금액 > 5000000 THEN 'VIP'
					WHEN 구매금액 > 1000000 OR 구매횟수 > 3 THEN '우수회원'
					WHEN 구매금액 > 0 THEN '일반회원'
					ELSE '잠재회원' END AS 회원세분화
		FROM RFM
		) AS A
GROUP BY 회원세분화
ORDER BY 회원수 ASC;


/* 2. Purchase amount by RFM segment */

SELECT 회원세분화
		,SUM(구매금액) AS 구매금액
FROM (
		SELECT  *
			,CASE WHEN 구매금액 > 5000000 THEN 'VIP'
				WHEN 구매금액 > 1000000 OR 구매횟수 > 3 THEN '우수회원'
				WHEN 구매금액 > 0 THEN '일반회원'
				ELSE '잠재회원' END AS 회원세분화
		FROM RFM
		) AS A
GROUP BY 회원세분화
ORDER BY 구매금액 DESC;


/* 3. Avg purchase amount per customer by RFM segment */

SELECT 회원세분화
		,SUM(구매금액) / COUNT(MEM_NO) AS 인당_구매금액
FROM (
		SELECT  *
				,CASE WHEN 구매금액 >  5000000 THEN 'VIP'
					WHEN 구매금액 >  1000000 OR 구매횟수 > 3 THEN '우수회원'
					WHEN 구매금액 >        0 THEN '일반회원'
					ELSE '잠재회원' END AS 회원세분화
		FROM RFM
		) AS A
GROUP BY 회원세분화
ORDER BY 인당_구매금액 DESC;
