--Напишете заявка, която извежда адресът на студио ‘MGM’
SELECT ADDRESS
FROM STUDIO
WHERE NAME = 'MGM';

--Напишете заявка, която извежда рождената дата на актрисата Sandra Bullock
SELECT BIRTHDATE
FROM MOVIESTAR
WHERE NAME = 'Sandra Bullock';

--Напишете заявка, която извежда имената на всички актьори, които са участвали във филм през 1980 в заглавието на които има думата ‘Love’
SELECT STARNAME
FROM STARSIN
WHERE MOVIEYEAR = 1980 AND MOVIETITLE LIKE '%Love%';

--Напишете заявка, която извежда имената на всички продуценти на
--филми на стойност над 10 000 000 долара
SELECT NAME
FROM MOVIEEXEC
WHERE NETWORTH > 10000000;

--Напишете заявка, която извежда имената на всички актьори, които са
--мъже или живеят в Malibu
SELECT NAME
FROM MOVIESTAR
WHERE GENDER = 'M' OR ADDRESS LIKE '%Malibu%';

--Напишете заявка, която извежда името на класа и страната за всички
--класове с брой на оръдията по-малък от 10
SELECT TYPE, COUNTRY
FROM CLASSES
WHERE NUMGUNS < 10;

--Напишете заявка, която извежда имената на всички кораби, пуснати на
--вода преди 1918. Задайте псевдоним на колоната shipName
SELECT NAME AS shipName
FROM SHIPS
WHERE LAUNCHED < 1918;

--Напишете заявка, която извежда имената на корабите потънали в битка
--и имената на битките в които са потънали
SELECT SHIP,BATTLE
FROM OUTCOMES
WHERE RESULT = 'sunk';

--Напишете заявка, която извежда имената на корабите с име съвпадащо
--с името на техния клас
SELECT NAME
FROM SHIPS
WHERE NAME = CLASS;

--Напишете заявка, която извежда имената на всички кораби започващи с
--буквата R
SELECT NAME
FROM SHIPS
WHERE NAME LIKE 'R%';

--Напишете заявка, която извежда имената на всички кораби, чието име е
--съставено от точно две думи.
SELECT NAME
FROM SHIPS
WHERE NAME LIKE '% %' AND NAME NOT LIKE '% % %';

-- SELECT TASKS----------------------------------------------------------
--Напишете заявка, която извежда номер на модел, честота и размер на диска за
--всички компютри с цена по-малка от 1200 долара. Задайте псевдоними за
--атрибутите честота и размер на диска, съответно MHz и GB
SELECT MODEL, SPEED AS MHz, HD AS GB
FROM PC
WHERE PRICE < 1200;

--Напишете заявка, която извежда всички производители на принтери без
--повторения
SELECT DISTINCT MAKER
FROM PRODUCT
WHERE TYPE = 'Printer';


--Напишете заявка, която извежда номер на модел, размер на паметта, размер на
--екран за лаптопите, чиято цена е по-голяма от 1000 долара
SELECT MODEL, RAM, SCREEN
FROM LAPTOP
WHERE PRICE > 1000;

--Напишете заявка, която извежда всички цветни принтери
SELECT *
FROM PRINTER
WHERE COLOR = 'y';

--Напишете заявка, която извежда номер на модел, честота и размер на диска за
--тези компютри с DVD 12x или 16x и цена по-малка от 2000 долара.
SELECT MODEL, SPEED, HD
FROM PC
WHERE CD = '12x' OR CD = '16x' AND PRICE < 2000;


--Напишете заявка, която извежда имената на актьорите мъже участвали в ‘Terms
--of Endearment’
SELECT NAME
FROM STARSIN, MOVIESTAR -- FROM STARSIN JOIN MOVIESTAR ON NAME = STARNAME
WHERE NAME = STARNAME
AND GENDER ='M'
AND MOVIETITLE = 'Terms of Endearment';

--Напишете заявка, която извежда имената на актьорите участвали във филми
--продуцирани от ‘MGM’през 1995 г
SELECT STARNAME
FROM MOVIE, STARSIN
WHERE TITLE = MOVIETITLE
AND STUDIONAME = 'MGM'
AND YEAR = '1995';

--• Напишете заявка, която извежда името на президента на ‘MGM’
SELECT DISTINCT NAME
FROM MOVIE, MOVIEEXEC
WHERE CERT# = MOVIE.PRODUCERC#
AND STUDIONAME = 'MGM';

--Напишете заявка, която извежда имената на всички филми с дължина по-голяма
--от дължината на филма ‘Gone With the Wind’
SELECT *
FROM MOVIE M1, MOVIE M2
WHERE M1.TITLE <> M2.TITLE
AND M1.YEAR <> M2.YEAR
AND M2.TITLE = 'Gone With the Wind'
AND M1.LENGTH > M2.LENGTH;


--Напишете заявка, която извежда имената на тези продукции
--на стойност поголяма от продукциите на продуценти ‘Merv Griffin’
SELECT *
FROM MOVIEEXEC M1, MOVIEEXEC M2
WHERE M1.CERT# <> M2.CERT#
AND M2.NAME = 'Merv Griffin'
AND M1.NETWORTH > M2.NETWORTH;

-- TASKS FOR PC
--Напишете заявка, която извежда производителя и честотата на тези лаптопи с
--размер на диска поне 9 GB
SELECT MAKER , SPEED
FROM PRODUCT, LAPTOP
WHERE HD > 9
AND PRODUCT.MODEL = LAPTOP.MODEL;

--Напишете заявка, която извежда номер на модел и цена на всички продукти,
--произведени от производител с име ‘B’
SELECT PRICE AS PRICE, LAPTOP.MODEL AS MODEL
FROM LAPTOP, PRODUCT
WHERE MAKER ='B'
AND LAPTOP.MODEL = PRODUCT.MODEL
UNION
SELECT PRICE AS PRICE, PC.MODEL AS MODEL
FROM PC, PRODUCT
WHERE MAKER ='B'
AND PC.MODEL = PRODUCT.MODEL
UNION
SELECT PRICE AS PRICE, PRINTER.MODEL AS MODEL
FROM PRINTER, PRODUCT
WHERE MAKER ='B'
AND PRINTER.MODEL = PRODUCT.MODEL


--Напишете заявка, която извежда размерите на тези дискове, които се предлагат в
--повече от два компютъра
SELECT DISTINCT M1.HD
FROM PC M1 , PC M2,PC M3
WHERE M1.CODE <> M2.CODE
AND M2.CODE <> M3.CODE
AND M1.CODE <> M3.CODE
AND M1.HD = M2.HD
AND M2.HD = M3.HD;

--• Напишете заявка, която извежда всички двойки модели на компютри, които
--имат еднаква честота и памет. Двойките трябва да се показват само по веднъж,
--например само (i, j), но не и (j, i)
SELECT M1.MODEL,M2.MODEL
FROM PC M1, PC M2
WHERE M1.CODE <> M2.CODE
AND M1.SPEED = M2.SPEED
AND M1.HD = M2.HD
AND M1.CODE > M2.CODE;

--Напишете заявка, която извежда производителите на поне два различни
--компютъра с честота поне 400.
select distinct p1.maker, p1.model
from product p1, product p2, pc as pc1, pc as pc2
where p1.maker=p2.maker and p1.model<>p2.model and pc1.speed>400 and pc1.model=p1.model and
pc2.speed>400 and pc2.model=p2.model;