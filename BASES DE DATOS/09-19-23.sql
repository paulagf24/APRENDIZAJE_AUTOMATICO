
#1. Repositorio a utilizar: earthquakes. Se necesita conocer los sismos de mayor magnitud
#ocurridos en Chile. Mostrar en orden descendente por magnitud, el id de los sismos, la
#significancia, la magnitud, la ubicaci�n completa (locationfull), la ubicaci�n aproximada
#(locationname) y el a�o de todos los sismos cuya ubicaci�n aproximada sea "Chile".
use earthquakes
select id , 
impactmagnitude,
impactsignificance,
locationfull,
locationname,
timeyear
from earthquake
where locationname ='Chile'
order by impactmagnitude DESC

#2. Repositorio a utilizar: earthquakes. Se necesita conocer los sismos registrados en lugares m�s
#alejados de una estaci�n de reporte dentro de territorio Chino. Mostrar en orden
#descendente por esta distancia el id, la significancia, la magnitud, la distancia a la estaci�n, la
#ubicaci�n completa y la ubicaci�n aproximada de los sismos cuya ubicaci�n aproximada sea China4
SELECT id,
impactsignificance,
impactmagnitude,
locationdistance,
locationfull
from earthquake
where upper(locationname)= 'CHINA'
order by locationdistance DESC

#3. Repositorio a utilizar: earthquakes. Se necesita saber si la profundidad del sismo influye en la
#significancia. Mostrar en orden ascendente por profundidad el id, profundidad, la
#significancia, ubicaci�n aproximada y ubicaci�n completa de todos los sismos.
select id,
locationdepth ,
impactsignificance,
locationname,
locationfull
from earthquake e 
order by locationdepth 

#4. Repositorio a utilizar: earthquakes. Se necesita saber si a menor profundidad y a menor
#distancia a una estaci�n, un sismo tiene una alta significancia. Mostrar en orden ascendente
#por profundidad y distancia el id, la profundidad, la magnitud, la distancia, la significancia,
#ubicaci�n aproximada y ubicaci�n completa de todos los sismos.
select id,
locationdepth,
impactmagnitude,
locationdistance,
impactsignificance,
locationname
from earthquake e 
order by locationdepth,locationdistance, impactsignificance DESC  


#5. Repositorio a utilizar: earthquakes. Se necesita saber cu�les son las ubicaciones aproximadas
#�nicas de todos los sismos de magnitud superior a 7.
select DISTINCT locationname 
from earthquake
where impactmagnitude>7

#6. Repositorio a utilizar: earthquakes. Se necesita saber la magnitud de los sismos ocurridos en
#Per� durante el d�a. Mostrar el id, magnitud, la significancia, ubicaci�n completa, ubicaci�n
#aproximada, la hora y la fecha de los sismos cuya hora este entre las 08 y 19 y cuya ubicaci�n
#aproximada sea Per�.
SELECT id,
impactmagnitude,
impactsignificance,
locationfull,
locationname,
timehour,
timefull 
from earthquake e 
where timehour BETWEEN 08 and 19 AND UPPER(locationname)='PERU'

#7. Repositorio a utilizar: earthquakes. Se necesita saber la magnitud de los sismos ocurridos por
#la noche/madrugada ocurridos en Japon. Mostrar el id, magnitud, la significancia, ubicaci�n
#completa, ubicaci�n aproximada, la hora y la fecha de los sismos cuya hora este entre las 22
#y 05 y ubicaci�n aproximada sea "Japan".

SELECT id,
impactmagnitude,
impactsignificance,
locationfull,
locationname,
timehour
from earthquake e 
where UPPER(locationname)='JAPAN' and timehour in (22,23,0,1,2,3,4,5);

