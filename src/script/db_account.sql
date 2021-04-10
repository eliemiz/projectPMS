
INSERT INTO account values(100000,'himan','7777','홍길동','adf@naver.com','2021-04-08','2021-04-10','Manager');
SELECT * FROM account;

SELECT * 
FROM account
WHERE user_id='아이디' AND password='비밀번호';


DELETE FROM account 
WHERE id=100000;