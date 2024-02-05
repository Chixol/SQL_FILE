use qatar_asian_cup;

-- 참가국에 데이터 삽입
-- 1. 대한민국, E, 위르겐 클리스만, 23
-- 2. 요르단, E, 후세인 아모타, 87
insert into country
	values ('대한민국', 'E', '위르겐 클리스만', 23);
insert into country
	values ('요르단', 'E', '후세인 아모타', 87);

select * from country;

-- 경기장에 데이터 삽입
-- 1. 아흐메드 빈 알리, 45032, 카타르 알라이얀
insert into stadium
	values ('아흐메드 빈 알리', 45032, '카타르 알라이얀');

select * from stadium;

-- 선수에 데이터 삽입
-- 1. 손흥민, 34, MF, 토트넘 홋스퍼, 7, 대한민국
-- 2. 올완, 24, FW, 알 샤말 SC, 9, 요르단
insert into player
	values ('손흥민', 34, 'MF', '토트넘 홋스퍼', 7, '대한민국');
insert into player
	values ('올완', 24, 'FW', '알 마샬 SC', 9, '요르단');
    
select * from player;
    
-- 경기에 데이터 삽입
-- 		 schedule,country1, country2, stadium
-- 1. 2024-02-07 00:00:00, 요르단, 대한민국, 아흐메드 빈 알리
insert into game (schedule, country1, country2, stadium)
	values ('2024-02-07 00:00:00', '요르단', '대한민국', '아흐메드 빈 알리');
    
select * from game;