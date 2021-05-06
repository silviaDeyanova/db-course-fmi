--1. Напишете заявка, която извежда страните, чиито кораби са с най-голям брой оръдия.
select distinct country
from classes
where numguns >= all(select numguns
					from classes);

--2. Напишете заявка, която извежда класовете, за които поне един от корабите е потънал в битка.
select distinct class
from ships
where name in (select ship
				from outcomes
				where result ='sunk');

--3. Напишете заявка, която извежда името и класа на корабите с 16 инчови оръдия.
select name, class
from ships
where class in (select class
				from classes
				where bore = 16);

--4. Напишете заявка, която извежда имената на битките, в които са участвали кораби от клас ‘Kongo’.
select battle
from outcomes
where ship in (select name
				from ships
				where class='Kongo');

--5. Напишете заявка, която извежда класа и името на корабите, чиито брой оръдия е по-голям или равен на този на корабите със същия калибър оръдия
select class, name
from ships
where class in (select class
				from classes as cl
				where numguns >= all (select numguns
										from classes
										where cl.bore = bore));