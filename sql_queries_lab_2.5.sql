Use sakila;
/* 1. Select all the actors with the first name ‘Scarlett’.*/
SELECT actor_id, CONCAT(first_name, ' ', last_name) AS full_name
FROM actor
WHERE first_name = 'Scarlett';

/* How many films (movies) are available for rent and how many films have been rented?*/
SELECT COUNT(DISTINCT r.inventory_id), COUNT(i.inventory_id)
FROM rental r
JOIN inventory i
ON r.inventory_id = i.inventory_id;

/* What are the shortest and longest movie duration? Name the values max_duration 
and min_duration.*/
SELECT MAX(length) max_duration, MIN(length) min_duration
FROM film;

SELECT MIN(CAST(length*60 AS TIME)) AS min_duration, 
	   MAX(CAST(length*60 AS TIME)) AS max_duration
FROM film;

/*What's the average movie duration expressed in format (hours, minutes)?*/
SELECT AVG(CAST(length*60 AS TIME)) AS avg_duration
FROM film;

/*How many distinct (different) actors' last names are there?*/
SELECT COUNT(DISTINCT last_name)
FROM actor;

/*Since how many days has the company been operating (check DATEDIFF() function)?*/
SELECT DATEDIFF(MAX(rental_date),MIN(rental_date))
FROM rental;

/*Show rental info with additional columns month and weekday. Get 20 results.*/
SELECT *, MONTH(rental_date) month_rental, WEEKDAY(rental_date) day_rental
FROM rental
LIMIT 20;

/*Add an additional column day_type with values 'weekend' and 'workday' 
depending on the rental day of the week.*/
SELECT *, CASE WHEN WEEKDAY(rental_date) IN (5,6) THEN 'weekend' ELSE 'workday' END AS day_type
FROM rental;

/*How many rentals were in the last month of activity?*/
SELECT COUNT(*)
FROM rental
WHERE MONTH(rental_date) = (SELECT MONTH(MAX(rental_date)) FROM rental);
