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

SELECT * FROM task ORDER BY PROJECT_ID;
SELECT t.*, a.name name, p.name project_name
   FROM task t, account a, PROJECT p
   WHERE t.account_id = a.id
   AND t.PROJECT_ID = p.ID 
	ORDER BY t.id desc;
UPDATE TASK 
	SET backgroundcolor='#439981'
WHERE tracker='지원';
UPDATE TASK 
	SET backgroundcolor='#4f5fd4'
WHERE tracker='새기능';
UPDATE TASK 
	SET backgroundcolor='#fc987d'
WHERE tracker='결함';
SELECT t.*, a.name name, p.name project_name
		FROM task t, account a, PROJECT p
		WHERE subject LIKE '%'||'테스트'||'%' 
		AND t.account_id = a.id
		AND t.PROJECT_ID = p.ID
		ORDER BY t.id DESC;
SELECT * FROM TASK WHERE ID = 1;
DELETE FROM task WHERE id = 10001;


-- Calendar 조회용
SELECT t.id, t.parent_id groupId, t.subject title, a.name, t.description content,
		t.start_date start1, t.due_date end1, t.tracker, t.backgroundColor
FROM task t, account a, project p
WHERE t.PROJECT_ID = p.ID AND t.ACCOUNT_ID = a.ID;

-- Gantt
SELECT t.id, t.TRACKER "type", t.subject text, t.start_date||'T00:00:00.000Z' start_date, 
		t.due_date||'T00:00:00.000Z' due_date,
		to_date(t.due_date)-to_date(t.start_date) duration,
		t.PARENT_ID parent, t.DONE_RATIO/100 progress, 1 as "open"	
FROM task t
ORDER BY t.id;
