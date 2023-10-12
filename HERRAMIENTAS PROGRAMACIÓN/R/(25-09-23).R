
library(dplyr)

mi_vector <- c(1,NA,4)
otro_vector <- c(10,NA,40)

mean(mi_vector)
cor(mi_vector,otro_vector)

is.na(mi_vector)
!is.na(mi_vector)
#na.rm no tiene en cuenta los NA cuando hace calculos,
#na.rm es una función que solo funciona dentro de mean, sum
la_media <- mean(mi_vector, na.rm=TRUE)

mi_vector[is.na(mi_vector)] <- la_media

mean(otro_vector,na.rm= TRUE)

#Creación de una función
calculo_alternativo_media <- function(un_vector_cualquiera){mean(un_vector_cualquiera,na.rm=TRUE)}

otro_vector
mean(otro_vector)
calculo_alternativo_media(otro_vector)

# EJERCICIOS 
#Crea una función que reciba una palabra y la use para filtrar filas en iris por la columna species.
#Calcula la media de sepal.length de los datos filtros
mean_sep_leng <- function(x){iris %>% 
    filter(Species==x) %>% 
    summarise(mean(Sepal.Length))}

mean_sep_leng('setosa')

# Crea una funcion cuyo argumento es la función de agregacion que se aplica al vector un_vector

un_vector <- c(8,NA,9)
f_agregacion <- function(x){x(un_vector, na.rm=TRUE)}

f_agregacion(max)
f_agregacion(min)

#Crea una funcion cuyos argumentos son la función de agregación que se aplica algún vector,
# y el vector sobre el que se aplica
f_agregacion_2 <- function(x,y){x(y, na.rm=TRUE)}

f_agregacion_2(max, un_vector=c(8,NA,9))
f_agregacion_2(min, un_vector=c(8,NA,9))

library(ggplot2)
#diferenciar por color dependiendo de una variable
mtcars
ggplot(mtcars) +
  geom_point(aes(x=mpg, y=wt, color=as.factor(am)))

#dos graficos separados con la misma escala

ggplot(mtcars) +
  geom_point(aes(x=mpg, y=wt))+
               facet_wrap(~ am)
#para 
ggplot(mtcars) +
  geom_point(aes(x=mpg, y=wt))+
  facet_grid(vs ~ am)
#comparten el eje x y estan pegadas unas con otras
ggplot(economics_long)+ 
  geom_line(aes(x=date, y=value01))+
  facet_grid(variable ~ .)

ggplot(economics_long)+ 
  geom_line(aes(x=date, y=value01))+
  facet_wrap(variable ~ .)

ggplot(economics_long)+ 
  geom_line(aes(x=date, y=value01))+
  facet_wrap(variable ~ .,scales='free_y')

#FACETS
#Ejercicio 1. Muestra la evolución del número de películas, de manera separada para Female
#y Male, en un único cuadro
library(dplyr)
library(ggplot2)
library(fivethirtyeight)
  df_biopics <- fivethirtyeight::biopics
  df_biopics %>% 
    group_by(subject_sex, year_release) %>% 
    summarise(number=n()) %>% 
    ggplot()+
    geom_line(aes(x = year_release, y = number))+
    facet_wrap(~ subject_sex)
  
  # Ejercicio 2. Haz un gráfico de columnas con el número de películas en función de si el
  # protagonista es Female y Male y en función también del país country. Necesitarás algún
  # cálculo con dplyr. Asegúrate de que el eje 𝑦 sea diferente entre cada gráfico.
  df_biopics %>% 
    group_by(subject_sex, country ) %>% 
    summarise(number=n()) %>% 
  ggplot()+ 
    geom_col(aes(x=subject_sex, y=number))+
    facet_wrap(~ country, scales="free_y")
  
  #FUNCIONES
  # #Ejercicio 1. Crea una función que reciba un vector x de números y otro número a y que
  # dibuje, en función de esos, la curva de la función matemática 𝑓(𝑥) = 𝑥𝑙𝑛(𝑎𝑥), donde 𝑎 es un
  # número positivo real. Asegúrate de que a es igual a 1 por defecto. La función debería incluir
  # este vector x como la columna de un data frame (puedes hacerlo con la función tibble()).
  # Después la función creará otra columna aplicando la fórmula de la función matemática, con
  # dplyr. Finalmente, con ggplot2, dibujará la curva. Un gráfico de líneas valdrá. Para comprobar
  # que la función hace lo que tiene que hacer, llámala con el vector generado con el siguiente
  # código: seq(0.01, 1, by = 0.01). Prueba diferentes valores de x y a para ver cómo cambia
  # el gŕafico.
  
  #HACERLO EN CASA EN BASE A LA SOLUCION
  
  
  