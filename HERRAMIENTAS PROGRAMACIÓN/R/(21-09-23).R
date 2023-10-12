
#EJERCICIOS

#con el dataframe economics haz una serie temporal de unemploy() (lineas) 
#y añade una capa de columnas con los mismos datos, la serie temporal en las x datos

ggplot(economics) +
  geom_line(aes(date, unemploy))
ggplot(economics,aes(date, unemploy)) +
  geom_line() +
  geom_col(fill='#800080')+
  labs(x="", y="Desempleo",
       title= "Evolución",
       subtitle='Eso no es un país',
       caption='ggplot')

#haz un boxplot de petal.width por cada species y pinta encima todos los puntos correspondientes
#(con geom_jitter en lugar de geom_point)

ggplot(iris) +
  geom_jitter(aes(Petal.Width, Species), color= 'orange')

# Ejercicio 1
# 1a. Echa un ojo al data frame mtcars con glimpse() y ? mtcars. Luego crea un gráfico
# de dispersión de las millas por galón (en eje 𝑦) y el peso (en el eje 𝑥). Para crear el gráfico,
# sustituye los puntos en el siguiente código.
library(mtcars)

ggplot(mtcars) + 
  geom_point(aes(x = wt, y =mpg ))

# 1b. Repite el gráfico anterior, coloreando todos los puntos en rojo. Fíjate en que como el color
# no dependerá de datos del data frame, deberás indicarlo fuera de la función aes().

  ggplot(mtcars) +
   geom_point(aes(x = wt, y =mpg ), colour = "red")
  
# 1c. Repite el mismo gráfico anterior pero coloreando los puntos según su cilindrada (columna disp).
  
  ggplot(mtcars) +
  geom_point(aes(x = wt, y = mpg, colour =cyl))

# 1d. En lugar de colorear los puntos con diferentes colores, haz que tengan un tamaño diferente
# en función de la variable disp.
# ggplot(...) +
#   geom_point(aes(...))
  ggplot(mtcars) +
    geom_point(aes(x = wt, y = mpg, size=disp))
  
  #Ejercicio 2
  # 2a. Los gráficos de dispersión también los puedes usar para datos no continuos. En R, cuando
  # trabajas con datos continuos, normalmente usarás la clase numeric (peso, altura, ingresos,…).
  # Pero hay algunas variables definidas por números que no son continuas (edad, número de
  # cilindros, identificadores). ¿Cuál es la clase del número de cilindros en el conjunto de datos
  # mtcars? Recuerda usar ? mtcars si no sabes cuál es el nombre de columna que tienes que mirar.1
  class(mtcars$cyl)
  
   # 2b. ¿Cuáles son sus valores únicos? Rellena los huecos:
  mtcars %>% distinct(cyl)
  
  # 2c. De acuerdo con sus valores únicos, la clase original de la columna no es la mejor. Prueba a
  # dibujar un gráfico de dispersión de las millas por galón (eje 𝑦) frente al número de cilindros.
  
  ggplot(mtcars) +
     geom_point(aes(cyl,mpg))
  
  # 2d. En el ejercicio anterior, en general, no hay nada malo. Pero el eje 𝑥 muestra valores que
  # no son posibles en el conjunto de datos, como 5 y 7. Esto es porque el número de cilindros
  # debería ser una variable categórica y no una continua. Arreglémoslo. En R, las variables
  # categóricas pertenecen a la clase factor. Puedes fácilmente convertir algunas variables con
  # la función as.factor(). Rellena los huecos para dibujar un gráfico de dispersión como el
  # anterior y compara.
  
  mtcars <- mtcars %>%
     mutate(cyl = as.factor(cyl))
  
  ggplot(mtcars) +
    geom_point(aes(cyl,mpg))
  
  #Ejercicio 3
  # 3a. Con ggplot2 tienes disponible el data frame diamonds. Echa un ojo a su información con
  # ? diamonds y glimpse(diamonds).
  ?diamonds
  glimpse(diamonds)
  d <- diamonds
  
  # 3b. Crea un gráfico de dispersión con el precio de los diamentes (eje 𝑦) frente al peso (eje 𝑥).
  # Hay más de 50.000 diamantes, por lo que puede llevar un poco más de lo esperado.
  ggplot(diamonds) +
    geom_point(aes(carat, price))
  
  # 3c. Hay demasiados puntos, por lo que se superponen y acabamos con una nube un poco
  # incómoda de interpretar. Para arreglarlo, primero reduce el tamaño de todos los puntos.
  # Prueba con size = 0.5.
  ggplot(diamonds) +
    geom_point(aes(carat, price), size= 0.5)
  
  # 3d. Otra cosa que vamos a mejorar. Puedes dar algo de transparencia a los puntos. Esto
  # facilitará la visualización en zonas donde se acumulan muchos puntos. El parámetro para esto
  # se llama alpha (común no solo en R sino en otros lenguajes, como CSS). Este parámetro toma
  # valores entre 0 (invisible) y 1 (opaco). Fija este valor a 0, 1 en el gráfico anterior (en el que
  #indicaste un tamaño también). Esta vez, te toca escribir el código desde cero, pero recuerda
  # que siempre puedes copiar y pegar.
  ggplot(diamonds) +
    geom_point(aes(carat, price), size= 0.1, alpha=0.1)
  
  # 3e. Ahora toca dar algo de color al gráfico. Este color variará en función de la claridad de
  # los diamantes, que es una columna del data frame. Fija también la transparencia en 0, 4, que
  # ayudará a ver los puntos.
  ggplot(diamonds) +
    geom_point(aes(carat, price, color=clarity), size= 0.5, alpha=0.4)
  
  # Ejercicio 4
  # 4a. Creemos un data frame a partir de los datos countries_of_the_world.csv. Usa la
  # función clean_names() del paquete janitor para simplificar los nombres de columnas. Elimina
  # también todas las filas que tengan algún NA. Ahora, haz un gráfico de dispoersión de la columna
  # phones_per_1000 frente a la columna literacy_percent.
  library(janitor)
  df_world <- read.csv('countries_of_the_world.csv')
  clean_names(df_world)
  df_world <- na.omit(df_world) 
  
  ggplot(df_world) +
    geom_point(aes(phones_per_1000, literacy_percent))
  
  # 4b. En el mismo gráfico, colorea cada punto en función de la región.´
  
  ggplot(df_world) +
    geom_point(aes(literacy_percent, phones_per_1000, color=region))
  
  # 4c. Haz otro gráfico de dispersión de la columna service frente a la columna agriculture.
  # Cambia el tamaño de cada punto en función de su población y colorea todos ellos en
  # "darkblue".
  
  ggplot(df_world) +
    geom_point(aes(service, agriculture, size=population ), color='darkblue')
