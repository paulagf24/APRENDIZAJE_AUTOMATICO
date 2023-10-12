#---------------------------------------------------
# MUCD Tema 4
# Calculo de probabilidades variable normal
# La variable representa ventas diarias
#---------------------------------------------------

library(ggplot2)
library(patchwork)

# media ventas
m<-200
# Desviacion tipica ventas
s<-50

#---------------------------------------------------
# P(Ventas<180)
#---------------------------------------------------
pnorm(200, m, s)

#---------------------------------------------------
# P(Ventas>220)
#---------------------------------------------------
1-pnorm(220, m, s)

#---------------------------------------------------
# P(190<Ventas<230)
#---------------------------------------------------
pnorm(230, m, s)-pnorm(190, m, s)

#---------------------------------------------------
# Ventas maximas correspondientes al 15 por ciento de las menores ventas
#---------------------------------------------------

qnorm(0.15, m, s)

#---------------------------------------------------
# Ventas minimas correspondientes al 87 por ciento de las mayores ventas
#---------------------------------------------------

qnorm(1-0.87, m, s)

#---------------------------------------------------
# Simular muestra de taman. 1000
#---------------------------------------------------

set.seed(2022)
vsim<-rnorm(1000,m,s)
vsim
hist(vsim, main="Muestra ventas", xlab="",ylab="")
box()

# Caracteristicas de la muestra

mean(vsim)
sd(vsim)
summary(vsim)

# Dibujo en ggplot

limites<-data.frame(x=c(m-4*s,m+4*s)) 

g1<-ggplot(limites, aes(x = x)) +
  stat_function(fun = dnorm, n = 1000, 
                args = list(mean = m, sd = s), 
                color = "blue", size = 1)+
  ylab("") +
  labs(title = "Densidad Normal", x = "", y = "") 
g1

g2<-ggplot(limites, aes(x = x)) +
  stat_function(fun = pnorm, n = 1000, 
                args = list(mean = m, sd = s), 
                color = "blue", size = 1)+
  ylab("") +
  labs(title = "Distribución Normal", x = "", y = "")
g2

g1/g2

