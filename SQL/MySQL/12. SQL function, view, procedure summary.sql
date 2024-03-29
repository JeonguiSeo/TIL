USE PRACTICE;

/****************************************************************************/
/******************************SQL function, view, procedure summary*******************************/
/****************************************************************************/

/***************Operator & function***************/

/* 1. CUSTOMER 테이블을 활용하여, 가입일자가 2019년이며 생일이 4~6월생인 회원수를 조회하시오.*/
SELECT COUNT(MEM_NO)
FROM CUSTOMER
WHERE YEAR(JOIN_DATE) = 2019 
	AND MONTH(JOIN_DATE) BETWEEN 4 AND 6;


/* 2. SALES 및 PRODUCT 테이블을 활용하여, 1회 주문시 평균 구매금액를 구하시오.(비회원 9999999 제외)*/

/* 1회 주문시 구매금액 */
SELECT SUM(S.SALES_QTY * P.PRICE) / COUNT(S.ORDER_NO) AS 1회_주문시_구매금액
FROM SALES AS S
	LEFT JOIN PRODUCT AS P
		USING (PRODUCT_CODE)
WHERE S.MEM_NO <> '9999999';
	
    
/* 3. SALES 테이블을 활용하여, 구매수량이 높은 상위 10명을 조회하시오.(비회원 9999999 제외)*/
 
/* 회원별 구매수량 순위 */  
SELECT MEM_NO
		,SUM(SALES_QTY) AS SUM_SALES_QTY
		,RANK() OVER (ORDER BY SUM(SALES_QTY) DESC) AS RANK_SALES_QTY
FROM SALES
WHERE MEM_NO <> '9999999'
GROUP BY MEM_NO;

/* 회원별 구매수량 순위 + 상위 10위 이하 필터링 */  
SELECT *
FROM (
	SELECT MEM_NO
			,SUM(SALES_QTY) AS SUM_SALES_QTY
			,RANK() OVER (ORDER BY SUM(SALES_QTY) DESC) AS RANK_SALES_QTY
	FROM SALES
	WHERE MEM_NO <> '9999999'
	GROUP BY MEM_NO
    ) AS A
WHERE RANK_SALES_QTY <= 10;



/***************View 및 Procedure***************/

/* 1. View를 활용하여, Sales 테이블 기준으로 CUSTOMER 및 PRODUCT 테이블을 LEFT JOIN 결합한 가상 테이블을 생성하시오.*/
/* 열은 SALES 테이블의 모든 열 + CUSTOMER 테이블의 GENDER + PRODUCT 테이블의 BRAND*/

CREATE VIEW SALES_GENDER_BRAND AS
SELECT S.*
		, C.GENDER
        , P.BRAND
FROM SALES S
	LEFT JOIN CUSTOMER C
		USING (MEM_NO)
	LEFT JOIN PRODUCT AS P
		USING(PRODUCT_CODE);


/* 확인 */
SELECT  *
FROM SALES_GENDER_BRAND;
  

/* 2. Procedure를 활용하여, CUSTOMER의 몇월부터 몇월까지의 생일인 회원을 조회하는 작업을 저장하시오.*/

DELIMITER //
CREATE PROCEDURE CST_BIRTH_MONTH_IN (IN INPUT_A INT, INPUT_B INT)
BEGIN
	SELECT *
    FROM CUSTOMER
    WHERE MONTH(BIRTHDAY) BETWEEN INPUT_A AND INPUT_B;
END //
DELIMITER ;

/* 확인 */
CALL CST_BIRTH_MONTH_IN(4, 6);



/***************데이터 마트***************/

/* 1. SALES 및 PRODUCT 테이블을 활용하여, SALES 테이블 기준으로 PRODUCT 테이블을 LEFT JOIN 결합한 테이블을 생성하시오.*/
/* 열은 SALES 테이블의 모든 열 + PRODUCT 테이블의 CATEGORY, TYPE + SALES_QTY * PRICE 구매금액 */
CREATE TABLE SALES_MART AS
SELECT S.*
		,P.CATEGORY
        ,P.TYPE
		,S.SALES_QTY * P.PRICE AS SALES_AMOUNT
FROM SALES S
	LEFT JOIN PRODUCT P
		USING (PRODUCT_CODE);

/* 확인 */
SELECT *
FROM SALES_MART;
  

/* 2. (1)에서 생성한 데이터 마트를 활용하여, CATEGORY 및 TYPE별 구매금액 합계를 구하시오*/
SELECT CATEGORY
		,TYPE
		,SUM(SALES_AMOUNT)
FROM SALES_MART
GROUP BY CATEGORY, TYPE;


  
