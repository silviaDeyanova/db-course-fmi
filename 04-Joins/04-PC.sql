--1. Напишете заявка, която извежда производител, модел и тип на продукт за тези производители, за които съответният продукт не се продава (няма го в таблиците PC, Laptop или Printer)
select maker, product.model, product.type 
from product left join pc on pc.model=product.model left join laptop on laptop.model=product.model 
left join printer on printer.model=product.model
where printer.code is null and pc.code is null and laptop.code is null;

--2. Намерете всички производители, които правят както лаптопи, така и принтери.
select maker
from product join laptop on laptop.model=product.model
intersect
select maker
from product join printer on printer.model=product.model;

--3. Намерете размерите на тези твърди дискове, които се появяват в два или повече модела лаптопи.
select distinct l1.hd
from laptop as l1 join laptop as l2 on l1.hd=l2.hd
where l1.model!=l2.model;

--4. Намерете всички модели персонални компютри, които нямат регистриран производител.
select pc.model
from pc left join product on pc.model=product.model
where product.maker is null;