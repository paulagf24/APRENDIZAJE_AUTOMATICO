#-----------------------------------------------------
# MUCD - Fundamentos 
# ENCUESTA Wage: Analisis grafico y numerico
#-----------------------------------------------------

library(ISLR)
data("Wage")
help(Wage)
variable.names(Wage)
str(Wage) #Cual es el tipo de variable 
attach(Wage)
head(Wage)

summary(Wage)
mean(wage)
sd(wage)

#-----------------------------------------------------
# Boxplot wage por niveles de un factor
#-----------------------------------------------------
boxplot(wage) #la parte de abajo 1 cuarttil, mediana y cierra con el cuarto cuartil.
par(mfrow=c(2, 2)) 
boxplot(wage ~ education, col=4)
boxplot(wage ~ race, col=3)
boxplot(wage ~ health,col=5)
boxplot(wage ~ maritl,col=2)
par(mfrow=c(1,1))


#-----------------------------------------------------
# Media de la variable wage por niveles de un factor
#-----------------------------------------------------

mean(wage)
by(wage, education, mean)#saber la media de una varible "wage" en base a otra variable "educacion"
wage_education <- by(wage, education,summary)
wage_education
by(wage, maritl,mean)

# Summary

wage_maritl <- by(wage, maritl,summary)

wage_maritl <- by(wage, maritl,fivenum)

wage_maritl

#-----------------------------------------------------
# Variables categoricas y tablas de contingencia
#-----------------------------------------------------

# Una sola variable categorica, antes hay que sacar la tabla cuando son variables categoricas
table(race)
barplot(table(race))

# Dos variables categoricas
t1<-table(race,education)
t1
t2<-table(health,education)
t2
t3<-table(race,education)
t3

chisq.test(t3)$expected#TODAVIA NO LO COMENTO


#---------------------------------------------
# Graficos de una variable segun niveles de la segunda
#---------------------------------------------
library(lattice)

histogram(wage, data = Wage)#nos sale histograma en base al pto y el salario, 
histogram( ~ wage | education, data = Wage)#  |  es un condicional , ~ se utiliza para dos variables

par(mfrow=c(1, 1))

# Graficos bidimensionales

plot(age,wage)

plot(age,wage, col = 2, pch = 20)


#---------------------------------------------
# Graficos de dos variables segun niveles de una tercera
#---------------------------------------------

# Dos variables, este es el de esta libreria, la que se quiere explicar y la que es explicada por ( ~ )
# el smooth es la linea de tendencia de la dispersion de los datos
xyplot(wage ~ age, data = Wage, type=c("p","smooth"), col=3,  pch = 20)

# Dos variables segun niveles de una tercera, incluyendo tendencia
# la p dentro de type=c("p","smooth") 
xyplot(wage ~ age | health, data = Wage, type=c("p","smooth"), col=3,  pch = 20)

xyplot(wage ~ age | race, data = Wage, type=c("p","smooth"), col=3,  pch = 20)

xyplot(wage ~ age | maritl, data = Wage, type=c("p","smooth"), col=3,  pch = 20)

#---------------------------------------------
# Otra forma de seleccionar variables y promediar
# Lo vereis en programacion 
#---------------------------------------------

install.packages("dplyr")                       
library("dplyr")
#primero dataset
# grupos por educacion
# resume y hacer la media
Wage %>%                                        # Especifica data frame
  group_by(education) %>%                       # Especifica grupo 
  summarise_at(vars(wage),                      # Especifica columna
               list(name = mean))   


Wage %>%                                        # Especifica data frame
  group_by(race) %>%                            # Especifica grupo
  summarise_at(vars(wage),                      # Especifica columna
               list(name = mean)) 


#---------------------------------------------

