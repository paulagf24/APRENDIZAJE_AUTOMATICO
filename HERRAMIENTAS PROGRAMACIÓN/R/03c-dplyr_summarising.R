library(dplyr)

library(readr)
df_storms <- read_tsv("storms.txt", 
                      col_types = cols(
                        name = col_character(), 
                        year = col_double(), 
                        month = col_double(), 
                        day = col_double(), 
                        hour = col_double(), 
                        status = col_character(), 
                        category = col_factor(), 
                        wind = col_integer(), 
                        pressure = col_integer(), 
                        tropicalstorm_force_diameter = col_double(), 
                        hurricane_force_diameter  = col_double()
                      ))

glimpse(df_storms)

# Qué histórico de datos tenemos
df_storms %>% 
  summarise(min(year), max(year))

# EJERCICIO ¿Cómo calcularías la velocidad media del viento en cada valor dado 
# por la columna `status`?
#el group by recoge las variables unicas de cada columna
df_storms %>% 
  group_by (status) %>% 
  summarise(mean(wind))

# Cuántos eventos de cada tipo (status) hubo por año
#n_distinct() cuantos eventos distintos hay
df_storms %>% 
  group_by(year, status) %>% 
  summarise(n_distinct(name))

# Qué tipo de evento tiene mayor velocidad de viento en media?
df_storms %>% 
  group_by(status) %>% 
  summarise(velocidad_viento = mean(wind)) %>% 
  arrange(desc(velocidad_viento))

# ¿Cómo ha variado la velocidad del viento en media año a año 
# de las tropical depression?

df_velocidad_media <- df_storms %>% 
  group_by(status) %>% 
  summarise(velocidad_viento = mean(wind)) %>% 
  arrange(desc(velocidad_viento))

df_storms %>% 
  filter(status == df_velocidad_media$status[3]) %>% 
  group_by(year) %>% 
  summarise(velocidad_huracanes = mean(wind)) %>% 
  print(n = nrow(.))

library(ggplot2)
df_storms %>% 
  filter(status == df_velocidad_media$status[3]) %>% 
  group_by(year) %>% 
  summarise(velocidad_huracanes = mean(wind)) %>% 
  ggplot() + 
  geom_line(aes(x = year, y = velocidad_huracanes))

