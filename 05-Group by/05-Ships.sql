--1. Напишете заявка, която извежда броя на класовете бойни кораби.
select count(class) as 'NO_Classes'
 from classes
 where type='bb';

--2. Напишете заявка, която извежда средния брой оръдия за всеки клас боен кораб.
select class, avg(numguns) as 'AvgGuns'
from classes
where type='bb'
group by class;

--3. Напишете заявка, която извежда средния брой оръдия за всички бойни кораби.
select avg(numguns) as 'AvgGuns'
from classes 
where type='bb';

--4. Напишете заявка, която извежда за всеки клас първата и последната година, в която кораб от съответния клас е пуснат на вода.
select classes.class, min(launched) as 'FirstYear', max(launched) as 'LastYear' 
from classes join ships on classes.class=ships.class
group by classes.class;

--5. Напишете заявка, която извежда броя на корабите, потънали в битка според класа.
select class, count(name) as 'No_Sunk'
from ships join outcomes on outcomes.ship=ships.name
where result='sunk'
group by class;

--6. Напишете заявка, която извежда броя на корабите, потънали в битка според класа, за тези класове с повече от 2 кораба.
select class, count(name) as 'No_Sunk'
from ships join outcomes on outcomes.ship=ships.name
where result='sunk' and class in(select classes.class
								from classes join ships on ships.class=classes.class
								group by classes.class
								having count(ships.class)>=2)
group by class;

--7. Напишете заявка, която извежда средния калибър на оръдията на корабите за всяка страна
select country, convert(decimal(4,2), avg(bore)) as 'Avg_Bore'
from classes join ships on ships.class=classes.class
group by country;