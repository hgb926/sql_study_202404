

-- Ʈ�����
CREATE TABLE student (
    id NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    age NUMBER
);

INSERT INTO student VALUES (1, '��ö��', 15);
INSERT INTO student VALUES (2, 'ȫ�浿', 16);

SELECT
    *
FROM student;

COMMIT; -- ����� �� ����

INSERT INTO student VALUES (3, '�����', 12);

ROLLBACK; -- Ŀ���� ���ϸ� �����·� ����


-- ������ü
UPDATE tb_account
SET balance = balance + 5000
WHERE name = '��ö��';

UPDATE tb_account
SET balance = balance - 5000
WHERE name = '�ڿ���';

COMMIT; -- �� �ΰ��� �۾��� �Ϸ�� �Ŀ� Ŀ���� �ؾ���.


DELETE FROM student; -- student ���̺��� ����
ROLLBACK; -- ����� ���! (Ŀ�� �ߴٸ� �Ұ���)

SELECT * FROM student;

TRUNCATE TABLE student;















