select address
from studio
where name='Disney';

select birthdate
from moviestar
where name = 'Jack Nicholson';

select starname
from starsin
where movieyear = 1980 OR movietitle like '%Knight%';

select name
from movieexec
where networth > 1000000;

select name
from moviestar
where gender = 'M' or address = ' Prefect Rd';
