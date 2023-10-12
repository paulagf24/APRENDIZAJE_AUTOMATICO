
use moviebig

USE test008

CREATE TABLE t_test
SELECT *
FROM moviebig.moviebig e 

INSERT INTO ExistentTable
SELECT Field1,Field2,...,FieldN FROM moviebig
WHERE Field1 = Value1 AND

#1. Repositorio a utilizar: moviebig. Mostrar la siguiente información de las películas: el id, el
#título, y un campo de nombre "detalles" que mostrará el texto: "Más detalles en: " al cual le
#añadirá el homepage de la película y en caso que no tenga, le añadirá "www.google.com".

SELECT 
	movie_id
	,title
	,concat('Mas detalles en:', ifnull(homepage,'www.google.com ') ) as detalles
from moviebig.moviebig

select movie_id,
		title, 
		case when title is not null 
		then concat('Más detalles en: ', homepage)
		else concat('www.google.com ', homepage)
		end as detalles
from moviebig.moviebig

#2. Repositorio a utilizar: airplanecrashes. Mostrar la siguiente información, la fecha del vuelo, la
#ubicación, el operador, la ruta y un campo generado con nombre "nuevaruta" que se
#informará con la ruta en caso de que esta exista, y en caso de que no exista la ruta, mostrará
#el texto "X - location - X". Donde location es la ubicación del accidente

use airplanecrashes

select realdate,
		location,
		operator,
		route,
		ifnull(Route , CONCAT('X - ', Location, ' - X') ) as nuevaruta
from airplanecrashes.crash c 

#3. Repositorio a utilizar: airports. Mostrar el país, el código IATA, código ICOE asi como una
#columna de nombre "Nombre" en el que se informe el nombre en inglés, si este no está
#informado, el nombre en francés, y si este tampoco está informado, se informará la columna
#"Name". Además se pide ordenarlos ascendentemente por el país.

use airports

select Country,
		IATAcode,
		ICAOcode,
		COALESCE (Nameen , Namefr, Name) as Nombre
from airports.osmairport o 
order by Country ASC

#4. Repositorio a utilizar: airports. Mostrar el nombre, país, la localización geográfica, asi como
#una columna de nombre "Ubicación" en el que se informe el país, si este no está informado,
#el nombre la ubicación geográfica, y si este tampoco está informado, se informará el texto
#"Sin información".

select Name,
		Country,
		GeoPoint,
		COALESCE (Country  , GeoPoint, 'Sin informacion') as Ubicacion
from airports.osmairport o 



