--1. Напишете заявка, която извежда средната честота на персоналните компютри
select convert(decimal(8,2),avg(speed)) as AvgSpeed
from pc;

--2. Напишете заявка, която извежда средния размер на екраните на лаптопите за всеки производител.
select product.maker, avg(screen) as AvgScreen
from laptop join product on laptop.model=product.model
group by product.maker;

--3. Напишете заявка, която извежда средната честота на лаптопите с цена над 1000
select convert(decimal(8,2),avg(speed)) as AvgSpeed
from laptop
where price>=1000;

--4. Напишете заявка, която извежда средната цена на персоналните компютри, произведени от производител ‘A’.
select maker, convert(decimal(8,2),avg(price)) as AvgPrice
from pc join product on pc.model=product.model
where maker='A'
group by maker;

--5. Напишете заявка, която извежда средната цена на персоналните компютри и лаптопите за производител ‘B’
select maker, avg(price)
from (select model, price
		from laptop
		union all
		select model, price
		from pc) as t1 join product on product.model=t1.model
where maker='B'
group by maker;

--6. Напишете заявка, която извежда средната цена на персоналните компютри според различните им честоти.
select speed, avg(price) as 'AvgPrice'
from pc
group by speed;

--7. Напишете заявка, която извежда производителите, които са произвели поне 3 различни персонални компютъра (с различен код).
select maker, count(product.model)
from pc join product on product.model=pc.model
group by maker
having count(product.model)>=3;

--8. Напишете заявка, която извежда производителите с най-висока цена на персонален компютър.
select  top 1 maker, max(price) as price
from pc join product on product.model=pc.model
group by product.maker
order by price desc;

--9. Напишете заявка, която извежда средната цена на персоналните компютри за всяка честота по-голяма от 800.
select speed, avg(price)
from pc
where speed>800
group by speed;

--10.Напишете заявка, която извежда средния размер на диска на тези персонални компютри, произведени от производители, които произвеждат и принтери. Резултатът да се изведе за всеки отделен производител.
select maker, convert(decimal(4,2),avg(hd)) as 'AvgHDD'
from pc join product on pc.model=product.model
where maker in (select maker from product join printer on printer.model=product.model)
group by maker;