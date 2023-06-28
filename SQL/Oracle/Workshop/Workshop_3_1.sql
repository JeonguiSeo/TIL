-- TEST - 6. 80년생 여학생 중, 성이 '김'씨인 학생의 주민번호 및 학생이름 조회 (학생이름 오름차순)

SELECT (SUBSTR(STUDENT_SSN, 1, 8) || '*******') AS 주민번호, STUDENT_NAME AS 학생이름
FROM TB_STUDENT
WHERE SUBSTR(STUDENT_SSN, 1, 2) = 80 -- OR (STUDENT_SSN LIKE '80%')
AND SUBSTR(STUDENT_SSN, 8, 1) = 2
AND SUBSTR(STUDENT_NAME, 1, 1) = '김' -- OR (STUDENT_NAME LIKE '김%')
ORDER BY 2;

-- TEST - 7. '예체능' 계열의 학과 정원 기준 40 이상은 '대강의실', 30 이상은 '중강의실', 나머지는 '소강의실로 출력 
-- 단, 정원이 많은 순으로 정렬
SELECT DEPARTMENT_NAME AS 학과이름, CAPACITY AS 현재정원,
			CASE WHEN CAPACITY >= 40 THEN '대강의실'
					WHEN CAPACITY >= 30 THEN '대강의실'
					ELSE '대강의실'
					END AS 강의실크기
FROM TB_DEPARTMENT
WHERE CATEGORY = '예체능'
ORDER BY 2 DESC;

-- TEST - 8. 2005/01/01~2006/12/31 기간에 입학한 학생 중, 주소가 등록되지 않은 남학생의 정보
-- 학과번호, 학생이름, 지도교수번호, 입학년도 조회 (입학년도 기준 ASC)
SELECT DEPARTMENT_NO AS 학과번호, STUDENT_NAME AS 학생이름,
			COACH_PROFESSOR_NO AS 지도교수번호,
			EXTRACT(YEAR FROM ENTRANCE_DATE) || '년' AS 입학년도
FROM TB_STUDENT
WHERE EXTRACT(YEAR FROM ENTRANCE_DATE) IN ('2005', '2006')
AND SUBSTR(STUDENT_SSN, 8, 1) = 1
AND STUDENT_ADDRESS IS NULL
ORDER BY 4, 2 ASC;