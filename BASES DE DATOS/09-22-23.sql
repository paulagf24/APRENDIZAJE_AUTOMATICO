
use moviebig

#Repositorio a utilizar: moviebig. Mostrar el presupuesto más caro registrado. Luego mostrar
#el id, el nombre, la fecha de estreno, el presupuesto y el promedio de votación de la película
#cuyo presupuesto fue el más caro.

select 
	max(budget)
from moviebig m 


SELECT movie_id,
	title,
	release_date,
	budget,
	vote_average
from moviebig m 
where budget = 380000000;


#Repositorio a utilizar: moviebig. Mostrar un resumen con lo siguiente: el total de películas
#registradas, el promedio de los presupuestos, el promedio de los ingresos y un campo
#"BeneficiosTotales" con la diferencia de los presupuestos e ingresos totales de todas las
#películas. Redondear los importes a 2 decimales.

select round(sum(movie_id),2),
		round(avg(budget),2),
		round(avg(revenue),2),
		round(sum(revenue) - sum(budget),2) as 'Beneficios Totales'
from moviebig m 
where movie_status='Released'
group by movie_status

#Repositorio a utilizar: earthquakes. Mostrar un resumen con lo siguiente: el total de sismos
#registrados, la mayor y menor magnitud registradas, la última fecha en que se registró un
#sismo y la máxima significancia.

use earthquakes

select count(id),
		max(impactmagnitude),
		min(impactmagnitude),
		max(timefull),
		max(impactsignificance)
from earthquake m 

#Repositorio a utilizar airports. Mostrar un resumen de aeropuertos agrupados por país. Se
#desea saber cuántos aeropuertos hay por cada país ordenado alfabéticamente
#ascendentemente.

use airports

select country,
		count(1)
from osmairport o 
group by country 
order by country asc



