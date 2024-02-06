use practice_sql;

-- 순서 *중요* (sql은 select가 먼저)
-- 1. FROM
-- 2. WHERE
-- 3. ORDER BY
-- 4. SELECT

alter table jeju add above_avg_spd boolean;
alter table jeju add above_avg_dir boolean;
alter table jeju add null_column1 double;
alter table jeju add null_column2 double;

update jeju
set above_avg_spd = true
where speed_80m > 5.5;

update jeju
set above_avg_spd = false
where speed_80m <= 5.5;

update jeju
set above_avg_dir = true
where direction_50m > 160;

update jeju
set above_avg_dir = false
where direction_50m <= 160;

update jeju
set null_column1 = speed_80m
where speed_80m > 5.5;

update jeju
set null_column2 = speed_80m
where direction_50m > 160;

-- 연산자
-- 산술연산자: +, -, *, /, %
select speed_80m + speed_76m + speed_70m + speed_35m as total_speed
from jeju;

select (speed_80m + speed_76m + speed_70m + speed_35m)/ 4 as avg_speed
from jeju;

-- 비교연산자(where절에서 자주 사용)
-- = : 좌항이 우항과 같으면 true
select * from jeju where observe_date = '2023-07-05';

-- <>, != : 좌항이 우항과 다르면 true
select * from jeju where observe_date <> '2023-07-05';
select * from jeju where observe_date != '2023-07-05';

-- < : 좌항이 우항보다 작으면 true
-- <= : 좌항이 우항보다 작거나 같으면 true
select * from jeju where speed_80m < 3.5;
select * from jeju where speed_80m <= 3.5;

-- > : 좌항이 우항보다 크면 true
-- >= : 좌항이 우항보다 크거나 같으면 true

select * from jeju where speed_80m > 3.5;
select * from jeju where speed_80m >= 3.5;

-- <=> : 좌항과 우항이 모두 null이면 true
select * from jeju where null_column1 <=> null_column2;

-- IS : 좌항이 우항과 같으면 true (키워드)
-- IS NOT : 좌항이 우항과 다르면 true (키워드)

select * from jeju where above_avg_spd is true;
select * from jeju where above_avg_dir is not false;

-- IS NULL : 좌항이 NULL이면 TRUE
-- IS NOT NULL : 좌항이 NULL이 아니면 TRUE
select * from jeju where null_column1 is null;
select * from jeju where null_column1 is not null;

-- BETWEEN min AND max : 좌항이 min보다 크거나 같으면서 max보다 작거나 같으면 true
-- NOT BETWEEN min ADN max : 좌항이 min보다 작거나 max보다 크면 true

select * from jeju where direction_50m between 270 and 360;
select * from jeju where direction_50m not between 270 and 360;

-- IN() : 주어진 값중에 하나라도 일치하는 값이 존재하면 true
-- NOT IN() : 주어진 값 들이 모두 일치하지 않으면 true
select * from jeju where observe_date 
	in ('2023-07-01','2023-08-01', '2023-09-01', '2023-10-01', '2023-11-01', '2023-12-01');

-- 논리연산자
-- AND (&&) : 좌항과 우항이 모두 true이면 true
select * from jeju where speed_80m > 4 and direction_50m < 180;

-- OR (||) : 좌항과 우항 중 하나라도 true이면 true
select * from jeju where speed_80m > 4 or direction_50m < 180;

-- XOR : 좌항과 우항이 다르면 true
select * from jeju where speed_80m > 4 xor direction_50m < 180;

-- LIKE 연산자 : 문자열을 비교할 때 패턴을 기준으로 비교

-- % : 임의의 개수(0 ~ 무한대)의 문자
-- _ : 임의의 한 개 문자
select * from jeju where observe_date Like '20%';
select * from jeju where observe_date Like '%08';
select * from jeju where observe_date Like '%08%';
select * from jeju where observe_date like '20_';
select * from jeju where observe_date like '2023-__-08';

-- 정렬
-- ORDER BY : 쿼리 결과 기준으로 정렬
-- ASC : 오름차순 정렬
-- DESC : 내림차순 정렬
select * from jeju order by speed_80m asc;
select * from jeju order by speed_80m desc;
select observe_date from jeju order by speed_80m desc;

-- 중복제거
-- DISTINCT : SELECT 결과 테이블에서 컬럼의 조합의 중복을 제거하여 출력
select distinct above_avg_spd from jeju;
select distinct above_avg_spd, above_avg_dir from jeju;
select distinct * from jeju; -- 의미없음