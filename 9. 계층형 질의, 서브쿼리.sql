-- 계층형 쿼리 
-- START WITH : 계층의 첫 단계를 어디서 시작할 것인지의 대한 조건
-- CONNECT BY PRIOR 자식 = 부모  -> 순방향 탐색
-- CONNECT BY 자식 = PRIOR 부모  -> 역방향 탐색
-- ORDER SIBLINGS BY : 같은 레벨끼리의 정렬을 정함.
SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "조직인원",
    A.dept_cd,
    B.dept_nm,
    A.emp_no,
    A.direct_manager_emp_no,
    CONNECT_BY_ISLEAF
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
START WITH A.direct_manager_emp_no IS NULL
-- START WITH A.EMP_NO = '1000000037'
CONNECT BY PRIOR A.emp_no = A.direct_manager_emp_no
ORDER SIBLINGS BY A.emp_no DESC
;


SELECT
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
;

-- 계층형 쿼리 
-- START WITH : 계층의 첫 단계를 어디서 시작할 것인지의 대한 조건
-- CONNECT BY PRIOR 자식 = 부모  -> 순방향 탐색
-- CONNECT BY 자식 = PRIOR 부모  -> 역방향 탐색
-- ORDER SIBLINGS BY : 같은 레벨끼리의 정렬을 정함.
SELECT 
    LEVEL AS LVL,
    LPAD(' ', 4*(LEVEL-1)) || emp_no || '(' || emp_nm || ')' AS "조직인원",
    A.dept_cd,
    B.dept_nm,
    A.emp_no,
    A.direct_manager_emp_no,
    CONNECT_BY_ISLEAF -- 잎사귀냐? 0 or 1
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
START WITH A.direct_manager_emp_no IS NULL
-- START WITH A.EMP_NO = '1000000037'
CONNECT BY PRIOR A.emp_no = A.direct_manager_emp_no
ORDER SIBLINGS BY A.emp_no DESC -- 형제들(sibling)끼리는 사원번호 내림차 정렬
;




-- # 서브쿼리 : SQL안에 SQL이 포함된 구문
-- ## 단일행 서브쿼리 : 조회 결과가 1건 이하

-- 부서코드가 100004번인 부서의 사원들 정보 조회
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd = '100004'
;

-- 이나라가 속한 부서의 모든 사원정보 조회
-- 이나라는 부서코드가 몇번이냐?
-- 그 부서코드로 모든 사원을 조회해라
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd = ( -- 100004 가 들어감
    SELECT
        dept_cd
    FROM tb_emp
    WHERE emp_nm = '이나라'
)
;



SELECT
    dept_cd
FROM tb_emp
WHERE emp_nm = '이관심'
;

? 사원이름이 이관심인 사람이 속해 있는 부서의 사원정보 조회
? 단일행 비교연산자(=, <>, >, >=, <, <=)는 단일행 서브쿼리로만 비교해야 함.
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd = ( -- 100004 가 들어감
    SELECT
        dept_cd
    FROM tb_emp
    WHERE emp_nm = '이관심'
)
;


-- 20200525에 받은 급여가 회사전체의 20200525일 
-- 전체 평균 급여보다 높은 사원들의 정보(사번, 이름, 급여지급일, 받은급여액수) 조회

-- 1. 일단 회사전체 20200525 평균급여를 계산
-- 2. 그 평균보다 높은 사원 조회

SELECT
    E.emp_no,
    E.emp_nm,
    S.pay_de,
    S.pay_amt
FROM tb_emp E
JOIN tb_sal_his S
ON E.emp_no = S.emp_no
WHERE S.pay_de = '20200525'
    AND S.pay_amt >= 
    (SELECT
        AVG(pay_amt)
     FROM tb_sal_his
     WHERE pay_de = '20200525')
;

-- 20200525 회사 전체 급여 평균
SELECT
    AVG(pay_amt)
FROM tb_sal_his
WHERE pay_de = '20200525'
;





-- # 다중행 서브쿼리
-- 서브쿼리의 조회 건수가 0건 이상인 것
-- ## 다중행 연산자
-- 1. IN : 메인쿼리의 비교조건이 서브쿼리 결과중에 하나라도 일치하면 참
--    ex )  salary IN (200, 300, 400)
--            250 ->  200, 300, 400 중에 없으므로 false
-- 2. ANY, SOME : 메인쿼리의 비교조건이 서브쿼리의 검색결과 중 하나 이상 일치하면 참
--    ex )  salary > ANY (200, 300, 400)
--            250 ->  200보다 크므로 true
-- 3. ALL : 메인쿼리의 비교조건이 서브쿼리의 검색결과와 모두 일치하면 참
--    ex )  salary > ALL (200, 300, 400)
--            250 ->  200보다는 크지만 300, 400보다는 크지 않으므로 false
-- 4. EXISTS : 메인쿼리의 비교조건이 서브쿼리의 결과 중 
--				만족하는 값이 하나라도 존재하면 참


SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd IN (
    SELECT
        dept_cd
    FROM tb_emp
    WHERE emp_nm = '이관심'
)
;

-- 한국데이터베이스진흥원에서 발급한 자격증을 가지고 있는
-- 사원의 사원번호와 사원이름과 해당 사원의 한국데이터베이스진흥원에서 
-- 발급한 자격증 개수를 조회

SELECT
    E.emp_no,
    E.emp_nm,
    COUNT(S.certi_cd) "자격증 개수"
FROM tb_emp E
INNER JOIN tb_emp_certi S
ON E.emp_no = S.emp_no
WHERE S.certi_cd IN (
    SELECT certi_cd
    FROM tb_certi
    WHERE issue_insti_nm = '한국데이터베이스진흥원'
)
GROUP BY E.emp_no, E.emp_nm
ORDER BY E.emp_no
;

-- 위아래는 동일하다. IN, = ANY

SELECT
    E.emp_no,
    E.emp_nm,
    COUNT(S.certi_cd) "자격증 개수"
FROM tb_emp E
INNER JOIN tb_emp_certi S
ON E.emp_no = S.emp_no
WHERE S.certi_cd = ANY (
    SELECT certi_cd
    FROM tb_certi
    WHERE issue_insti_nm = '한국데이터베이스진흥원'
)
GROUP BY E.emp_no, E.emp_nm
ORDER BY E.emp_no
;


-- EXISTS문 : 메인쿼리의 비교조건이 서브쿼리의 결과 중 
--           만족하는 값이 하나라도 존재하면 참
-- EXISTS문의 SELECT문은 어떤 값이 들어오던 중요하지 않다, *이 들어와도 된다.
-- 중요한건 WHERE절, WHERE에서 매칭된 값만 가져온다.
-- 주소가 강남인 직원들이 근무하고 있는 부서정보를 조회 (부서코드, 부서명)
SELECT
    dept_cd,
    dept_nm
FROM tb_dept
WHERE dept_cd IN (
    SELECT
        dept_cd
    FROM tb_emp
    WHERE addr LIKE '%강남%'
    )
;



SELECT
    dept_cd,
    dept_nm
FROM tb_dept D
WHERE EXISTS (
    SELECT
        D.dept_cd
    FROM tb_emp E
    WHERE addr LIKE '%강남%'
        AND D.dept_cd = E.dept_cd
    )
;




-- # 다중 컬럼 서브쿼리
--  : 서브쿼리의 조회 컬럼이 2개 이상인 서브쿼리
-- 서브쿼리와 메인쿼리의 컬럼명(갯수)를 맞춰줘야 함!

-- 부서원이 2명 이상인 부서 중에서 각 부서의 
-- 가장 연장자의 사번과 이름 생년월일과 부서코드를 조회

SELECT 
    A.emp_no, A.emp_nm, A.birth_de, A.dept_cd, B.dept_nm
FROM tb_emp A
JOIN tb_dept B
ON A.dept_cd = B.dept_cd
WHERE (A.dept_cd, A.birth_de) IN (
                        SELECT 
                            dept_cd, MIN(birth_de)
                        FROM tb_emp
                        GROUP BY dept_cd
                        HAVING COUNT(*) >= 2
                    )
ORDER BY A.emp_no
;



-- 인라인 뷰 서브쿼리, 성능 개선을 위해 필터링 후 조회할 수 있게 해줌
-- FROM 절에 쓰는 서브쿼리

-- 각 사원의 사번과 이름과 평균 급여정보를 알고 싶음
SELECT
    E.emp_no,
    E.emp_nm,
    AVG(S.pay_amt)
FROM tb_emp E
JOIN (
    SElECT emp_no, AVG(pay_amt) AS pay_avg
    FROM tb_sal_his
    GROUP BY emp_no
) S
ON E.emp_no = S.emp_no
ORDER BY E.emp_no
;




-- 스칼라 서브쿼리 (SELECT, INSERT, UPDATE절에 쓰는 서브쿼리)
-- 다른 테이블에서 소수의 정보를 가져와야 할때, 성능을 고려하여 
-- 굳이 조인하지 않고 메인쿼리의 SELECT 문 내부에서 서브쿼리를 사용하는 법.

-- 사원의 사번, 사원명, 부서명, 생년월일, 성별코드를 조회
SELECT
    E.emp_no,
    E.emp_nm,
    (SELECT dept_nm FROM tb_dept D WHERE E.dept_cd = D.dept_cd) AS dept_nm,
    E.birth_de,
    E.sex_cd
FROM tb_emp E
;












