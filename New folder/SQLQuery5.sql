--select convert(decimal(8,2),avg(speed)) as AvgSpeed
--from pc;

--select product.maker, avg(screen) as AvgScreen
--from laptop join product on laptop.model=product.model
--group by product.maker;

--select convert(decimal(8,2),avg(speed)) as AvgSpeed
--from laptop
--where price>=1000;

--select maker, convert(decimal(8,2),avg(price)) as AvgPrice
--from pc join product on pc.model=product.model
--where maker='A'
--group by maker;

--select maker, avg(price)
--from (select model, price
--		from laptop
--		union all
--		select model, price
--		from pc) as t1 join product on product.model=t1.model
--where maker='B'
--group by maker;

--select speed, avg(price) as 'AvgPrice'
--from pc
--group by speed;

--select maker, count(product.model)
--from pc join product on product.model=pc.model
--group by maker
--having count(product.model)>=3;

--select  top 1 maker, max(price) as price
--from pc join product on product.model=pc.model
--group by product.maker
--order by price desc;

--select speed, avg(price)
--from pc
--where speed>800
--group by speed;

--select maker, convert(decimal(4,2),avg(hd)) as 'AvgHDD'
--from pc join product on pc.model=product.model
--where maker in (select maker from product join printer on printer.model=product.model)
--group by maker;
 
 --select count(class) as 'NO_Classes'
 --from classes
 --where type='bb';

 --select class, avg(numguns) as 'AvgGuns'
 --from classes
 --where type='bb'
 --group by class;

 --select avg(numguns) as 'AvgGuns'
 --from classes 
 --where type='bb';

 --select classes.class, min(launched) as 'FirstYear', max(launched) as 'LastYear' 
 --from classes join ships on classes.class=ships.class
 --group by classes.class;

 --select class, count(name) as 'No_Sunk'
 --from ships join outcomes on outcomes.ship=ships.name
 --where result='sunk'
 --group by class;

 --select class, count(name) as 'No_Sunk'
 --from ships join outcomes on outcomes.ship=ships.name
 --where result='sunk' and class in(select classes.class
	--							from classes join ships on ships.class=classes.class
	--							group by classes.class
	--							having count(ships.class)>=2)
 --group by class;

 select country, convert(decimal(4,2), avg(bore)) as 'Avg_Bore'
 from classes join ships on ships.class=classes.class
 group by country;
