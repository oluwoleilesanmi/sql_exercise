-- Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner FROM nobel
WHERE yr = 1950

-- Show who won the 1962 prize for Literature.
SELECT winner FROM nobel 
WHERE yr = 1962 AND subject = 'Literature'

-- Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr, subject From nobel 
WHERE winner = 'Albert Einstein'

-- Give the name of the 'Peace' winners since the year 2000, including 2000.
SELECT winner FROM nobel WHERE subject = 'Peace' and yr >= 2000

-- Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
SELECT yr, subject, winner FROM nobel 
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989

-- Show all details of the presidential winners:Theodore Roosevelt; Woodrow Wilson; Jimmy Carter; Barack Obama
SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

-- Show the winners with first name John
SELECT winner FROM nobel 
WHERE winner LIKE 'John%'

-- Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
SELECT * FROM nobel
WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984)

-- Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
SELECT yr, subject, winner FROM nobel 
WHERE (yr = 1980 AND subject != 'Chemistry') AND (yr = 1980 AND subject != 'Medicine')

-- Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
SELECT yr, subject, winner FROM nobel 
WHERE (subject = 'Medicine' AND yr < 1910) OR (subject= 'Literature' AND yr >= 2004)

-- Find all details of the prize won by PETER GRÜNBERG
SELECT * FROM nobel Where winner = 'PETER GRÜNBERG'

-- Find all details of the prize won by EUGENE O'NEILL
SELECT * FROM nobel Where winner = 'EUGENE O''NEILL'


-- List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
SELECT winner, yr, subject FROM nobel WHERE winner LIKE 'Sir%'

-- Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.
SELECT winner, subject FROM nobel
WHERE yr = 1984 ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner;

/* QUIZ */

-- Pick the code which shows the name of winner's names beginning with C and ending in n
SELECT winner FROM nobel
WHERE winner LIKE 'C%' AND winner LIKE '%n'

-- Select the code that shows how many Chemistry awards were given between 1950 and 1960
SELECT COUNT(subject) FROM nobel
WHERE subject = 'Chemistry' AND yr BETWEEN 1950 and 1960

-- Pick the code that shows the amount of years where no Medicine awards were given
SELECT DISTINCT yr FROM nobel
WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject LIKE 'Medicine')

-- SELECT subject, winner FROM nobel WHERE winner LIKE 'Sir%' AND yr LIKE '196%'
Medicine	Sir John Eccles
Medicine	Sir Frank Macfarlane Burnet

-- Select the code which would show the year when neither a Physics or Chemistry award was given
SELECT yr FROM nobel
WHERE yr NOT IN(SELECT yr FROM nobel WHERE subject IN ('Chemistry','Physics'))


-- Select the code which shows the years when a Medicine award was given but no Peace or Literature award was
SELECT DISTINCT yr FROM nobel
WHERE subject='Medicine' 
AND yr NOT IN(SELECT yr FROM nobel WHERE subject='Literature')
AND yr NOT IN (SELECT yr FROM nobel WHERE subject='Peace')

-- Pick the result that would be obtained from the following code:
Chemistry	1
Literature	1
Medicine	2
Peace	1
Physics	1
