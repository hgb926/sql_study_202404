

-- 사원의 first_name, employee_id, department_id, dept_name

SELECT
    E.employee_id,
    E.first_name,
    e.department_id,
    d.department_name
FROM employees E
INNER JOIN departments D
ON E.department_id = D.department_id
ORDER BY e.employee_id
;

-- natural 조인은 겹치는 컬럼이 있으면 조건을 겹치는 수만큼 걸어버린다.
-- 그래서 natural조인과 inner 조인은 항상 같은 결과를 출력하지 않는다.
SELECT
    E.employee_id,
    E.first_name,
    department_id,
    d.department_name
FROM employees E
NATURAL JOIN departments D
ORDER BY E.employee_id
;

SELECT
    E.employee_id,
    E.first_name,
    d.department_id,
    d.department_name
FROM employees E
INNER JOIN departments D
ON e.department_id = d.department_id
    AND e.manager_id = d.manager_id
ORDER BY E.employee_id
;



SELECT
    E.employee_id,
    E.first_name,
    department_id,
    d.department_name
FROM employees E
INNER JOIN departments D
USING (department_id)
ORDER BY e.employee_id
;

SELECT
    E.employee_id,
    E.first_name,
    department_id,
    d.department_name
FROM employees E
INNER JOIN departments D
USING (department_id, manager_id)
ORDER BY E.employee_id
;




-- 1. employees테이블과 departments테이블을 inner join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_id,
    d.department_name
FROM employees E
INNER JOIN departments D
ON e.department_id = d.department_id
;

-- 2. employees테이블과 departments테이블을 natural join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    department_id,
    d.department_name
FROM employees E
NATURAL JOIN departments D
;




-- 3. employees테이블과 departments테이블을 using절을 사용하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    department_id,
    d.department_name
FROM employees E
INNER JOIN departments D
USING (department_id)
;


-- 4. employees테이블과 departments테이블과 locations 테이블을 
--    join하여 employee_id, first_name, department_name, city를 조회하세요

SELECT
    e.employee_id,
    e.first_name,
    d.department_name,
    l.city
FROM employees E
INNER JOIN departments D
ON e.department_id = d.department_id
JOIN locations L
ON l.location_id = d.location_id
;

-- 5. employees 테이블과 jobs 테이블을 INNER JOIN하여 
-- 사원의 first_name, last_name, job_title을 조회하세요.

SELECT
    e.first_name,
    e.last_name,
    j.job_title
FROM employees E
INNER JOIN jobs J
ON e.job_id = j.job_id
;

-- 6. employees 테이블과 departments 테이블을 INNER JOIN하여 
-- 부서명과 각 부서의 최대 급여값을 조회하세요.

SELECT
    d.department_name,
    MAX(salary)
FROM employees E
INNER JOIN departments D
ON e.department_id = d.department_id
GROUP BY d.department_name
;

-- 7. employees 테이블과 jobs 테이블을 INNER JOIN하여 
--    직무별 평균 급여와 직무 타이틀을 조회하세요.
SELECT
    AVG(E.salary),
    j.job_title
FROM employees E
INNER JOIN jobs J
ON e.job_id = j.job_id
GROUP BY e.job_id, j.job_title
;


