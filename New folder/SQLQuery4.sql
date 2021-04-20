--select title, name 
--from movie inner join movieexec on movie.producerc#=movieexec.cert#
--where cert#=(select producerc#
--			from movie
--			where title = 'Star Wars');

--select  distinct movieexec.name
--from movie join starsin on title=movietitle join movieexec on producerc#=cert#
--where starname = 'Harrison Ford';

--select distinct studio.name, starsin.starname
--from studio join movie on studioname=name join starsin on movietitle = title
--order by studio.name;

--select starname, networth, title
--from starsin join movie on movietitle=title join movieexec on producerc#=cert#
--where networth >= all(select networth
--						from movieexec);

--select name, movietitle
--from moviestar left join starsin on name=starname
--where movietitle is null;

--select maker, product.model, product.type 
--from product left join pc on pc.model=product.model left join laptop on laptop.model=product.model 
--left join printer on printer.model=product.model
--where printer.code is null and pc.code is null and laptop.code is null;

--select maker
--from product join laptop on laptop.model=product.model
--intersect
--select maker
--from product join printer on printer.model=product.model;

--select distinct l1.hd
--from laptop as l1 join laptop as l2 on l1.hd=l2.hd
--where l1.model!=l2.model;

--select pc.model
--from pc left join product on pc.model=product.model
--where product.maker is null;

--select *
--from ships join classes on ships.class=classes.class
--where classes.class is not null;

--select *
--from ships right join classes on ships.class=classes.class;

--select classes.country, ships.name
--from ships join classes on ships.class=classes.class left join outcomes on outcomes.ship=ships.name
--where outcomes.battle is null
--order by country, ships.name;

--select name as 'Ship name'
--from ships join classes on ships.class=classes.class
--where classes.numguns>=7 and ships.launched=1916;

--select ship, battle, date
--from outcomes join battles on battles.name=outcomes.battle
--where outcomes.result='sunk'
--order by battle;

--select distinct name, displacement, launched
--from ships join classes on ships.class=classes.class
--where ships.name=classes.class;

--select classes.class, type, country, numguns, bore, displacement
--from classes left join ships on ships.class=classes.class
--where launched is null;

select name, displacement, numguns, result
from ships join outcomes on ships.name=outcomes.ship join classes on ships.class=classes.class
where battle='North Atlantic';