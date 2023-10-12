###########################
## ggplot2 and dataviz   ##
## Leonardo Hansa        ## 
## September 2021        ## 

## First steps into dataviz ---------------------------
#secuencia de 0 a 1 de 0.01 cada vez que se eleva

seq(as.Date('2022-01-01'), as.Date('2023-01-01'), by='week')
plot(sample(seq(0, 1, by = 0.01)))
plot(iris)

library(ggplot2)
#dibujo vacio, objeto que le voy añadiendo cosas
ggplot()
ggplot(iris) +
geom_point(aes(x= Sepal.Length, y =Sepal.Width))

P <- ggplot()
class(P)

P

# - Data
# - The axis QUE HAY EN LOS EJES??, ESTETICA
# - Aesthetics
# - Labelling
# - Distribution on the board
# - ...


# Scatter plots-----------------------------------------------------------
#aes es poner la estetica del ggplot
ggplot(iris)

ggplot(iris) + 
  geom_point(aes(x = Sepal.Length, y = Sepal.Width))

ggplot(iris) + 
  geom_point(aes(x = Sepal.Length,
                 y = Sepal.Width, ´
                 colour = Species))

# ggplot(iris) + 
#   geom_point(aes(x = Sepal.Length, y = Sepal.Width), colour = Species)
# Error in layer(data = data, mapping = mapping, stat = stat, geom = GeomPoint, : object 'Species' not found

#si el elemento estetico no depende de los datos ponerlo fuera del aes()
#ejes
#colores
#formas
#grosor

ggplot(iris) + 
  geom_point(aes(x = Sepal.Length, y = Sepal.Width),
             colour = "darkblue")

ggplot(iris) + 
  geom_point(aes(x = Sepal.Length,
                 y = Sepal.Width,
                 colour = Species),
                 size = 2,
                 shape=4)

# Column plots ------------------------------------------------------------
library(dplyr)
#para cada especie calculo las medias de dos columnas
iris2plot <- iris %>% 
  group_by(Species) %>% 
  summarise(avg_petal_length = mean(Petal.Length), 
            avg_petal_width = mean(Petal.Width))

iris2plot

ggplot(iris2plot) + 
  geom_col(aes(x = Species, y = avg_petal_length))

#fill rellenar las barras
ggplot(iris2plot) + 
  geom_col(aes(x = Species, y = avg_petal_length), 
           fill = "#F47C00")
#col es el borde de una barra
ggplot(iris2plot) + 
  geom_col(aes(x = Species, y = avg_petal_length), 
           col = "#F47C00")

# Line plots --------------------------------------------------------------
glimpse(economics)

# Notice that you can include the aes() functions inside geom_line() or ggplot()
ggplot(economics) +
  geom_line(aes(date, unemploy))

# hmmm
ggplot(economics) + 
  geom_line(aes(date, unemploy)) + 
  geom_line(aes(date, uempmed))

#reescalar dos variables
scaled_economics <- economics %>% 
  select(date, unemploy, uempmed) %>% 
  mutate(unemploy = unemploy / max(unemploy), 
         uempmed = uempmed / max(uempmed))

ggplot(scaled_economics) + 
  geom_line(aes(date, unemploy)) + 
  geom_line(aes(date, uempmed))

ggplot(scaled_economics) + 
  geom_line(aes(date, unemploy), colour='blue') + 
  geom_line(aes(date, uempmed), colour='red')

glimpse(economics_long)

ggplot(economics_long) +
  geom_line(aes(x = date, y = value01))

ggplot(economics_long) +
  geom_line(aes(x = date, y = value01, group = variable))

ggplot(economics_long) +
  geom_line(aes(x = date, y = value01, colour = variable))
 
