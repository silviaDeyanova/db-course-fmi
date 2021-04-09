select model, speed as 'MHz', hd as 'GB'
from pc
where price < 1200;

select distinct maker
from product
where type='printer';

select model, ram, screen
from laptop
where price>1000;

select *
from printer
where color='y';

select model, speed, hd
from pc
where (cd = '12x' or cd = '16x') and price<2000;
