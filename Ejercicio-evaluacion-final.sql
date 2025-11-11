USE sakila; 

-- 1. Selecciona todos los nombres de las películas sin que aparezcan duplicados:
SELECT DISTINCT title
	FROM film; 

-- 2. Muestra los nombres de todas las películas que tengan una clasificación de "PG-13":
SELECT title
	FROM film
    WHERE rating = 'PG-13';
    
-- 3.  Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción: 
SELECT title, description
	FROM film
    WHERE  description LIKE '%amazing%'; 
    
-- 4.  Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos:
SELECT title
	FROM film
    WHERE length > 120; 

-- 5.  Recupera los nombres de todos los actores:
SELECT first_name
	FROM actor; 

-- 6.  Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido:
SELECT first_name, last_name
	FROM actor
    WHERE last_name = 'Gibson'; 

-- 7.  Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20:
SELECT first_name
	FROM actor
	WHERE actor_id >= 10 AND actor_id <= 20;

-- 8.  Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación:
SELECT title
	FROM film
    WHERE rating NOT IN ('PG-13', 'R'); 
    
-- 9:  Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento:
SELECT rating, COUNT(title)
	FROM film
    GROUP BY rating; 

-- 10.  Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas:
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS rented_films
	FROM customer AS c
    INNER JOIN rental AS r
		ON c.customer_id = r.customer_id
	GROUP BY customer_id, c.first_name, c.last_name;  
    
-- 11.  Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres:
SELECT ca.name AS name_genre,  COUNT(r.rental_id) AS rented_films
	FROM category AS ca
    INNER JOIN film_category AS fic
		ON ca.category_id = fic.category_id
    INNER JOIN inventory AS i
		ON fic.film_id = i.film_id
	INNER JOIN rental AS r
		ON i.inventory_id = r.inventory_id
	GROUP BY name; 

-- 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración:
SELECT rating, AVG(length)
	FROM film
    GROUP BY rating; 
    
-- 13.  Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love":
SELECT a.first_name, a.last_name
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	INNER JOIN film AS f
		ON fa.film_id = f.film_id
    WHERE f.title = 'INDIAN LOVE'; 

-- 14.  Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
SELECT title
	FROM film
    WHERE description LIKE '%dog%' OR description LIKE '%cat%'; 
    
-- 15. Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor:
SELECT a.actor_id, a.first_name, a.last_name
	FROM actor AS a
    LEFT JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	WHERE fa.film_id IS NULL; 
    
-- 16.  Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010:
 


 

