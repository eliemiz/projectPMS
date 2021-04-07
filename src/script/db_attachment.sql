-- 파일 attachment
CREATE TABLE attachment(
	id NUMBER PRIMARY KEY, -- 파일 일련번호
	document_type varchar2(10), -- 게시글 타입
	document_id NUMBER, -- 게시글 일련번호
	filename varchar2(300), -- 파일 이름
	disk_filename varchar2(300), -- 파일 저장 이름
	pathname varchar2(300), -- 파일 경로 이름
	filesize varchar2(30), -- 파일 사이즈
	created_on DATE -- 파일 생성일자
);