use practice_sql;

-- Transaction: SQL로 작업하는 작업 단위

-- Transaction의 4가지 특성
-- Atomicity (원자성) : 트랜잭션은 모두 성공하거나 모두 실패해야 한다.
-- Consistency (일관성) : 트랜잭션의 작업 결과는 항상 일관성이 있어야 한다.
-- Isolation (독립성) : 트랜잭션은 모두 독립적이어야 한다.
-- Durability (영구성) : 트랜잭션이 성공적으로 완료되면 영구히 반영되어야 한다.

-- 회원가입: USER - email_authentication
-- 사용자는 아이디를 입력하고 중복 확인을 함
-- 만약 입력한 아이디가 중복된 아이디가 아니라면
-- 비밀번호, 비밀번호 확인, 이메일을 입력하고 이메일로 인증번호를 전송
-- 사용자는 이메일에 전송된 인증 번호를 확인 후 입력하여 이메일 인증을 진행
-- 이메일 인증을 완료 후 회원가입 버튼을 눌러 회원가입을 마무리

create table user (
	id varchar(100) primary key,
    password varchar(255) not null,
    email varchar(255) not null
);

create table email_authentication (
	email varchar(255) primary key,
    authentication_code varchar(4) not null
);

-- 사용자가 아이디를 'idddd'로 입력했다.

-- 1. 아이디 중복확인
select * from user where id = 'idddd';

-- 사용자가 비밀번호를 'P!ssw0rd', 비밀번호 확인을 'P!ssw0rd', 
-- 이메일을 'email@email.com', 서버가 생성한 코드는 'OCMD'이다.

-- 2. 이메일 인증
insert email_authentication values ('email@email.com', 'OCMD');

-- 서버가 지정한 이메일로 인증 코드를 전송하고 사용자는 그 코드를 확인 후 인증코드를 입력하여 인증함

-- 3. 이메일 인증 확인
select * from email_authentication
where email = 'email@email.com' and authentication_code = 'OCMD';

-- 4. 회원가입 처리
insert user values ('idddd', 'P!ssw0rd', 'email@email.com');

show variables like '%commit%';
set autocommit = 0;

-- 트랜잭션 시작
start transaction;

-- 사용자가 아이디를 'idddd'로 입력했다.

-- 1. 아이디 중복확인
select * from user where id = 'idddd3';

-- 사용자가 비밀번호를 'P!ssw0rd', 비밀번호 확인을 'P!ssw0rd', 
-- 이메일을 'email@email.com', 서버가 생성한 코드는 'OCMD'이다.

-- 2. 이메일 인증
insert email_authentication values ('email3@email.com', 'OCMD');

-- 트랜잭션 초기상태로 변경 (트랜잭션 취소)
rollback;

-- 트랙잭션 롤백 위치 지정
savepoint A;

-- 서버가 지정한 이메일로 인증 코드를 전송하고 사용자는 그 코드를 확인 후 인증코드를 입력하여 인증함

-- 3. 이메일 인증 확인
select * from email_authentication
where email = 'email3@email.com' and authentication_code = 'OCMD';

-- 4. 회원가입 처리
insert user values ('idddd3', 'P!ssw0rd', 'email3@email.com');

-- 특정 세이브포인트로 롤백
rollback to savepoint A;

--  트랜잭션 성고 처리 (영구히 적용)
commit;

select * from user;
select * from email_authentication;

-- limit 개수 : 결과 테이블에서 지정한 개수만큼의 상위 데이터만 보여줌
select * from jeju limit 10;
-- limit 제외 레코드 개수, 개수 : 상위에서 제외 레코드 개수만큼 제외 후 개수만큼의 데이터만 보여줌
select * from jeju limit 10, 3;
