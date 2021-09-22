--Question 1
SELECT customer_id, first_name, last_name, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

--Question 2
SELECT payment_idd, first_name, last_name, amount
FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;

--Question 3
SELECT cutomer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

--Question 4
SELECT customer_id, first_name, last_name, country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country ='Nepal';

--Question 5

SELECT staff.staff_id, first_name, last_name, COUNT(*)
FROM payment
JOIN staff
ON payment.staff_id = staff.staff_id
GROUP BY staff.staff_id, first_name, last_name
ORDER BY COUNT(*) DESC
LIMIT 1;

--Question 6
SELECT film.film_id, title, COUNT(*)
FROM film_actor
JOIN film
ON film_actor.film_id = film.film_id
GROUP BY film.film_id, title
ORDER BY COUNT DESC
LIMIT 1;

--Question 7
SELECT actor.actor_id, first_name, last_name, COUNT(*)
FROM film_actor
JOIN actor
ON film_actor.actor_id = actor.actor_id
GROUP BY actor.actor_id, first_name, last_name
ORDER BY COUNT(*)
LIMIT 1;

--Question 8 
SELECT district, COUNT(*)
FROM address
GROUP BY district
HAVING COUNT(*) > 5;