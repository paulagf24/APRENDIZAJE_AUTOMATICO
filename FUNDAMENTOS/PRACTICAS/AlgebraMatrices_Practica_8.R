#--------------------------------------------------
# MUCD - Fundamentos Algebra para ciencias de datos
# Autovalores y autovectores
# Descomposicion Espectral
#--------------------------------------------------

A <- matrix(c(8, -2, -3, -2, 11, 4, -3, 4, 5),3,3)
A

#--------------------------------------------------
# Descomposicion Espectral
#--------------------------------------------------

evA<-eigen(A)
evA
avalores<-evA$values
avalores
avectores<-evA$vectors
avectores

#--------------------------------------------------
# Comprobacion Descomposicion espectral
# Comprobacion Ortogonalidad
#--------------------------------------------------

D <- diag(avalores)
avectores %*% D %*% t(avectores) 

round(evA$vectors %*% t(evA$vectors),9)

#--------------------------------------------------
# Determinante de la Matriz
#--------------------------------------------------

det(A)
prod(avalores)

#--------------------------------------------------
# Traza de A
#--------------------------------------------------

sum(avalores)

#--------------------------------------------------
# Rango de la matriz
#--------------------------------------------------

sum(avalores != 0)

#--------------------------------------------------
# Autovalores de A^(-1) =1/autovalores(A)
#--------------------------------------------------

AInv <- solve(A)
AInv
round(A%*%AInv,9)
eigen(AInv)
eigen(AInv)$values
1/avalores

#--------------------------------------------------
# Autovalores de A^(2) =autovalores(A^2)
#--------------------------------------------------

A2 <- A%*%A
eigen(A2)$values
eigen(A)$values^2

