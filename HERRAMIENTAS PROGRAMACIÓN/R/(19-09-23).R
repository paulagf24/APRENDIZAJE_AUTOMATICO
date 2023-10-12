

library(dplyr)
library(nycflights13)
dim(flights)
flights
# Ejercicio 1. Selecciona todas los vuelos del 1 de enero.
flights1 <- flights %>% 
  filter(month==1, day==1 )
flights1

# Ejercicio 2. ¿Cuántos vuelos salieron del aeropuerto JFK?
flights2 <- flights %>% 
  filter(origin=='JFK' )
nrow(flights2)

# Ejercicio 3. ¿Cuántos vuelos se retrasaron?
flights3 <-  flights %>% 
  filter(dep_delay>0)
nrow(flights3)

# Ejercicio 4. Selecciona todos los vuelos que no tengan valor NA en la columna dep_delay.
flights4 <-  flights %>% 
  filter(!is.na(dep_delay))
nrow(flights4)

# Ejercicio 5. Del data frame flights, selecciona todas las columnas relacionadas con los
# retrasos (o sea, que contengan algo relacionado con delay).
flights5 <-  flights %>% 
  select(arr_delay, dep_delay)
flights5

# Ejercicio 6.
# • Define una nueva columnas llamada gain, que sea la diferencia entre arr_delay y
# dep_delay.
# • Define otra columna que sea la velocidad media (distance dividida por air_time).
# Multiplícala por 60 para tener el resultado en minutos.
flights6 <-  flights %>% 
  mutate(gain= arr_delay - dep_delay) %>% 
  mutate(velo_med=(distance / air_time)*60)
flights6

# Ejercicio 7. Calcula la media en el retraso de salida. Cuidado con los NA.
mean(flights$dep_delay, na.rm=TRUE)

# Ejercicio 8. Separa el dataset en aviones (columna tailnum) y luego agrega cada avión
# contando el número de vuelos (count = n()) y la distancia media (distance) y el retraso
# medio de llegada (arr_delay). Crea un tibble con el resultado y después usa el código de
# ejemplo de ggplot para hacer un gráfico
flights6 <- flights %>%
  group_by(tailnum) %>%
  summarise(
    count = n(),
    mean_distance = mean(distance, na.rm = TRUE),
    mean_arr_delay = mean(arr_delay, na.rm = TRUE)
  ) %>%
  ungroup()

# Ejercicio 9. Encuentra el número de aviones y el número de vuelos que van a cada posible
# destino (dest).
flights7 <- flights %>%
  select(tailnum, flight, dest) %>%
  group_by(tailnum, flight, dest)

flights7

df %>% 
  group_by(fechas) %>% 
  sumaarize(clientes_nuevos= mean(clientes_nuevos))

