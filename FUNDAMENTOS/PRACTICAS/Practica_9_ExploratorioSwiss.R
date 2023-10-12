#-----------------------------------------------------------------
# MUCD - Fundamentos
# Fichero Swiss
# Analisis exploratorio multivariante. Visualizacion multivariante
#-----------------------------------------------------------------

data(swiss)
names(swiss)
help(swiss)
swiss

X <- as.data.frame(swiss)

#------------------------------------------------------------------------
# Numero de provincias nX y numero de variables pX
#------------------------------------------------------------------------

dim(X)

nX <- nrow(X)
nX
pX <- ncol(X)
pX

#------------------------------------------------------------------------
# Visualizacion datos
#------------------------------------------------------------------------

#------------------------------------------------------------------------
# Diagramas de caja de variables
#------------------------------------------------------------------------
# selecciona la primera variable, columna
x[,1]

hist(X[,1])

# Veremos dos procedemientos: mediante un bucle y mediante un vector
# sapply aplica una funcion a una lista y la hace vector

par(mfrow=c(2,3)) # ha dividido en 2 filas y 3 columnas

# el for tiene que tener un contador
for (j in 1:6) { print(j^2+j+1)
}
#for para la j de 1 a 6 [,j] van aparecer 6 boxplot dentro{} poner histograma boxplot, 
#la j se pone como una variable normal´
# main el titulo, xlab el eje x y la col, columnas
par(mfrow=c(2,3))
for (j in 1:6) {
  boxplot(X[,j],main=colnames(X)[j],xlab="",col="orange")
}

#sapply es igual que el for, se hace igual
sapply(seq(1,6),function(j)boxplot(X[,j],main=colnames(X)[j],xlab="",col="orange"))

#------------------------------------------------------------------------
# Histogramas con  optimo binwidth con metodo de Sturges 
#------------------------------------------------------------------------

par(mfrow=c(2,3))

for (j in 1:6) {
  hist(X[,j],main=colnames(X)[j],xlab="",col="orange",breaks = "Sturges")
}

#------------------------------------------------------------------------
# Estimacion Kernel para las variables con el optimal bandwidth con kernel Gaussiano
#------------------------------------------------------------------------
#KERNELL ES MEJOR
par(mfrow=c(2,3))

for (j in 1:6) {
  plot(density(X[,j],kernel="gaussian"),main=colnames(X)[j],xlab="",col="orange",lwd=2)
}

#-----------------------------------------------------------------
# Estimacion Kernel con nucleos Gaussiano y Epanechnikov
#-----------------------------------------------------------------
#KERNELL NO HARIA FALTA PONERLO TE PONE DIRECTAMENTE EL KERNELL, HISTOGRAMA SUAVIZADO EL DENSITY
par(mfrow=c(2,3))
for (j in 1:6) {
  plot(density(X[,j],kernel="gaussian"),main=colnames(X)[j],xlab="",col="orange",lwd=1)
  lines(density(X[,j],kernel="epanechnikov"),main=colnames(X)[j],xlab="",col="blue",lwd=1)
  }

#-----------------------------------------------------------------
# Scatterplot Fertility,Agriculture
#-----------------------------------------------------------------

attach(X)

par(mfrow=c(1,1))

plot(Fertility,Agriculture)


plot(Fertility,Agriculture,pch=19,col="blue",xlab="Fertility",ylab="Agriculture")

#-----------------------------------------------------------------
# 3D-Scatterplots  Fertility, Agriculture, Education
#-----------------------------------------------------------------

library(scatterplot3d)
scatterplot3d(Fertility,Agriculture,Education,pch=19,color="blue") 
scatterplot3d(Fertility,Agriculture,Education,pch=19,color="blue",type="h")

library(rgl)
open3d() # Abre ventana en 3 dimensiones
plot3d(Fertility,Agriculture,Education,size=5) # Se giran las variables


#-----------------------------------------------------------------
# Scatterplot para todas las variables de Swiss
#-----------------------------------------------------------------

pairs(X,pch=19,col="orange")

#-----------------------------------------------------------------
# Coordenadas paralelas para las variables de Swiss
#-----------------------------------------------------------------

library(MASS)
parcoord(X,col="orange",var.label = TRUE)

#-----------------------------------------------------------------
# Medidas multivariantes
#-----------------------------------------------------------------

# Vector de medias

muX <- colMeans(X)
muX


#-----------------------------------------------------------------
# Matriz e covarianzas y autovalores
#-----------------------------------------------------------------

SX <- cov(X)
SX

# Autovalores y autovectores de S
eigen(SX) 
eigen(SX)$values
sum(eigen(SX)$values) # Traza de S
det(SX)

RX <- cor(X)
RX

# Autovalores y autovectores de R
eigen(RX) 
eigen(RX)$value
sum(eigen(RX)$values) # Traza de S
det(RX) 

# Vector de medias de un subconjunto, DIBUJA INDIVIDUOS

muX1 <- colMeans(X[,1:3])
muX1


#-----------------------------------------------------------------
# Diagrama de Caras de Chernoff y de Estrellas
#-----------------------------------------------------------------
#Representar individuos por caras
library(TeachingDemos)
faces2(swiss)
faces2(swiss[1:12,])

#Representar individuos por estrellas, cada variable es una arista
stars(swiss)
stars(swiss[1:12,])


#-----------------------------------------------------------------
# Coplot (dos variables en terminos de una variable extra)
#-----------------------------------------------------------------

coplot(swiss$Fertility ~ swiss$Agriculture |swiss$Education)

#-----------------------------------------------------------------
# Estandarizacion multivatiante de Swiss
#-----------------------------------------------------------------

pairs(X,pch=19,col="orange")

# Estandarizacion univariante

sX <- scale(X)

pairs(sX,pch=19,col="orange")
