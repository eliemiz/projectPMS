-- 댓글 comments
CREATE TABLE comments(
	id NUMBER PRIMARY KEY, -- 댓글 일련번호
	document_type varchar2(10), -- 게시글 타입
	document_id NUMBER, -- 게시글 일련번호
	account_id NUMBER, -- 댓글 작성자 일련번호
	content varchar2(1000), -- 댓글 내용
	created_on DATE, -- 댓글 작성일자
	updated_on DATE -- 댓글 수정일자
);

-- Comments Sequence
CREATE SEQUENCE COMMENTS_SEQ 
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9999999
	CYCLE;