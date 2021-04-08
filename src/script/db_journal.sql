create table journal (
	id NUMBER PRIMARY key, -- 일지 일련번호
	document_type varchar2(10), -- 게시글 타입
	document_id number, -- 게시글 일련번호
	account_id number, -- 작성자 일련번호
	created_on date -- 작성일자

);
CREATE SEQUENCE JOURNAL_SEQ 
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9999999
	CYCLE; 