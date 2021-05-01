--1. Напишете заявка, която извежда имената на актрисите, които са също и продуценти с нетни активи над 10 милиона.
select name
from moviestar
where gender='f' and name in (select name from movieexec
							where networth>=10000);

--2. Напишете заявка, която извежда имената на тези актьори (мъже и жени), които не са продуценти.
select name
from moviestar
where name not in (select name from movieexec);

--3. Напишете заявка, която извежда имената на всички филми с дължина, по-голяма от дължината на филма ‘Star Wars’
select title
from movie
where length > (select length from movie
				where title ='Star Wars');

--4. Напишете заявка, която извежда имената на продуцентите и имената на филмите за всички филми, които са продуцирани от продуценти с нетни активи по-големи от тези на ‘Merv Griffin’
select title, name
from movie join movieexec on producerc#=cert#
where networth > (select networth from movieexec
					where name ='Merv Griffin');
