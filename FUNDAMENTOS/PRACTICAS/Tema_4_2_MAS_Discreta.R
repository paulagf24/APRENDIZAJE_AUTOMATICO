#--------------------------------------------------------
# Simulacion de distribucion discreta mediante sample
# MUCD Tema 4
#--------------------------------------------------------
# Valores: c(-2,-1,0,1,2)
# Probabilidades: c(0.14,0.25,0.3,0.2,0.1)

library(moments)

# Simular datos desde sample()
m1<-sample(c(-2,-1,0,1,2), 10000, replace = T, 
           prob = c(0.14,0.25,0.3,0.2,0.1))

# Momentos
mean(m1)
sd(m1)
skewness(m1)
kurtosis(m1)

# Tabla y graficos
table(m1)/length(m1)
barplot(table(m1), main="valores", col="green")
box()
