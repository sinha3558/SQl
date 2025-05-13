create database olympicset;
use olympicset;
show databases;

use olympicset;

select * from athlete_events;
select * from noc_regions;

#1. How many olympics games have been held?

select count(distinct games) as total_olympic_games
    from athlete_events;

# #2 how many different athletes have participated in the olympics

select count(*) as cnt_athlete
from
(select distinct name from athlete_events) as n;


# #3 how many of them won a medal.


select sum(medal_winners) as total_number_athlete
from 
(SELECT name, COUNT(DISTINCT ID) AS medal_winners
FROM athlete_events
WHERE Medal IS NOT NULL
GROUP BY name
HAVING COUNT(DISTINCT ID) = 1
ORDER BY medal_winners desc) as r;

#  Write a SQL query to list down all the Olympic Games held so far.

SELECT DISTINCT Year,Season
FROM athlete_events
ORDER BY Year, Season;


# #5 SQL query to fetch total no of countries participated in each olympic games

select * from athlete_events;
select * from noc_regions;


SELECT 
    Games,
    COUNT(DISTINCT NOC) AS total_countries_participated
FROM 
    athlete_events
GROUP BY 
    Games
ORDER BY 
    Games;

select games,count(distinct team) as cnt
from
(select a.games,a.team 
from 
    athlete_events a
    join noc_regions n on a.noc = n.noc) as A
group by games;


select games,count(distinct team) as number_0f_country
from
(select a.games,a.team 
from 
    athlete_events a
    join noc_regions n on a.noc = n.noc) as A
group by games
order by number_0f_country desc;

##4 Which year saw the highest and lowest no of countries participating in olympics

select * from athlete_events;
select * from noc_regions;

SELECT year,number_of_country
FROM (
    SELECT year,
           COUNT(DISTINCT team) AS number_of_country,
           RANK() OVER (ORDER BY COUNT(DISTINCT team) DESC) AS `rank`
    FROM (
        SELECT a.year, a.team
        FROM athlete_events a
        JOIN noc_regions n ON a.noc = n.noc
    ) AS T
    GROUP BY year
) AS highest_no_of_country
WHERE `rank` = 1;


SELECT year,number_of_country
FROM (
    SELECT year,
           COUNT(DISTINCT team) AS number_of_country,
           RANK() OVER (ORDER BY COUNT(DISTINCT team) DESC) AS `rank`
    FROM (
        SELECT a.year, a.team
        FROM athlete_events a
        JOIN noc_regions n ON a.noc = n.noc
    ) AS T
    GROUP BY year
) AS lowest_no_of_country
WHERE `rank` = 33;


# #8.Which Sports were just played only once in the olympics.

 select sport
 from
 (select sport,number_of_sports,rank() over(order by number_of_sports) as rnking
 from
(SELECT sport,COUNT(DISTINCT games) as number_of_sports
 FROM athlete_events
 GROUP BY sport
 order by number_of_sports) as sport_1) as number_of_sports
 where rnking = 1
 
 # another method
 
 SELECT DISTINCT sport
FROM athlete_events
WHERE sport IN (
    SELECT sport
    FROM athlete_events
    GROUP BY sport
    HAVING COUNT(DISTINCT games) = 1
);


# #9.Fetch the total no of sports played in each olympic games.

select * from athlete_events;

select games,count( distinct sport) as number_of_sports
from athlete_events
group by games
order by number_of_sports desc;

##10 Fetch details of the oldest athletes to win a gold medal.

select * from athlete_events;

select name,age
from
(
select name,age,medal,rank() over(order by age desc) as rnk
from athlete_events
where medal = "Gold"
group by name,medal,age) as oldest_athletes
where rnk = 1;

# # 11 Find the Ratio of male and female athletes participated in all olympic games

select * from athlete_events;

 
SELECT 
    Male_Count,
    Female_Count,
    ROUND(Male_Count * 100.0 / Female_Count, 2) AS Male_to_Female_Ratio
FROM (
    SELECT 
        SUM(CASE WHEN Sex = 'M' THEN 1 ELSE 0 END) AS Male_Count,
        SUM(CASE WHEN Sex = 'F' THEN 1 ELSE 0 END) AS Female_Count
    FROM (
        SELECT DISTINCT ID, Sex
        FROM athlete_events
    ) AS unique_athletes
) AS counts;

# #12 Fetch the top 5 athletes who have won the most gold medals.

SELECT name, number_of_gold_medals
FROM (
    SELECT 
        name, 
        COUNT(*) AS number_of_gold_medals,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
    FROM 
        athlete_events
    WHERE 
        medal = 'Gold'
    GROUP BY 
        name
) ranked
WHERE rnk < 5;

# second way

SELECT 
    name, 
    COUNT(*) AS number_of_gold_medals
FROM 
    athlete_events
WHERE 
    medal = 'Gold'
GROUP BY 
    name
ORDER BY 
    number_of_gold_medals DESC
LIMIT 5;

# # #12 Fetch the top 5 athletes who have won the most bronze medals.

SELECT 
    name, 
    COUNT(*) AS number_of_gold_medals
FROM 
    athlete_events
WHERE 
    medal = 'Bronze'
GROUP BY 
    name
ORDER BY 
    number_of_gold_medals DESC
LIMIT 5;

# second way

SELECT name, number_of_gold_medals
FROM (
    SELECT 
        name, 
        COUNT(*) AS number_of_gold_medals,
        rank() OVER (ORDER BY COUNT(*) DESC) AS rnk
    FROM 
        athlete_events
    WHERE 
        medal = 'Bronze'
    GROUP BY 
        name
) ranked
WHERE rnk < 5;

##14 Fetch the top 5 athletes who have won the most silver medals.

SELECT name, number_of_gold_medals
FROM (
    SELECT 
        name, 
        COUNT(*) AS number_of_gold_medals,
        rank() OVER (ORDER BY COUNT(*) DESC) AS rnk
    FROM 
        athlete_events
    WHERE 
        medal = 'Silver'
    GROUP BY 
        name
) ranked
WHERE rnk < 5;

# 2nd way

SELECT 
    name, 
    COUNT(*) AS number_of_gold_medals
FROM 
    athlete_events
WHERE 
    medal = 'Bronze'
GROUP BY 
    name
ORDER BY 
    number_of_gold_medals DESC
LIMIT 5;

##15 SQL Query to fetch the top 5 athletes who have won the most medals (Medals include gold, silver and bronze).


SELECT 
    name, 
    COUNT(*) AS number_of_gold_medals
FROM 
    athlete_events
WHERE 
    medal in ("Gold","Bronze","Silver")
GROUP BY 
    name
ORDER BY 
    number_of_gold_medals DESC
LIMIT 5;

# 2nd way

SELECT name, number_of_gold_medals
FROM (
    SELECT 
        name, 
        COUNT(*) AS number_of_gold_medals,
        rank() OVER (ORDER BY COUNT(*) DESC) AS rnk
    FROM 
        athlete_events
    WHERE 
        medal in ("Gold","Bronze","Silver")
    GROUP BY 
        name
) ranked
WHERE rnk < 5;

# third method

select Name,Region,Total_Medal
from
(select Name,Region,Total_Medal,Rank() over(ORDER BY Total_Medal DESC) as rnk
from
(Select O.Name,OH.Region,Count(1) As Total_Medal From athlete_events O
Join noc_regions OH ON OH.NOC = O.NOC
Where O.Medal In ('Silver','Bronze','Gold')
Group By O.Name,OH.Region) as Region_) as top_five_athelete
where rnk <= 5;


# #16 Fetch the top 5 most successful countries in olympics. Success is defined by 

select * from athlete_events;
select * from noc_regions;

SELECT country, number_of_medal
FROM (
    SELECT 
        country,
        COUNT(*) AS number_of_medal,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS ranking
    FROM (
        SELECT 
            n.region AS country,
            a.medal
        FROM 
            athlete_events a
        JOIN 
            noc_regions n ON a.noc = n.noc
        WHERE 
            a.medal IS NOT NULL
    ) AS Region_
    GROUP BY country
) AS top_five_country
WHERE ranking < 6;

# # 17 List down total gold, silver and bronze medals won by each country.

-- 17. List down total gold, silver and bronze medals won by each country.
SELECT 
    country,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold_Count,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver_Count,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze_Count,
    SUM(CASE WHEN Medal IN ('Gold', 'Silver', 'Bronze') THEN 1 ELSE 0 END) AS All_Medal_Count
FROM (
    SELECT  
        n.region AS country, 
        a.medal
    FROM 
        athlete_events a
    JOIN 
        noc_regions n ON a.noc = n.noc
) AS Total_number_medal
GROUP BY country;

# 2nd way

SELECT 
    nr.region AS country,
    SUM(CASE WHEN ae.medal = 'Gold' THEN 1 ELSE 0 END) AS gold_medals,
    SUM(CASE WHEN ae.medal = 'Silver' THEN 1 ELSE 0 END) AS silver_medals,
    SUM(CASE WHEN ae.medal = 'Bronze' THEN 1 ELSE 0 END) AS bronze_medals,
    COUNT(CASE WHEN ae.medal IN ('Gold', 'Silver', 'Bronze') THEN 1 ELSE NULL END) AS total_medals
FROM athlete_events ae
JOIN noc_regions nr ON ae.NOC = nr.NOC
GROUP BY nr.region
ORDER BY total_medals DESC;

# # 18 List down total gold, silver and bronze medals won by each country corresponding to each olympic games.

select games, region as country,
		SUM(CASE WHEN medal = 'Gold' THEN 1 ELSE 0 END) AS gold_medals,
        SUM(CASE WHEN medal = 'Silver' THEN 1 ELSE 0 END) AS silver_medals,
        SUM(CASE WHEN medal = 'Bronze' THEN 1 ELSE 0 END) AS bronze_medals,
        SUM(CASE WHEN medal IN ('Gold','Silver','Bronze') THEN 1 ELSE 0 END) AS total_medals
from athlete_events  as o, noc_regions as r 
where o.noc= r.noc
group by region,games;

# 2nd ways

select game,
    country,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold_Count,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver_Count,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze_Count,
    SUM(CASE WHEN Medal IN ('Gold', 'Silver', 'Bronze') THEN 1 ELSE 0 END) AS All_Medal_Count
FROM (
    SELECT a.games as game,
        n.region AS country, 
        a.medal
    FROM 
        athlete_events a
    JOIN 
        noc_regions n ON a.noc = n.noc
) AS Total_number_medal
GROUP BY country,game;

# #19 Identify which country won the most gold, most silver and most bronze medals in each olympic games.
select * from athlete_events;
select * from noc_regions;

        
       -- Gold medal winners per Olympic Games
SELECT Year, Season, NOC, region AS Country, Gold_Count
FROM (
    SELECT ae.Year, ae.Season, ae.NOC, nr.region, COUNT(*) AS Gold_Count,
           RANK() OVER (PARTITION BY ae.Year, ae.Season ORDER BY COUNT(*) DESC) AS rnk
    FROM athlete_events ae
    JOIN noc_regions nr ON ae.NOC = nr.NOC
    WHERE ae.Medal = 'Gold'
    GROUP BY ae.Year, ae.Season, ae.NOC, nr.region
) AS Golds
WHERE rnk = 1;

-- Silver medal winners per Olympic Games
SELECT Year, Season, NOC, region AS Country, Silver_Count
FROM (
    SELECT ae.Year, ae.Season, ae.NOC, nr.region, COUNT(*) AS Silver_Count,
           RANK() OVER (PARTITION BY ae.Year, ae.Season ORDER BY COUNT(*) DESC) AS rnk
    FROM athlete_events ae
    JOIN noc_regions nr ON ae.NOC = nr.NOC
    WHERE ae.Medal = 'Silver'
    GROUP BY ae.Year, ae.Season, ae.NOC, nr.region
) AS Silvers
WHERE rnk = 1;


-- Bronze medal winners per Olympic Games
SELECT Year, Season, NOC, region AS Country, Bronze_Count
FROM (
    SELECT ae.Year, ae.Season, ae.NOC, nr.region, COUNT(*) AS Bronze_Count,
           RANK() OVER (PARTITION BY ae.Year, ae.Season ORDER BY COUNT(*) DESC) AS rnk
    FROM athlete_events ae
    JOIN noc_regions nr ON ae.NOC = nr.NOC
    WHERE ae.Medal = 'Bronze'
    GROUP BY ae.Year, ae.Season, ae.NOC, nr.region
) AS Bronzes
WHERE rnk = 1;
        

# -- #20. Countries with Silver/Bronze medals but never Gold

select * from athlete_events;
select * from noc_regions;


-- #20. Countries with Silver/Bronze medals but never Gold

SELECT DISTINCT n.region AS Country
FROM athlete_events a
JOIN noc_regions n ON a.NOC = n.NOC
WHERE a.Medal IN ('Silver', 'Bronze')
  AND n.region NOT IN (
      SELECT DISTINCT n1.region
      FROM athlete_events a1
      JOIN noc_regions n1 ON a1.NOC = n1.NOC
      WHERE a1.Medal = 'Gold'
  )
ORDER BY n.region;

# Countries with Gold medals but never Silver/Bronze

SELECT DISTINCT n.region AS Country
FROM athlete_events a
JOIN noc_regions n ON a.NOC = n.NOC
WHERE a.Medal IN ("Gold")
  AND n.region NOT IN (
      SELECT DISTINCT n1.region
      FROM athlete_events a1
      JOIN noc_regions n1 ON a1.NOC = n1.NOC
      WHERE a1.Medal in ("Bronze","Silver")
  )
ORDER BY n.region;

## Countries with silver medals but never gold/Bronze

 SELECT DISTINCT n.region AS Country
FROM athlete_events a
JOIN noc_regions n ON a.NOC = n.NOC
WHERE a.Medal IN ("Silver")
  AND n.region NOT IN (
      SELECT DISTINCT n1.region
      FROM athlete_events a1
      JOIN noc_regions n1 ON a1.NOC = n1.NOC
      WHERE a1.Medal in ("Gold","Bronze")
  )
ORDER BY n.region;

## Countries with Bronze medals but never gold/Silver

 SELECT DISTINCT n.region AS Country
FROM athlete_events a
JOIN noc_regions n ON a.NOC = n.NOC
WHERE a.Medal IN ("Bronze")
  AND n.region NOT IN (
      SELECT DISTINCT n1.region
      FROM athlete_events a1
      JOIN noc_regions n1 ON a1.NOC = n1.NOC
      WHERE a1.Medal in ("Gold","Silver")
  )
ORDER BY n.region;

#  #21.In which Sport/event, USA has won highest medals.

select * from athlete_events;
select * from noc_regions;

SELECT 
    a.sport,
    COUNT(*) AS medal_count
FROM 
    athlete_events a
JOIN 
    noc_regions n ON a.NOC = n.NOC
WHERE 
    n.region = 'USA'
GROUP BY 
    a.sport
ORDER BY 
    medal_count DESC
LIMIT 1;


# 2nd way

select sports,medal_count
from
(SELECT 
    sports, 
    medal_count, 
    RANK() OVER (ORDER BY medal_count DESC) AS rnk
FROM (
    SELECT 
        a.sport AS sports, 
        COUNT(*) AS medal_count
    FROM athlete_events a
    JOIN noc_regions n ON a.noc = n.noc
    WHERE n.region = 'USA'
    GROUP BY a.sport
) AS usa_medals_by_sport) as sport_list
where rnk = 1;

#  #20 Break down all olympic games where USA won medal for Athletics and how many medals in each olympic games

select * from athlete_events;
select * from noc_regions;

SELECT 
    a.games AS olympic_game,
    a.sport AS sports,
    COUNT(*) AS medal_count
FROM 
    athlete_events a
JOIN 
    noc_regions n ON a.noc = n.noc
WHERE 
    n.region = 'USA'
    AND a.sport = 'Athletics'
GROUP BY 
    a.games, a.sport
ORDER BY 
    a.games;

# find the top 3 countries in terms of the total number of medals.

select * from
(select *,rank() over(order by number_of_medal desc) as rnk
from
(select country,count(*) as number_of_medal
from
(select n.region as country,a.medal as medal
from athlete_events a
join noc_regions n ON a.noc = n.noc
where medal not in ("NA")) as list_medal
group by country) as medal_count) as TOP_three_country
where rnk <=3 ;

#  average age of female and male athletes who won a medal

select sex,avg(age) as avg_age
from
(select age,sex
from athlete_events
where medal not in ("NA")) as ave_age
group by sex;

# "Which country has won the most Gold medals in the history of the Olympics, and how many Gold medals have they won?"

select Country,Gold_Medals
from
(select Country,Gold_Medals,rank() 
over(order by Gold_Medals desc ) as rankpos
from
(SELECT 
    nr.region AS Country,
    COUNT(*) AS Gold_Medals
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.NOC = nr.NOC
WHERE 
    ae.Medal = 'Gold'
GROUP BY 
    nr.region) as Total_gold_medal) as most_medal
where rankpos = 1;

# Which countries have won the most Gold medals in each Olympic year, and 
#how many Gold medals did they win that year?"

select country,year,Gold_Medals
from
(SELECT 
    country,
    year,
    Gold_Medals,
    RANK() OVER (PARTITION BY year ORDER BY Gold_Medals DESC) AS rnkpos
FROM (
    SELECT 
        nr.region AS country,
        ae.year AS year,
        COUNT(*) AS Gold_Medals
    FROM 
        athlete_events ae
    JOIN 
        noc_regions nr ON ae.NOC = nr.NOC
    WHERE 
        ae.Medal = 'Gold'
    GROUP BY 
        nr.region, ae.year
) AS P_gold_medal) as Most_Gold_medal
where rnkpos = 1;

# Find the top 5 countries (nations) with 
#the highest number of gold medals in the Summer Olympics.

select * from athlete_events;
select * from noc_regions;

SELECT 
    nr.region AS country,
    GROUP_CONCAT(DISTINCT Sport) AS Sports,
    COUNT(*) AS gold_medal_count
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.NOC = nr.NOC
WHERE 
    ae.Medal = 'Gold' 
    AND ae.Season = 'Summer'
GROUP BY 
    nr.region
order by 
      gold_medal_count desc
limit 1;

# Find the top 5 countries (nations) with 
#the highest number of gold medals in the Winter Olympics.

SELECT 
    nr.region AS country,
    COUNT(*) AS gold_medal_count
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.NOC = nr.NOC
WHERE 
    ae.Medal = 'Gold' 
    AND ae.Season = 'Winter'
GROUP BY 
    nr.region
order by 
      gold_medal_count desc
limit 1;

#  find the country with the highest medal-to-athlete ratio:


SELECT
    country,
    total_medals * 1.0 / total_athletes AS medal_to_athlete_ratio
FROM
(SELECT 
    ae.NOC as country,
    COUNT(DISTINCT ae.ID) AS total_athletes,
    COUNT(CASE WHEN ae.Medal IN ('Gold', 'Silver', 'Bronze') THEN 1 END) AS total_medals
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.NOC = nr.NOC
GROUP BY 
    ae.NOC) as states_
order by medal_to_athlete_ratio
desc;


# 🧬 2. Find Athletes Who Have Won Medals in More Than One Sport

select * from athlete_events;
select * from noc_regions;


SELECT Name, COUNT( distinct Sport) AS sports_with_medals
FROM athlete_events
GROUP BY Name
HAVING COUNT(DISTINCT Sport) > 1;

# 
SELECT 
    Name,
    GROUP_CONCAT(DISTINCT Sport) AS Sports,
    COUNT(DISTINCT Sport) AS sports_with_medals,
    COUNT(*) AS total_medals
FROM athlete_events
WHERE Medal IS NOT NULL
GROUP BY Name
HAVING COUNT(DISTINCT Sport) > 1;

# 🧓 4. Youngest and Oldest Medal-Winning Athletes by Sport

SELECT Sport, Name, Age, Medal
FROM (
    SELECT Sport, Name, Age, Medal,
           RANK() OVER (PARTITION BY Sport ORDER BY Age ASC) AS youngest,
           RANK() OVER (PARTITION BY Sport ORDER BY Age DESC) AS oldest
    FROM athlete_events
    WHERE Medal in ("Gold","Silver","Bronze")
) t
WHERE youngest = 1 OR oldest = 1
ORDER BY Sport, Age;

SELECT 
    Year, 
    COUNT(DISTINCT CASE WHEN Sex = 'F' THEN ID END) AS Female_Athletes,
    COUNT(DISTINCT ID) AS Total_Athletes,
    ROUND(100.0 * COUNT(DISTINCT CASE WHEN Sex = 'F' THEN ID END) / COUNT(DISTINCT ID), 2) AS Female_Percentage
FROM athlete_events
GROUP BY Year
ORDER BY Female_Percentage DESC;




# # 📈 5. Growth of male Participation Over Time

SELECT 
    Year, 
    COUNT(DISTINCT CASE WHEN Sex = 'M' THEN ID END) AS Male_Athletes,
    COUNT(DISTINCT ID) AS Total_Athletes,
    ROUND(100.0 * COUNT(DISTINCT CASE WHEN Sex = 'M' THEN ID END) / COUNT(DISTINCT ID), 2) AS Male_Percentage
FROM 
    athlete_events
GROUP BY 
    Year
ORDER BY  
    Male_Percentage ASC;
