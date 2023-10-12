
#clase del 18-09-23

library(dplyr)
library(readr)

#wnd + e Te abre la carpeta de archivos

setwd('C:/Users/paula/Desktop/CUNEF/ASIGNATURAS/HERRAMIENTAS PROGRAMACIÓN/cars/')
df_mtcars <- read_csv("mtcars.csv")

#primeras filas
head(df_mtcars)

#? cualquier cosa, nos dice info de la duda que tengas

#PASO 1
#tomo el dataframe
#aplico una formula sobre una columna
#devuelvo el data frame por consola
df_mtcars %>% 
  select(mpg) %>% 
  mutate(log(mpg))
#PASO 2
df_mtcars %>% 
  mutate(mpg_log=log(mpg))
#PASO 3 (cambiarle el nombre del datframe)
df_mtcars_definitivo <- df_mtcars %>% 
  mutate(mpg_log=log(mpg))


df_mtcars %>% 
  mutate(
    mpg2=log(mpg),
    disp=disp -1
  )
#voy a crear una columna qu me dia si el coge 
# es de cambio manual o automático
# cambio = if_else(condicion, valor_si_true, valor_si_false)
df_mtcars %>% 
  select (am) %>%
  mutate (
    cambio = if_else(am == 0, "automatico", "manual")
  )

#columna nueva que sea
# cyl==4 bajo
# cyl==5 medio
# cyl==6 alto

df_mtcars %>% 
  select (cyl) %>% 
  mutate(columna_nueva=if_else(cyl==4, "bajo", 
                               if_else(cyl ==6, "medio", 
                                       "alto")))

#alt gr + 4 + espacio (~)
df_mtcars %>% 
  select (cyl) %>% 
  mutate(columna_nueva= case_when (
    cyl== 4 ~ "bajo",
    cyl==6 ~ "medio",
      TRUE  ~ "alto"
  ))

# EJERCICIOS 3
# Ejercicio 1. ¿Qué diferencias ves en los resultados de glimpse(df_mtcars) y df_mtcars
# %>% glimpse()?
glimpse(df_mtcars)
df_mtcars %>% glimpse()  
#es el mismo resultado

#Ejercicio 2. En el data frame mtcars decide qué columnas se pueden almacenar como integer
# sin perder información y cámbialas. Para cambiar el tipo de una columna (o de cualquier
# objeto) puedes usar as.integer(). Por ejemplo, class(as.integer(4, 6, 1)).
sapply(df_mtcars, class)
df_mtcars %>% 
  select(mpg) %>% 
  mutate(as.integer(mpg))

# Ejercicio 3. A partir del data frame df_inventado construido en la sección dplyr columns,
# ahora te toca hacer unos cálculos. Necesitarás mutate(). Puedes optar por sobreescribir el
# data frame con los nuevos cálculos o simplemente mostrar los resultados por consola.
# 1. Calcula el área total de cada tienda (como longitud por anchura).
# 2. Calcula cuántos euros gasta cada cliente, por cada tienda.
# 3. Calcula cuántos euros gasta cada cliente en media en total. Pista._ Para hacer esto,
# summarise() es muy útil y puedes leer su documentación para ver cómo usarlo. Sin
# embargo, puedes emplear también el enfoque de la notación $ y las funciones sum() o
# mean().
df_inventado2 <- df_inventado %>% 
  mutate(area_tienda=long*ancho, eurosxcliente= euros/clientes)
mean(df_inventado2$eurosxcliente)
summary(df_inventado2)
# 4. Si la tienda es blanca o azul, réstale 5 metros a su longitud; en caso contrario, súmale
# 10 metros. Pista. ? if_else(). Te vendrá bien usar %in%. Para aprender a usarlo,
# juega en la consola con códigos como "white" %in% c("white", "blue") o "red" %in%
#   c("white", "blue") e intenta entender qué está pasando y cómo puedes usarlo dentro
# de mutate().
df_inventado2 %>% 
  mutate(long=if_else(col=="white"| col=="blue", long-5, long+10))
df_inventado2 %>% 
  mutate(long=if_else(col %in% c("white","blue"), long-5, long+10))
# 5. Si todos los clientes en un día fueran a la tienda a la vez, ¿cuántos metros cuadrados por
# cliente habría?´
df_inventado2 %>% 
  mutate(m2xcliente= area_tienda/sum(clientes))
# Ejercicio 4. A partir del data frame starwars, responde estas preguntas.
#   • ¿Cuáles son los nombres de las columnas?
#   • ¿Cuáles son las clases de cada columna?
#   • ¿Cuáles son las dimensiones del data frame?
 names(starwars)
 sapply(starwars, class)
 dim(starwars)
#  Ejercicio 5. Obtén las combinaciones distintas de valores que puedes encontrar usando las
#  columnas eye_color y gender del data frame starwars (me refiero a combinaciones reales
# entre personajes que aparecen en la tabla: no intentes calcular todas las combinaciones posibles
# entre los valores). Crea un data frame con esas combinaciones. Exporta este data frame o
#  tibble a un fichero csv usando una función del paquete readr. Pista. Después de ejecutar
#  library(readr), escribe en la consola o en un script write_ y deja que el autocompletado te
#  proponga opciones. Decide qué función deberías usar. Otra pista. Hay varias soluciones. En
#  cualquier caso, recuerda usar ? para leer la documentación de una función.
 starwars %>%
   distinct(eye_color,gender)
 # Ejercicio 6. Lee la ayuda de na.omit() para quitar todas las filas con algún NA del data
 # frame starwars. Crea un data frame nuevo con los datos filtrados. Exporta el data frame a
 # un fichero csv (separado por coma).
 starwars2 <- na.omit(starwars)
starwars2 
write.csv(starwars2,"starwars2.csv", row.names = FALSE)

# Ejercicio 7
# 1. Lee el fichero volpre2019.csv y crea un data frame con sus datos. Nómbralo como
# quieras. Encontrarás datos sobre el volumen y el precio de muchos productos de MercaMadrid.
df_volpre2019 <- read_csv2("volpre2019.csv")

# 2. Llama a la librería janitor (instálala si toca) y usa la función clean_names() en el data
# frame (recuerda sobreescribir el data frame, porque si no lo haces es como si no hubieras usado la función).
library(janitor);
df_volpre2019 <-  clean_names(df_volpre2019);

# 3. Explora el data frame con las funciones que ya conoces: nrow, ncol (o dim()),
# glimpse(), summary().
nrow(df_volpre2019);
ncol(df_volpre2019);
dim(df_volpre2019);
glimpse(df_volpre2019);
summary(df_volpre2019);

# 4. Cuenta cuántos NA hay en la columna fecha_desde. Pista. Por ahora, valdrá con usar
# is.na() para crear un vector lógico y luego usar sum() para sumar el número de casos
# NA.
sum(is.na(df_volpre2019));

# 5. Excluye casos donde fecha_desde sea NA y sobreescribe el data frame.
df_volpre2019 <- df_volpre2019[complete.cases(df_volpre2019$fecha_desde), ]
df_volpre2019;

# 6. Calcula los valores únicos de origen (columna desc_origin) de productos "VACUNO"
# (desc_variedad_2).
df_volpre2019 %>%
  filter(desc_variedad_2=='VACUNO')%>%
  distinct(desc_origen) 

# 7. Selecciona cuatro productos de la columna desc_variedad_2 y extrae los meses en los
# que están disponibles (fecha_desde) y su origen. Hazlo de manera separada para cada
# uno. El data frame final de cada producto tendrá dos columnas. Ordena el data frame
# en base a la columna desc_origin. La función que necesitas es arrange(). Sugerencia. 
# Para seleccionar productos, yo usaría distinct() en la columna y luego haría
# sample_n(4), todo unido con pipes %>%. Lee la documentación sample_n().
library(lubridate);

df_volpre2019_simp <- df_volpre2019 %>%
  arrange(desc_origen) %>% 
  mutate(fecha_desde = as.Date(as.character(fecha_desde), format = "%Y%m%d")) %>%
  distinct(desc_variedad_2, month(fecha_desde)) %>% 
  sample_n(4);
df_volpre2019_simp;

# Ejercicio 8. A partir del data frame storms, generado en la sección dplyr-aggregate, haz los
# siguientes ejercicios:
df_storm <-  read.table("C:/Users/paula/Desktop/CUNEF/ASIGNATURAS/HERRAMIENTAS PROGRAMACIÓN/storm/storms.txt", header = TRUE, sep = "\t")
df_storm;
#   1. ¿Qué observas al aplicar summary()?
summary(df_storm);
#   2. ¿Cuáles son los diferentes valores en la columna name? Crea también un data frame que
#       muestre los nombres distintos.
df_storm_names <- df_storm %>%
  distinct(name);
df_storm_names
#   3. ¿Cuáles son los status diferentes? No crees data frame esta vez: solo muéstralo en
#       consola.
df_storm %>%
  distinct(status);
#   4. ¿Cuáles son las combinaciones de valores disponibles entre status y presión?
df_storm %>%
  distinct(status, pressure);

# Ejercicio 9 (data frame storms). Para storms, depressions y hurricanes que sucedieron
# entre 1975 y 1980, crea una nueva columna con la media y la desviación típica de wind. Crea
# una nueva columna restando la media a wind y dividiendo por la desviación típica. Calcula la
# media y la desviación típica con summarise() de esta nueva columna. ¿Qué ha pasado?

df_storm2 <- df_storm %>% 
  mutate(media_wind = mean(wind)) %>% 
  mutate(dt_wind = sd(wind)) %>% 
  mutate(score = (wind - media_wind) / dt_wind)
df_storm2
df_storm3 <- df_storm2 %>% 
  summarise(mean_score = mean(score),
            sd_score = sd(score))
df_storm3

# Ejercicio 10 (data frame storms).
# 1. Para las filas donde hurricane_force_diameter no sea NA, calcula la presión mínima,
# la mediana, la media y el máximo.
# 2. ¿Hay más filas por encima o por debajo de la media?
df_storm10 <- df_storm %>% 
  filter(!is.na(hurricane_force_diameter)) %>% 
  summarise(
    presion_min = min(pressure),
    presion_mediana = median(pressure),
    presion_mean = mean(pressure),
    presion_max = max(pressure)
  )
df_storm10
#NO LO HE ENTENDIDO, PREGUNTAR A LEO

# Ejercicio 11 (data frame storms). Para los huracanes, calcula la media de
# tropicalstorm_force_diameter. Pista. No es NA.

df_storm11 <- df_storm %>% 
  filter(status== 'hurricane') %>% 
  summarise(media_huracan = min(tropicalstorm_force_diameter, na.rm=TRUE))

df_storm11
#me da 50
