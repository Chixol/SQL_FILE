use practice_sql;

create table employee (
	employee_number int primary key auto_increment,
    name varchar(30),
    department_code varchar(5)
);

create table department (
	code varchar(5) primary key,
    name varchar(10) not null,
    tel_number varchar(15) not null
);

alter table employee
add constraint foreign key (department_code) references department (code);

insert into department
values ('HR', '인사부', '051-111-1111');
insert into department
values ('FI', '재무부', '051-111-1112');
insert into department
values ('DV', '개발부', '051-111-1113');

insert into employee (name, department_code)
values ('홍길동', null);
insert into employee (name, department_code)
values ('김서준', null);
insert into employee (name, department_code)
values ('이민준', 'HR');
insert into employee (name, department_code)
values ('최시우', 'HR');
insert into employee (name, department_code)
values ('강지호', 'FI');
insert into employee (name, department_code)
values ('박도현', 'FI');

-- JOIN: 두 개 이상의 테이블의 특정 조건에 따라 조합하여 결과를 조회하고자 할때 사용하는 명령어

-- INNER JOIN: 두 테이블에서 조건이 일치하는 레코드만 반환
select 
	E.employee_number as employee_number,
	E.name as employee_name,
    D.code as department_code,
    D.name as department_name,
    D.tel_number as department_tel_number
from employee as E inner join department as D
on E.department_code = D.code;

-- LEFT OUTER JOIN (LEFT JOIN) : 첫 번째 테이블의 모든 레코드와 두 번째 테이블의 조건이 일치하는 레코드를 반환,
-- 								 첫 번째 테이블의 레코드에서 조건이 일치하는 값이 없으면 null로 반환
select 
	E.employee_number as employee_number,
	E.name as employee_name,
    D.code as department_code,
    D.name as department_name,
    D.tel_number as department_tel_number
from employee as E left join department as D
on E.department_code = D.code;

-- RIGHT OUTER JOIN (RIGHT JOIN) : 두 번째 테이블에 있는 모든 레코드와 첫 번째 테이블의 조건이 일치하는 레코드를 반환,
-- 								   두 번째 테이블의 레코드에서 일치하는 값이 없다면 null을 반환
select 
	E.employee_number as employee_number,
	E.name as employee_name,
    D.code as department_code,
    D.name as department_name,
    D.tel_number as department_tel_number
from employee as E right join department as D
on E.department_code = D.code;

