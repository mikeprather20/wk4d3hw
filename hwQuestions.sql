--1. List all customers who live in Texas (use JOINs).
--ANSWER =
SELECT  customer_id, first_name, last_name, district
FROM customer
INNER JOIN address
ON address.address_id = customer. address_id
WHERE district = 'Texas';


--2. Get all payments above $6.99 with the Customer's Full Name.
--ANSWER =
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;


--3. Show all customers names who have made payments over $175(use subqueries).
--ANSWER =
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
    ORDER BY SUM(amount) DESC
);
--4. List all customers that live in Nepal (use the city table).
--ANSWER = 
SELECT  customer_id, first_name, last_name, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN  city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';


--5. Which staff member had the most transactions?
--ANSWER =
SELECT first_name, last_name, COUNT(payment_id)
FROM staff
INNER JOIN payment
ON payment.staff_id = staff.staff_id
GROUP BY first_name, last_name
LIMIT 1;

--6. How many movies of each rating are there?
--ANSWER =
SELECT rating, COUNT(inventory_id)
FROM film
INNER JOIN inventory
ON inventory.film_id = film.film_id
GROUP BY rating;

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries).
--ANSWER =
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
    SELECT amount
    FROM payment
    GROUP BY amount
    HAVING SUM(amount) > 6.99
);


--8. How many free rentals did our stores give away?
--ANSWER =
SELECT COUNT(payment_id)
FROM payment
WHERE amount <= 0;
