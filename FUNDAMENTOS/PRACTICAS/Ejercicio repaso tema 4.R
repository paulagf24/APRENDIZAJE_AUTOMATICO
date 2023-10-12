
#Ejercicio revision tema 4
#Se trata de dividor in dataset en dos subconjuntos de datos elegidos al azar del dataset
#original y que contenfgan cada uno el (70,30) por ciento del total, respectivamente
#Para ello se trata de dividir los indices del dataset (por medio de las filas)
#y hacer uso de la función sample()
#Realizar el ejercicio con el dataset swiss

swiss
set.seed(1122)
ind <- sample(2,nrow(swiss), replace=TRUE, prob=c(0.7,0.3))

train <- swiss[ind==1,]
test <- swiss[ind==2,]
nrow(train)
nrow(test)

(estrain <- c(mean(train$Fertility),
              sd))


#FALTA POR RELLENAR

# Un examen de estad´ıstica consiste en un test de 10 preguntas de respuesta m´ultiple, con
# cuatro posibles respuestas por pregunta. Un estudiante completa el examen eligiendo al
# azar la respuesta de cada pregunta.
# 
# Probabilidad que acierte 5 ´o m´as preguntas. Probabilidad que acierte 5 preguntas ´o
# menos.

1-pbinom(4,10,0.25)

# El numero de errores cometidos por un programador en una jornada diaria sigue una
# distribuci´on de Poisson de media 4.


# El n´umero de contactos de los usuarios de una red social sigue una distribuci´on de Poisson
# de media 75 contactos. Simular una muestra del n´umero de contactos de n = 500 usuarios
# de la red.
# a) Obtener las caracter´ısticas de la muestra simulada: m´ınimo, m´aximo, media, etc.
# b) N´umero esperado de usuarios con m´as de 90 contactos.
# c) Representar gr´aficamente la muestra y la frecuencia esperada te´orica seg´un el modelo
# de Poisson. ¿Qu´e se observa?
set.seed(1200)
y <- rpois(500,75)
summary(y)
hist(y)
sum(y>90)
sum(y>90)/length(y)
  
