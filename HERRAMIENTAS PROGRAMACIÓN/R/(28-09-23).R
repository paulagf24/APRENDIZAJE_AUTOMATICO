
#EJERCICIO 1

iris

#funciones apply, o funciones map, #purrr 
#apply hacer una funcion en varios
#un dataframe es un conjunto de vectores 
#s significa simplicar, es decir, dame el valor lo más simplificado posible
sapply(iris, class)

class(iris)
#una lista de cuando aplica la funcion en cada uno de los elementos
lapply(iris,class)

list(iris, mtcars)

#EJERCICIO1 
#Crea una funcion que reciba como argumento una ruta, y devuelva la media de dato_co en cada mes

library(dplyr)
funcion_media <- function(ruta){data <- read.csv(ruta)%>% 
              group_by(mes)%>% 
              summarize(mean(dato_co))}

y <- funcion_media('C:/Users/paula/Desktop/CUNEF/ASIGNATURAS/HERRAMIENTAS PROGRAMACIÓN/contaminacion/CO_2017.csv')
y

#EJERCICIO2
#Aplica esa funcion a todos los ficheros co con lapply
listado_de_rutas <- list(
  'CO_2017.csv',
  'CO_2018.csv',
  'CO_2018.csv')

lapply(listado_de_rutas,funcion_media)
slapply()

# Ejercicio 1. Read the file anscombe. Ejercicio 2. Get the class of all the columns. Ejercicio
# 3. Get the mean of all the columns. Ejercicio 4. Get the sd of all the columns. Ejercicio 5.
# Calculate again the mean and the sd of all the columns and store them in the same list (each
# element will be a vector). Ejercicio 6. Create a list of four data frames: each data frame
# will contain a pair of columns x and y: the first one will contain x1 and y1, the second one
# x2 and y2, and so on. map() should iterate over a vector 1:4 and you will create a function
# that select the columns containing the number. Ejercicio 7. Calculate the correlation of all
# the pairs 𝑥𝑖 and 𝑦𝑖. You can use your previous function because maybe you just have to add
# something like cor()

sapply(anscombe, class)
mean_ans <- sapply(anscombe, mean)
sd_ans <- sapply(anscombe, sd)
lista <- list(mean_ans,sd_ans)



nombres_random <- c("Mariyanna", "Lamiah", "Shandal",
                    "Rynda", "Kcee", "Camia",
                    "Isaiyah", "Barbare", "Braxon",
                    "Kailly")
baynames
funcion_nombres <- function(tabla){bb <- read_tsv('babynames') %>% 
  filter(name=tabla)}
funcion_nombres(nombres_random)




