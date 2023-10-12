
# Ejercicio 1. Crea una función cuyo argumento será una ruta a alguno de los
# ficheros CO. La función devolverá la mediana de los datos de CO de ese fichero
# para cada mes

df_ans <- read.delim('CO_2017.csv', sep=',')

funcion_median <- function(ruta){read.table(ruta, header=TRUE)%>% 
    group_by(mes) %>% 
    summarize(mean=mean(Income)) %>% 
    ggplot(aes(x = Gender, y = mean )) +
    geom_bar(stat = "identity", fill=color_fill) +
    facet_wrap(~Ethnicity, scales = "free_y") +
    labs(x = "Gender", y = "Income") +
    ggtitle(titulo)}

# Ejercicio 2. Crea una función cuyo argumento será una ruta a alguno de los
# ficheros NO2. La función devolverá la media y desviación típica 
# de los datos de NO2 de ese fichero para estacion

# Ejercicio 3. Para el conjunto de datos anscombe_largo, crea una 
# función que reciba dos argumentos: uno será uno de los 
# conjuntos de datos indicado en la columna dataset del data frame, 
# y otro será un color. La función pintará un gráfico de 
# dispersión para ese conjunto de datos con ese color

# Ejercicio 4. Para el conjunto de datos anscombe_largo, crea una
# función que reciba dos argumentos: uno será un color y otro será
# un título. Crea un gráfico de dispersión que muestre en un mismo
# cuadro los cuatro conjuntos de datos anscombe, todos ellos pintados
# con ese color y con el título dado por el argumento

