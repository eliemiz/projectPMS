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

SELECT * FROM task;
SELECT * FROM TASK WHERE ID = 1;
DELETE FROM task WHERE id = 3;
INSERT INTO task VALUES (10001, 10000, 11111, 12345, 'test용 TASK', '테스트용입니다.', '신규', 1, 
						 '2021-04-08', '2021-04-08', '2021-04-08',
						 '2021/04/30', 180, 30, '2021/04/30','새기능');
INSERT INTO task VALUES (10002, 10002, 11112, 12346, 'test용 TASK222', '테스트용입니다.222', '신규', 1, 
						 sysdate, sysdate, sysdate,
						 '2021/04/30', 185, 25, '2021/04/30','결함');		
SELECT t.*, to_date(due_date,'YYYY/MM/DD')-to_date(start_date,'YYYY/MM/DD') duration FROM task t;
