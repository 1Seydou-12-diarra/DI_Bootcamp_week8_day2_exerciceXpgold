-- EXERCICE_GOLD3
-- To create the purchases table and insert the rows, we can use the following SQL commands:

-- Part I

CREATE TABLE purchases (
  id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT,
  item_id INT,
  quantity_purchased INT
);

INSERT INTO purchases (customer_id, item_id, quantity_purchased)
SELECT id, 3, 1
FROM customers
WHERE first_name = 'Scott' AND last_name = 'Scott';

INSERT INTO purchases (customer_id, item_id, quantity_purchased)
SELECT id, 2, 10
FROM customers
WHERE first_name = 'Melanie' AND last_name = 'Johnson';

INSERT INTO purchases (customer_id, item_id, quantity_purchased)
SELECT id, 1, 2
FROM customers
WHERE first_name = 'Greg' AND last_name = 'Jones';

-- Part II

-- To get the following information from the database, we can use the following SQL commands:

-- All purchases:

SELECT * FROM purchases;

-- All purchases, joining with the customers table:

SELECT customers.first_name, customers.last_name, items.name, purchases.quantity_purchased
FROM purchases
INNER JOIN customers ON purchases.customer_id = customers.id
INNER JOIN items ON purchases.item_id = items.id;

-- Purchases of the customer with the ID equal to 5:

SELECT customers.first_name, customers.last_name, items.name, purchases.quantity_purchased
FROM purchases
INNER JOIN customers ON purchases.customer_id = customers.id
INNER JOIN items ON purchases.item_id = items.id
WHERE customers.id = 5;

-- Purchases for a large desk AND a small desk:

SELECT customers.first_name, customers.last_name, items.name, purchases.quantity_purchased
FROM purchases
INNER JOIN customers ON purchases.customer_id = customers.id
INNER JOIN items ON purchases.item_id = items.id
WHERE items.name = 'Large Desk' OR items.name = 'Small Desk';

-- Customers who have made a purchase:

SELECT customers.first_name, customers.last_name, items.name
FROM purchases
INNER JOIN customers ON purchases.customer_id = customers.id
INNER JOIN items ON purchases.item_id = items.id;

-- Adding a row which references a customer by ID, but does not reference an item by ID (leave it blank):

INSERT INTO purchases (customer_id, item_id, quantity_purchased)
VALUES (1, NULL, 1);