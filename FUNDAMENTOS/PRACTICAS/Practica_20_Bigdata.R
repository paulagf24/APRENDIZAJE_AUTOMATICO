#----------------------------------------------
# MUCD - Practica 20
# Graficos para big-data
#----------------------------------------------

#r norm(1000,0,1)
rnorm(2,0,1)

#1000 datos, media, desviacion tipica
#----------------------------------------------
# Obtenemos los datos (x,y) por simulacion con 0.7 de correlacion
#----------------------------------------------
set.seed(2023)
# tamano de muestra
n<-100000
# Generar el dataset datos
x<-rnorm(n)
y<-rnorm(n)
# x y estan correlacionados
z<-x+y
#hay correlacion positiva, con tendencia positiva, correlacion 0.7
plot(x,z)
cor.test(x,z)
datos<-data.frame(x,z)
hist(datos[,1])
hist(datos[,2])

#----------------------------------------------
# Paquetes 
#----------------------------------------------

# install.packages("hexbin")
library("ggplot2")
library("hexbin")

#----------------------------------------------
# Graficos de exagonos UNA MANERA DE PONER LOS DATOS MAS BONITOS
#----------------------------------------------
g2 <- ggplot(datos, (aes(x=datos[,1],y=datos[,2])))+
  stat_binhex(color='white')+
  theme_bw()+
  scale_fill_gradient(low='white', high = 'blue')+
  labs(x='variable x', y='variable y')
g2

#----------------------------------------------
# Graficos de contorno
#----------------------------------------------
 ggplot(datos, (aes(x=datos[,1],y=datos[,2])))+
  theme_bw()+
  geom_point(alpha=0.1)+
  geom_density_2d(color='blue')+
  labs(x='variable x', y='variable y')
