create table journal (
	id NUMBER PRIMARY key, -- 일지 일련번호
	document_type varchar2(10), -- 게시글 타입
	document_id number, -- 게시글 일련번호
	account_id number, -- 작성자 일련번호
	created_on DATE, -- 작성일자
	content varchar2(4000) -- 내용
);
CREATE SEQUENCE JOURNAL_SEQ 
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9999999
	CYCLE;

SELECT * FROM JOURNAL;
SELECT content, created_on 
FROM journal
WHERE document_id = 45
AND upper(document_type) = upper('task');
INSERT INTO journal VALUES (journal_seq.nextval, 'Task', 9999, 99999, sysdate, 'Task Journal Test');