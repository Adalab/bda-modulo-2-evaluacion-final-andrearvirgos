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
SELECT *
	FROM film;

SELECT title
	FROM film 
	WHERE release_year BETWEEN 2005 AND 2010; 

SELECT title, release_year -- un par de comprobaciones, porque devuelve las mil filas
	FROM film
    ORDER BY release_year DESC; 

SELECT release_year, COUNT(title) AS total_pelis -- ok, todas las pelis indexadas en la BD son del año de lanzamiento 2006!
	FROM film
    WHERE release_year BETWEEN 2005 AND 2010
    GROUP BY release_year; 

-- 17:
SELECT *
	FROM category; -- comprobación "family" es un género/categoría Y TIENE ID 8

SELECT title 
	FROM film AS f
    INNER JOIN film_category AS fic
		ON f.film_id = fic.film_id
        WHERE fic.category_id IN (
			SELECT category_id
				FROM category
                WHERE name = 'Family'
); 

SELECT f.title, fic.category_id -- si, todos los títulos tienen el id 8 de Family.
	FROM film AS f
    INNER JOIN film_category AS fic
		ON f.film_id = fic.film_id
        WHERE fic.category_id IN (
			SELECT category_id
				FROM category
                WHERE name = 'Family'
); 

-- 18:
SELECT a.first_name, a.last_name, COUNT(fa.film_id) 
	FROM actor AS a
	INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
        GROUP BY a.actor_id 
			HAVING COUNT(fa.film_id) > 10; 
            
SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS total_films
	FROM actor AS a
	INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
        GROUP BY a.actor_id 
			HAVING total_films > 10; 
            
-- 19:
SELECT title, rating, length
	FROM film
    WHERE rating = 'R' AND length > 120; 
    
SELECT title -- select limpio porque solo piden título de las pelis
	FROM film
    WHERE rating = 'R' AND length > 120; 

SELECT COUNT(*) AS pelis_cumplen_condiciones
	FROM film
    WHERE rating = 'R' AND length > 120; -- query de comprobación, resultado 90 filas/pelis ok

    
-- 20:
-- categoría peli = name en category
-- AVG length > 120
-- SELECT name + AVG length
SELECT *
	FROM category; -- + consulta diagrama para visualizar cómo están conectadas las tablas: category (category_id)-> film_category(film_id)-> film

SELECT ca.name, AVG(length)
	FROM category AS ca
    INNER JOIN film_category AS fic
		ON ca.category_id = fic.category_id
	INNER JOIN film AS f
		ON fic.film_id = f.film_id
	GROUP BY ca.name
		HAVING AVG(length) > 120; 

SELECT ca.name AS name_genre, AVG(length) AS average_duration -- devuelve resultado más comprensible
	FROM category AS ca
    INNER JOIN film_category AS fic
		ON ca.category_id = fic.category_id
	INNER JOIN film AS f
		ON fic.film_id = f.film_id
	GROUP BY name_genre
		HAVING average_duration > 120;
        

SELECT ca.name AS name_genre, AVG(length) AS average_duration -- query anterior devuelve 4filas(Drama, Foreign, Games, Sports)
	FROM category AS ca
    INNER JOIN film_category AS fic
		ON ca.category_id = fic.category_id
	INNER JOIN film AS f
		ON fic.film_id = f.film_id
	GROUP BY name_genre
		ORDER BY  average_duration DESC; -- cambiando el having por un order by en descendente, compruebo que las 4primeras filas, son las que superan los 120 y las mismas que devuelve mi query final.
        
-- 21:
-- actor(actor_id) -> film_actor(film_id) -> film >= 5 pelis
-- select first_name + nº pelis

SELECT a.first_name, COUNT(fa.film_id) AS total_films   
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
        GROUP BY a.actor_id, a.first_name
			HAVING total_films >= 5; 

SELECT a.first_name, COUNT(fa.film_id) AS total_films   -- query de comprobación
	FROM actor AS a
    INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
        GROUP BY a.actor_id, a.first_name
			ORDER BY total_films ASC; -- No hay actores con menos de 14pelis. 14 > 5 con lo que el HAVING total_films >= 5 es correcto, los 200 actores cumplen la condición.

-- 22: 
SELECT title, rental_duration -- para mi, la query más eficiente: concisa, limpia y devuelve lo que se busca. Pero no cumple estrictamente con el enunciado/subconsulta.
	FROM film 
    WHERE rental_duration > 5; 

-- no entiendo el requisito de la subconsulta aquí, es redundante porque filtra todo el rato la misma tabla. Me parece complicarlo! PERO, si es requisito del enunciado, por seguir practicvando sintaxis de subconsultas:
SELECT title, rental_duration 
	FROM film 
    WHERE film_id IN (  
		SELECT film_id 
			FROM film
            WHERE  rental_duration > 5
);


-- 23:
SELECT *
	FROM category; -- category_id 'horror' es 11

-- actores IN y actores NOT IN 'horror'
SELECT a.first_name, a.last_name
	FROM actor AS a
		WHERE a.actor_id NOT IN (
			SELECT fa.actor_id
				FROM film_actor AS fa
                INNER JOIN film_category AS fic
					ON fa.film_id = fic.film_id
				INNER JOIN category AS ca
					ON fic.category_id = ca.category_id
				WHERE ca.name = 'Horror'
	
);

-- query de comprobación:
SELECT COUNT(DISTINCT fa.actor_id)  -- 156 actores distintos que si han actuado en pelis horror(que es la lista de exclusión que genera el NOT IN y por la que esa query devuelve solo 44 actores!!)
	FROM film_actor AS fa
    INNER JOIN film_category AS fic
		ON fa.film_id = fic.film_id
	INNER JOIN category AS ca
		ON fic.category_id = ca.category_id
        WHERE ca.name = 'Horror'; 
        
SELECT *
	FROM actor;  -- hay 200 actores registrados en la BD(200-156= 44 actores que devuelve la query final/oficial)


-- 24:
-- film-> film_category-> category

-- siendo estrictos con el enunciado, la consulta devolvería 0, porque no hay 'comedias' entre las categorías.
SELECT f.title
	FROM film AS f
    INNER JOIN film_category AS fic
		ON f.film_id = fic.film_id
	INNER JOIN category AS ca
		ON fic.category_id = ca.category_id
	WHERE ca.name = 'Comedia' AND f.length > 180; 

-- interpretando que buscamos 'comedy' (factible al conocer la traducción, si la BD estuviera en un idioma de complicada traducción, la extracción de datos se complicaría no teniendo las pautas correctas de consulta)
SELECT f.title
	FROM film AS f
    INNER JOIN film_category AS fic
		ON f.film_id = fic.film_id
	INNER JOIN category AS ca
		ON fic.category_id = ca.category_id
	WHERE ca.name = 'Comedy' AND f.length > 180; 

-- query de comprobación, mostrando columnas:
SELECT f.title, f.length AS minutaje, ca.name AS categoria_control
	FROM film AS f
    INNER JOIN film_category AS fic
		ON f.film_id = fic.film_id
	INNER JOIN category AS ca
		ON fic.category_id = ca.category_id
	WHERE ca.name = 'Comedy' AND f.length > 180;
