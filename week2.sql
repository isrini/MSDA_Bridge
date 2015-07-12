-- 1. What weather conditions are associated with New York City departure delays?
-- Answer:
-- There is weather data for only seven days for the two New York City airports. Checking the temperature, humidity, wind speed and visibility where the flights have been delayed for more than 60 mins from JFK and LGA airports.
-- The query results show that for temperature, the delays are more when the temperatures are above 70 degrees. For humidity, there is a clear corelation where higher the
-- humidity the more the number of flights delayed. For wind speed, there is a clear corelation where lower the wind speeds the more the number of flights delayed. And finally 
-- the visibility had less to do with delays as there more more flights delayed when the visibility was high.

-- Query: change the column and group by in the select statement to temp, humid, wind_speed and visib to obtain results for different weather variables.
SELECT b.temp, count(*) from flights a, weather b
WHERE a.origin = b.origin and
a.year = b.year and
a.month = b.month and
a.day = b.day and
a.dep_delay > 60 and a.origin in('JFK', 'LGA')
GROUP BY b.temp
ORDER BY count(*) desc 


-- 2. Are older planes more likely to be delayed?
-- Answer: 
-- The query results indicate there is no corelation between the year the plane was made and the delays. The results show planes made in 1998 and 1999 
-- experienced far less delays than the planes made in 2001, 2002.

SELECT b.year, count(*) from flights a, planes b
WHERE
a.tailnum = b.tailnum and a.dep_delay >60
GROUP BY b.year
ORDER BY count(*) desc

-- 3. Ask (and if possible answer) a third question that also requires joining information from two or more tables in the flights database, and/or assumes that additional information 
-- can be collected in advance of answering your question.

-- Question:
-- Which carrier had least number of flights from Newark airport in the year 2013?
-- Answer: Skywest Airlines inc

Select b.name, count(*) FROM
flights a, airlines b
WHERE
a.carrier = b.carrier AND
a.origin = 'EWR' AND
a.year = 2013
GROUP BY b.name
ORDER BY count(*) ASC


