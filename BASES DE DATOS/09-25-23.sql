
SELECT t1.job, t2.name, t2.lastname, t1.hiringdate, t1.endofworkdate
FROM peoplejob t1 
INNER JOIN people t2 ON (t1.personid = t2.personid);


#EJERCICIOS
#Repositorio a utilizar: craftbeer. Se quiere listar todas las cervecerías con sus respectivas
#cervezas de la ciudad de San Diego. Mostrar el nombre de la ciudad, el nombre de la
#cervecería y el nombre de las cervezas que producen.
select 
 b2.city,
 b2.name as cerveceria,
 b.name as cerveza
from brewery b2
inner join  beer b 
on b2.id=b.id
where UPPER(b2.city)='San Diego'

#Repositorio a utilizar: craftbeer. Se quiere listar todas las cervecerías cuyos productos tengan
#en promedio un amargor inferior a 50 ibu's.
#Mostrar la ciudad de la cervecería, el nombre de la cervecería y el promedio de ibu's.

select b2.city,
	 b2.name as cerveceria,
	 round(avg(b.ibu)) as media_idu
from brewery b2
inner join  beer b 
on b2.id = b.id
group by b2.city, b2.name 
having round(avg(b.ibu))<50;

#Repositorio a utilizar: craftbeer. Para cada ciudad se quiere calcular el promedio de alcohol
#de todas las cervezas producidas (independientemente de la cervecería). Para saber que
#ciudades consumen más alcohol, solo se va a mostrar aquellas ciudades en las que el
#promedio sea superior a 0.05. Mostrar el nombre de la ciudad, la cantidad de cervecerías en
#la ciudad, asi como el promedio de alcohol de la ciudad.

select b2.city,
		count(b.brewery_id),
		avg(b.ibu)
from brewery b2
inner join  beer b 
on b2.id = b.brewery_id
group by b2.city
having round(avg(b.ibu))>0.05;

#Repositorio a utilizar: craftbeer. Se quiere saber la cantidad de cervezas artesanales que se
#ofrecen por estado. Mostrar el código del estado y la cantidad de cervezas que se ofrecen.

select b2.state,
		count(b.id)
from brewery b2
inner join  beer b 
on b2.id = b.brewery_id
group by b2.state;

#Repositorio a utilizar: moviesmall. Se quiere listar las películas de género "Thriller". Mostrar
#el género, el nombre de la película, el rank y el año.

use 008moviesmall

select mg.genre,
		m.name,
		m.rank,
		m.year
from moviesmall m 
inner join movie_genre mg 
on mg.movie_id =m.id
where mg.genre= 'Thriller'



