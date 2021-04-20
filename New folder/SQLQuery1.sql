--use movies;

--select address
--from studio
--where name='Disney';

--select birthdate
--from moviestar
--where name = 'Jack Nicholson';

--select starname
--from starsin
--where movieyear = 1980 OR movietitle like '%Knight%';

--select name
--from movieexec
--where networth > 1000000;

--select name
--from moviestar
--where gender = 'M' or address = ' Prefect Rd'; 

--select model, speed as 'MHz', hd as 'GB'
--from pc
--where price < 1200;

--select distinct maker
--from product
--where type='printer';

--select model, ram, screen
--from laptop
--where price>1000;

--select *
--from printer
--where color='y';

--select model, speed, hd
--from pc
--where (cd = '12x' or cd = '16x') and price<2000;

--select class, country
--from classes
--where numguns<10;

--select name
--from ships
--where launched <1918;

--select ship, battle
--from outcomes
--where result='sunk';

--select name
--from ships
--where name=class;

--select name
--from ships
--where name like 'R%';

select name
from ships
where name like '_% _%';
