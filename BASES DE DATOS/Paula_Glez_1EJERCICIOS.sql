
##### EJERCICIOS PAULA GONZÁLEZ #####

#CONTENIDO 02
#Pasado ya el tiempo, una vez que Nilo está totalmente recuperado, los veterinarios deciden
#reducirle la ingesta de comida en un 20% Elabora la sentencia SQL para actualizar el dato. 
use 008test;

UPDATE ParaiZooHuesped SET peso_kg_comida = peso_kg_comida-(peso_kg_comida*0.2)
WHERE UPPER(nombre)='NILO';

#Después de un tiempo, los veterinarios deciden actualizar los pesos de todos los animales.
#Los vuelven a pesar y observan que todos los Carnivoros han aumentado su peso un 20%
#mientras que los Herbivoros, aumentaron un 15%.
#Elabora la sentencia SQL para actualizar el peso de los animales

UPDATE ParaiZooHuesped SET peso_kg_llegada = peso_kg_llegada  +(peso_kg_llegada *0.2)
WHERE UPPER(especie)='CARNÍVORA';

UPDATE ParaiZooHuesped SET peso_kg_llegada = peso_kg_llegada  +(peso_kg_llegada *0.15)
WHERE UPPER(especie)='HERBÍBORO';

#CONTENIDO 03-04
#Repositorio a utilizar: moviebig. Se quiere saber si la longitud del Tagline tiene algún tipo de
#impacto en la popularidad de la película. Mostrar el nombre, la longitud del Tagline, la
#popularidad y el propio TagLine de aquellas películas cuyo TagLine tenga más de 100
#caracteres.
use 008moviebig;
SELECT title,
		LENGTH(tagline) as longitud_tagline,
		popularity,
		tagline
FROM moviebig m 
WHERE LENGTH(tagline)>100;

#Repositorio a utilizar: moviebig. Se quiere saber si las películas con menos duración llegan a
#tener mejores votaciones. Mostrar el nombre, la fecha de lanzamiento, la duración y el
#promedio de votación de las películas que duren una hora o menos. (La tabla muestra 0 en el
#campo Runtime para ciertas películas de las que no se registró la duración. Excluir de la
#consulta estas películas).
use 008moviebig;
SELECT title,
		release_date,
		runtime,
		vote_average
FROM moviebig m 
WHERE runtime NOT LIKE 0 AND runtime<=60
order by runtime;

use 008moviebig;
SELECT title,
		release_date,
		runtime,
		vote_average
FROM moviebig m 
WHERE runtime=0 
#CONTENIDO 05
#Repositorio a utilizar: earthquakes. Se necesita saber los sismos ocurridos en Japon en zonas
#distintas de "Miyako" y "Naze". Mostrar el id, la fecha, la ubicación aproximada, la ubicación
#completa, la magnitud y la significancia de los sismos cuya ubicación aproximada sea "Japan"
#pero no incluyan ni "Miyako" ni "Naze" en la ubicación completa.

use 008earthquakes;
SELECT id,
       timefull,
       locationname,
       locationfull,
       impactmagnitude,
       impactsignificance
FROM earthquake e 
WHERE UPPER(locationname) = 'JAPAN'
  AND UPPER(locationfull) NOT LIKE '%MIYAKO%'
  AND UPPER(locationfull) NOT LIKE '%NAZE%';

#Repositorio a utilizar: earthquakes. Se necesita ordenar los sismos por su distancia al círculo
#polar ártico para saber si la latitud impacta en la significancia y magnitud. Mostrar el id, la
#fecha, la latitud, la magnitud, la significancia, la ubicación aproximada, la ubicación completa de
#los sismos ordenados mostrando primero los más cercanos al círculo polar ártico.

use 008earthquakes;
SELECT 
	id,
	timefull,
	locationlatitude,
	impactmagnitude,
	impactsignificance,
	locationname,
	locationfull 
FROM earthquake e 
ORDER BY locationlatitude DESC






