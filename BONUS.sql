USE sakila; 

-- 25. Encuentra todos los actores que han actuado juntos en al menos una película. La consulta debe mostrar el nombre y apellido de los actores y el número de películas en las que han actuado juntos:

/* Conceptos nuevos: 
AUTO-JOIN: Para crear todas las combinaciones posibles de pares. Transformando una lista vertical de actores en una lista horizontal de relaciones entre ellos.'Generación de pares'*/

-- Hay que desdoblar la tabla film_actor en fa1 y fa2 para saber en qué peli(s) está cada actor(es). 

SELECT a1.first_name AS nombre_actor1, a1.last_name AS apellido_actor1,
	   first_name AS nombre_actor2, last_name AS apellido_actor2,AVG	
		FROM actor AS a1
        
        
        
        INNER JOIN actor AS a2
        
        
        
        GROUP BY -- por actor_id y first_name, last_name de ambos actores