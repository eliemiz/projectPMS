CREATE TABLE project (
	id NUMBER PRIMARY key, -- 프로젝트 일련번호
	name varchar2(300), -- 프로젝트 이름
	description varchar2(1000), -- 프로젝트 설명
	identifier varchar2(100), -- 프로젝트 식별자(url)
	homepage varchar2(100) -- 프로젝트 홈페이지
);
CREATE SEQUENCE PROJECT_SEQ 
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9999999
	CYCLE;
	
INSERT INTO project values(100001, '화소반 프로젝트', 
		'화소반 프로젝트입니다!', 'hsoban', 'www.hsoban.com');
