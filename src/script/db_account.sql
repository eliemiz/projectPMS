
INSERT INTO account values(100000,'himan','7777','홍길동','adf@naver.com','2021-04-08','2021-04-10','Manager');
SELECT * FROM account;

SELECT * 
FROM account
WHERE user_id='아이디' AND password='비밀번호';


DELETE FROM account 
WHERE id=100000;
SELECT * FROM account;

DELETE FROM journal
WHERE id=2;
SELECT * FROM journal;
SELECT * FROM risk;
SELECT * FROM task;
UPDATE ACCOUNT 
SET
mail='projectmgtsystem1@gmail.com'
WHERE id=1;
INSERT INTO account values(account_seq.nextval,'himan','7777','김나리','asdf@naver.com',sysdate,sysdate,'Manager');
INSERT INTO JOURNAL values(journal_seq.nextval,'task',2,1,sysdate,'제목 수정, 댓글 추가');
SELECT * 
FROM journal
WHERE document_type='task';

CREATE SEQUENCE ACCOUNT_SEQ
START WITH 1
MINVALUE 1
INCREMENT BY 1
MAXVALUE 9999999;

		
SELECT j.*, a.name account_name
			FROM journal j, account a
			WHERE document_type like '%'||#{document_type}||'%'
			AND j.PROJECT_ID = #{projectId}
			AND j.account_id = a.ID 
			order by created_on DESC
			
			
			SELECT j.*, a.name account_name, t.project_id project_id 
			FROM journal j, account a, task t
			WHERE document_type like '%'||#{document_type}||'%'
			AND project_id = #{projectId}
			AND j.document_id = t.id
			AND j.account_id = a.id 
			order by created_on DESC
				UNION 
			SELECT j.*, a.name account_name, r.project_id project_id 
			FROM journal j, account a, risk r
			WHERE document_type like '%'||#{document_type}||'%'
			AND project_id = #{projectId}
			AND j.document_id = r.id
			AND j.account_id = a.id 
			order by created_on DESC
			
			
SELECT * FROM account;



