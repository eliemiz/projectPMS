CREATE TABLE risk(
	id NUMBER PRIMARY KEY,
	project_id NUMBER,
	account_id NUMBER,
	subject varchar2(300),
	description varchar2(4000),
	status varchar2(30),
	category varchar2(30),
	created_on DATE,
	updated_on DATE,
	start_date DATE,
	end_date DATE,
	probability NUMBER,
	impact NUMBER,
	strategy varchar2(30),
	treatment varchar2(4000)
);
SELECT * FROM risk
ORDER BY id DESC;
WHERE id = 6;
DELETE FROM risk WHERE id=4;

DROP TABLE risk;
INSERT INTO risk VALUES(
	risk_seq.nextval, 0001, 0002, 'risk 제목', '상세 설명', '상태', '유형',
	'2021-04-01', sysdate, '2021-03-01', '2021-03-02', 5, 3,
	'전략', '해결방안'
);
CREATE SEQUENCE RISK_SEQ 
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9999999
	CYCLE; 

SELECT r.*, a.name
FROM RISK r, ACCOUNT a
WHERE r.ACCOUNT_ID = a.ID
ORDER BY r.ID DESC;

SELECT r.*, a.name
FROM RISK r, ACCOUNT a
WHERE r.ACCOUNT_ID = a.ID 
AND r.id = 10;

DELETE FROM risk;
SELECT * FROM USER_SEQUENCES;

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'RISK_SEQ';
ALTER SEQUENCE RISK_SEQ INCREMENT BY -41;
SELECT RISK_SEQ.NEXTVAL FROM DUAL;
ALTER SEQUENCE RISK_SEQ INCREMENT BY 1;
drop sequence RISK_SEQ;



