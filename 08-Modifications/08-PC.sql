--1
insert into product (maker, model, type)
values ('C','1100','pc');
insert into pc (code, model, speed, ram, hd, cd, price)
values (12,'1100',2400, 2048, 500, '52x',299);

--2
delete from pc
where model='1100';

--3
delete from laptop
where model in (select model
				from product
				where type='laptop' and maker not in (select maker 
													from product 
													where type='printer'));

--4
update product
set maker='A'
where maker='B';

--5
update pc
set price=price/2, hd=hd+20;

--6
update laptop
set screen=screen+1
where model in (select model
				from product
				where type='laptop' and maker='B');