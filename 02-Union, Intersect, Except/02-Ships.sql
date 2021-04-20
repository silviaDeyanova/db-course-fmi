--1. Напишете заявка, която извежда името на корабите с водоизместимост над 50000.
select name
from ships join classes on ships.class=classes.class
where classes.displacement>50000;

--2. Напишете заявка, която извежда имената, водоизместимостта и броя оръдия на всички кораби, участвали в битката при Guadalcanal.
select name, displacement, numguns
from classes join ships on ships.class=classes.class join outcomes on outcomes.SHIP=ships.name
where OUTCOMES.BATTLE='Guadalcanal';

--3. Напишете заявка, която извежда имената на тези държави, които имат както бойни кораби, така и бойни крайцери.
select country
from classes
where type='bb'
intersect
select country
from classes
where type='bc';

--4. Напишете заявка, която извежда имената на тези кораби, които са били повредени в една битка, но по-късно са участвали в друга битка
select ship
from outcomes 
where result='damaged'
intersect
select ship
from outcomes
where result='ok';