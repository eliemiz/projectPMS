CREATE TABLE NOTICE(
   id NUMBER PRIMARY KEY, 
   project_id NUMBER, 
   account_id NUMBER, 
   subject varchar2(300),
   content varchar2(4000), 
   created_on DATE,
   updated_on DATE
);
SELECT * FROM notice
ORDER BY id DESC;

INSERT INTO notice values(
	1, 0001, 0001, 'Test 제목', 'Test 내용', '2021-03-01', '2021-04-01'
);
SELECT * FROM USER_SEQUENCES;

CREATE SEQUENCE NOTICE_SEQ 
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9999999
	CYCLE; 

DELETE FROM notice;

drop sequence NOTICE_SEQ;