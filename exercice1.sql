-- EXERCICE_GOLD 1

-- Find out how many films there are for each rating.

SELECT rating, COUNT(*) as num_films
FROM film
GROUP BY rating;

-- To get a list of all the movies that have a rating of G or PG-13, are under 2 hours long, and whose rental price is under 3.00:

SELECT title
FROM film
WHERE (rating = 'G' OR rating = 'PG-13')
  AND length < 120
  AND rental_rate < 3.00
ORDER BY title;
-- To update a customer's details to your own, you would first need to find the customer's record and then use the UPDATE statement. For example, if you wanted to update the customer with customer_id = 1:

SELECT * FROM customer WHERE customer_id = 1; 

UPDATE customer
SET first_name = 'Your first name', last_name = 'Your last name', email = 'your.email@example.com'
WHERE customer_id = 1; -- To update the customer's details
To update the customer's address, you can use a similar UPDATE statement:

UPDATE address SET address = 'Your address', city = 'Your city', postal_code = 'Your postal code'
WHERE address_id = (SELECT address_id FROM customer WHERE customer_id = 1); 