--1. Напишете заявка, която извежда производителя и честотата на лаптопите с размер на диска поне 9 GB.
select maker, speed
from product, laptop
where hd>=9 and product.model=laptop.model;

--2. Напишете заявка, която извежда модел и цена на продуктите, произведени от производител с име B.
select product.model, price
from product, laptop
where maker='B' and product.model=laptop.model
union
select product.model, price
from product, pc
where maker='B' and product.model=pc.model
union
select product.model, price
from product, printer
where maker='B' and product.model=printer.model;

--3. Напишете заявка, която извежда производителите, които произвеждат лаптопи, но не произвеждат персонални компютри.
select distinct maker
from product
where type='Laptop'
except
select distinct maker
from product
where type='PC';

--4. Напишете заявка, която извежда размерите на тези дискове, които се предлагат в поне два различни персонални компютъра (два компютъра с различен код).
select distinct pc1.hd
from pc as pc1 join pc as pc2 on pc1.hd=pc2.hd and pc1.code!=pc2.code;

--5. Напишете заявка, която извежда двойките модели на персонални компютри, които имат еднаква честота и памет. Двойките трябва да се показват само по веднъж, например само (i, j), но не и (j, i).
select pc1.model, pc2.model
from pc as pc1, pc as pc2
where pc1.speed=pc2.speed and pc1.ram=pc2.ram and pc1.model<pc2.model;

--6. Напишете заявка, която извежда производителите на поне два различни персонални компютъра с честота поне 400.
select distinct maker
from product join pc as pc1 on product.model=pc1.model join pc as pc2 on pc1.code!=pc2.code and product.model=pc2.model
where pc1.speed>=400 and pc2.speed>=400;
