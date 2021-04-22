--1. Напишете заявка, която извежда имената на актьорите мъже, участвали във филма The Usual Suspects.
select name
from moviestar
where gender='m'
intersect
select starname
from starsin
where movietitle = 'The Usual Suspects';

--2. Напишете заявка, която извежда имената на актьорите, участвали във филми от 1995, продуцирани от студио MGM.
select distinct starname
from starsin, movie
where movieyear=1995 and studioname='MGM' and movietitle=title;

--3. Напишете заявка, която извежда имената на продуцентите, които са продуцирали филми на студио MGM.
select distinct name
from movieexec join movie on studioname='MGM' and cert#=producerc#;

--4. Напишете заявка, която извежда имената на всички филми с дължина, поголяма от дължината на филма Star Wars.
select m1.title
from movie as m1, movie as m2
where m1.length>m2.length and m2.title='Star Wars';

--5. Напишете заявка, която извежда имената на продуцентите с нетни активи поголеми от тези на Stephen Spielberg.
SELECT EX1.NAME
FROM MOVIEEXEC AS EX1 JOIN MOVIEEXEC AS EX2 ON (EX1.NETWORTH > EX2.NETWORTH)
WHERE EX2.NAME = 'Stephen Spielberg';

--6. Напишете заявка, която извежда имената на всички филми, които са продуцирани от продуценти с нетни активи по-големи от тези на Stephen Spielberg.
SELECT movie.title
FROM MOVIEEXEC AS EX1 JOIN MOVIEEXEC AS EX2 ON (EX1.NETWORTH > EX2.NETWORTH) JOIN MOVIE ON (MOVIE.PRODUCERC# = EX1.CERT#)
WHERE EX2.NAME = 'Stephen Spielberg';
