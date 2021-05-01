create database Flights;

create table Airline(
code varchar (3) constraint pk_airline primary key,
name varchar(50) unique,
country varchar(30)
);

create table Airport(
code varchar(3) constraint pk_airport primary key,
name varchar(50) unique,
country varchar(50),
town varchar(50)
);

create table Airplane(
code varchar(5) constraint pk_airplane primary key,
type varchar(30),
seats int constraint ch_airplane check(seats>0),
year int
);

create table Flight(
number varchar(20) constraint pk_flight primary key,
codeAirline varchar(3) not null,
codeArrAirport varchar(3) not null,
codeDepAirport varchar(3) not null,
time time not null,
duration int not null,
codeAirplane varchar(5) not null,
constraint fk_flightdep_airport foreign key(codeDepAirport) references airport(code),
constraint fk_flightarr_airport foreign key(codeArrAirport) references airport(code));

alter table Flight add constraint fk_flight_airline foreign key(codeAirline) references Airline(code);
alter table Flight add constraint fk_flight_airplane foreign key(codeAirplane) references Airplane(code);

create table Customer(
id int constraint pk_customer primary key,
name varchar(50) not null,
familyName varchar(50),
email varchar(60) constraint ch_email check(email like '%@%.%' and datalength(email)>6));

create table Agency(
name varchar(60) constraint pk_agency primary key,
country varchar(40),
town varchar(40),
phone varchar(20)
);

create table Booking(
code varchar(30) constraint pk_booking primary key,
nameAgency varchar(60) not null,
codeAirline varchar(3) not null,
flightNumber varchar(20) not null,
idCustomer int not null,
dateReservation date not null,
dateFlight date not null,
price decimal(16,2) not null,
state int not null constraint ch_state check(state in (0,1)),
constraint ch_date check(dateReservation<=dateFlight),
constraint fk_booking_agency foreign key(nameAgency) references Agency(name) );

alter table Booking add constraint fk_booking_airline foreign key (codeAirline) references Airline(code);
alter table Booking add constraint fk_booking_flight foreign key (flightNumber) references Flight(number);
alter table Booking add constraint fk_booking_customer foreign key (idCustomer) references Customer(id);