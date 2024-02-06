use practice_sql;

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