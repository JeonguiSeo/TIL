-- TEST - 34. 현 학과 정원 10% 증원 업데이트 (ROUND 사용)
UPDATE TB_DEPARTMENT 
SET CAPACITY = ROUND(CAPACITY * 1.1, 0);

-- 결과 확인
SELECT * FROM TB_DEPARTMENT;

ROLLBACK;

-- TEST - 35. 학번 A413042 박건우 학생의 주소 업데이트
-- ('서울시 종로구 숭인동 181-21')
UPDATE TB_STUDENT 
SET STUDENT_ADDRESS = '서울시 종로구 숭인동 181-21'
WHERE STUDENT_NO = 'A413042';

-- 결과 확인
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT
WHERE STUDENT_NO = 'A413042';

ROLLBACK;

-- TEST - 36. 학생의 주민번호 뒷자리 삭제 업데이트
UPDATE TB_STUDENT 
SET STUDENT_SSN = SUBSTR(STUDENT_SSN, 1, 6);

SELECT STUDENT_SSN
FROM TB_STUDENT;

ROLLBACK;

-- TEST - 37. 의학과 김명훈 학생의 2005년 1학기 수강 '피부생리학' 점수 정정 (to 3.5)
UPDATE TB_GRADE
SET POINT = 3.5
WHERE STUDENT_NO = (SELECT STUDENT_NO
                    				FROM TB_STUDENT
                    				WHERE STUDENT_NAME = '김명훈'
                    				AND DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                                         									FROM TB_DEPARTMENT
                                         									WHERE DEPARTMENT_NAME = '의학과'))
AND TERM_NO = '200501'
AND CLASS_NO = (SELECT CLASS_NO
							FROM TB_CLASS
							WHERE CLASS_NAME = '피부생리학');

-- OR
						
UPDATE  TB_GRADE
SET  POINT = 3.5
WHERE  TERM_NO = ‘200501’
AND CLASS_NO = (SELECT CLASS_NO
                   FROM TB_CLASS
                  WHERE CLASS_NAME = ‘피부생리학’ )
 AND STUDENT_NO = ( SELECT STUDENT_NO
                       FROM TB_STUDENT
                       JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
                       WHERE STUDENT_NAME = ‘김명훈’
                       AND DEPARTMENT_NAME = ‘의학과’ );


-- 결과 확인
SELECT POINT
FROM TB_GRADE
WHERE STUDENT_NO = (SELECT STUDENT_NO
                    				FROM TB_STUDENT
                    				WHERE STUDENT_NAME = '김명훈'
                    				AND DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                                         									FROM TB_DEPARTMENT
                                         									WHERE DEPARTMENT_NAME = '의학과'))
AND TERM_NO = '200501'
AND CLASS_NO = (SELECT CLASS_NO
							FROM TB_CLASS
							WHERE CLASS_NAME = '피부생리학');

						
ROLLBACK;



-- TEST - 38
DELETE FROM TB_GRADE  
WHERE STUDENT_NO IN (SELECT STUDENT_NO
									FROM TB_STUDENT 
									WHERE ABSENCE_YN = 'Y');
								
ROLLBACK;