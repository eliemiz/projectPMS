
INSERT INTO account values(100000,'himan','7777','홍길동','adf@naver.com','2021-04-08','2021-04-10','Manager');
SELECT * FROM account;

SELECT * 
FROM account
WHERE user_id='아이디' AND password='비밀번호';


DELETE FROM account 
WHERE id=100000;
SELECT * FROM journal;
SELECT * 
FROM journal
WHERE document_type='task';




INSERT INTO JOURNAL values(journal_seq.nextval,'task',100002,100012,sysdate,'제목 수정, 댓글 추가');