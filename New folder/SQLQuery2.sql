--use movies;

--select name
--from moviestar
--where gender='m'
--intersect
--select starname
--from starsin
--where movietitle = 'The Usual Suspects';

--select distinct starname
--from starsin, movie
--where movieyear=1995 and studioname='MGM' and movietitle=title;

--select distinct name
--from movieexec join movie on studioname='MGM' and cert#=producerc#;

--select m1.title
--from movie as m1, movie as m2
--where m1.length>m2.length and m2.title='Star Wars';

--SELECT EX1.NAME
--FROM MOVIEEXEC AS EX1 JOIN MOVIEEXEC AS EX2 ON (EX1.NETWORTH > EX2.NETWORTH)
--WHERE EX2.NAME = 'Stephen Spielberg';

--SELECT movie.title
--FROM MOVIEEXEC AS EX1 JOIN MOVIEEXEC AS EX2 ON (EX1.NETWORTH > EX2.NETWORTH) JOIN MOVIE ON (MOVIE.PRODUCERC# = EX1.CERT#)
--WHERE EX2.NAME = 'Stephen Spielberg';

--select maker, speed
--from product, laptop
--where hd>=9 and product.model=laptop.model;

--select product.model, price
--from product, laptop
--where maker='B' and product.model=laptop.model
--union
--select product.model, price
--from product, pc
--where maker='B' and product.model=pc.model
--union
--select product.model, price
--from product, printer
--where maker='B' and product.model=printer.model;

--select distinct maker
--from product
--where type='Laptop'
--except
--select distinct maker
--from product
--where type='PC';

--select distinct pc1.hd
--from pc as pc1 join pc as pc2 on pc1.hd=pc2.hd and pc1.code!=pc2.code;

--select pc1.model, pc2.model
--from pc as pc1, pc as pc2
--where pc1.speed=pc2.speed and pc1.ram=pc2.ram and pc1.model<pc2.model;

--select distinct maker
--from product join pc as pc1 on product.model=pc1.model join pc as pc2 on pc1.code!=pc2.code and product.model=pc2.model
--where pc1.speed>=400 and pc2.speed>=400;

--select name
--from ships join classes on ships.class=classes.class
--where classes.displacement>50000;

--select name, displacement, numguns
--from classes join ships on ships.class=classes.class join outcomes on outcomes.SHIP=ships.name
--where OUTCOMES.BATTLE='Guadalcanal';

--select country
--from classes
--where type='bb'
--intersect
--select country
--from classes
--where type='bc';

select ship
from outcomes 
where result='damaged'
intersect
select ship
from outcomes
where result='ok';
