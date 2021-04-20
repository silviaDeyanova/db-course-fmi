--select title, year, length
--from movie
--where (length>=120 or length is null) and year<2000;

--select name, gender
--from moviestar
--where name like 'J%' and birthdate>1948
--order by name desc;

--select movie.studioname, count(distinct starsin.starname) as 'num_actors'
--from movie join starsin on movie.title=starsin.movietitle
--group by movie.studioname;

--select starname, count(movietitle)
--from starsin
--group by starname;

--select t2.studioname, t2.title, t2.year
--from (select studioname, max(year) as year
--		from movie
--		group by studioname) as t1 join movie as t2 on t1.studioname=t2.studioname and t1.year=t2.year;

--select top 1 name
--from moviestar
--where gender='m'
--order by birthdate desc;

--select studioname, starname, count(title) as 'Num_Movies'
--from movie m join starsin on m.title=starsin.movietitle and m.year=starsin.movieyear
--group by studioname, starname
--having count(*)>=all(select count(*)
--					from movie join starsin on movie.title=starsin.movietitle and movie.year=starsin.movieyear
--					where studioname=m.studioname
--					group by studioname, starname);

--select movietitle, movieyear, count(starname) as 'numActors'
--from starsin
--group by movietitle, movieyear
--having count(starname)>2;

--select distinct ship
--from outcomes
--where ship like 'C%' or ship like 'K%'
--group by ship
--having count(battle)>=1;

--select distinct name, country
--from ships join classes on ships.class=classes.class left join outcomes on outcomes.ship=ships.name
--where result!='sunk' or battle is null;

--select country, count(ship) as 'sunkShips'
--from classes left join ships on ships.class=classes.class left join outcomes on outcomes.ship=ships.name
--where result='sunk' or ship is null
--group by country;

--select battle
--from outcomes
--group by battle
--having count(ship)>(select count(ship)
--					from outcomes
--					where battle='Guadalcanal');

--select battle
--from outcomes join ships on ships.name=outcomes.ship join classes on classes.class=ships.class
--group by battle
--having count(country)>(select count(country)
--					from outcomes join ships on ships.name=outcomes.ship join classes on classes.class=ships.class
--					where battle='Surigao Strait');

--select name, t2.displacement, t2.numguns
--from ships join (select*
--				from (select *
--					from classes
--					where displacement<=all(select displacement
--											from classes)) t1
--				where numguns>=all(select numguns
--									from(select *
--										from classes
--										where displacement<=all(select displacement
--										from classes))t1)) t2 on ships.class=t2.class;

--select count(ship) as 'numShips'
--from outcomes
--where result='ok' and ship in (select ship
--								from outcomes
--								where result='damaged');

--select okTable.ship
--from (select outcomes.ship, outcomes.battle, numOk
--		from outcomes join (select battle, count(ship) as numOk
--							from outcomes
--							group by battle) as countTable on outcomes.battle=countTable.battle
--		where result='ok') as okTable join (select outcomes.ship, outcomes.battle, numDamaged
--											from outcomes join (select battle, count(ship) as numDamaged
--																from outcomes
--																group by battle) as countTable on outcomes.battle=countTable.battle
--											where result='damaged') as damageTable on damageTable.ship=okTable.ship
--where numOk>numDamaged;

--select model, code, screen
--from laptop
--where laptop.screen=15 or screen=11;

--select distinct t1.model 
--from (select pc.model, maker, price 
--	from pc join product on pc.model=product.model) as t1 join (select maker, min(price) as 'minPrice'
--																from laptop join product on product.model=laptop.model
--																group by maker) as t2 on t1.maker=t2.maker
--where price<minPrice;

--select pcs.model, avgPrice
--from (select t1.model, maker, avgPrice
--		from (select model, avg(price) as 'avgPrice'
--				from pc
--				group by model) as t1 join product on product.model=t1.model) as pcs join (select maker, min(price) as 'minPrice'
--																							from laptop join product on product.model=laptop.model
--																							group by maker) as lps on lps.maker=pcs.maker
--where avgPrice<minPrice;

select t1.code, t1.maker, count(distinct pc.code) as 'numHigher'
from (select code, maker , price
		from pc join product on pc.model=product.model) as t1, pc
where t1.price<=pc.price
group by t1.code, t1.maker;
											

