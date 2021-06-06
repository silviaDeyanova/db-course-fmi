--1
alter table Flights 
add num_pass int;

--2
alter table Agencies 
add num_book int;

--3
create trigger bookings_add
on bookings
after insert as
begin
update Flights
set num_pass=num_pass+1
where fnumber=(select flight_number 
				from inserted)
update Agencies
set num_book=num_book+1
where name = (select agency
				from inserted)
end;

--4
create trigger bookings_remove
on bookings
after delete as
begin
update Flights
set num_pass=num_pass-1
where fnumber=(select flight_number 
				from deleted)
update Agencies
set num_book=num_book-1
where name = (select agency
				from deleted)
end;

--5
create trigger bookings_update
on bookings
after update as
begin
update Flights
set num_pass=num_pass+1
where fnumber=(select flight_number 
				from inserted)
update Agencies
set num_book=num_book+1
where name = (select agency
				from inserted)
update Flights
set num_pass=num_pass-1
where fnumber=(select flight_number 
				from deleted)
update Agencies
set num_book=num_book-1
where name = (select agency
				from deleted)
end;