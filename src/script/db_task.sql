-- 업무 TASK
CREATE TABLE task(
   id NUMBER PRIMARY KEY, -- Task 일련번호
   parent_id NUMBER, -- 상위 Task 일련번호
   project_id NUMBER, -- 프로젝트 일련번호
   account_id NUMBER, -- 담당자 일련번호
   subject varchar2(300), -- Task 제목
   description varchar2(4000), -- Task 설명
   status varchar2(30), -- Task 상태(신규, 완료 등)
   priority NUMBER, -- Task 우선순위
   created_on CHAR(24), -- 게시글 생성일자
   updated_on CHAR(24), -- 게시글 수정일자 
   start_date CHAR(24), -- 시작일
   due_date CHAR(24), -- 완료 예정일
   estimated NUMBER, -- 추정 시간
   done_ratio NUMBER, -- 진척도
   completed_on CHAR(24), -- 완료일자
   tracker varchar2(30) -- 유형(새기능, 결함, 지원 등)
);

-- TASK id 시퀀스
CREATE SEQUENCE TASK_SEQ 
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9999999
	CYCLE;

-- getTaskList(Task sch) 전체 리스트
SELECT t.id, p.name project_name, t.tracker, t.status, t.PRIORITY, t.subject, a.name name,
		substr(t.start_date,0,10) start_date, substr(t.due_date,0,10) due_date
FROM task t, account a, PROJECT p
WHERE subject LIKE '%'||'프로젝트'||'%' 
AND t.account_id = a.id
AND t.PROJECT_ID = p.ID
ORDER BY t.id desc;
SELECT * FROM task;
-- getTask(int id) 상세내용 이동
SELECT t.id, t.PARENT_ID, t.PROJECT_ID, t.ACCOUNT_ID,
		t.SUBJECT, t.DESCRIPTION, t.STATUS, t.PRIORITY, 
		t.CREATED_ON, t.UPDATED_ON,
		substr(t.start_date,0,10) start_date, 
		substr(t.due_date,0,10) due_date,
		t.ESTIMATED, t.DONE_RATIO, t.COMPLETED_ON,
		t.TRACKER, a.name name, p.name project_name
FROM task t, account a, PROJECT p
WHERE t.account_id = a.id
AND t.PROJECT_ID = p.ID
and t.id=1;

-- tracker별 색상 지정(캘린더용)
UPDATE TASK 
	SET backgroundcolor='#439981'
WHERE tracker='지원';

UPDATE TASK 
	SET backgroundcolor='#4f5fd4'
WHERE tracker='새기능';

UPDATE TASK 
	SET backgroundcolor='#fc987d'
WHERE tracker='결함';




-- Calendar 조회용
SELECT t.id, t.parent_id groupId, t.subject title, a.name, t.description content,
		t.start_date start1, t.due_date end1, t.tracker, t.backgroundColor
FROM task t, account a, project p
WHERE t.PROJECT_ID = p.ID 
AND t.ACCOUNT_ID = a.ID
AND p.id = #{p.id};

-- Gantt
SELECT t.id, t.TRACKER "type", t.subject text, t.start_date start_date,
		to_date(SUBSTR(t.due_date,0,10))-to_date(SUBSTR(t.START_DATE,0,10)) duration,
		t.PARENT_ID parent, t.DONE_RATIO/100 progress, 1 as "open"
FROM task t, project p
where p.id = t.project_id
and p.id = #{p.id}
ORDER BY t.id;