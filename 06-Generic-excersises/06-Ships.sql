--1. Напишете заявка, която извежда имената на всички кораби без повторения, които са участвали в поне една битка и чиито имена започват с C или K.
select distinct ship
from outcomes
where ship like 'C%' or ship like 'K%'
group by ship
having count(battle)>=1;

--2. Напишете заявка, която извежда име и държава на всички кораби, които никога не са потъвали в битка (може и да не са участвали).
select distinct name, country
from ships join classes on ships.class=classes.class left join outcomes on outcomes.ship=ships.name
where result!='sunk' or battle is null;

--3. Напишете заявка, която извежда държавата и броя на потъналите кораби за тази държава. Държави, които нямат кораби или имат кораб, но той не е участвал в битка, също да бъдат изведени.
select country, count(ship) as 'sunkShips'
from classes left join ships on ships.class=classes.class left join outcomes on outcomes.ship=ships.name
where result='sunk' or ship is null
group by country;

--4. Напишете заявка, която извежда име на битките, които са по-мащабни (с повече участващи кораби) от битката при Guadalcanal.
select battle
from outcomes
group by battle
having count(ship)>(select count(ship)
					from outcomes
					where battle='Guadalcanal');

--5. Напишете заявка, която извежда име на битките, които са по-мащабни (с повече участващи страни) от битката при Surigao Strait.
select battle
from outcomes join ships on ships.name=outcomes.ship join classes on classes.class=ships.class
group by battle
having count(country)>(select count(country)
					from outcomes join ships on ships.name=outcomes.ship join classes on classes.class=ships.class
					where battle='Surigao Strait');

--6. Напишете заявка, която извежда имената на най-леките кораби с най-много оръдия.
select name, t2.displacement, t2.numguns
from ships join (select*
				from (select *
					from classes
					where displacement<=all(select displacement
											from classes)) t1
				where numguns>=all(select numguns
									from(select *
										from classes
										where displacement<=all(select displacement
										from classes))t1)) t2 on ships.class=t2.class;

--7. Изведете броя на корабите, които са били увредени в битка, но са били поправени и по-късно са победили в друга битка.
select count(ship) as 'numShips'
from outcomes
where result='ok' and ship in (select ship
								from outcomes
								where result='damaged');

--8. Изведете име на корабите, които са били увредени в битка, но са били поправени и по-късно са победили в по-мащабна битка (с повече кораби).
select okTable.ship
from (select outcomes.ship, outcomes.battle, numOk
		from outcomes join (select battle, count(ship) as numOk
							from outcomes
							group by battle) as countTable on outcomes.battle=countTable.battle
		where result='ok') as okTable join (select outcomes.ship, outcomes.battle, numDamaged
											from outcomes join (select battle, count(ship) as numDamaged
																from outcomes
																group by battle) as countTable on outcomes.battle=countTable.battle
											where result='damaged') as damageTable on damageTable.ship=okTable.ship
where numOk>numDamaged;