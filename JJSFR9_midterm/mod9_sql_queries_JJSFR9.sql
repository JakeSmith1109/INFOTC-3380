--display customer first name, last name, and movie titles rented in 2006
--sort by customer last name
SELECT c.first_name, c.last_name, YEAR(r.rental_date)
FROM rental r, customer c
WHERE c.customer_id = r.customer_id
    AND YEAR(r.rental_date) = 2006
ORDER BY c.last_name;

--number of films in each category
--list category name in a column "Category Name"
--number of films in a column "Number of Films"
--sort by number of films descending
SELECT c.name AS "Category Name", COUNT(f.film_id) AS "Number of Films"
FROM film_category f, category c
WHERE f.category_id = c.category_id
GROUP BY c.name
ORDER BY COUNT(film_id) DESC;

--calculate each customer's total payments and display
--the top 15 customers in terms of total payments descending
--display customer first name, last name, and total payment
--column called "Total Payments"
SELECT c.first_name, c.last_name, SUM(p.amount) AS "Total Payments"
FROM customer c, payment p
WHERE c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY SUM(p.amount) DESC
LIMIT 15;

--calculate the total payments for each store
--display store id and total payment in a column "Total Payments"
--sort results by total payments descending
SELECT store.store_id, SUM(p.amount) AS "Total Payments"
FROM store, staff, payment p
WHERE store.store_id = staff.store_id
    AND staff.staff_id = p.staff_id
GROUP BY store.store_id
ORDER BY SUM(p.amount) DESC;

--films that are rented the most
--display film name and the total rentals in a column "Total Rentals"
SELECT f.title, COUNT(r.rental_date) AS "Total Rentals"
FROM film f, inventory i, rental r
WHERE f.film_id = i.film_id
    AND i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY COUNT(r.rental_date) DESC;

--film categories rented the most
--display category name and total rentals in a column "Total Rentals"
--sort by total rentals descending
SELECT c.name, COUNT(r.rental_date) AS "Total Rentals"
FROM category c, film_category fc, film f, inventory i, rental r
WHERE c.category_id = fc.category_id
    AND fc.film_id = f.film_id
    AND f.film_id = i.film_id
    AND i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY COUNT(r.rental_date) DESC;

--display inventory list of movie titles for store 1
--display film title and quantity in stock in a column "In Stock"
--display results in alphabetical order by title
SELECT f.title, COUNT(i.film_id) AS "In Stock"
FROM film f, inventory i
WHERE i.store_id = 1
    AND f.film_id = i.film_id
GROUP BY f.title
ORDER BY f.title;

--actors that have acted in the most movies
--list the actor first and last name
--list number of movies in a column "Number of Movies"
--sort by number of movies descending
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS "Number of Movies"
FROM actor a, film_actor fa
WHERE a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY COUNT(fa.film_id) DESC;