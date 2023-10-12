#------------------------------------------------------------
# MUCD - Fundamentos Algebra
# Operaciones de matrices
#------------------------------------------------------------

#------------------------------------------------------------
# Practica 1 Operaciones basicas de matrices
#------------------------------------------------------------

A <- matrix(c(3,5,-4,5,7,8,8,1,-3), ncol=3,nrow=3)
B <- matrix(c(-4,7,9,3,5,9,0,5,-2), ncol=3,nrow=3)
A
B

# Combinaciones lineales
A + 3*B
2*A - B

# Productos %*% es la multplicacion de matrices
t(A) %*% B
t(B) %*% A

t(t(B) %*% A)

# Inversas
solve(A)
solve(B)

# Comprobar, round es redondear
round(B %*% solve(B),2)
round(B %*% solve(B),2)

# Medias filas y columnas de A y B

rowMeans(A) 
rowMeans(B) 
colMeans(A)
colMeans(B)

#------------------------------------------------------------
# Practica 3 Resolucion de sistemas de ecuaciones
#------------------------------------------------------------


rm(list=ls())
A <- matrix(c(3,8,5,-1,4,1,-2,4,1), ncol=3,nrow=3)
A
x<-c(2,3,7)

# Rango de A
qr(A)$rank
# Solucion sistema
solve(A,x)

