--1. �������� ������, ����� ������� ����� � �������� �� ������ ������� � ������� �� 10 ������.
select class, country
from classes
where numguns<10;

--2. �������� ������, ����� ������� ������� �� ��������, ������� �� ���� ����� 1918. ������� ��������� shipName �� ��������.
select name
from ships
where launched <1918;

--3. �������� ������, ����� ������� ������� �� �������� �������� � ����� � ������� �� ����������� �����.
select ship, battle
from outcomes
where result='sunk';

--4. �������� ������, ����� ������� ������� �� �������� � ���, ��������� � ����� �� ������ ����.
select name
from ships
where name=class;

--5. �������� ������, ����� ������� ������� �� ��������, ����� �������� � ������� R.
select name
from ships
where name like 'R%';

--6. �������� ������, ����� ������� ������� �� ��������, ����� �������� 2 ��� ������ ����
select name
from ships
where name like '_% _%';