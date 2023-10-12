
# es un fichero que se para la información por comas
100, 250, "leo", -17
45;34; "hola", -17 

# libreria son las expansiones de los lenguajes
# la ruta me lleva a un fichero
# como llegar a mordor

# quiero traerme los datos del fichero iris.csv
# donde estoy? esa funcion te da el directorio de trabajo
getwd()
# Nos ayudan a ver las carpetas del ordenador y si le das a TAB te van saliendo 
ruta_relativa <- "../HERRAMIENTAS PROGRAMACIÓN/IRIS/iris.csv"

"C:/Users/paula/Desktop/CUNEF/ASIGNATURAS/HERRAMIENTAS PROGRAMACIÓN/IRIS/iris.csv"
df_iris <- read_csv(ruta_relativa)

# para ver la tabla
View(df_iris)
# llamao a la expansión una vez
install.packages(readr)
# lo utilizo cada vez que lo necesite
library(readr)

# usa head para ver las primeras filas
head(df_iris)
# usa tail para ver las últimas
tail(df_iris)
# usa names para ver los nombres de columnas
names(df_iris)
# usa class() para ver la clase de cada columna
class(df_iris)
# usa la longitud de sépalo y del pétalo de cada flor
df_iris$petal_length + df_iris$petal_length

sum(c(1,2.3))
sum(c(TRUE, FALSE, TRUE))
#que elemntos cumplen la condicion
c(1,2,3)>1
# dos elementos que cumplen la función ya que la operación de abajo da dos
sum(c(1,2,3)>1)


# EJERCICIO 1 (CUANTAS FLORES TIENEN UNA LONGITUD DE SÉPALO MENOR A 5)

#el número de variables que tiene la tabla, es decir, el número de columnas
length(df_iris)
# Usar nrow() para contar las filas
num_filas <- nrow(df_iris)
num_filas
sepalo_menor_5 <- c(df_iris$sepal_length<5)
sepalo_menor_5
#si sumamos TRUE, nos da el recuento de los mismo ya que TRUE=1 y FALSE=0
sum(sepalo_menor_5)

# EJERCICIO 2 (CUANTAS FLORES TIENEN UNA LONGITUD DE SÉPALO MAYOR 5 Y QUE LA ANCHURA SEA MENOR A 4)
df_iris$sepal_length>6 & df_iris$sepal_width<4

# EJERCICIO 3 (CUANTAS FLORES TIENEN UNA LONGITUD DE SÉPALO MAYOR 5 O QUE LA ANCHURA SEA MENOR A 4)
df_iris$sepal_length>6 | df_iris$sepal_width<4


#HAY QUE LLEGASR HASTA EL FINAL DEL ARCHIVO
read_csv("C:/Users/paula/Desktop/CUNEF/ASIGNATURAS/HERRAMIENTAS PROGRAMACIÓN/IRIS/iris.csv")
head(df_iris)
tail(df_iris)
colnames(df_iris)
ncol(df_iris)
