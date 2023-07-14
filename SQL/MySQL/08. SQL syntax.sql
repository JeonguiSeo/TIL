USE PRACTICE;


/***************Query data (SELECT)***************/

/* 1. Retrieve the number of members by year of registration and region from the CUSTOMER table.*/
/* Utilize the FROM clause, GROUP BY clause, SELECT clause, YEAR function, and COUNT function. */
SELECT YEAR(JOIN_DATE), ADDR, COUNT(MEM_NO)
FROM CUSTOMER
GROUP BY YEAR(JOIN_DATE), ADDR;
  
  
/* 2. Add a condition for male members and a condition for having 50 or more members to the query in (1).*/
/* Utilize the WHERE clause and HAVING clause. */
SELECT YEAR(JOIN_DATE), ADDR, COUNT(MEM_NO)
FROM CUSTOMER
WHERE GENDER ='MAN'
GROUP BY YEAR(JOIN_DATE), ADDR
HAVING COUNT(MEM_NO) >= 50;


/* 3. Sort the query from (2) in descending order by the number of members.*/
/* Utilize the ORDER BY clause. */
SELECT YEAR(JOIN_DATE), ADDR, COUNT(MEM_NO)
FROM CUSTOMER
WHERE GENDER ='MAN'
GROUP BY YEAR(JOIN_DATE), ADDR
HAVING COUNT(MEM_NO) >= 50
ORDER BY COUNT(MEM_NO) DESC;
    
    
/***************SELECT + JOIN***************/

/* 1. LEFT JOIN the PRODUCT table with the SALES table as the basis.*/
/* Utilize the LEFT JOIN clause. */
SELECT *
FROM SALES
	LEFT JOIN PRODUCT
		USING (PRODUCT_CODE);
        
        
/* 2. Using the combined table from (1), calculate the quantity sold by brand. */
/* Utilize the GROUP BY clause and SUM function.*/
SELECT P.BRAND, SUM(SALES_QTY)
FROM SALES S
	LEFT JOIN PRODUCT P
		USING (PRODUCT_CODE)
GROUP BY P.BRAND;
        
    
/* 3. Using the CUSTOMER and SALES tables, calculate the number of members who only registered but have no order history.*/
/* LEFT JOIN 활용 */   
SELECT COUNT(C.MEM_NO)
FROM CUSTOMER C
	LEFT JOIN SALES S
		USING (MEM_NO)
WHERE S.ORDER_NO IS NULL;


/**************SELECT + JOIN + Sub Query***************/

/* 1. Use a subquery in the FROM clause to calculate the quantity sold by PRODUCT_CODE from the SALES table.*/
/* Utilize the subquery in the FROM clause and the SUM function. */

SELECT *
FROM (
		SELECT PRODUCT_CODE, SUM(SALES_QTY)
		FROM SALES
		GROUP BY PRODUCT_CODE
        ) AS S;


/* 2. Apply the query from (1) to LEFT JOIN the PRODUCT table.*/
/* Utilize the LEFT JOIN clause. */
SELECT *
FROM (
		SELECT PRODUCT_CODE, SUM(SALES_QTY)
		FROM SALES
		GROUP BY PRODUCT_CODE
        ) AS S
        LEFT JOIN PRODUCT P USING (PRODUCT_CODE); 

        
/* 3. Using the query from (2), calculate the quantity sold by category and brand.*/
/* Utilize the GROUP BY clause and SUM function.*/
SELECT P.CATEGORY, P.BRAND, SUM(판매수량) AS 판매수량
FROM (
		SELECT PRODUCT_CODE, SUM(SALES_QTY) AS 판매수량
		FROM SALES
		GROUP BY PRODUCT_CODE
        ) AS S
        LEFT JOIN PRODUCT P USING (PRODUCT_CODE)
GROUP BY P.CATEGORY, P.BRAND; 

