/*Modify it to show the population of Germany*/
SELECT population FROM world 
WHERE name = 'Germany';

/*Show the name and the population for 'Sweden', 'Norway' and 'Denmark'*/
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

/*Show the country and the area for countries with an area between 200,000 and 250,000.*/
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000;

/* QUIZ */

/*Select the code which produces this table*/
SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000;

/*Pick the result you would obtain from this code:*/
Table-E
Albania	3200000
Algeria	32900000

/*Select the code which shows the countries that end in A or L*/
SELECT name FROM world
WHERE name LIKE '%a' OR name LIKE '%l';
 
/*Pick the result from the query */
name	length(name)
Italy	    5
Malta	    5
Spain	    5

/*SELECT name, area*2 FROM world WHERE population = 64000*/
Andorra	936

/*Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000*/
SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000;

/*Select the code that shows the population density of China, Australia, Nigeria and France */
SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia');