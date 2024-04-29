CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY,
    goods_name VARCHAR2(10) NOT NULL,
    price NUMBER (10) DEFAULT 1000,  
    reg_date DATE
);

-- INSERT
INSERT INTO goods -- insert�� ���̺� ����
    (id, goods_name, price, reg_date) -- �÷���
VALUES 
    (1, '��ǳ��', 120000, SYSDATE); -- �� ����
    

INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES
    (2, '��Ź��', 2000000, SYSDATE);
    
    
INSERT INTO goods
    (id, goods_name, reg_date)
VALUES
    (3, '�ް�', SYSDATE);
    
INSERT INTO goods
    (id, goods_name)
VALUES
    (4, '���');     
    
INSERT INTO goods
    (goods_name, id, reg_date, price) -- ���� �Ҷ� ������ �����ָ� �Ӽ� ���� ������ �������
VALUES
    ('����', 5, SYSDATE, '49000'); 
    
    
-- �÷��� ������ ���̺��� ������� �ڵ� ����, �� ���� ���� ����, ������ ���������ʴ´�
INSERT INTO goods
    
VALUES
    (6, '�����', 1000000, SYSDATE); 



-- UPDATE

UPDATE goods -- goods ���̺���
SET goods_name = '������' -- goods_name�� ���������� �ٲ��
WHERE id = 1 -- ����? id�� 1���� �����͸�
;

UPDATE goods
SET price = 9999; -- ��ü���� ���� Ÿ���� ��� ��� price ���� �� �ٲ�
    
UPDATE goods
SET id = 11
WHERE id = 4;

UPDATE goods
SET price = null
WHERE id = 3;

UPDATE goods
SET goods_name = 'û����',
    price = 299900
WHERE id = 3;

-- DELETE 
-- �� ���� �� ��������
DELETE FROM goods
WHERE id = 11;

-- ���� ���� delete �ϸ� ��ü������
-- �ٸ� �� ������ ������ ������
DELETE FROM goods;
TRUNCATE TABLE goods; -- ���� �Ұ�
DROP TABLE goods; -- ���� �Ұ� + ���̺� ����. ���� ������
    
DELETE FROM goods
WHERE price > 1000;
    
    
SELECT * FROM goods;


-- SELECT �⺻

SELECT -- �ؿ� �����͸� ��ȸ�϶�
    certi_cd,
    certi_nm,
    issue_insti_nm
FROM tb_certi; -- ��𿡼�? tb_certi����


SELECT 
    certi_nm,
    issue_insti_nm
FROM tb_certi; 

SELECT DISTINCT -- �ߺ� ����
    issue_insti_nm
FROM tb_certi;

SELECT 
   * -- ��ü ��ȸ
FROM tb_certi; 

-- �� ��Ī �ο�
SELECT
    emp_nm AS "�����",
    addr AS "�ּ�"
FROM tb_emp;

SELECT
    emp_nm �����, -- AS, "" ���� ����
    addr "������ �ּ�" -- ���� ���� �� "" ���� �Ұ���
FROM tb_emp;

-- ���ڿ� �����ϱ�
SELECT
    '�ڰ���: ' || certi_nm AS "�ڰ��� ����" -- ||�� + �� ����
FROM tb_certi;

SELECT
    certi_nm || ' (' || issue_insti_nm || ')' AS "�ڰ���"
FROM tb_certi; -- SQLD (�ѱ������ͺ��̽������)






