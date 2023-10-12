
#Lectura de ficheros
#Siempre tienes que volver a ejecutar
getwd()
setwd("C:/Users/paula/Desktop/CUNEF/ASIGNATURAS/HERRAMIENTAS PROGRAMACIÓN/IRIS") #acaba en carpeta


df_iris2 <- read_csv("iris2.csv") #acaba en fichero
ncol(df_iris2)
df_iris2 <- read_csv2("IRIS/iris2.csv")#esto es para leer los ; de los csv

read_delim("IRIS/iris", delim = '$')#esto es cuando estan separados por el simbolo del $, o separadores genericos

# COMENZAR A CORREGIR EJERCICIOS
library(readr)
df_iris <- read_csv("iris.csv")
# es un read_parquet 
print(df_iris)
#EJERCICIOS
#Ejercicio 1. Cuenta el número de flores con Petal.Length mayor que 5.1 en iris.
sepalo_ma_5 <- sum(c(df_iris$petal_length>5.1))
sepalo_ma_5

# Ejercicio 2. Comprueba qué especies tienen flores con la anchura del sépalo mayor que 3,5
# y menor que 4. Pista. Necesitarás & porque tienes más de una condición. Además, para
# simplificar el resultado te puede venir bien la función unique(). Usa ? unique para consultar
# la documentación
x <- df_iris$sepal_width>3.5 & df_iris$sepal_width<4
table(x)
unique(df_iris$species)
sum(df_iris$sepal_width>3.5 & df_iris$sepal_width<4 & df_iris$species=="setosa")
sum(df_iris$sepal_width>3.5 & df_iris$sepal_width<4 & df_iris$species=="versicolor")
sum(df_iris$sepal_width>3.5 & df_iris$sepal_width<4 & df_iris$species=="virginica")
unique(df_iris$species[df_iris$sepal_width>3.5 & df_iris$sepal_width<4])
# Ejercicio 3. ¿Cuántas flores de cada especie hay? Pista. La función table() te será útil.
table(df_iris$species)

# Ejercicio 4. Calcula la media de la anchura del sépalo de las flores cuya anchura de sépalo
# está por debajo de la media general.
sepal_me <- mean(df_iris$sepal_width)
sepal_me
sepal_me2 <- mean(df_iris$sepal_width<sepal_me)
sepal_me2

# Ejercicio 5. Calcula la mediana de la anchura del pétalo de cada especie por separado.
median(df_iris$petal_width[df_iris$species=="setosa"])
median(df_iris$petal_width[df_iris$species=="versicolor"])
median(df_iris$petal_width [df_iris$species=="virginica"])

#Ejercicio 6. Calcula el mínimo y el máximo de la longitud del pétalo para de las flores
# versicolor. Luego cuenta cuántas flores setosa y virginica hay con la longitud del pétalo entre
# esos valores.
max_versi <- max(df_iris$petal_length[df_iris$species=="versicolor"])
max_versi
min_versi <- min(df_iris$petal_length[df_iris$species=="versicolor"] )
min_versi
sum(df_iris$petal_length<max_versi & df_iris$petal_length>min_versi &df_iris$species!="versicolor")

#Ejercicio 7. ¿Qué pasa si usas la función plot() con el dataframe iris? ¿Cómo interpretas
# lo que ves?
plot(df_iris)

# Ejercicio 8. Si escribes Titanic en la consola verás un conjunto de datos con un formato un
# poco feo para el análisis. Usa as.data.frame() para convertirlo a un data frame y asígnalo a
# una variable (objeto) en R (elige el nombre que quieras). Ahora tienes un data frame cargado
# en memoria.
# • Verifica que el data frame es un data frame (con is.data.frame()).
# • Comprueba las clases de las columnas del data frame.
# • Cuenta (o suma) el número de personas que sobrevivieron y el número de personas que
# no. Si tienes dudas sobre los datos, ejecuta ? Titanic para acceder a la ayuda (sí,
# también tienes ayuda sobre conjuntos de datos en R).
# • Cuenta el número de niños (children) que había en el barco.
# • Cuenta el número de hombres que había en primera clase.
# • ¿Había niños entre los miembros de la tripulación? ¿Y mujeres?
dt_titanic <- as.data.frame(Titanic)
dt_titanic
glimpse(dt_titanic)
sum(dt_titanic$Freq [dt_titanic$Survived=='Yes'])
sum(dt_titanic$Freq [dt_titanic$Survived=='No'])
sum(dt_titanic$Freq [dt_titanic$Age=='Child'])
sum(dt_titanic$Freq [dt_titanic$Sex=='Male' & dt_titanic$Age=='Adult' & dt_titanic$Class=='1st'])
print("Children:")
sum(dt_titanic$Freq[dt_titanic$Age == "Child" & dt_titanic$Class == "Crew"])
print("Women:")
sum(dt_titanic$Freq[dt_titanic$Sex == "Female" & dt_titanic$Class == "Crew"])

