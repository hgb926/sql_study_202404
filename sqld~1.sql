

-- WHERE ������
-- ��ȸ ���� ����
SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE sex_cd = 2; -- ���� ��ȣ�� 2�� ����鸸 (����)

-- PK�� ���͸��� �ϸ� ������ 1�� ���ϰ� ��ȸ�ȴ�. 2���� ���� �� ����
SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd
FROM tb_emp
WHERE emp_no = 1000000003;


-- �� ������
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

-- BETWEEN ������
SELECT
    emp_no,
    emp_nm,
    birth_de
FROM tb_emp
WHERE birth_de BETWEEN '19900101' AND '19991231';

-- IN ���� : or ����
SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd = 100002 
    OR dept_cd = 100007 -- OR�� ���� �� ���� �� ���
;

SELECT
    emp_no,
    emp_nm,
    dept_cd
FROM tb_emp
WHERE dept_cd IN (100002, 100007) -- IN�� ���� ���� �ڵ�� �����ϴ�
;

-- LIKE
-- �˻����� ���
-- ���ϵ�ī�� ���� (%: 0���� �̻�, _: �� 1����)

SELECT
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE addr LIKE '%����%' -- = ��� LIKE
;

SELECT
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE emp_nm LIKE '��%' -- �̸��� '��'�� �����ϴ� ���
;

SELECT
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE emp_nm LIKE '��__' -- ������ �̸�3���ڸ� ��ȸ, ����ٰ� �ΰ��� ���� ��ȸ �ȵ�
;

SELECT
    emp_no, 
    emp_nm, 
    addr
FROM tb_emp
WHERE emp_nm LIKE '%��' -- �̸��� '��'���� ������ ��� 
;



-- ������ �达 �̸鼭 
-- �μ��� 100003, 100004 �߿� �ϳ��鼭
-- 90������ ����� ���, �̸�, ����, �μ��ڵ� ��ȸ
SELECT
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM tb_emp
WHERE 1=1 -- true ó���ؼ� �ּ�ó���ϱ� ���ϰ� �Ѵ�.
    AND emp_nm LIKE '��%' 
    AND dept_cd IN (100003, 100004) 
    AND birth_de BETWEEN '19900101' AND '19991231'
;


-- NULL�� ��ȸ
-- �ݵ�� IS NULL�� ��ȸ�� ��!
SELECT
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NULL 
-- null�� = �� ���� �ʾƼ� is null�� ��ȸ�ؾ� ��
;

SELECT
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT NULL 
;


-- ������ �켱 ����
-- NOT > AND > OR
SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE 1=1
	AND EMP_NM LIKE '��%'
	AND(ADDR LIKE '%����%' OR ADDR LIKE '%�ϻ�%')
;

-- null ������ ������ ����� null.
-- null + 3 = null






