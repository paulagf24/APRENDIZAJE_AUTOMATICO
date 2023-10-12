
#EJERCICIO 1
#moviebig. Cual es la pelicula con m�s alto presupuesto? Mostrar
#el t�tulo, el presupuesto, la fecha de lanzamiento y el promedio de votaci�n
use 008moviebig

SELECT title, budget, release_date, vote_average
FROM moviebig 
WHERE budget = (SELECT MAX(budget) FROM moviebig);

#EJERCICIO 2 
#craftbeer. Cual es la cerveza que tiene m�s alcohol? Mostrar su nombre, el abv y la cervecer�a que que la produce
use 008craftbeer

select b.name,
	abv,
	b2.name
from beer b 
inner join brewery b2 
on brewery_id=b2.id
where b.abv =(select max(b.abv) from beer b);

#EJERCICIO 3
#world. Qu� pa�ses tienen la menor esperanza de vida? Mostar por cada continente, el pa�s y la esperanza
# de vida de los que m�s baja la tienen.
use 008world

select Continent,
		Name ,
		LifeExpectancy 
from country c 
where (continent, LifeExpectancy)
in (select continent, min(LifeExpectancy) from country c
group by Continent);





