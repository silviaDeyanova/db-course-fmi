--1
create view view_one
as
select airlines.name, airline_operator, fnumber, count(customer_id) as customer_count
from airlines join bookings on bookings.airline_code=airlines.code join flights on flights.fnumber=bookings.flight_number
group by airlines.name, fnumber, airline_operator;

--2
create view view_two
as
select distinct agency, max(bookings_count) as 'MAX'
from (select agency, customer_id, count(code) as 'bookings_count'
		from bookings
		group by agency, customer_id) as t1
where bookings_count=(select top 1 count(code) as 'bookings_count'
						from bookings t2
						where t2.agency=t1.agency and t2.customer_id=t1.customer_id
						group by agency, customer_id
						order by bookings_count desc)
group by agency;

--3
create view view_three
as
select *
from agencies
where city='Sofia'
with check option;

--4
create view view_four
as
select *
from agencies
where phone is null
with check option;

--5
INSERT INTO view_three 
VALUES('T1 Tour', 'Bulgaria', 'Sofia','+359');
INSERT INTO view_four 
VALUES('T2 Tour', 'Bulgaria', 'Sofia',null);--7drop view view_one, view_two,view_three,view_four;--8create index idx_product_model on product(model);--9create index idx_classes_type on classes(type);

--10
drop index idx_product_model on product;
drop index idx_classes_type on classes;
