CREATE TABLE risk(
	id NUMBER PRIMARY KEY,
	project_id NUMBER,
	account_id NUMBER,
	subject varchar2(300),
	description varchar2(4000),
	status varchar2(30),
	category varchar2(30),
	created_on DATE,
	updated_on DATE,
	start_date DATE,
	end_date DATE,
	probability NUMBER,
	impact NUMBER,
	starategy varchar2(30),
	treatment varchar2(4000)
);
SELECT * FROM risk;