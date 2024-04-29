CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY,
    goods_name VARCHAR2(10) NOT NULL,
    price NUMBER (10) DEFAULT 1000,  
    reg_date DATE
);

-- INSERT
INSERT INTO goods -- insert할 테이블 선언
    (id, goods_name, price, reg_date) -- 컬럼명
VALUES 
    (1, '선풍기', 120000, SYSDATE); -- 값 대입
    

INSERT INTO goods
    (id, goods_name, price, reg_date)
VALUES
    (2, '세탁기', 2000000, SYSDATE);
    
    
INSERT INTO goods
    (id, goods_name, reg_date)
VALUES
    (3, '달고나', SYSDATE);
    
INSERT INTO goods
    (id, goods_name)
VALUES
    (4, '계란');     
    
INSERT INTO goods
    (goods_name, id, reg_date, price) -- 대입 할때 순서만 맞춰주면 속성 선언 순서는 상관없음
VALUES
    ('점퍼', 5, SYSDATE, '49000'); 
    
    
-- 컬럼명 생략시 테이블구조 순서대로 자동 기입, 값 대입 순서 주의, 하지만 지양하지않는다
INSERT INTO goods
    
VALUES
    (6, '냉장고', 1000000, SYSDATE); 



-- UPDATE

UPDATE goods -- goods 테이블에서
SET goods_name = '에어컨' -- goods_name을 에어컨으로 바꿔라
WHERE id = 1 -- 누굴? id가 1번인 데이터를
;

UPDATE goods
SET price = 9999; -- 구체적인 지목 타겟이 없어서 모든 price 값이 다 바뀜
    
UPDATE goods
SET id = 11
WHERE id = 4;

UPDATE goods
SET price = null
WHERE id = 3;

UPDATE goods
SET goods_name = '청바지',
    price = 299900
WHERE id = 3;

-- DELETE 
-- 한 줄을 싹 날려버림
DELETE FROM goods
WHERE id = 11;

-- 조건 없이 delete 하면 전체삭제됨
-- 다만 이 문법은 복구가 가능함
DELETE FROM goods;
TRUNCATE TABLE goods; -- 복구 불가
DROP TABLE goods; -- 복구 불가 + 테이블 날라감. 가장 위험함
    
DELETE FROM goods
WHERE price > 1000;
    
    
SELECT * FROM goods;


-- SELECT 기본

SELECT -- 밑에 데이터를 조회하라
    certi_cd,
    certi_nm,
    issue_insti_nm
FROM tb_certi; -- 어디에서? tb_certi에서


SELECT 
    certi_nm,
    issue_insti_nm
FROM tb_certi; 

SELECT DISTINCT -- 중복 제거
    issue_insti_nm
FROM tb_certi;

SELECT 
   * -- 전체 조회
FROM tb_certi; 

-- 열 별칭 부여
SELECT
    emp_nm AS "사원명",
    addr AS "주소"
FROM tb_emp;

SELECT
    emp_nm 사원명, -- AS, "" 생략 가능
    addr "거주지 주소" -- 띄어쓰기 있을 때 "" 생략 불가능
FROM tb_emp;

-- 문자열 결합하기
SELECT
    '자격증: ' || certi_nm AS "자격증 정보" -- ||은 + 와 동일
FROM tb_certi;

SELECT
    certi_nm || ' (' || issue_insti_nm || ')' AS "자격증"
FROM tb_certi; -- SQLD (한국데이터베이스진흥원)






