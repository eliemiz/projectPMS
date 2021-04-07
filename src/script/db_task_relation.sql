-- TASK-연결된 TASK
CREATE TABLE task_relation(
   task_id NUMBER, -- Task 일련번호
   related_id NUMBER, -- 연결된 Task 일련번호
   CONSTRAINT task_relation_pk PRIMARY KEY (task_id, related_id) -- primary key 2개 설정
);