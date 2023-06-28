-- TEST - 1. 학과 이름 및 계열 표시 (단, 출력 header는 "학과 명", "계열")
SELECT DEPARTMENT_NAME AS "학과 명", CATEGORY AS "계열"
FROM TB_DEPARTMENT;

-- TEST - 2. 학과의 학과 정원 출력 (Header = 학과별 정원, record = 00학과의 정원은 00명입니다.)
SELECT (DEPARTMENT_NAME || '의 정원은 ' || CAPACITY || '명입니다.') AS "학과별 정원"
FROM TB_DEPARTMENT;

-- TEST - 3. 국어국문학과 소속 여학생 중, 현재 휴학중인 여학생 출력 (학과코드는 학과 테이블을 조회)
SELECT TS.STUDENT_NAME
FROM TB_STUDENT TS  
JOIN (SELECT DEPARTMENT_NO, DEPARTMENT_NAME
      FROM TB_DEPARTMENT) TD
ON TS.DEPARTMENT_NO = TD.DEPARTMENT_NO
WHERE TS.ABSENCE_YN = 'Y'
	AND SUBSTR(TS.STUDENT_SSN, 8, 1) = 2
	AND TD.DEPARTMENT_NAME = '국어국문학과';

-- TEST - 4. 학번을 통한 연체자 조회
SELECT STUDENT_NAME
FROM TB_STUDENT 
WHERE STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY 1 DESC;

-- TEST - 5. 입학 정원 20명 이상, 30명 이하인 학과 이름 및 계열
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY BETWEEN 20 AND 30;

-- TEST - 6. 총장 이름 출력 (총장의 소속 학과 = NULL)
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;

-- TEST - 7. 학과 미지정 학생 출력
SELECT STUDENT_NAME, DEPARTMENT_NO
FROM TB_STUDENT
WHERE DEPARTMENT_NO IS NULL;

-- DEPARTMENT_NO는 NOT NULL 조건이므로 미지정 불가
-- Join table에서 다시 확인 
SELECT TS.STUDENT_NAME
FROM TB_STUDENT TS  
JOIN (SELECT DEPARTMENT_NO, DEPARTMENT_NAME
      FROM TB_DEPARTMENT) TD
ON TS.DEPARTMENT_NO = TD.DEPARTMENT_NO
WHERE TD.DEPARTMENT_NAME IS NULL;

-- TEST - 8. 선수과목이 존재하는 과목 번호 조회
SELECT  CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

-- TEST - 9. 대학 계열 조회 (Category)
SELECT  DISTINCT  CATEGORY
FROM TB_DEPARTMENT
ORDER BY 1;

-- TEST - 10. 02학번 전주 거주자의 학번, 이름, 주민번호 조회 (휴학생 제외)
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE STUDENT_ADDRESS LIKE ('%전주%')
AND ABSENCE_YN = 'N'
AND EXTRACT(YEAR FROM ENTRANCE_DATE) = '2002';

-- OR
SELECT ENTRANCE_DATE
FROM TB_STUDENT
WHERE ENTRANCE_DATE LIKE '02%'
AND STUDENT_ADDRESS LIKE ('%전주%')
AND ABSENCE_YN = 'N'


