########################
## First steps with R ##
## Leonardo Hansa     ## 
## September 2021     ## 

#11/09/23
# The console as a calculator -------------------------------------------
# NO SE PUEDE SUMAR STRINGS´
#pi es una variable
#sin() calcula el seno de una variable
#log() calcula el logaritmo
#<- ALT + (-)
#rm() borrar variables que no necesite para que no me ocupen espacio
#f <- a+56 si cambio el valor de a no cambia el numero f ya que para que cambie
#tendrías que volver a ejecutar el programa para que te salga el numero nuevo
#ctrl+shift+p nos ayuda a buscar
#ctrl+ intro se ejecuta el file que tenemos guardado
#una variable no se puede empezar por un numero es decir puede ser a2 pero no 2a
#es preferible usar minusculas, barras bajas 

#12/07/23
#colección de elementos c(1,2,3) también llamado vector

1 + 1
100 * 100
20 / 4
20 / 3
2 ** 10
2 ^ 10

factorial(5)
sin(pi)

# calculate the force that is needed 
# to move an object of 9.5 kg with an accelaration of 4.7 $m/{s^2}$. 
9.5 * 4.7

newton <- 9.5 * 4.7
newton

acc <- 4.7
mass <- 9.5
newton <- mass * acc
newton

## Exercises
# 1. Change the values of `acc` and `mass` (make sure on the upper right corner 
#    of RStudio that you have actually changed them). 
#    Write on the console `newton`. 
#    Try to understand what is necessary for successfully getting that change. 
# 2. What happens if you use `=` instead of `<-`? 
# 3. You have defined `acc`. Type `ACC` and see what happens when 
#    you try to work with it.


# Types of objects --------------------------------------------------------
# numeric
1
2.3
-1003.65
pi

# integer
my_number <- 10
class(my_number)

my_number <- 10L
class(my_number)

# character
city <- "Madrid"
capital_letters <- "NEW YORK"
a_number <- "10"
strange_characters <- "@!-/"
all_together <- "¿Cuál es la capital de España?"

class(city)
class(all_together)

# logical o tambien booleanos 
saying_yes <- TRUE
class(saying_yes)

pi > 3
log10(100) == 2
-3 <= -4

TRUE == 1
FALSE == 0
TRUE == 3


comparison1 <- pi > 3
comparison2 <- log10(100) == 2
comparison3 <- -3 <= -4

class(comparison1)
class(comparison2)
class(comparison3)

# Sets of elements --------------------------------------------------------
# vectors

# si tengo un parrafo
# lo comento con ctrl+shift+c

# doesn' work. Esto no funciona porque coge solo el primero
mean(1.75, 1.69, 1.81, 1.65, 2.01, 1.73, 1.90, 1.62)

# my_set <- 1.75, 1.69, 1.81, 1.65, 2.01, 1.73, 1.90, 1.62
# Error: unexpected ',' in "my_set <- 1.75,"

# habria que crear un vector (colección de numeros)todas tienen que ser del mismo tipo

my_set <- c(1.75, 1.69, 1.81, 1.65, 2.01, 1.73, 1.90, 1.62)
my_set

# nos dice que tipo de numero, string es
# para poder ejecutar hay que hacer ctrl+enter
class(2)
mean(my_set)
# desviación tipica
sd(my_set)  

class(c(2, 4, 6))
class(c("hi there!", "I don't really understand this R stuff", "abc10"))
class(c(TRUE, TRUE, FALSE, TRUE, FALSE))

# los corchetes son para acceder a elementos de un conjunto
# las llaves sirven para indicar el input de funciones
my_set[2]

# se utiliza el nombre de indice para decir las posiciones de un elementos 
my_desired_index <- 3
# nos va a dar la posición 3 del conjunto de los elementos
my_set[my_desired_index]
# es el ultimo valor
length((my_set))
my_set[length(my_set)]

my_set[0]

my_indexes <- c(2, 4, 6)
my_set[my_indexes]
my_set[-my_indexes] ## all except my_indexes

a <- 1:5
b <- c(1, 2, 3, 4, 5)

a == b ## element by element

a

# Exercise.
# What happens when you define a variable with the name `c`? 
# Bear in mind that `c()` is a function in R. 


my_set[4L]

logical_vector <- c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE)
my_set[logical_vector]
length(logical_vector)
# nos salen los valores que coinciden con los true
my_set[logical_vector]

# cumple la condición de true false en base al vector y los numeros.
# siempre se van a quedar con las cifras true
my_set[c(TRUE, FALSE)]
my_set[c(TRUE, FALSE, TRUE)]

# Matrices
my_matrix <- matrix(c(10, 12, 9, 1, 5, 7, -1, -6, 8, 100, 200, 300), nrow = 3)
my_matrix

nrow(my_matrix)
ncol(my_matrix)

desired_row <- 2
desired_column <- 4

my_matrix[2, 4]

my_matrix[1:2, 3:4]

# data.frame --------------------------------------------------------------
#  tabla coleccion de vectores que tienen la misma longitud

# col1=c(1,2,3,4)
# la tipologia es logica es como escribir TRUE FALSE
my_data_frame <- data.frame(
  col1 = 1:4, 
  col2 = c("Category 1", "Category 2", "Category 3", "Category 4"), 
  col3 = c(3.4, -2.5, 10.1, -0.05),
  col4 = c(T, F, F, T)
)

my_data_frame

## Exercises.
# - Check the type of each column for the data frame you've just created. Remember you need the function `class()` to do it. 
# - Is there anything strange with the second column? What were you expecting? Ask your teach about this and feel free to read `? factor` but don't worry about it for now. We'll get into that later. 

# NOMBRE DEL DATAFRAME $ NOMBRE DE LA COLUMNA
class(my_data_frame)
class(my_data_frame$col3)
my_data_frame$col3 + 45
my_data_frame [3]
my_data_frame["col3"]

my_data_frame[1, 2] # first row, second column 
my_data_frame[2:4, 2] # second to fourth rows, second column 
my_data_frame[1:3, -4] # first to third rows (included), all except fourth column

# Exercise. What are the types of objects returned with those executions. 

# `$` and `[[`

my_data_frame$col1
my_data_frame[["col1"]]

dollar_sintax <- my_data_frame$col1
double_bracket_sintax <- my_data_frame[["col1"]]

all(dollar_sintax == double_bracket_sintax)

# iris son ejemplos de flores 
head(iris)

tail(iris, 10)

nrow(iris)
ncol(iris)
dim(iris)

names(iris)

class(iris)

class(iris$Sepal.Length)
class(iris$Sepal.Width)
class(iris$Petal.Length)
class(iris$Petal.Width)
class(iris$Species)

summary(iris)

# logicals can be treated as numbers
sum(iris$Sepal.Length > 5.8)

my_average <- mean(iris$Sepal.Length)

# Comparing each row to the same number
sum(iris$Sepal.Length > my_average)

# comparing each row to different numbers
sum(iris$Sepal.Length > iris$Petal.Length)

# let's count how many flowers are there whose whose Petal.Width is
# larger than the median of all flowers

my_index <- iris$Petal.Width > median(iris$Petal.Width) # is above the median

head(my_index) # these are logical values indicating whether the flower corresponds with the filter

iris$Sepal.Length[my_index] 

length(iris$Sepal.Length[my_index] )

