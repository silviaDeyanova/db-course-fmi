--1. �������� ������, ����� ������� ����� �� �������� � ��������������� ��� 50000.
select name
from ships join classes on ships.class=classes.class
where classes.displacement>50000;

--2. �������� ������, ����� ������� �������, ����������������� � ���� ������ �� ������ ������, ��������� � ������� ��� Guadalcanal.
select name, displacement, numguns
from classes join ships on ships.class=classes.class join outcomes on outcomes.SHIP=ships.name
where OUTCOMES.BATTLE='Guadalcanal';

--3. �������� ������, ����� ������� ������� �� ���� �������, ����� ���� ����� ����� ������, ���� � ����� ��������.
select country
from classes
where type='bb'
intersect
select country
from classes
where type='bc';

--4. �������� ������, ����� ������� ������� �� ���� ������, ����� �� ���� ��������� � ���� �����, �� ��-����� �� ��������� � ����� �����
select ship
from outcomes 
where result='damaged'
intersect
select ship
from outcomes
where result='ok';