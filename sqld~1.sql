

-- WHERE 조건절
-- 조회 행을 제한
SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd = 2; -- 성별 번호가 2인 사원들만 (여성)

-- PK로 필터링을 하면 무조건 1건 이하가 조회된다. 2건이 나올 수 없음
SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE emp_no = 1000000003;


-- 비교 연산자
SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd != 2;

SELECT
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE birth_de >= '19800101'
    AND birth_de <= '19891231'
;

SELECT
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE NOT birth_de >= '19800101'
;

-- BETWEEN 연산자
SELECT
    emp_no,
    emp_nm,
    birth_de
FROM tb_emp
WHERE birth_de BETWEEN '19900101' AND '19991231';

-- IN 연산 : or 연산
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd = 100002 
    OR dept_cd = 100007 -- OR를 쓰면 두 조건 다 출력
;

SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd IN (100002, 100007) -- IN을 쓰면 위에 코드랑 동일하다
;

-- LIKE
-- 검색에서 사용
-- 와일드카드 매핑 (%: 0글자 이상, _: 딱 1글자)

SELECT
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE addr LIKE '%용인%' -- = 대신 LIKE
;

SELECT
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE emp_nm LIKE '이%' -- 이름이 '이'로 시작하는 사람
;

SELECT
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE emp_nm LIKE '이__' -- 무조건 이름3글자만 조회, 언더바가 두개라 외자 조회 안됨
;

SELECT
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE emp_nm LIKE '%심' -- 이름이 '심'으로 끝나는 사람 
;



-- 성씨가 김씨 이면서 
-- 부서가 100003, 100004 중에 하나면서
-- 90년대생인 사원의 사번, 이름, 생일, 부서코드 조회
SELECT
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM tb_emp
WHERE 1=1 -- true 처리해서 주석처리하기 편하게 한다.
    AND emp_nm LIKE '김%' 
    AND dept_cd IN (100003, 100004) 
    AND birth_de BETWEEN '19900101' AND '19991231'
;


-- NULL값 조회
-- 반드시 IS NULL로 조회할 것!
SELECT
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NULL 
-- null은 = 이 되지 않아서 is null로 조회해야 함
;

SELECT
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT NULL 
;


-- 연산자 우선 순위
-- NOT > AND > OR
SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE 1=1
	AND EMP_NM LIKE '김%'
	AND(ADDR LIKE '%수원%' OR ADDR LIKE '%일산%')
;

-- null 연산은 무조건 결과가 null.
-- null + 3 = null






