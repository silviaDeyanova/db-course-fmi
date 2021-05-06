--1. Напишете заявка, която извежда името на продуцента и имената на филмите, продуцирани от продуцента на филма ‘Star Wars’.
select title, name 
from movie inner join movieexec on movie.producerc#=movieexec.cert#
where cert#=(select producerc#
			from movie
			where title = 'Star Wars');

--2. Напишете заявка, която извежда имената на продуцентите на филмите, в които е участвал ‘Harrison Ford’
select  distinct movieexec.name
from movie join starsin on title=movietitle join movieexec on producerc#=cert#
where starname = 'Harrison Ford';

--3. Напишете заявка, която извежда името на студиото и имената на актьорите, участвали във филми, произведени от това студио, подредени по име на студио.
select distinct studio.name, starsin.starname
from studio join movie on studioname=name join starsin on movietitle = title
order by studio.name;

--4. Напишете заявка, която извежда имената на актьорите, участвали във филми на продуценти с най-големи нетни активи.
select starname, networth, title
from starsin join movie on movietitle=title join movieexec on producerc#=cert#
where networth >= all(select networth
						from movieexec);

--5. Напишете заявка, която извежда имената на актьорите, които не са участвали в нито един филм.
select name, movietitle
from moviestar left join starsin on name=starname
where movietitle is null;