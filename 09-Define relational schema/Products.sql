create database products;

create table Product(
maker char(1),
model char(4),
type varchar(7)
);

create table Printer(
code int,
model char(4),
price decimal(16,2)
);

insert into Product
values('4', 'A','p');

insert into Printer
values(5,'c',26.5);

alter table Printer add type char(6);
alter table Printer add color char(1) default 'n';

alter table Printer drop column price;

drop table Product;
drop table Printer;
