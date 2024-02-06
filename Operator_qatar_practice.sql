use qatar_asian_cup;

insert into player values('조규성', 0, null, null, null, '대한민국');
insert into player values('박용우', 0, null, null, null, '대한민국');
insert into player values('황인범', 0, null, null, null, '대한민국');
insert into player values('손흥민', 0, null, null, null, '대한민국');
insert into player values('송범근', 0, null, null, null, '한국');
insert into player values('오현규', 0, null, null, null, '한국');

insert into player values('쿠보 다케후사', 0, null, null, null, '일본');
insert into player values('이토 준야', 0, null, null, null, '일본');
insert into player values('미토마 가오루', 0, null, null, null, '일본');
insert into player values('엔도 와타루', 0, null, null, null, '일본');

-- 플레이어 이름이 조규성이면 나이를 27, 포지션을 FW, 프로팀을 FC 밀트윌란, 등번호를 10으로 변경
update player
	set
		age = 27,
        position = 'FW',
        pro_team = 'FC 밀트윌란',
        uniform_number = 10
	where name = '조규성';
    
-- 플레이어 이름이 박용우이면 나이를 32, 포지션을 MF, 프로팀을 알 아인 FC, 등번호를 5로 변경
update player
	set
		age = 32,
        position = 'MF',
        pro_team = '알 아인 FC',
        uniform_number = 5
	where name = '박용우';
-- 플레이어 이름이 쿠보 다케후사 이면서 국적이 일본이면 나이를 24, 포지션을 MF/FW, 프로팀을 레알 소시에다드, 등번호를 20로 변경
update player
	set
		age = 24,
        position = 'MF/FW',
        pro_team = '레알 소시에다드',
        uniform_number = 20
	where
		name = '쿠보 다케후사'
        and
        country = '일본';
        
-- 이름이 손흥민인 선수를 조회
select * from player where name = '손흥민';

update player
set age = 34, position = 'MF', pro_team = '토트넘 홋스퍼', uniform_number = 7
where name = '손흥민';
-- update절과 where을 적절히 사용

-- 대한민국 선수 중 나이가 30세 이상인 선수를 조회
select * from player where country = '대한민국' and age >= 30;

-- 국가명이 요르단인 국가를 제거
delete from country where name = '요르단';
select * from country;

select * from player;

