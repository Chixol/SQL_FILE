-- Active: 1706776161410@@127.0.0.1@3306@real_estate

-- 1. 아이디 중복확인
select user_id from user where user_id = 'userID';

-- 2. 이메일 인증 전송
insert into email_authentication VALUES ('email@email.com', 'QWER');

-- 3. 이메일 인증 확인
select * from email_authentication 
where email = 'email@email' and authentication_code = 'QWER';

-- 4. 회원가입 처리
insert into user (user_id, password, email)
VALUES ('userID', 'P!ssw0rd', 'email@email.com');

-- 5. 로그인 처리
SELECT user_id from user
where user_id = 'userID' and password = 'P!ssw0rd';

-- 6. 게시물 작성
insert into qna (title, contents, writer_id)
VALUES ('질문있습니다.', '데이터는 언제 데이터인가요?', 'userID'); -- 오류뜸 reception_number 미지정?

select reception_number, reply_status, title, writer_id, write_datetime, view_count
from qna
ORDER BY reception_number desc;

-- 8. 관리자로 미완료 게시물 보기
select reception_number, reply_status, title, writer_id, write_datetime, view_count
from qna
where reply_status = 0 -- = 이후로 is false 도 같은 뜻
ORDER BY reception_number desc;

-- 9. 검색 게시물 목록 보기
select reception_number, reply_status, title, writer_id, write_datetime, view_count
from qna
where title like '%질문%'
ORDER BY reception_number desc;

-- 10. 특정 게시물 보기
SELECT title, writer_id, write_datetime, view_count, contents, reply
FROM qna
WHERE reception_number = 1;

-- 11. 관리자로 답변 작성
UPDATE qna set reply = '2023년 데이터 입니다.', replyer_id = 'userID', reply_status = 1
where reception_number = 1;

-- 12. 게시물 수정하기
UPDATE qna set title = '변경한 제목입니다.', contents = '변경한 내용입니다.'
WHERE reception_number = 1;

-- 13. 게시물 삭제하기
DELETE from qna WHERE reception_number = 1;