-- 업무 TASK
CREATE TABLE task(
   id NUMBER PRIMARY KEY, -- Task 일련번호
   parent_id NUMBER, -- 상위 Task 일련번호
   project_id NUMBER, -- 프로젝트 일련번호
   user_id NUMBER, -- 담당자 일련번호
   subject varchar2(300), -- Task 제목
   description varchar2(4000), -- Task 설명
   status varchar2(30), -- Task 상태(신규, 완료 등)
   priority NUMBER, -- Task 우선순위
   created_on DATE, -- 게시글 생성일자
   updated_on DATE, -- 게시글 수정일자
   start_date DATE, -- 시작일
   due_date DATE, -- 완료 예정일
   estimated NUMBER, -- 추정 시간
   done_ratio NUMBER, -- 진척도
   completed_on DATE -- 완료일자
);

-- TASK-연결된 TASK
CREATE TABLE task_relation(
   task_id NUMBER, -- Task 일련번호
   related_id NUMBER, -- 연결된 Task 일련번호
   CONSTRAINT task_relation_pk PRIMARY KEY (task_id, related_id) -- primary key 2개 설정
);

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
