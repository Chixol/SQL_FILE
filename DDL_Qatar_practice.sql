-- qatar asian cup 데이터베이스

-- 참가국 (국가명, 조, 감독, 피파랭킹)
-- 경기장 (경기장 명, 수용인원, 주소)
-- 축구선수 (이름, 나이, 포지션, 소속프로팀, 등번호, 국가)
-- 심판 (이름, 나이, 포지션)

-- 경기 (경기일정, 국가1, 국가2, 경기장, 주심, 선심, 경기결과)

-- qatar_asian_cup
CREATE DATABASE qatar_asian_cup;
USE qatar_asian_cup;

-- country (name[가변문자열 30], group_name[가변문자열 1], manager[가변문자열 30], lanking[정수])
CREATE TABLE country (
	name varchar(30),
    group_name varchar(1),
    manager varchar(30),
    lanking int
);
  
-- stadium (name[가변문자열 50], capacity[정수], address[가변문자열 255])
CREATE TABLE stadium (
	stadium_name varchar(50),
    capacity int,
    address varchar(255)
);

-- player (name[가변문자열 30], age[정수], position[가변문자열 15], pro_team[가변문자열 30],
-- 			uniform_number[정수], country[가변문자열 30])
CREATE TABLE player (
	name varchar(30),
    age int,
    position varchar(15),
    pro_team varchar(30),
    uniform_number int,
    contry varchar(30)
);

-- referee (name[가변문자열 30], age[정수], position[가변문자열 15])
CREATE TABLE referee (
	name varchar(30),
    age int,
    position varchar(15)
);

-- game (schedule[날짜및시간], country1[가변문자열 30], country2[가변문자열 30], stadium[가변문자열 50],
--  	 chief_referee[가변문자열 30], second_referee[가변문자열 30], winning_country[가변문자열 30])
CREATE TABLE game (
	schedule datetime,
    country1 varchar(30),
    country2 varchar(30),
    stadium varchar(50),
    chief_referee varchar(30),
    second_referee varchar(30),
    winning_country varchar(30)
);