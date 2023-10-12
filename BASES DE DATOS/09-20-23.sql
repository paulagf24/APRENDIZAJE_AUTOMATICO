
use moviebig

USE test008

CREATE TABLE t_test
SELECT *
FROM moviebig.moviebig e 

INSERT INTO ExistentTable
SELECT Field1,Field2,...,FieldN FROM moviebig
WHERE Field1 = Value1 AND

#1. Repositorio a utilizar: moviebig. Mostrar la siguiente informaci�n de las pel�culas: el id, el
#t�tulo, y un campo de nombre "detalles" que mostrar� el texto: "M�s detalles en: " al cual le
#a�adir� el homepage de la pel�cula y en caso que no tenga, le a�adir� "www.google.com".

SELECT 
	movie_id
	,title
	,concat('Mas detalles en:', ifnull(homepage,'www.google.com ') ) as detalles
from moviebig.moviebig

select movie_id,
		title, 
		case when title is not null 
		then concat('M�s detalles en: ', homepage)
		else concat('www.google.com ', homepage)
		end as detalles
from moviebig.moviebig

#2. Repositorio a utilizar: airplanecrashes. Mostrar la siguiente informaci�n, la fecha del vuelo, la
#ubicaci�n, el operador, la ruta y un campo generado con nombre "nuevaruta" que se
#informar� con la ruta en caso de que esta exista, y en caso de que no exista la ruta, mostrar�
#el texto "X - location - X". Donde location es la ubicaci�n del accidente

use airplanecrashes

select realdate,
		location,
		operator,
		route,
		ifnull(Route , CONCAT('X - ', Location, ' - X') ) as nuevaruta
from airplanecrashes.crash c 

#3. Repositorio a utilizar: airports. Mostrar el pa�s, el c�digo IATA, c�digo ICOE asi como una
#columna de nombre "Nombre" en el que se informe el nombre en ingl�s, si este no est�
#informado, el nombre en franc�s, y si este tampoco est� informado, se informar� la columna
#"Name". Adem�s se pide ordenarlos ascendentemente por el pa�s.

use airports

select Country,
		IATAcode,
		ICAOcode,
		COALESCE (Nameen , Namefr, Name) as Nombre
from airports.osmairport o 
order by Country ASC

#4. Repositorio a utilizar: airports. Mostrar el nombre, pa�s, la localizaci�n geogr�fica, asi como
#una columna de nombre "Ubicaci�n" en el que se informe el pa�s, si este no est� informado,
#el nombre la ubicaci�n geogr�fica, y si este tampoco est� informado, se informar� el texto
#"Sin informaci�n".

select Name,
		Country,
		GeoPoint,
		COALESCE (Country  , GeoPoint, 'Sin informacion') as Ubicacion
from airports.osmairport o 



