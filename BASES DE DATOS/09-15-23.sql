
use moviebig

#hay que separar las lines dentro de la query
select movie_id, title, budget
from moviebig
where budget > 14000000

select * from moviebig

select title from moviebig 
#camboiar el nombre de la variable o columna de la base de datos
select title as titulo from moviebig
#hacer referencia a una base de datos con una variable, en este caso m
select m.title from moviebig m 

#USAR NUEVA TABLA DE DATOS

use airplanecrashes
#la funcion str_to_date sirve para pasar una variable de texto en una fecha (%m/%d/%Y)

select DateCrash,
str_to_date(Datecrash, '%m/%d/%Y') 
from crash

#USAR NUEVA TABLA DE DATOS
use moviebig
# la funcion date_add sirve para sumar años
select release_date,
date_add(release_date, interval '1' year)
from moviebig

SELECT 
title, 
release_date,
YEAR(release_date) year,
MONTH(release_date) month,
DAY(release_date) day
FROM moviebig

#para saber las clases de las variables 
desc moviebig

#la funcion concat()sirve para concatenar variables, la tercera variable es para darle nombre a la nueva columna

SELECT title, tagline, CONCAT(title,' - ',tagline)
FROM moviebig;

SELECT title, CONCAT('Title : ', title)
FROM moviebig;

#marca el numero de caracteres que tiene una vaiable
SELECT title, LENGTH(overview), overview FROM moviebig;

#la funcion like signfica que esta contenido dentro. Muy importante poner %nombre%, puede existir texto delante y detras
#para tenerlo en cuenta
SELECT title 
FROM moviebig 
WHERE title LIKE '%Bill%';

#recibes una fecha y te devuelve un varchar que es un string
SELECT release_date, 
DATE_FORMAT(release_date, '%d-%m-%Y') 
FROM moviebig;

#son para poner mayusculas o minusculas
SELECT title , UPPER(title), LOWER(title)
FROM moviebig;

#cogemos una parte del titulo desde el caracter 1 y el número de caracteres que más adelante quieres coger
SELECT title, SUBSTR(title,2,5), SUBSTR(title,6,3) FROM moviebig;

#le das un texto y un caracter, en que posicion se encuenta el texto dentro de la variable, coge la primera vez que salga
SELECT title, homepage, INSTR(homepage,'/') 
FROM moviebig;

#FORMULAS MATEMÁTICAS EN SQL
#ceil, el valor más alto
#floor mas bajo
#mod, el resto de una division
#round, redondar
#trunc le quita los decimales 
#power elevado al cuadrado
#abs valor absolutio
#sqrt raiz cuadrada

SELECT popularity, 
CEIL(popularity) "ceil", 
FLOOR(popularity) "floor",
MOD(popularity,1) "mod",
ROUND(popularity,3) "round",
TRUNC(popularity,3) "trunc",
POWER(popularity,2) "power",
ABS(-popularity) "abs",
SQRT(popularity) "sqrt"
FROM moviebig;

SELECT 50*32, 12*32;
SELECT SUBSTR('ABCDEFGHI',5,4);

#la fecha del sistema
SELECT SYSDATE();
SELECT "2021-01-30",       DATE_ADD("2021-01-30" ,                INTERVAL '1' MONTH);

#Mostrar el nombre, beneficios y presupuesto de las películas que se 
#consideran un fracaso, es decir aquellas que fueron lanzadas y que los 
#beneficios no llegaron a ser superiores al presupuesto.

select * from moviebig ;
use moviebig;
select title, 
revenue,
budget
from moviebig
where revenue < budget
and movie_status='Released'

#Repositorio a utilizar: moviebig. Mostrar el nombre,
 #y la fecha de estreno de todas las películas de la saga
 #"Terminator". Si la tabla tuviese películas con "TERMINATOR"
 #(en mayúsculas) debería también mostrarlas. 

select title,
release_date
from moviebig
where title like '%TERMINATOR%'










