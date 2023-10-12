
#EJERCICIO 1
#moviebig. Cual es la pelicula con más alto presupuesto? Mostrar
#el título, el presupuesto, la fecha de lanzamiento y el promedio de votación
use 008moviebig

SELECT title, budget, release_date, vote_average
FROM moviebig 
WHERE budget = (SELECT MAX(budget) FROM moviebig);

#EJERCICIO 2 
#craftbeer. Cual es la cerveza que tiene más alcohol? Mostrar su nombre, el abv y la cervecería que que la produce
use 008craftbeer

select b.name,
	abv,
	b2.name
from beer b 
inner join brewery b2 
on brewery_id=b2.id
where b.abv =(select max(b.abv) from beer b);

#EJERCICIO 3
#world. Qué países tienen la menor esperanza de vida? Mostar por cada continente, el país y la esperanza
# de vida de los que más baja la tienen.
use 008world

select Continent,
		Name ,
		LifeExpectancy 
from country c 
where (continent, LifeExpectancy)
in (select continent, min(LifeExpectancy) from country c
group by Continent);





