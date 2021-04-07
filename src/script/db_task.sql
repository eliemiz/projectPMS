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
SELECT * FROM task;
INSERT INTO task VALUES (10001, 10000, 11111, 12345, 'test용 TASK', '테스트용입니다.', '신규', 1, 
						 sysdate, sysdate, sysdate,
						 '2021/04/30', 180, 30, '2021/04/30');