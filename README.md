
# EJERCICO DE EVALUACIÓN FINAL - MÓDULO 02: SQL

Este repositorio contendrá mi solución al ejercicio de evaluación del Módulo2. Para tal efecto, la base de datos planteada es 'Sakila', un hipotético inventario de un videoclub. Esta base de datos, está formada por numerosas tablas que contienen información acerca de las películas(film)las personas que actúan en ellas(actor), la clientela(customer), los alquileres(rental), las diferentes categorías, etc.

Para iniciar el desarrollo del trabajo, seguiré unos pasos iniciales, comunes a cualquier labor con BBDD:

-Apertura sistema de gestión de datos, MySQL Workbench.
-Carga de la base de datos (en este caso está previamente descargada) y ejecución.
-Apertura script nuevo.


A través de las 24 consultas planteadas se demostrarán los conocimientos adquiridos durtante el presente módulo, así como los que se asentaron en la primera parte del curso. 



## Herramientas utilizadas:

1. [Sistema de Gestión de Base de Datos (SGBD): MySQL]
2. [Entorno de Desarrollo Integrado para SQL: Workbench]
3. [Lenguaje: SQL]
4. [Esquema usado para desarrollo: SAKILA (base de datos ficticia de inventario de videoclub)]


## Estructura del Repositorio:

El proyecto está compuesto por los siguientes archivos:

- `README.md`: La documentación del proyecto de evaluación.
- `Ejercicio-evaluacion-final.sql`: Contiene las 24 consultas SQL, numeradas, resueltas y comentadas debidamente.
- `Campo-de-pruebas-SAKILA.sql`: Archivo "sucio" con desarrollo de las consultas, comentarios y comprobaciones.
- ¿Bonus?


## Análisis y Desafíos técnicos abarcados:

Las 24 consultas recorren las lecciones aprendidas en este segundo módulo del curso. Entre ellas:

- Consultas de Agregación (HAVING): Demostrada diferencia entre WHERE y HAVING al filtrar resultados de funciones agregadas (COUNT y AVG) en los ejercicios 18, 20 y 21.
- JOINs en múltiples consultas: Encadenamiento de tablas para resolver los problemas planteados.


## Justificación de decisiones:

### NOTA sobre la consulta 22:
Debido a que el enunciado del ejercicio instaba a realizar una subconsulta " para encontrar los rental_ids con una duración superior a 5 días", desarrollé esa consulta como era solicitada. Pero, como resolución principal dejé la que, a mi juicio resultaba más lógica y eficiente para llevar a la práctica. 

### NOTA sobre la consulta 24: 
De nuevo, debido al formato del enunciado y ciñéndome estrictamente a él, desarrollé una consulta cuyo resultado era 0, por utilizar un término en castellano ('comedia' en 'category'), para una base de datos creada en inglés. Añadí no obstante, al conocer la traducción del término al inglés, una consulta cuyo resultado tenía más sentido en relación al contexto de trabajo. 
