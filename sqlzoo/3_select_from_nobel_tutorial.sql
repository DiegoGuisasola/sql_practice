/* Tercera sección 
Source: https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial
*/

-- PREGUNTA 1

/*
Change the query shown so that it displays Nobel prizes for 1950.
*/

SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950




-- PREGUNTA 2

/*
Show who won the 1962 prize for Literature.
*/

SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'Literature'

-- PREGUNTA 3

/*
Show the year and subject that won 'Albert Einstein' his prize.
*/

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

-- PREGUNTA 4

/*
Give the name of the 'Peace' winners since the year 2000, including 2000.
*/

SELECT winner
FROM nobel
WHERE subject = 'Peace'
AND yr >= 2000

-- PREGUNTA 5

/*
Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
*/

SELECT *
FROM nobel
WHERE subject = 'Literature'
AND yr >= 1980 AND yr <= 1989

-- PREGUNTA 6

/*
Show all details of the presidential winners:

Theodore Roosevelt
Woodrow Wilson
Jimmy Carter
Barack Obama
*/

SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter',
                  'Barack Obama')

-- PREGUNTA 7

/*
Show the winners with first name John
*/

SELECT winner
FROM nobel
WHERE winner LIKE 'John%'

-- PREGUNTA 8

/*
Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
*/

SELECT *
FROM nobel
WHERE subject = 'Physics' AND yr = 1980 
OR subject = 'Chemistry' AND yr = 1984
    
-- PREGUNTA 9

/*
Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
*/

SELECT *
FROM nobel
WHERE yr = 1980
AND subject NOT IN ('Chemistry','Medicine')

-- PREGUNTA 10

/*
Show year, subject, and name of people who won a 'Medicine' prize in an early year
(before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
*/

SELECT *
FROM nobel
WHERE subject = 'Medicine' AND yr < 1910
OR subject = 'Literature' AND yr >= 2004

-- PREGUNTA 11

/*
Find all details of the prize won by PETER GRÜNBERG

Non-ASCII characters
The u in his name has an umlaut. You may find this link useful https://en.wikipedia.org/wiki/%C3%9C#Keyboarding
*/

-- Not recommended
SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG'

-- Recommended

SELECT *
FROM nobel
WHERE winner LIKE 'PETER GR%NBERG' -- 'PETER GR_NBERG' Also works

-- PREGUNTA 12

/*
Find all details of the prize won by EUGENE O'NEILL

Escaping single quotes
You can't put a single quote in a quote string directly. You can use two single quotes within a quoted string.
*/

SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL'

-- PREGUNTA 13

/*
Knights in order

List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
*/

SELECT winner,yr,subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner

-- PREGUNTA 14
/*
The expression subject IN ('Chemistry','Physics') can be used as a value - it will be 0 or 1. (First shows 0, then 1)

Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.

Solution: https://www.youtube.com/watch?v=9pfL0Hj1Axk
*/

-- Not recommended: Not SQL
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('Physics','Chemistry'), subject, winner

-- Recommended: Proper SQL
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY 
CASE WHEN subject IN ('Physics','Chemistry') THEN 1 ELSE 0 END, subject, winner
