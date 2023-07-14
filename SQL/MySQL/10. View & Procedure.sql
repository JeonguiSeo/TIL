USE PRACTICE;

/************************************VIEW************************************/

/***************Combine tables***************/
/* 주문(Sales) 테이블 기준, 상품(Product) 테이블 LEFT JOIN 결합 */

SELECT A.*
		,A.SALES_QTY * B.PRICE AS 결제금액
FROM SALES AS A
	LEFT JOIN PRODUCT AS B
		ON A.PRODUCT_CODE = B.PRODUCT_CODE;


/***************Create a VIEW***************/
    
CREATE VIEW SALES_PRODUCT AS
SELECT A.*
		,A.SALES_QTY * B.PRICE AS 결제금액
FROM SALES AS A
	LEFT JOIN PRODUCT AS B
		ON A.PRODUCT_CODE = B.PRODUCT_CODE;


/***************Query the VIEW***************/

SELECT *
FROM SALES_PRODUCT;


/***************ALTER the VIEW***************/
  
ALTER VIEW SALES_PRODUCT AS
SELECT A.*
		,A.SALES_QTY * B.PRICE * 1.1 AS 결제금액_수수료포함
FROM SALES AS A
	LEFT JOIN PRODUCT AS B
		ON A.PRODUCT_CODE = B.PRODUCT_CODE;
    
/* Check the VIEW */    
SELECT *
FROM SALES_PRODUCT;   
  

/***************DROP the VIEW***************/

DROP VIEW SALES_PRODUCT;
    

/***************VIEW is NOT able to save duplicated column names***************/
       
/* 
CREATE VIEW SALES_PRODUCT AS
SELECT *
  FROM SALES AS A
	LEFT JOIN PRODUCT AS B
		ON A.PRODUCT_CODE = B.PRODUCT_CODE; 
*/
    
    
    
/********************************PROCEDURE***********************************/

/***************IN parameter***************/    

DELIMITER //
CREATE PROCEDURE CST_GEN_ADDR_IN(IN INPUT_A VARCHAR(20), INPUT_B VARCHAR(20))
BEGIN
	SELECT *
	FROM CUSTOMER
	WHERE GENDER = INPUT_A
			AND ADDR = INPUT_B;
END //
DELIMITER ;

/* DELIMITER: used to change the delimiter for creating stored procedures, functions, or triggers. */
/* Default : DELIMITER = ';' */

/***************Execute the PROCEDURE***************/
    
CALL CST_GEN_ADDR_IN('MAN', 'SEOUL');

CALL CST_GEN_ADDR_IN('WOMEN', 'INCHEON');


/***************DROP the PROCEDURE***************/
    
DROP PROCEDURE CST_GEN_ADDR_IN;


/**************OUT parameter***************/    

DELIMITER //
CREATE PROCEDURE CST_GEN_ADDR_IN_CNT_MEM_OUT( IN INPUT_A VARCHAR(20), INPUT_B VARCHAR(20), OUT CNT_MEM INT )
BEGIN
	SELECT COUNT(MEM_NO)
		INTO CNT_MEM	# INTO : Returns the result of OUT parameter 
	FROM CUSTOMER
	WHERE GENDER = INPUT_A
			AND ADDR = INPUT_B;
END //
DELIMITER ;


/***************Execute the PROCEDURE***************/
    
CALL CST_GEN_ADDR_IN_CNT_MEM_OUT('WOMEN', 'INCHEON', @CNT_MEM);
SELECT  @CNT_MEM;


/**************IN/OUT parameter***************/    

DELIMITER //
CREATE PROCEDURE IN_OUT_PARAMETER( INOUT COUNT INT)
BEGIN
	SET COUNT = COUNT + 10;
END //
DELIMITER ;


/***************Execute the PROCEDURE***************/

SET @counter = 1;
CALL IN_OUT_PARAMETER(@counter);
SELECT  @counter;
