-- 1
USE sakila;
SELECT actor_id, CONCAT(first_name,' ',last_name) AS full_name
FROM actor
WHERE first_name = 'Scarlett';

-- 2
SELECT COUNT(film_id) AS count_rented_movies
FROM rental;

SELECT DISTINCT(COUNT(film_id)) AS moviles_available
FROM inventory;

-- 3 
SELECT MIN(length) AS shortest_movie, MAX(length) AS longest_movie
FROM film;

SELECT MIN(CAST(length*60 AS TIME)) AS min_duration, 
	   MAX(CAST(length*60 AS TIME)) AS max_duration
FROM film;

-- 4
SELECT FLOOR(AVG(length) / 60) as Hours, (FLOOR(AVG(length)) % 60) as Minutes
FROM sakila.film;

-- 5 
SELECT COUNT(DISTINCT(last_name))
FROM actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF(max(rental_date),min(rental_date))
FROM rental;

-- 7.Show rental info with additional columns month and weekday. Get 20 results
SELECT *, MONTH(rental_date) AS month, DAY(rental_date) AS day 
FROM rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,CASE WHEN WEEKDAY(rental_date) = 1 OR WEEKDAY(rental_date) = 7 THEN 'weekend'
		ELSE 'weekday'
        END AS week
FROM sakila.rental;

-- 9. How many rentals were in the last month of activity?
SELECT COUNT(rental_date)
FROM sakila.rental
WHERE MONTH(rental_date) = (SELECT MONTH(MIN(rental_date)) FROM rental)


