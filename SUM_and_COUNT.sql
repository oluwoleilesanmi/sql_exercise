-- Show the total population of the world.
SELECT SUM(population) FROM world

-- List all the continents - just once each.
SELECT DISTINCT continent FROM world

-- Give the total GDP of Africa
SELECT SUM(gdp) FROM world WHERE continent='Africa'

-- How many countries have an area of at least 1000000
SELECT COUNT(name) FROM world WHERE area >=1000000

-- What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- For each continent show the continent and number of countries.
SELECT continent, COUNT(name) FROM world GROUP BY continent

-- For each continent show the continent and number of countries with populations of at least 10 million.
SELECT continent, COUNT(name) FROM world
WHERE population > 10000000 GROUP BY continent;

-- List the continents that have a total population of at least 100 million.
SELECT continent FROM world
GROUP BY continent HAVING SUM(population) > 100000000;

/* QUIZ */

-- Select the statement that shows the sum of population of all countries in 'Europe'
SELECT SUM(population) FROM bbc WHERE region = 'Europe'

-- Select the statement that shows the number of countries with population smaller than 150000
SELECT COUNT(name) FROM bbc WHERE population < 150000
 
-- Select the list of core SQL aggregate functions
AVG(), COUNT(), MAX(), MIN(), SUM()

-- SELECT region, SUM(area) FROM bbc WHERE SUM(area) > 15000000 GROUP BY region
No result due to invalid use of the WHERE function

-- Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

-- Select the statement that shows the medium population density of each region
SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

-- Select the statement that shows the name and population density of the country with the largest population
SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

-- SELECT region, SUM(area) FROM bbc GROUP BY region HAVING SUM(area)<= 20000000
Americas	732240
Middle East	13403102
South America	17740392
South Asia	9437710