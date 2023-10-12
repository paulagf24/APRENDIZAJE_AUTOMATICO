
##### P R A C T I C A ######

######Paula Gonzalez######
######Maria Rodriguez######
######Ruth Jorganes######

#EJERCICIO 1
# Crea un data frame o tibble a partir de los datos del fichero penguins. Contiene información
# sobre ejemplares de pingüinos:
# • La especie a la que pertenece
# • La isla en la que se encuentra
# • Dimensiones del pico (bill)
# • Longitud del ala (flipper)
# • La masa
# • El sexo
# • El año en que se registró
df_penguins <- read.csv2('penguins')

#EJERCICIO 2
# Responde a las siguientes preguntas:
#   • ¿Cuántas especies distintas hay?
#   • ¿De cuántas islas distintas hay datos?
#   • ¿Están todas las especies en todas las islas?
#SOLUCION: Como se puede observar estamos mostrando las combinaciones de pinguinos y las islas donde 
#se pueden encontrar. La especie Adelie se encuentra en las islas Torgersen, Biscoe, Dream. En cambio,
#las especies Gentoo y Chinstrap se encuentran unicamente en una isla, Biscoe y Dream respectivamente.
library(dplyr)

df_penguins %>%
  select(species) %>%
  distinct()

df_penguins %>%
  select(island) %>%
  distinct()

df_penguins %>%
  select(species,island) %>%
  distinct()


#EJERCICIO 3
#En el ejercicio 2 has visto que en la isla Torgersen solo hay una especie. ¿Cuál es?
#SOLUCION: es la especie Adelie
df_penguins %>%
  select(species,island) %>%
  distinct() %>% 
  filter(island== "Torgersen")

# EJERCICIO 4
# Teniendo en cuenta que cada fila es un pingüino, calcula cuántos pingüinos de cada especie
# hay.
df_penguins %>%
  group_by(species) %>%
  count(species)

# EJERCICIO 5
# Calcula la media de la longitud y la profundidad del pico en función de cada especie. Pista.
# Ninguna de las medias es NA.
df_penguins %>%
  group_by(species) %>%
  summarize(mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
            mean_bill_depth = mean(bill_depth_mm, na.rm = TRUE))

# EJERCICIO 6
# Calcula la mediana de la longitud del ala para la especie Adelie en cada isla y en función del
# sexo. Quita los casos en los que sex es NA. 
# Este script hemos omitido los valores NA
df_penguins_sin_na <- na.omit(df_penguins)
df_penguins_sin_na %>%
  group_by(species, island, sex) %>%
  summarise(flipper_length_median = median(flipper_length_mm, na.rm = TRUE)) %>% 
  filter(species== 'Adelie')
# Sin embargo, en este los tenemos en cuenta para poder observar los pinguinos que no se tiene la información
# disponible de su sexo
df_penguins %>%
  group_by(species, island, sex) %>%
  summarise(flipper_length_median = median(flipper_length_mm, na.rm = TRUE)) %>% 
  filter(species== 'Adelie')
  
# Replica el siguiente gráfico, que tiene todos esos
# datos coloreando cada columna en función del sexo. Necesitarás jugar con la position de
# las columnas. Explica qué conclusiones sacas a la vista del gráfico. Pista. De nuevo,
# ninguno de estos datos es NA.








