--1. Напишете заявка, която извежда имената на актрисите, които са също и продуценти с нетни активи над 10 милиона.
select name
from moviestar
where gender='f' and name in (select name
							from movieexec
							where networth>=10000);

select name
from moviestar
where name not in (select name
					from movieexec);

select title
from movie
where length > (select length
				from movie
				where title ='Star Wars');

select title, name
from movie join movieexec on producerc#=cert#
where networth > (select networth
					from movieexec
					where name ='Merv Griffin');