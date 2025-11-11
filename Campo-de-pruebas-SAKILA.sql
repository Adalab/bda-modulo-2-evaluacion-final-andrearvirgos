USE sakila; 

-- 1: 
SELECT title
	FROM film; 
    
SELECT DISTINCT title
	FROM film; 

-- 2: 
SELECT *
	FROM film;

SELECT title, rating -- rating es columna de control, para verificar que todo ok, limpio select para ejer.final!
	FROM film
    WHERE rating = 'PG-13';
    
-- 3:
SELECT *
	FROM film; 
    
SELECT title, description 
	FROM film
    WHERE  description LIKE '%amazing%'; 

SELECT title, description  -- query de comprobación: No incluyen 'amazing' 952 filas + 48 que si = 1000 
	FROM film
    WHERE  description NOT LIKE '%amazing%'; 

-- 4:
SELECT title
	FROM film
    WHERE length > 120; 
    
SELECT title, length
	FROM film
    WHERE length > 120
    ORDER BY length ASC; 
    
-- 5:
SELECT first_name
	FROM actor; 
    
SELECT *
	FROM actor; 
    
-- 6: 

SELECT first_name, last_name
	FROM actor
    WHERE last_name LIKE '%Gibson%'; -- por si hubiera algún apellido compuesto, que no 

SELECT first_name, last_name
	FROM actor
    WHERE last_name = 'Gibson'; 

-- 7:
SELECT first_name, actor_id
	FROM actor
	WHERE actor_id >= 10 AND actor_id <= 20; 
    
SELECT first_name
	FROM actor
	WHERE actor_id >= 10 AND actor_id <= 20; 
    
-- 8:
SELECT title, rating 
	FROM film;
    
SELECT title, rating
	FROM film
    WHERE rating NOT IN ('PG-13', 'R'); 
    
-- 9:
SELECT rating, COUNT(title)
	FROM film
    GROUP BY rating; -- para agrupar por cada valor único del grupo y obtener el total de cada uno

-- 10:
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS pelis_alquiladas
	FROM customer AS c
    INNER JOIN rental AS r
		ON c.customer_id = r.customer_id
	GROUP BY customer_id, c.first_name, c.last_name; 
    
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rented_films -- mejor en inglés, más coherente!
	FROM customer AS c
    INNER JOIN rental AS r
		ON c.customer_id = r.customer_id
	GROUP BY customer_id, c.first_name, c.last_name; 
    
  -- 11:   
  -- category (id)-> film_category (id)-> inventory (id)-> rental
SELECT ca.name, COUNT(r.rental_id) AS rented_films
	FROM category AS ca
    INNER JOIN film_category AS fic
		ON ca.category_id = fic.category_id
    INNER JOIN inventory AS i
		ON fic.film_id = i.film_id
	INNER JOIN rental AS r
		ON i.inventory_id = r.inventory_id
	GROUP BY name; 

SELECT ca.name AS name_genre,  COUNT(r.rental_id) AS rented_films -- renombrada columna 'name' para resultado más explícito/fácil leer por otrxs
	FROM category AS ca
    INNER JOIN film_category AS fic
		ON ca.category_id = fic.category_id
    INNER JOIN inventory AS i
		ON fic.film_id = i.film_id
	INNER JOIN rental AS r
		ON i.inventory_id = r.inventory_id
	GROUP BY name; 

-- 12:
SELECT rating, AVG(length)
	FROM film
    GROUP BY rating; 
    
-- 13: 
-- film-> film_actor-> actor
SELECT a.first_name, a.last_name, f.title
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	INNER JOIN film AS f
		ON fa.film_id = f.film_id
    WHERE f.title = 'INDIAN LOVE'; 
    
SELECT COUNT(a.actor_id) AS total_elenco -- pequeña comprobación para ver si resultado anterior ok
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	INNER JOIN film AS f
		ON fa.film_id = f.film_id
    WHERE f.title = 'INDIAN LOVE';

-- 14:
SELECT title, description
	FROM film
    WHERE description LIKE '%dog%' OR description LIKE '%cat%'; 

-- 15:
SELECT *
	FROM actor;
                 -- unión tablas: necesito lista todos los actores y las pelis en las que actuaron para saber si algún actor no tiene pelis ¿film_id null?
SELECT *
	FROM film_actor;

SELECT a.actor_id, a.first_name, a.last_name
	FROM actor AS a
    LEFT JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	WHERE fa.film_id IS NULL; 

-- 16:
