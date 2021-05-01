create database Facebook;

create table Users(
id int,
email varchar(40),
password varchar(30),
date date
);

create table Friends(
user1 int,
user2 int
);

create table Walls(
idWriter int,
idOwner int,
text varchar(100) default '',
date date
);

create table Groups(
id int,
name varchar(20),
decription varchar(30) default ''
);

create table GroupMembers(
groupId int,
userId int
);

insert into Friends 
values(1, 2);
insert into GroupMembers 
values(1, 3);
insert into Groups (id, name) 
values(5, 'group1');
insert into Users 
values (1, 'no@google.com', '123123', '12-04-2019');
insert into Walls 
values (1, 2, 'sup', '12-04-2019');
