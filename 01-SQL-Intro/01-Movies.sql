--1. �������� ������, ����� ������� ������ �� ������ �Disney�
select address
from studio
where name='Disney';

--2. �������� ������, ����� ������� ��������� ���� �� ������� Jack Nicholson
select birthdate
from moviestar
where name = 'Jack Nicholson';

--3. �������� ������, ����� ������� ������� �� ���������, ����� �� ��������� ��� ���� �� 1980 ��� ��� ����, � ����� �������� ��� ������ �Knight�
select starname
from starsin
where movieyear = 1980 OR movietitle like '%Knight%';

--4. �������� ������, ����� ������� ������� �� ������������ � ����� ������ ��� 10 000 000 ������
select name
from movieexec
where networth > 1000000;

--5. �������� ������, ����� ������� ������� �� ���������, ����� �� ���� ��� ������ �� Prefect Rd.
select name
from moviestar
where gender = 'M' or address = ' Prefect Rd';
