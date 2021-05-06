--1
insert into classes
values ('Nelson', 'bb', 'Gt.Britain', 9, 16, 34000);
insert into ships
values ('Nelson', 'Nelson', 1927);
insert into ships
values ('Rodney', 'Nelson', 1927);

--2
delete from ships
where name in (select ship
				from outcomes
				where result='sunk');

--3
update classes
set bore=bore*2.5, displacement=displacement/1.1;