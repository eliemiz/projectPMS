create table journal_detail (
	id NUMBER PRIMARY key, -- 일지 상세 일련번호
	journal_id NUMBER, -- 일지 일련번호
	property varchar2(30), -- 속성
	prop_key varchar2(30), -- 속성 키
	old_value varchar2(4000), -- 기존 값
	value varchar2(4000) -- 새 값
);
CREATE SEQUENCE JOURNAL_DETAIL_SEQ 
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9999999
	CYCLE;