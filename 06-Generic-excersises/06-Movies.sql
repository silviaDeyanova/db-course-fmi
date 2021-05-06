--1. Напишете заявка, която извежда заглавие и година на всички филми, които са по-дълги от 120 минути и са снимани преди 2000 г. Ако дължината на филма е неизвестна, заглавието и годината на този филм също да се изведат.
select title, year, length
from movie
where (length>=120 or length is null) and year<2000;

--2. Напишете заявка, която извежда име и пол на всички актьори (мъже и жени), чието име започва с 'J' и са родени след 1948 година. Резултатът да бъде подреден по име в намаляващ ред.
select name, gender
from moviestar
where name like 'J%' and birthdate>1948
order by name desc;

--3. Напишете заявка, която извежда име на студио и брой на актьорите, участвали във филми, които са създадени от това студио.
select movie.studioname, count(distinct starsin.starname) as 'num_actors'
from movie join starsin on movie.title=starsin.movietitle
group by movie.studioname;

--4. Напишете заявка, която за всеки актьор извежда име на актьора и броя на филмите, в които актьорът е участвал.
select starname, count(movietitle)
from starsin
group by starname;

--5. Напишете заявка, която за всяко студио извежда име на студиото и заглавие на филма, излязъл последно на екран за това студио.
select t2.studioname, t2.title, t2.year
from (select studioname, max(year) as year
		from movie
		group by studioname) as t1 join movie as t2 on t1.studioname=t2.studioname and t1.year=t2.year;

--6. Напишете заявка, която извежда името на най-младия актьор (мъж).
select top 1 name
from moviestar
where gender='m'
order by birthdate desc;

--7. Напишете заявка, която извежда име на актьор и име на студио за тези актьори, участвали в най-много филми на това студио.
select studioname, starname, count(title) as 'Num_Movies'
from movie m join starsin on m.title=starsin.movietitle and m.year=starsin.movieyear
group by studioname, starname
having count(*)>=all(select count(*)
					from movie join starsin on movie.title=starsin.movietitle and movie.year=starsin.movieyear
					where studioname=m.studioname
					group by studioname, starname);

--8. Напишете заявка, която извежда заглавие и година на филма, и брой на актьорите, участвали в този филм за тези филми с повече от двама актьори.
select movietitle, movieyear, count(starname) as 'numActors'
from starsin
group by movietitle, movieyear
having count(starname)>2;