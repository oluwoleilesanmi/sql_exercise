-- Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid,player FROM goal WHERE teamid = 'GER'

-- Show id, stadium, team1, team2 for just game 1012
SELECT id, stadium, team1, team2 FROM game 
WHERE id = 1012

-- Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid) WHERE teamid = 'GER'

-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2, player FROM game 
JOIN goal ON (id=matchid)
WHERE player LIKE 'Mario%'

-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime FROM goal JOIN eteam ON (teamid = id)
WHERE gtime <= 10

-- List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT mdate, teamname FROM eteam
JOIN game ON (game.team1 = eteam.id)
WHERE coach = 'Fernando Santos'

-- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player FROM goal JOIN game ON (id = matchid)
WHERE stadium = 'National Stadium, Warsaw'

-- Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT player FROM goal JOIN game ON (id = matchid)
WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid != 'GER'

-- Show teamname and the total number of goals scored.
SELECT teamname, COUNT(gtime) FROM eteam JOIN goal ON (id = teamid)
GROUP BY teamname

-- Show the stadium and the number of goals scored in each stadium.
SELECT stadium, COUNT(gtime)
FROM game JOIN goal ON (matchid = id)
GROUP BY stadium

-- For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT game.id, game.mdate, COUNT(*) AS goals FROM goal JOIN game
WHERE game.id = goal.matchid AND (game.team1 = 'POL' OR game.team2 = 'POL')
GROUP BY game.id, game.mdate

-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT game.id, game.mdate, COUNT(*) AS goals FROM goal JOIN game
WHERE goal.matchid = game.id
AND goal.teamid = 'GER' GROUP BY game.id, game.mdate

-- List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
SELECT mdate, team1, SUM(CASE WHEN goal.teamid = game.team1 THEN 1 ELSE 0 END) score1, team2,
SUM(CASE WHEN goal.teamid = game.team2 THEN 1 ELSE 0 END) score2
FROM game LEFT JOIN goal
ON goal.matchid = game.id
GROUP BY mdate, team1, team2
ORDER BY mdate, matchid, team1, team2;

/* QUIZ */

--  You want to find the stadium where player 'Dimitris Salpingidis' scored. Select the JOIN condition to use:
game  JOIN goal ON (id=matchid)

-- You JOIN the tables goal and eteam in an SQL statement. Indicate the list of column names that may be used in the SELECT line:
matchid, teamid, player, gtime, id, teamname, coach

-- Select the code which shows players, their team and the amount of goals they scored against Greece(GRE).
SELECT player, teamid, COUNT(*) FROM game JOIN goal ON matchid = id
WHERE (team1 = "GRE" OR team2 = "GRE") AND teamid != 'GRE'
GROUP BY player, teamid

-- SELECT DISTINCT teamid, mdate FROM goal JOIN game on (matchid=id) WHERE mdate = '9 June 2012'
DEN	9 June 2012
GER	9 June 2012

-- Select the code which would show the player and their team for those who have scored against Poland(POL) in National Stadium, Warsaw.
SELECT DISTINCT player, teamid FROM game JOIN goal ON matchid = id WHERE stadium = 'National Stadium, Warsaw' 
AND (team1 = 'POL' OR team2 = 'POL')
AND teamid != 'POL'

-- Select the code which shows the player, their team and the time they scored, for players who have played in Stadion Miejski (Wroclaw) but not against Italy(ITA).
SELECT DISTINCT player, teamid, gtime FROM game JOIN goal ON matchid = id
WHERE stadium = 'Stadion Miejski (Wroclaw)'
AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))

-- SELECT teamname, COUNT(*) FROM eteam JOIN goal ON teamid = id GROUP BY teamname HAVING COUNT(*) < 3
Netherlands	2
Poland	2
Republic of Ireland	1
Ukraine	2