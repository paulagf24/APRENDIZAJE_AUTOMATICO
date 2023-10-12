###########################
## data.frames and dplyr ##
## Leonardo Hansa        ## 
## September 2021        ## 


library(dplyr)
library(readr)

df_mtcars <- ...("../data/sesiones/mtcars.csv")

df_mtcars %>% glimpse()

summary(df_mtcars)

df_mtcars %>% 
  select(wt)

df_mtcars %>% 
  mutate(wt = wt * 1000)

df_mtcars %>% 
  mutate(wt = wt * 1000) %>% 
  select(wt)

df_mtcars <- df_mtcars %>% 
  mutate(wt = wt * 1000)

df_mtcars %>% 
  mutate(wt = wt / 1000) %>% 
  select(wt)
                                                                                                           
mtcars %>% 
  mutate(vs = vs + 1) %>% 
  select(vs)

                                                                                                           
class(df_mtcars$vs)

df_mtcars %>% 
  mutate(vs_aux = if_else(vs == 0, "V-shaped", "straight")) %>% 
  select(vs, vs_aux)


# Simulations -------------------------------------------------------------

runif(10)
#inicio una formula muy compleja
set.seed(1234)#queremos poner un numero por el que empiece la funcion
runif(10)

set.seed(1234)
results <- runif(10)

library(dplyr)
if_else(results < 0.5, "tails", "heads")


# Creating a data frame ---------------------------------------------------
                                                                                                           
number_of_stores <- 20
#primer vector
indices <- 1:number_of_stores # Index: 1, 2, 3, 4, ..., 20

set.seed(2718)

length_sim <- rnorm(number_of_stores, mean = 7, sd = 1.5)
width_sim <- rnorm(number_of_stores, mean = 10, sd = 2.1)

# For the customers, we assume that the average will be 50. 
# You'll learn what a Poisson distribution is later on
customers_daily <- rpois(number_of_stores, lambda = 50)

income_daily <- rnorm(number_of_stores, mean = 2000, sd = 100)

# sample() reutiliza los elementos que le de
# es importante poner el replace=TRUE para que salgan varias veces
colors <- sample(c("green", "blue", "red", "white"), 
size = number_of_stores, replace = TRUE)
                                                                                                           
#tibble() crear una tabla
df_inventado <- tibble(
ind = indices, 
long = length_sim, 
ancho = width_sim, 
clientes = customers_daily, 
euros = income_daily, 
col = colors
)

glimpse(df_inventado)
df_inventado  

#cuando queremos que los colores vayan por un orden
#son 4 colores que hay 20 valores por lo que seria 5 veces
colores_no_aleatorios <- c("green", "blue", "red", "white")
df_inventado2 <- tibble(
  ind = indices, 
  long = length_sim, 
  ancho = width_sim, 
  clientes = customers_daily, 
  euros = income_daily, 
  col = rep(colores_no_aleatorios, times=5)
)
#Importante tener encuenta los NA y no tenerlo en cuenta en funciones ya que nos da 
#problemas
mean(c(NA,5,6))
mean(c(NA,5,6), na.rm=TRUE)

#descubir y encontrar los NA
vector_con_na <- c(NA, 5, 6)
#estoy sustituyendo el valor faltante
# por la media del vector 5.5
if_else(
  is.na(vector_con_na),
  5.5, 
  vector_con_na
)

df:mtcars %>% 
  distinct(am,cyl)
