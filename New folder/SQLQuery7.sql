--insert into moviestar (name, gender, birthdate)
--values ('Nicole Kidman', 'F','1967-06-20 00:00:00.000')

--delete from movieexec
--where networth<30000000;

--delete from moviestar
--where address is null;

--insert into product (maker, model, type)
--values ('C','1100','pc');
--insert into pc (code, model, speed, ram, hd, cd, price)
--values (12,'1100',2400, 2048, 500, '52x',299);

--delete from pc
--where model='1100';

--delete from laptop
--where model in (select model
--				from product
--				where type='laptop' and maker not in (select maker 
--													from product 
--													where type='printer'));

--update product
--set maker='A'
--where maker='B';

--update pc
--set price=price/2, hd=hd+20;

--update laptop
--set screen=screen+1
--where model in (select model
--				from product
--				where type='laptop' and maker='B');

--insert into classes
--values ('Nelson', 'bb', 'Gt.Britain', 9, 16, 34000);
--insert into ships
--values ('Nelson', 'Nelson', 1927);
--insert into ships
--values ('Rodney', 'Nelson', 1927);

--delete from ships
--where name in (select ship
--				from outcomes
--				where result='sunk');

update classes
set bore=bore*2.5, displacement=displacement/1.1;