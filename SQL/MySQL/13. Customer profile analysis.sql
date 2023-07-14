USE PRACTICE;

/*******************************Customer profile analysis********************************/

/***************Data mart for custmer profile analysis***************/
CREATE TABLE CUSTOMER_PROFILE AS
SELECT A.*
		,DATE_FORMAT(JOIN_DATE, '%Y-%m') AS 가입년월
        ,2021 - YEAR(BIRTHDAY) + 1 AS 나이
        ,CASE WHEN 2021 - YEAR(BIRTHDAY) + 1 < 20 THEN '10대 이하'
			WHEN 2021 - YEAR(BIRTHDAY) + 1 < 30 THEN '20대'
			WHEN 2021 - YEAR(BIRTHDAY) + 1 < 40 THEN '30대'
			WHEN 2021 - YEAR(BIRTHDAY) + 1 < 50 THEN '40대'
			ELSE '50대 이상' END AS 연령대
		,CASE WHEN B.MEM_NO IS NOT NULL THEN '구매'
			ELSE '미구매' END AS 구매여부
  FROM CUSTOMER AS A
  LEFT JOIN (
		SELECT DISTINCT MEM_NO
		FROM SALES
		)AS B
	ON A.MEM_NO = B.MEM_NO;

/* Check the result */
SELECT  *
  FROM  CUSTOMER_PROFILE;

/* 1. Number of customers based on join date */
SELECT 가입년월
		,COUNT(MEM_NO) AS 회원수
FROM CUSTOMER_PROFILE
GROUP BY 가입년월;

/* 2. Average age by gender / Number of customers by gender & age band */
SELECT GENDER AS 성별
		,AVG(나이) AS 평균나이
FROM CUSTOMER_PROFILE
GROUP BY GENDER;

SELECT GENDER AS 성별
		,연령대
		,COUNT(MEM_NO) AS 회원수
FROM CUSTOMER_PROFILE
GROUP BY GENDER, 연령대
ORDER BY GENDER, 연령대;

/* 3. Number of members by gender and age band (+purchase status) */
SELECT GENDER AS 성별
		,연령대
		,구매여부
        ,COUNT(MEM_NO) AS 회원수
FROM CUSTOMER_PROFILE
GROUP BY GENDER
		,연령대
        ,구매여부
ORDER BY 구매여부
		,GENDER
		,연령대;
        
        
