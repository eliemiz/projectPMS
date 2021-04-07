-- TASK-작업시간
CREATE TABLE time_entry(
	id NUMBER, -- 작업 일련번호
	task_id NUMBER, -- Task 일련번호
	CONSTRAINT time_entry_pk PRIMARY KEY (id, task_id), -- primary key 2개 설정
	account_id NUMBER, -- 작업자 일련번호
	comments varchar2(1000), -- 작업내용
	spent_hours NUMBER, -- 작업시간
	created_on DATE -- 작업일자
);

-- TimeEntry 시퀀스
CREATE SEQUENCE TIME_ENTRY_SEQ 
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9999999
	CYCLE;
