###########################
## data.frames and dplyr ##
## Leonardo Hansa        ## 
## September 2021        ##
###########################

library(dplyr)

# Filtering rows ----------------------------------------------------------

df_mtcars <- read_csv("cars/mtcars.csv")

mean(c(1,2,3))# estos dos son lo mismo
c(1,2,3) %>% mean()# estos dos significan lo mismo

glimpse(df_mtcars)
summary(df_mtcars)

df_mtcars$wt #nos da un vector
df_mtcars %>% #tomo un dataframe 
  select(wt) #selecciono la columna wt, te lo pone como una tabla

df_mtcars %>% #tomo un dataframe 
  mutate(wt=wt*1000) #cambiar en toneladas a kilos

df_mtcars %>% #tomo un dataframe 
  mutate(wt=wt*1000) %>% #hacer lo mismo que la anterior pero solo seleccionando la columna
  select(wt)

#ctrl+shift+M == %>% %>% 

#iris- cread una nueva columna con la suma de las longitudes mostrad las tres columas

setwd("C:/Users/paula/Desktop/CUNEF/ASIGNATURAS/HERRAMIENTAS PROGRAMACIÓN/IRIS/")
df_iris <- read_csv("iris.csv")

df_iris %>% 
  mutate(length_total= sepal_length+petal_length)
df_iris %>% 
  mutate(length_total= sepal_length+petal_length) %>% 
  select(length_total, sepal_length, petal_length )

#Ejercicio 1. ¿Qué diferencias ves en los resultados de glimpse(df_mtcars) y df_mtcars
# %>% glimpse()?
glimpse(df_mtcars)
df_mtcars %>% glimpse()
# es lo mismo que el otro, con ese simbolo hace la misma funcion

# Ejercicio 2. En el data frame mtcars decide qué columnas se pueden almacenar como integer
# sin perder información y cámbialas. Para cambiar el tipo de una columna (o de cualquier
# objeto) puedes usar as.integer(). Por ejemplo, class(as.integer(4, 6, 1)).

# Filter in the base-R way
starwars$height > 175
starwars$name[starwars$height > 175]

# Filter in the dplyr way, filter() es un where en sql
starwars %>% 
  filter(height > 175)

starwars %>% 
  filter(height > 175) %>% 
  select(name)

starwars %>% 
  filter(height != 202) %>% 
  nrow()

# characters
starwars %>% 
  filter(hair_color == "brown")

# AND operator
starwars %>% 
  filter(skin_color == "light", height >= 165)

# OR operator
starwars %>% 
  filter(skin_color == "light" | height < 100)

Distinct

# Distinct  ---------------------------------------------------------------
unique(starwars$hair_color)

starwars %>% 
  distinct(hair_color)


starwars %>% 
  distinct(hair_color, skin_color)


# NA ----------------------------------------------------------------------
unique_hair_color <- unique(starwars$hair_color)
unique_hair_color

# This NA is the only value not written within ". But the vector is a character vector.

class(unique_hair_color)

class(unique_hair_color[1])

# A NA value, sigue siendo character
class(unique_hair_color[2])

# Exercise. Repeat the same procedure with height column and see what class NA belong to this time.
#se mantiene la misma clase aunque sea NA
alturas <- unique(starwars$height)
class(alturas[1])
class(alturas[21])

# Exercise. Apply the class() function to NA and see the result.

mean(starwars$height)

1 + NA

mean(starwars$height, na.rm = TRUE)


# is.na() is a R base function that allows us detecting NA values. Simple example:

vector_with_NA <- c(1, NA, 3)
is.na(vector_with_NA)

!is.na(vector_with_NA)


starwars %>% 
  filter(is.na(height))

starwars %>% 
  filter(!is.na(height))

starwars %>% 
  filter(is.na(height) | is.na(hair_color))


# Exercise. Keep only the rows with both height and mass available and create a 
# new column with the BMI (m/h2). Finally select the name of the character and 
# the new column.


# Row numbers --------------------------------------------------------------


iris %>% 
  slice(1:3, 100:103)