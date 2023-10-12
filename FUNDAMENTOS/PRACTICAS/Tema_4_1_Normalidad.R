#-----------------------------------------------------
# Normalidad Salarios
# MUCD Tema 4
#-----------------------------------------------------

# Paquetes 
library(ggplot2)
library(ISLR)
library(patchwork)

# Datos y análisis
data("Wage")
help(Wage)
variable.names(Wage)
str(Wage)
attach(Wage)
head(Wage)

# Variable wage
#si coincidieran seria recto
#h0 normalidad (lo que pasa sin hacer nada) SE RECHAZA CUANDO EL P-VALOR ES <=0,05
#h1 no normal
qqnorm(wage)
qqline(wage)
shapiro.test(wage)
hist(wage)


# Con ggplot2
library("ggplot2")
# Comandos de R
g0<-ggplot(Wage, aes(sample=wage)) +
  stat_qq() +
  stat_qq_line(col="blue")
g0
# Contraste de normalidad de SW
shapiro.test(wage)

# Transformaciones para conseguir normalidad
# Con ggplot2
logwage=log(wage)
sqrtwage=sqrt(wage)

g1<-ggplot(Wage, aes(sample=logwage)) +
  stat_qq() +
  stat_qq_line(col="blue")
g1
shapiro.test(logwage)


g2<-ggplot(Wage, aes(sample=sqrtwage)) +
  stat_qq() +
  stat_qq_line(col="blue")
g2
shapiro.test(sqrtwage)

# Graficos QQ conjuntos
g0/g1/g2
