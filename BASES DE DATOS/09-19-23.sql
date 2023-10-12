
#1. Repositorio a utilizar: earthquakes. Se necesita conocer los sismos de mayor magnitud
#ocurridos en Chile. Mostrar en orden descendente por magnitud, el id de los sismos, la
#significancia, la magnitud, la ubicación completa (locationfull), la ubicación aproximada
#(locationname) y el año de todos los sismos cuya ubicación aproximada sea "Chile".
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

#2. Repositorio a utilizar: earthquakes. Se necesita conocer los sismos registrados en lugares más
#alejados de una estación de reporte dentro de territorio Chino. Mostrar en orden
#descendente por esta distancia el id, la significancia, la magnitud, la distancia a la estación, la
#ubicación completa y la ubicación aproximada de los sismos cuya ubicación aproximada sea China4
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
#significancia, ubicación aproximada y ubicación completa de todos los sismos.
select id,
locationdepth ,
impactsignificance,
locationname,
locationfull
from earthquake e 
order by locationdepth 

#4. Repositorio a utilizar: earthquakes. Se necesita saber si a menor profundidad y a menor
#distancia a una estación, un sismo tiene una alta significancia. Mostrar en orden ascendente
#por profundidad y distancia el id, la profundidad, la magnitud, la distancia, la significancia,
#ubicación aproximada y ubicación completa de todos los sismos.
select id,
locationdepth,
impactmagnitude,
locationdistance,
impactsignificance,
locationname
from earthquake e 
order by locationdepth,locationdistance, impactsignificance DESC  


#5. Repositorio a utilizar: earthquakes. Se necesita saber cuáles son las ubicaciones aproximadas
#únicas de todos los sismos de magnitud superior a 7.
select DISTINCT locationname 
from earthquake
where impactmagnitude>7

#6. Repositorio a utilizar: earthquakes. Se necesita saber la magnitud de los sismos ocurridos en
#Perú durante el día. Mostrar el id, magnitud, la significancia, ubicación completa, ubicación
#aproximada, la hora y la fecha de los sismos cuya hora este entre las 08 y 19 y cuya ubicación
#aproximada sea Perú.
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
#la noche/madrugada ocurridos en Japon. Mostrar el id, magnitud, la significancia, ubicación
#completa, ubicación aproximada, la hora y la fecha de los sismos cuya hora este entre las 22
#y 05 y ubicación aproximada sea "Japan".

SELECT id,
impactmagnitude,
impactsignificance,
locationfull,
locationname,
timehour
from earthquake e 
where UPPER(locationname)='JAPAN' and timehour in (22,23,0,1,2,3,4,5);

