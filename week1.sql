
-- 1. Show the total number of flights.
SELECT count(*) from flights 


-- 2. Show the total number of flights by airline (carrier).
SELECT 
  airlines.name, count(*) FROM
  public.flights, 
  public.airlines
WHERE 
  airlines.carrier = flights.carrier
  Group by airlines.name;
  

-- 3. Show all of the airlines, ordered by number of flights in descending order.
SELECT 
  airlines.name, count(*) as "# of Flights" FROM
  public.flights, 
  public.airlines
WHERE 
  airlines.carrier = flights.carrier
  Group by airlines.name
  Order by count(*) DESC;

-- 4. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
SELECT 
  airlines.name, count(*) "# of Flights" FROM
  public.flights, 
  public.airlines
WHERE 
  airlines.carrier = flights.carrier
  Group by airlines.name
  Order by count(*) DESC
  Limit 5;


-- 5. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order. 
SELECT 
  airlines.name, count(*) "# of Flights" FROM
  public.flights, 
  public.airlines
WHERE 
  airlines.carrier = flights.carrier and
  flights.distance >= 1000
  Group by airlines.name
  Order by count(*) DESC
  Limit 5;


-- 6. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and write down both the question, and the query that answers the question.
-- Show the number of planes from each manufaturer ordered by number of planes in descending order.

SELECT 
  manufacturer, count(*) "# of Planes" FROM
  public.planes
  Group by manufacturer
  Order by count(*) DESC;

