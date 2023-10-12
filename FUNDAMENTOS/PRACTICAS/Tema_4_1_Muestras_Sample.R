#----------------------------------------------------
# Funcion Sample - Elegir muestras con R
# MUCD Tema 4
#----------------------------------------------------

# Sintaxis de la funcion
# sample(x, size, replace = FALSE, prob = NULL)

#----------------------------------------------------
# Muestras sample con y sin reemplazamiento
#----------------------------------------------------
set.seed() #nos ayuda a fijar una muestra
x<- sample(1:20, 5)
x
x<- sample(1:5, 10, replace=T)
x

#----------------------------------------------------
# Muestras desde un dataset swiss
#----------------------------------------------------
# Dataset swiss
names(swiss)

# De una variable
sample(swiss$Fertility, 10)

# De todo el dataset
# La muestra se obtiene eligiendo primero las filas
# Elegir una muestra de 10 provincias de swiss
#PRIMERO ESCOGEMOS LOS INDICES
#1:nrow NOS SIRVE PARA COGER TODAS LAS FILAS
#sirve para fijar el sample 
set.seed(2023)
df<- sample(1:nrow(swiss), 10)
df

# Muestra de 10 filas - provincias
swiss[df,]

#----------------------------------------------------
# Elegir subconjuntos de datos y luego una muestra
# Elegir de Iris y de la especie setosa una muestra de 5
#----------------------------------------------------
library(tidyverse)
library(dplyr)

subset1<- iris %>%
  filter(Species == "setosa")

sm1<-sample(1:nrow(subset1), 5)
sm1
subset1[sm1,]


#----------------------------------------------------
# Muestras de datasets con set.seed
#----------------------------------------------------
# Dataset iris
# La muestra se obtiene eligiendo primero las filas

set.seed(1221)
x<- sample(1:nrow(iris), 10)
x

# Muestra de las 10 filas 
iris[x, ]


# Otro ejemplo--------------------------------------
datos <- data.frame(x1 = 1:12,
                    x2 = letters[1:12])
# Elegir muestra de tamanho 5 del df datos
muestra_datos <- datos[sample(1:nrow(datos), size = 5), ]
muestra_datos 


#----------------------------------------------------
# Generar muestras aleatorias simples con sample
# Desde una lista
#----------------------------------------------------

sample(c('Pedro','Jaime','Juan','Lucia','Ana','Maria'), 4)

#----------------------------------------------------
# Muestras con probabilidades
# prob (0.8, 0.2) de relojes correctos y defectuosos
#----------------------------------------------------
x<-sample(tipo<-c('Correcto','Defectuoso'), size=50, replace=T, prob=c(.80,.20))
table(x)
barplot(table(x), main="Tipos de relojes", col="green")
box()

#----------------------------------------------------
# Muestreo Estratificado
#----------------------------------------------------
# Elegir una muestra con la misma probabilidad
# Poblacion de individuos de edad: joven, media, mayor

s1<-sample(c("joven", "media", "mayor"), 100, replace = T)
table(s1)/length(s1)
barplot(table(s1), main="Edades", col="green")
box()

# Elegir una muestra con distintas probabilidades
# c(0.2,0.6,0.2)
s2<-sample(c("joven", "media", "mayor"), 100, replace = T, 
           prob = c(0.2,0.6,0.2))
table(s2)/length(s2)
barplot(table(s2), main="Edades", col="green")
box()
#box es para cerrar el grafico
#Es importante que podamos cambiar las probabilidades de las variables
