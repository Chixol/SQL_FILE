use practice_sql;

-- 집계 함수: 레코드를 '그룹화'하여 하나의 결과를 반환하는 함수

-- count(): 특정 조건에 맞는 행의 개수를 반환
select count(*) from jeju;
select count(*) from jeju where speed_80m > 3;

-- sum(): 특정 컬럼의 값을 모두 합한 결과를 반환
select sum(speed_80m) from jeju;
select sum(speed_80m) from jeju where observe_date like '2023-08-__';

-- avg(): 특정 컬럼의 값의 평균을 반환
select avg(speed_80m) from jeju;

-- min(), max(): 특정 컬럼의 최소값, 최대값을 반환
select min(speed_80m), max(speed_80m) from jeju;