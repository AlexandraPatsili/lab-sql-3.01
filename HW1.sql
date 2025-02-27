USE sakila;

-- Drop column picture from staff.
ALTER TABLE staff
DROP COLUMN picture;
SELECT * FROM staff;

-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT * FROM customer
WHERE first_name = 'Tammy' AND last_name = 'Sanders';
-- staff_id is PK
SELECT * FROM staff;
INSERT INTO staff (first_name, last_name, address_id, email, store_id, active, username, password, last_update) 
VALUES('TAMMY','SANDERS',79,'TAMMY.SANDERS@sakilacustomer.org', 2, 1, 'Tammy', 'holacaracola', CURDATE());

-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- Use similar method to get inventory_id, film_id, and staff_id.

SELECT film_id FROM film
WHERE title = 'Academy Dinosaur';

SELECT staff_id FROM staff
WHERE first_name = 'Mike'; -- 1

SELECT inventory_id FROM inventory
WHERE film_id = 1 AND store_id = 1; -- 1,4

INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id, last_update) 
VALUES
(current_timestamp(),1,130, 1, CURDATE());

SELECT * FROM rental
ORDER BY last_update DESC;