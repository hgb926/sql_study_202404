

-- 트랜잭션
CREATE TABLE student (
    id NUMBER PRIMARY KEY,
    NAME VARCHAR2(100),
    age NUMBER
);

INSERT INTO student VALUES (1, '김철수', 15);
INSERT INTO student VALUES (2, '홍길동', 16);

SELECT
    *
FROM student;

COMMIT; -- 깃발을 딱 꽂음

INSERT INTO student VALUES (3, '도우너', 12);

ROLLBACK; -- 커밋을 안하면 원상태로 복귀


-- 계좌이체
UPDATE tb_account
SET balance = balance + 5000
WHERE name = '김철수';

UPDATE tb_account
SET balance = balance - 5000
WHERE name = '박영희';

COMMIT; -- 위 두개의 작업이 완료된 후에 커밋을 해야함.


DELETE FROM student; -- student 테이블을 지움
ROLLBACK; -- 지운거 취소! (커밋 했다면 불가능)

SELECT * FROM student;

TRUNCATE TABLE student;















