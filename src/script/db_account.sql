CREATE TABLE account(
id NUMBER PRIMARY KEY,
user_id VARCHAR2(30),
password VARCHAR2(32),
name VARCHAR2(100),
mail VARCHAR2(100),
created_on DATE,
last_login_on DATE,
auth VARCHAR2(30)
);
INSERT INTO account values(100000,'아이디','비밀번호','이채영','메일',sysdate,sysdate,'관리자');
SELECT * FROM account;

SELECT * 
FROM account
WHERE user_id='아이디' AND password='비밀번호';


