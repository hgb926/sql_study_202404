-- 1. employees ���̺��� ��� ����� first_name�� �빮�ڷ� ��ȯ�Ͽ� ����ϼ���.
SELECT
    UPPER(first_name)
FROM employees;

-- 2. employees ���̺��� ��� ����� last_name�� �ҹ��ڷ� ��ȯ�Ͽ� ����ϼ���.
SELECT
    LOWER(last_name)
FROM employees;

-- 3. employees ���̺��� �� ����� hire_date�� ������ �����Ͽ� ����ϼ���.
SELECT
    SUBSTR(hire_date, 1, 4)
FROM employees;

-- 4. employees ���̺��� �� ����� hire_date�� ���� ���� �����Ͽ� ����ϼ���. ��: MM-DD ����.
SELECT
     SUBSTR(hire_date, 6, 2) ||'-' ||SUBSTR(hire_date, 9, 2)
FROM employees;


-- 5. departments ���̺��� ��� �μ��� department_name�� �� �� ���ڸ� ����ϼ���.
SELECT
    SUBSTR(department_name, 1, 2)
FROM departments;

-- 6. employees ���̺��� manager_id�� NULL�� ����� �̸��� ��å�� ����ϼ���.
SELECT
    first_name || last_name,
    job_id
FROM employees
WHERE manager_id IS NULL;

-- 7. jobs ���̺��� job_title�� ���̸� ����Ͽ� ����ϼ���.
SELECT
    LENGTH(job_title)
FROM jobs;

-- 8. employees ���̺��� ����� �̸��� ���� �̸����� ������ ���� '��', '�̸�' ��Ī���� ����ϼ���.
SELECT
    first_name ��
    ,last_name �̸�
FROM employees;

-- 9. employees ���̺��� �� ����� ���� ù ���ڿ� �̸��� �����Ͽ� ����ϼ���.
SELECT
    SUBSTR(first_name, 1, 1) || last_name
FROM employees;

-- 10. locations ���̺��� city�� �̸��� ������ ����ϼ���. 
SELECT
    REVERSE(city)
FROM locations;

-- 11. employees ���̺��� �� ����� salary�� 100�޷� ������ �ø��Ͽ� ����ϼ���.
SELECT
    ROUND(salary, -2)
    ,salary
FROM employees;

-- 12. employees ���̺��� �� ����� commission_pct�� NULL�� ���, 0���� ǥ���Ͽ� ����ϼ���.
SELECT
    NVL(commission_pct, 0)
FROM employees;

-- 13. employees ���̺��� �� ����� �̸��� ù ���ڿ� ���� ù ���ڸ� �����Ͽ� ����ϼ���.
SELECT
    SUBSTR(last_name,1,1) || SUBSTR(first_name,1,1)
FROM employees;

-- 14. employees ���̺��� �� ����� salary�� ���� 10% �λ��� �ݾ��� ����Ͽ� ����ϼ���.
SELECT
    salary * 1.1
FROM employees;

-- 15. countries ���̺��� �� ������ �̸��� �� ���ڷ� �ٿ��� ����ϼ���.
SELECT
    SUBSTR(country_name, 1, 3)
FROM countries;

-- 16. employees ���̺��� �� ����� last_name�� �� ��° ���ڸ� '*'�� �����Ͽ� ����ϼ���
SELECT
    SUBSTR(last_name,1,1) || '*' || SUBSTR(last_name,3)
FROM employees;

-- 17. employees ���̺��� job_id�� it_prog�� ����� first_name�� salary�� ����ϼ���.
--  ����1 ) ���ϱ� ���� ���� �ҹ��ڷ� �Է��� ��!
--  ����2 ) �̸��� �� 3���ڱ����� ����ϰ� �������� *�� ��ŷ�� ��. 
--          �� ���� ��Ī�� name�Դϴ�.

SELECT
    RPAD(SUBSTR(first_name,1, 3), LENGTH(first_name), '*') name,
    salary
FROM employees
WHERE LOWER(job_id) = 'it_prog';



