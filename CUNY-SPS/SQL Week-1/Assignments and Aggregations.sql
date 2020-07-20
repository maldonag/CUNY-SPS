/*
1.	Which destination in the flights database is the furthest distance away, based on information in the flights table.  
Show the SQL query(s) that support your conclusion. 
*/

# Answer:
-- Destination AIH with a distance of 4983.

# Query:
SELECT dest, Max(distance) 
FROM flights.flights;

/*
2.	What are the different numbers of engines in the planes table?  For each number of engines, which aircraft have the most number of seats?  
Show the SQL statement(s) that support your result. 
*/

# Answer:
-- Number of different engines in the planes table is 6. Of the 6 engines, aircrafts with the most seats are AT-5, 150, EMB-145XR, 757-224, E-90, S-76A.

# Query:
SELECT tailnum, model, Max(seats), engine 
FROM flights.planes
GROUP BY engine;

/* 
3.	Show the total number of flights.
*/ 

# Answer:
-- Total number of flights is 336776

# Query:
SELECT Count(flight) as totalNumberOfFlights
FROM flights.flights;

/* 
4.	Show the total number of flights by airline (carrier). 
*/

# Answer:
-- Total number of flights by carrier is  The total number of flights by carrier is 16

# Query:
SELECT count(carrier) FROM flights.airlines;

/*
5.	Show all of the airlines, ordered by number of flights in descending order.
*/

# Query:
SELECT flights.airlines.carrier, flights.airlines.name , flights.flights.flight 
FROM flights.airlines
INNER JOIN flights.flights ON airlines.carrier = flights.carrier
GROUP BY flights.airlines.carrier
order by flights.flights.flight DESC;

/*
6.	Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order. 
*/

# Query:
SELECT flights.airlines.carrier, flights.airlines.name , flights.flights.flight 
FROM flights.airlines
INNER JOIN flights.flights ON airlines.carrier = flights.carrier
GROUP BY flights.airlines.carrier
order by flights.flights.flight DESC
LIMIT 5;


/*
7.	Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order.
*/ 

# Query:
SELECT flights.airlines.carrier, flights.airlines.name , flights.flights.flight, flights.flights.distance
FROM flights.airlines
INNER JOIN flights.flights ON airlines.carrier = flights.carrier
WHERE distance >= 1000
GROUP BY flights.airlines.carrier
order by flights.flights.flight DESC
LIMIT 5;

/*
8.	Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, 
and write down both the question, and the query that answers the question. 
*/

# 2.	What are the different numbers of engines in the planes table?  For each number of engines, which aircraft have the most number of seats?  
# Question: Show only the top 5 airlines that have the most air time in descending order.


#Query:
SELECT flights.airlines.carrier, flights.airlines.name, Max(flights.flights.air_time)
FROM flights.airlines
INNER JOIN flights.flights ON airlines.carrier = flights.carrier
GROUP BY flights.airlines.carrier
Order by flights.flights.air_time DESC
LIMIT 5;
