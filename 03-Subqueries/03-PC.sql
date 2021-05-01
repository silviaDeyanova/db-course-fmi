--
select maker
from product
where model in (select model
				from pc
				where speed>500);

select code, model, price
from printer
where price = (select top 1 price
			from printer
			order by price desc);

select *
from laptop
where speed < (select top 1 speed
				from pc
				order by speed asc);

select model, price
from pc
where price >= all (select price from pc union select price from printer union select price from laptop)
union
select model, price
from laptop
where price >= all (select price from pc union select price from printer union select price from laptop)
union
select model, price
from printer
where price >= all (select price from pc union select price from printer union select price from laptop);

select maker
from product
where model in (select model
				from printer
				where color='y' and price<= all(select price 
								from printer
								where color='y'));

select maker
from product
where model in (select model
				from (select *
					from pc
					where ram<=all(select ram
									from pc)) pc2
				where speed >= all(select speed
									from (select *
											from pc
											where ram <=all(select ram
															from pc)) pc3));