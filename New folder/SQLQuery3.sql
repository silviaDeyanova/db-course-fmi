--select name
--from moviestar
--where gender='f' and name in (select name
--							from movieexec
--							where networth>=10000);

--select name
--from moviestar
--where name not in (select name
--					from movieexec);

--select title
--from movie
--where length > (select length
--				from movie
--				where title ='Star Wars');

--select title, name
--from movie join movieexec on producerc#=cert#
--where networth > (select networth
--					from movieexec
--					where name ='Merv Griffin');

--select maker
--from product --join pc on product.model=pc.model
--where model in (select model
--				from pc
--				where speed>500);

--select code, model, price
--from printer
--where price = (select top 1 price
--			from printer
--			order by price desc);

--select *
--from laptop
--where speed < (select top 1 speed
--				from pc
--				order by speed asc);

--select model, price
--from pc
--where price >= all (select price from pc union select price from printer union select price from laptop)
--union
--select model, price
--from laptop
--where price >= all (select price from pc union select price from printer union select price from laptop)
--union
--select model, price
--from printer
--where price >= all (select price from pc union select price from printer union select price from laptop);

--select maker
--from product
--where model in (select model
--				from printer
--				where color='y' and price<= all(select price 
--								from printer
--								where color='y'));

--select maker
--from product
--where model in (select model
--				from (select *
--					from pc
--					where ram<=all(select ram
--									from pc)) pc2
--				where speed >= all(select speed
--									from (select *
--											from pc
--											where ram <=all(select ram
--															from pc)) pc3));

--select distinct country
--from classes
--where numguns >= all(select numguns
--					from classes);

--select distinct class
--from ships
--where name in (select ship
--				from outcomes
--				where result ='sunk');

--select name, class
--from ships
--where class in (select class
--				from classes
--				where bore = 16);

--select battle
--from outcomes
--where ship in (select name
--				from ships
--				where class='Kongo');

select class, name
from ships
where class in (select class
				from classes as cl
				where numguns >= all (select numguns
										from classes
										where cl.bore = bore));


				

			

