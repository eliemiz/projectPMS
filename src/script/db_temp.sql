-- 테이블 삭제
DROP TABLE TEMP;

-- 테이블 생성
CREATE TABLE TEMP (
	NAME VARCHAR2(30),
	AGE NUMBER
);

-- 데이터 추가
INSERT INTO TEMP VALUES ('홍길동', 30);

-- 데이터 조회
SELECT * FROM TEMP;