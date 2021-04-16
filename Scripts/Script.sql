CREATE TABLE risk (
	riskId NUMBER PRIMARY KEY,
	name varchar2(100),
	status varchar2(30),
	e_start DATE,
	e_end DATE,
	riskDetail varchar2(1000),
	probabilty NUMBER,
	impact NUMBER,
	riskType varchar2(30),
	newDate date
);
DROP TABLE notice;
CREATE TABLE notice (
	noticeId NUMBER PRIMARY KEY,
	projectId NUMBER, 
	writerId NUMBER, 
	noticeName varchar2(100),
	noticeDetail varchar2(1000),
	fileName varchar2(100),
	filePath varchar2(300)
);
SELECT * FROM notice
WHERE noticeId = 1;

UPDATE notice SET
	noticeName = '공지사항2',
	noticeDetail = '공지 내용입니다2'
WHERE noticeId = 1;


INSERT INTO notice values(
	1, 001, 0001, '공지사항', '공지 내용입니다', '참고 파일.jpg', 'project/pms/download' 
);


UPDATE risk SET 
	name = '기술 문제',
	riskDetail = '문제 발생2'
WHERE riskId = 1;

SELECT * FROM risk;








INSERT INTO risk values(
	1, '예산 문제', 'open', '2021-04-01', '2021-04-02',
	'문제 발생', 3, 4, 'cost', sysdate
);
SELECT * FROM risk 
WHERE riskId = 1;