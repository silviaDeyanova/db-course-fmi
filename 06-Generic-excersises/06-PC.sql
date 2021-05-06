--1. Напишете заявка, която извежда всички модели лаптопи, за които се предлагат както разновидности с 15" екран, така и с 11" екран.
select model, code, screen
from laptop
where laptop.screen=15 or screen=11;

--2. Да се изведат различните модели компютри, чиято цена е по-ниска от найевтиния лаптоп, произвеждан от същия производител
select distinct t1.model 
from (select pc.model, maker, price 
	from pc join product on pc.model=product.model) as t1 join (select maker, min(price) as 'minPrice'
																from laptop join product on product.model=laptop.model
																group by maker) as t2 on t1.maker=t2.maker
where price<minPrice;

--3. Един модел компютри може да се предлага в няколко разновидности с различна цена. Да се изведат тези модели компютри, чиято средна цена (на различните му разновидности) е по-ниска от най-евтиния лаптоп, произвеждан от същия производител.
select pcs.model, avgPrice
from (select t1.model, maker, avgPrice
		from (select model, avg(price) as 'avgPrice'
				from pc
				group by model) as t1 join product on product.model=t1.model) as pcs join (select maker, min(price) as 'minPrice'
																							from laptop join product on product.model=laptop.model
																							group by maker) as lps on lps.maker=pcs.maker
where avgPrice<minPrice;

--4. Напишете заявка, която извежда за всеки компютър код на продукта, производител и брой компютри, които имат цена, по-голяма или равна на неговата
select t1.code, t1.maker, count(distinct pc.code) as 'numHigher'
from (select code, maker , price
		from pc join product on pc.model=product.model) as t1, pc
where t1.price<=pc.price
group by t1.code, t1.maker;