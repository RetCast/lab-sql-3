USE sakila;
SELECT * FROM actor;

#How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM actor;

#In how many different languages where the films originally produced? 
#(Use the column language_id from the film table)
SELECT COUNT(DISTINCT language_id) FROM film;

#How many movies were released with "PG-13" rating?
SELECT COUNT(rating)
FROM film
WHERE rating = 'PG-13';

#Get 10 the longest movies from 2006.
SELECT title, length FROM film
ORDER BY length DESC
LIMIT 10;

SELECT MAX(DATE(rental_date)) FROM rental;

#How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(DATE(rental_date)), MIN(DATE(rental_date))) FROM rental;

#Show rental info with additional columns month and weekday. Get 20
SELECT rental_id, rental_date, MONTH(rental_date), WEEKDAY(rental_date)
FROM rental
LIMIT 20;

/*Add an additional column day_type with values 'weekend' and 'workday' 
depending on the rental day of the week.
*/
SELECT rental_date, rental_id, 
  CASE
    WHEN WEEKDAY(rental_date) < 5 THEN 'workday'
    WHEN WEEKDAY(rental_date) >= 5 THEN 'weekday'
  END AS day_type
FROM rental;

#How many rentals were in the last month of activity?
SELECT MONTH(MAX(rental_date)) AS last_month_of_activity
FROM rental;
SELECT COUNT(rental_id) FROM rental
WHERE MONTH(rental_date) = 2;

SELECT COUNT(rental_id) 
FROM rental
WHERE MONTH(rental_date) = (SELECT MONTH(MAX(rental_date)) FROM rental);




