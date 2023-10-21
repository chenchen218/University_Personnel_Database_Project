/* project_part1.sql 
  Chenyang Li
   CS 31A, Spring 2022
*/

DROP DATABASE university;
CREATE DATABASE university;
USE university;

DROP TABLE IF EXISTS academic_session;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS parent_info;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS faculty;
DROP TABLE IF EXISTS exam_type;
DROP TABLE IF EXISTS exam;
DROP TABLE IF EXISTS exam_result;
DROP TABLE IF EXISTS student_att;
DROP TABLE IF EXISTS student_course;
DROP TABLE IF EXISTS faculty_course;
DROP TABLE IF EXISTS faculty_login;

-- create academic_session table
CREATE TABLE academic_session (
	session_id INT NOT NULL
,	session_name VARCHAR(25) NOT NULL UNIQUE
, 	CONSTRAINT as_pk PRIMARY KEY(session_id)
);

-- creeatre department table
CREATE TABLE department (
	dept_id INT NOT NULL
,	dept_name VARCHAR(25) NOT NULL UNIQUE
,	head VARCHAR(25)
,	CONSTRAINT dt_pk PRIMARY KEY(dept_id)
);

-- create parent_info table
CREATE TABLE parent_info (
	parent_id INT NOT NULL
,	parent1_fn VARCHAR(25) NOT NULL
,	parent1_ln VARCHAR(25) NOT NULL
,	parent2_fn VARCHAR(25) NOT NULL
,	parent2_ln VARCHAR(25) NOT NULL
,	CONSTRAINT pi_pk PRIMARY KEY(parent_id)
);

-- create student table 
CREATE TABLE student (
	student_id INT NOT NULL
,	first_name VARCHAR(25) NOT NULL
,	last_name VARCHAR(25) NOT NULL
,	reg_year DATE NOT NULL
,	email VARCHAR(50) NOT NULL UNIQUE
,	parent_id INT NOT NULL
,	CONSTRAINT student_pk PRIMARY KEY(student_id)
,	CONSTRAINT student_pat_fk FOREIGN KEY (parent_id) 
        REFERENCES parent_info (parent_id)
);

-- create course table
CREATE TABLE course(
	course_id INT NOT NULL
,	course_name VARCHAR(100) NOT NULL UNIQUE
,	session_id INT NOT NULL
,	dept_id INT NOT NULL
,	logon_id VARCHAR(25)
,	pass_word VARCHAR(25)
,	building VARCHAR(25)
,	room	INT
,	date_time VARCHAR(25)
,	CONSTRAINT course_pk PRIMARY KEY(course_id)
,	CONSTRAINT cours_as_fk FOREIGN KEY(session_id)
		REFERENCES academic_session(session_id)
,	CONSTRAINT cours_dept_fk FOREIGN KEY(dept_id)
		REFERENCES department(dept_id)
);

-- create faulcty table
CREATE TABLE faculty (
	faculty_id INT NOT NULL
,	first_name VARCHAR(25)
,	last_name VARCHAR(25)
,	faculty_email VARCHAR(100)
,	salary INT
,	insurance VARCHAR(25)
,	hourly_rate INT
,	dept_id INT
,	CONSTRAINT fy_pk PRIMARY kEY(faculty_id)
, 	CONSTRAINT fy_dpt_fk FOREIGN KEY(dept_id)
		REFERENCES department(dept_id)
);



-- create exam_type table
CREATE TABLE exam_type (
	exam_type VARCHAR(10) NOT NULL
,	name VARCHAR(50)
,	description VARCHAR(150)
,	CONSTRAINT etp_pk PRIMARY KEY(exam_type)
);


-- create table exam
CREATE TABLE exam(
	exam_id INT NOT NULL
,	start_date DATE
,	exam_type VARCHAR(25)
,	course_id INT
,	CONSTRAINT exm_pk PRIMARY KEY(exam_id)
,	CONSTRAINT exm_etp_fk FOREIGN KEY(exam_type)
		REFERENCES exam_type(exam_type)
,	CONSTRAINT ext_cours_fk FOREIGN KEY(course_id)
		REFERENCES course(course_id)
);

-- create exam_result tbale
CREATE TABLE exam_result (
	student_id INT NOT NULL
,	course_id INT NOT NULL
,	exam_id INT NOT NULL
,	exam_grade INT
,	CONSTRAINT ert_pk PRIMARY KEY(student_id, course_id, exam_id)
);

-- create student_att table

CREATE TABLE student_att (
	student_id INT NOT NULL 
,	session_id INT
,	num_work_days INT
,	num_work_off INT
,	exam_eligibility CHAR(1)
, 	CONSTRAINT satt_pk PRIMARY KEY(student_id, session_id)
);

-- create student_course table
CREATE TABLE student_course (
	student_id INT NOT NULL
,	course_id INT NOT NULL
,	grade	CHAR(1) NOT NULL
,	CONSTRAINT cs_pk PRIMARY KEY(student_id, course_id)
);

-- create faculty_course table

CREATE TABLE faculty_course (
	faculty_id INT NOT NULL
,	course_id INT
,	contact_hrs INT
,	CONSTRAINT fcse_pk PRIMARY KEY(course_id, faculty_id)
);

-- create table faculty_login

CREATE TABLE faculty_login (
	faculty_id INT NOT NULL
,	login_date_time DATETIME DEFAULT CURRENT_TIMESTAMP
,	CONSTRAINT fln_pk PRIMARY KEY(faculty_id, login_date_time)
);










