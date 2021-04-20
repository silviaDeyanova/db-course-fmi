--1. Напишете заявка, която извежда адреса на студио ‘Disney’
select address
from studio
where name='Disney';

--2. Напишете заявка, която извежда рождената дата на актьора Jack Nicholson
select birthdate
from moviestar
where name = 'Jack Nicholson';

--3. Напишете заявка, която извежда имената на актьорите, които са участвали във филм от 1980 или във филм, в чието заглавие има думата ‘Knight’
select starname
from starsin
where movieyear = 1980 OR movietitle like '%Knight%';

--4. Напишете заявка, която извежда имената на продуцентите с нетни активи над 10 000 000 долара
select name
from movieexec
where networth > 1000000;

--5. Напишете заявка, която извежда имената на актьорите, които са мъже или живеят на Prefect Rd.
select name
from moviestar
where gender = 'M' or address = ' Prefect Rd';
