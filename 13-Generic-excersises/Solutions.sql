--1
create database FurnitureCompany;

create table Customer(
id int not null primary key identity(1,1),
name varchar(30),
address varchar(50),
city varchar(20),
city_code int
);

create table Orders(
id int not null primary key,
order_date date,
customerId int
constraint fk_customer_order foreign key (customerId) references Customer(id)
);

create table Product(
id int not null primary key,
description varchar(100),
finish varchar(50),
price decimal(10,2),
line_id int,
check (finish in ('череша', 'естествен ясен', 'бял ясен', 'червен дъб', 'естествен дъб', 'орех'))
);

create table Order_line(
order_id int,
product_id int,
ordered_quantity int,
constraint fk_order_line_order foreign key (order_id) references Orders(id),
constraint fk_order_line_product foreign key (product_id) references Product(id)
);

insert into Product values
(1000, 'офис бюро', 'череша', 195, 10),
(1001, 'директорско бюро', 'червен дъб', 250, 10),
(2000, 'офис стол', 'череша', 75, 20),
(2001, 'директорски стол', 'естествен дъб', 129, 20),
(3000, 'етажерка за книги', 'естествен ясен', 85, 30),
(4000, 'настолна лампа', 'естествен ясен', 35, 40);

insert into Customer values
('Иван Петров', 'ул. Лавеле 8', 'София', 1000),
('Камелия Янева', 'ул. Иван Шишман 3', 'Бургас', 8000),
('Васил Димитров', 'ул. Абаджийска 87', 'Пловдив', 4000),
('Ани Милева', 'бул. Владислав Варненчик 56', 'Варна',9000);

insert into Orders values
(100, '2013-01-05', 1),
(101, '2013-12-07', 2),
(102, '2014-10-03', 3),
(103, '2014-10-08', 2),
(104, '2015-10-05', 1),
(105, '2015-10-05', 4),
(106, '2015-10-06', 2),
(107, '2016-01-06', 1);

insert into Order_line values
(100, 4000, 1),
(101, 1000, 2),
(101, 2000, 2),
(102, 3000, 1),
(102, 2000, 1),
(106, 4000, 1),
(103, 4000, 1),
(104, 4000, 1),
(105, 4000, 1),
(107, 4000, 1);

--2
select id, description, count(order_id) as 'Orders'
from Product join Order_line on Order_line.product_id=Product.id
group by Product.id, Product.description;

--3
select id, description, count(ordered_quantity) as 'Total Quantity'
from Product left join Order_line on Order_line.product_id=Product.id
group by Product.id, Product.description;

--4
select name, sum(price*ordered_quantity)
from Customer join Orders on Orders.customerId=Customer.id join Order_line on Order_line.order_id=Orders.id join Product on Product.id=Order_line.product_id
group by name;

--5
select maker
from product join printer on product.model=printer.model
intersect
select maker
from product join laptop on product.model=laptop.model;

select distinct maker
from product join printer on product.model=printer.model
where maker in (select maker
				from product join laptop on product.model=laptop.model);

--6
update pc
set price=price-(price*0.05)
where model in (select model
				from product
				where maker in(select maker
								from product join printer on product.model=printer.model
								group by maker
								having avg(printer.price)>800));

--7
select hd, min(price) as 'min_price'
from pc
where hd>=10 and hd<30
group by hd;

--8
create view bigger_battles
as
select battle
from outcomes join ships on ships.name=outcomes.ship join classes on classes.class=ships.class
where battle not like 'Guadalcanal'
group by battle
having count(ship)>=(select count(ship)
					from outcomes join ships on name=ship
					where battle='Guadalcanal')
and count(country)>=(select count(country)
					from outcomes join ships on ships.name=outcomes.ship join classes on classes.class=ships.class
					where battle='Guadalcanal');

select * from bigger_battles;

--9
delete from outcomes
where ship in (select ship
				from outcomes
				group by battle, ship
				having count(ship)=1);

--10
INSERT INTO outcomes VALUES ('Missouri','Surigao Strait', 'sunk'),
('Missouri','North Cape', 'sunk'),
('Missouri','North Atlantic', 'ok');

delete from outcomes
where ship in (select ship
				from outcomes join battles on name=battle
				where result='sunk'
				group by ship
				having count(date)>=2);


--11
create view battles_countries
as
select distinct battle, country
from outcomes join ships on ships.name=outcomes.ship join classes on classes.class=ships.class;

select distinct battle
from battles_countries
where battle not like 'Guadalcanal'
and country in (select country 
				from battles_countries
				where battle='Guadalcanal');

--12
select country, count(battle)
from classes left join ships on ships.class=classes.class left join outcomes on outcomes.ship=ships.name
group by country;
