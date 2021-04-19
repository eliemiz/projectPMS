-- 파일 attachment
CREATE TABLE attachment(
	id NUMBER PRIMARY KEY, -- 파일 일련번호
	document_type varchar2(10), -- 게시글 타입
	document_id NUMBER, -- 게시글 일련번호
	filename varchar2(300), -- 파일 이름
	disk_filename varchar2(300), -- 파일 저장 이름
	pathname varchar2(300), -- 파일 경로 이름
	filesize varchar2(30), -- 파일 사이즈 *0415 number(38,0)로 수정
	created_on DATE -- 파일 생성일자
);

-- Attachment Sequence
CREATE SEQUENCE ATTACHMENT_SEQ 
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9999999
	CYCLE;
SELECT * FROM attachment;
SELECT * FROM attachment WHERE DOCUMENT_ID = 2;
SELECT * FROM task;
INSERT INTO attachment VALUES (ATTACHMENT_SEQ.nextval,'TASK',59,'파일.jpg','파일저장.jpg','파일경로',256||'KB',SYSDATE);

update ATTACHMENT
			set filename = 'spade-80.png',
				filesize = '109KB',
				DISK_FILENAME = 'spade-80123.png'
		where document_id = 2
			and filename=#{orgFilename}
