--1. Напишете заявка, която извежда цялата налична информация за всеки кораб, включително и данните за неговия клас. В резултата не трябва да се включват тези класове, които нямат кораби.
select *
from ships join classes on ships.class=classes.class
where classes.class is not null;

--2. Повторете горната заявка, като този път включите в резултата и класовете, които нямат кораби, но съществуват кораби със същото име като тяхното.
select *
from ships right join classes on ships.class=classes.class;

--3. За всяка страна изведете имената на корабите, които никога не са участвали в битка.
select classes.country, ships.name
from ships join classes on ships.class=classes.class left join outcomes on outcomes.ship=ships.name
where outcomes.battle is null
order by country, ships.name;

--4. Намерете имената на всички кораби с поне 7 оръдия, пуснати на вода през 1916, но наречете резултатната колона Ship Name.
select name as 'Ship name'
from ships join classes on ships.class=classes.class
where classes.numguns>=7 and ships.launched=1916;

--5. Изведете имената на всички потънали в битка кораби, името и дата на провеждане на битките, в които те са потънали. Подредете резултата по име на битката.
select ship, battle, date
from outcomes join battles on battles.name=outcomes.battle
where outcomes.result='sunk'
order by battle;

--6. Намерете името, водоизместимостта и годината на пускане на вода на всички кораби, които имат същото име като техния клас.
select distinct name, displacement, launched
from ships join classes on ships.class=classes.class
where ships.name=classes.class;

--7. Намерете всички класове кораби, от които няма пуснат на вода нито един кораб.
select classes.class, type, country, numguns, bore, displacement
from classes left join ships on ships.class=classes.class
where launched is null;

--8. Изведете името, водоизместимостта и броя оръдия на корабите, участвали в битката ‘North Atlantic’, а също и резултата от битката
select name, displacement, numguns, result
from ships join outcomes on ships.name=outcomes.ship join classes on ships.class=classes.class
where battle='North Atlantic';