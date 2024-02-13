create database school;

use school;

-- 학과 (department) 테이블 생성
CREATE TABLE department (
    department_id VARCHAR(5) PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE,
    office_location VARCHAR(150) NOT NULL,
    contact_number VARCHAR(15) NOT NULL UNIQUE
);

-- 학생 (student) 테이블 생성
CREATE TABLE student (
    student_number VARCHAR(7) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    year INT NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    department_id VARCHAR(5) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- 과목 (course) 테이블 생성
CREATE TABLE course (
    course_code VARCHAR(5) PRIMARY KEY,
    title VARCHAR(40) NOT NULL UNIQUE,
    credits FLOAT NOT NULL,
    professor_id VARCHAR(7),
	FOREIGN KEY (professor_id) REFERENCES professor(professor_id) -- 1대 다의 관계는 테이블생성이 아닌 참조키만
);

-- 교수 (professor) 테이블 생성
CREATE TABLE professor (
    professor_id VARCHAR(7) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    specialization VARCHAR(40) NOT NULL,
    office_location VARCHAR(150) NOT NULL,
    department_id VARCHAR(5) NOT NULL,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- 학과와 학생 관계 테이블 생성
CREATE TABLE department_student (
    department_id VARCHAR(5),
    student_number VARCHAR(7),
    PRIMARY KEY (department_id, student_number),
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (student_number) REFERENCES student(student_number)
);

-- 학과와 교수 관계 테이블 생성
CREATE TABLE department_professor (
    department_id VARCHAR(5),
    professor_id VARCHAR(7),
    PRIMARY KEY (department_id, professor_id),
    FOREIGN KEY (department_id) REFERENCES department(department_id),
    FOREIGN KEY (professor_id) REFERENCES professor(professor_id)
);

-- 학생과 과목 관계 테이블 생성
CREATE TABLE student_course (
    student_number VARCHAR(7),
    course_code VARCHAR(5),
    grade FLOAT,
    PRIMARY KEY (student_number, course_code),
    FOREIGN KEY (student_number) REFERENCES student(student_number),
    FOREIGN KEY (course_code) REFERENCES course(course_code)
);

-- 다대 다의 관계는 관계 테이블이 생긴다.

drop database company;