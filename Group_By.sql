use practice_sql;

create table jeju2
as
select * from jeju;

update jeju2 set observe_date = '7월 상반기'
where observe_date between '2023-07-01' and '2023-07-15';
update jeju2 set observe_date = '7월 하반기'
where observe_date between '2023-07-16' and '2023-07-31';
update jeju2 set observe_date = '8월 상반기'
where observe_date between '2023-08-01' and '2023-08-15';
update jeju2 set observe_date = '8월 하반기'
where observe_date between '2023-08-16' and '2023-08-31';
update jeju2 set observe_date = '9월 상반기'
where observe_date between '2023-09-01' and '2023-09-15';
update jeju2 set observe_date = '9월 하반기'
where observe_date between '2023-09-16' and '2023-09-31';

select * from jeju2;

-- 그룹화 (group by): 레코드를 하나 이상의 컬럼으로 그룹하여 결과를 도출하고자 할 때 사용
-- 일반적으로 집계함수와 함께 사용됨
select observe_date from jeju2 group by observe_date;
select observe_date, speed_80m from jeju2 group by observe_date; -- 안됨 안되는거임
select observe_date, speed_80m from jeju2 group by observe_date, speed_80m;

select observe_date, avg(speed_80m) from jeju2 group by observe_date;

-- 필터링 (having): 그룹화된 결과에 필터링을 적용하는 명령어
-- 주의! where 절과 사용방법이 같지만 where절은 select 이전에 실행되고 having 절은 select 이후에 실행
select observe_date, avg(speed_80m) as avg 
from jeju2 
group by observe_date
having avg > 5.5;

select observe_date, speed_80m, avg(speed_80m) as avg 
from jeju2 
group by observe_date, speed_80m
having speed_80m > 5.5;

select observe_date, avg(speed_80m) as avg 
from jeju2 
where speed_80m > 5.5
group by observe_date;
