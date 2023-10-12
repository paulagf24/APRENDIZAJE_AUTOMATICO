#-----------------------------------------------------
# MUCD - Fundamentos 2023-24
# ENCUESTA Wage: Analisis grafico con ggplot 2
#-----------------------------------------------------

# Librerias usadas
library(ISLR)
library(ggplot2)
library(tidyverse)

# Datos Wage
data("Wage")
# help(Wage)
variable.names(Wage)
attach(Wage)

# Primeras filas
head(Wage)

# Tipos de variables
str(Wage)
glimpse(Wage)

# Resumen estadístico básico
summary(Wage)

#-----------------------------------------------------
# Histograma, Poligono de frecuencia y densidad wage
#-----------------------------------------------------
ggplot(Wage, aes(x=wage)) #nos aparece solo
ggplot(Wage, aes(x=wage))+ geom_histogram()

# En (0,1)

ggplot(Wage, aes(x=wage))+
  geom_histogram(aes(y=..density..))

# Intervalos y color

ggplot(Wage, aes(x=wage))+
  geom_histogram(bins = 20, color="white", fill="orange")#lo que afecta al histograma cogemos hasta 20

# Titulo y Labels

ggplot(Wage, aes(x=wage))+
  geom_histogram(bins = 20, color="white", fill="orange")+
  labs(title="Distribucion Salarios",
       x="Salarios",
       y="",
       ylim(c(0,620))#esto es oara ver el numero de division de los ejes, como arriba esta el bins=20
                      #no lo ponemos ya que sería repetir
  )

# Incluir densidad, cuando pone geom es añadir capas

ggplot(Wage, aes(x=wage))+
  geom_histogram(aes(y=..density..),
    bins = 20, color="white", fill="orange")+
  labs(title="Distribucion Salarios",
       x="Salarios",
       y="")+
  geom_density(color="blue")



# Facetas: histogramas con densidad segun raza

ggplot(Wage, aes(x=wage))+
  geom_histogram(aes(y=..density..),
                 bins = 20, color="white", fill="blue")+
  geom_density(color="black")+
  facet_grid(~ race)
#facet_grid pone una densidad a cada variable de race

# Ejercicio: Hacerlo con otras facetas

#-----------------------------------------------------
# Poligono de frecuencias
#-----------------------------------------------------

# Poligono geomfreqpoly, ..destinit.. 0,1

ggplot(Wage, aes(x=wage))+
  geom_freqpoly(aes(y=..density..),
                 bins = 20, color="red")+
  geom_density(color="blue")

# Que ocurre?
ggplot(Wage, aes(x=wage))+
  geom_freqpoly(aes(y=..density..),
                bins = 20, color="red")

# Con facetas
ggplot(Wage, aes(x=wage))+
  geom_freqpoly(aes(y=..density..),
                bins = 20, color="red")+
  geom_density(color="blue")+
  facet_grid(~ race)

# Con un Theme
ggplot(Wage, aes(x=wage))+
  geom_freqpoly(aes(y=..density..),
                bins = 20, color="red")+
  geom_density(color="blue")+
  facet_grid(~ race)+
  theme_classic()

#-----------------------------------------------------
# Boxplot de la variable wage y por niveles de un factor
#-----------------------------------------------------

# Boxplot wage

ggplot(Wage, aes(x=0,y=wage))+
  geom_boxplot()

# Boxplot wage segun niveles de un factor

ggplot(Wage, aes(x=race, y=wage, fill= race))+
  geom_boxplot()+
  labs(x="Raza", y="Salario", fill="Raza")

# Boxplot wage segun niveles de un factor y colores

ggplot(Wage, aes(x=race, y=wage, fill= race))+
  geom_boxplot()+
  labs(x="Raza", y="Salario", fill="Raza")

# Girar

ggplot(Wage, aes(x=race, y=wage, fill= race))+
  geom_boxplot()+
  labs(x="Raza", y="Salario", fill="Raza")+
  coord_flip()


# Incluir datos (geometria jitter)

ggplot(Wage, aes(x=race, y=wage, fill= race))+
  geom_boxplot()+
  labs(x="Raza", y="Salario", fill="Raza")+
  coord_flip()+
  geom_jitter(width = 0.1, alpha=0.2)


# Violin
ggplot(Wage, aes(x=education, y=wage))+
  geom_violin()

ggplot(Wage, aes(x=education, y=wage, fill=education))+ geom_violin()
