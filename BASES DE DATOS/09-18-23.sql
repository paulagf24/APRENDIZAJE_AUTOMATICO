
#Repositorio a utilizar: moviebig. Se necesita saber si las pel�culas largas,
#llegan a tener una buena valoraci�n. Seleccionar el nombre, duraci�n y el 
#promedio de votaci�n de las pel�culas que duran m�s de 2 horas. 
SELECT title, movie_status, budget 
FROM moviebig 
WHERE movie_status <> 'Released'; 

#Repositorio a utilizar: moviebig. Se necesita conocer el nombre, 
#el estado asi como el presupuesto de las pel�culas que no han sido estrenadas. 
select 
title,
budget,
movie_status
from moviebig m 
where movie_status != "released"

#Repositorio a utilizar: moviebig. Se necesita conocer el nombre 
#de las pel�culas que est�n bien valoradas y sean de tem�tica religiosa. 
#Mostrar el nombre de las pel�culas, el promedio de votaci�n y el resumen (overview) 
#de las pel�culas que tengan un promedio de votaci�n superior a 7 y que contengan la 
#palabra "god" en el resumen (Si tuviese "GOD" o "God" tambi�n deber�a mostrarlas). 
select title,
vote_average,
overview
from moviebig m
where vote_average >7 and upper(overview) like '%GOD%'

#Repositorio a utilizar: moviebig. Se necesita saber el nombre, numero de votaciones,
#promedio de votaciones y fecha de lanzamiento de las pel�culas que han recibido m�s 
#de 1000 calificaciones, pero el promedio de estas no ha sido superior a 5. 
select title,
vote_average,
release_date
from moviebig m 
where vote_count>1000 and vote_average<=5

#Repositorio a utilizar: moviebig. Se necesita conocer el nombre de las pel�culas que 
#hablen de aliens y que hayan tenido una alta popularidad. Mostrar el nombre de las 
#pel�culas, la popularidad, la fecha de estreno, el promedio de votaci�n de las pel�culas
#que tengan una popularidad superior a 100 y que contengan la palabra "alien" en el resumen
#(Considerar may�sculas).
select title,
popularity, 
release_date
vote_average
from moviebig m 
where upper(overview) like '%ALIEN%' and popularity>100

#Repositorio a utilizar: moviebig. Se quiere conocer si las pel�culas antiguas est�n bien valoradas.
#Se necesita conocer el nombre, el promedio de votaci�n y la fecha de estreno de las pel�culas 
#que han sido estrenadas antes del 01.01.1980. 
select title,
vote_average,
release_date
from moviebig
where release_date < '1980-01-01'

#Repositorio a utilizar: moviebig. Se quiere saber cu�les son las pel�culas que fueron publicadas
#en la web de disney. Mostrar el nombre, la fecha de lanzamiento, la duraci�n, el homepage y el
#promedio de votaci�n de las pel�culas cuyo homepage tenga: "movies.disney.com"
#de la posici�n 8 a la 25. 
select title,
release_date,
runtime,
homepage,
vote_average
from moviebig m 
where SUBSTRING(homepage,8, 17) like ('%movies.disney.com%')
#substring() coges la posicion 8 hasta la 25, la difencia que hay entre ambos es 17

#Repositorio a utilizar: airplanecrashes. Se quiere conocer los accidentes en los que hubo
# al menos un sobreviviente del avi�n. Mostrar la fecha, la ubicaci�n, la ruta, operador, las
# personas abordo y la cantidad de v�ctimas en el avi�n de los vuelos en los que la cantidad 
#de fallecidos del avi�n es menor a la cantidad de personas abordo. 
use airplanecrashes;

select DateCrash,
Location,
Route,
Operator,
Aboard,
Fatalities
from crash c 
where Fatalities< Aboard


from crash c 

