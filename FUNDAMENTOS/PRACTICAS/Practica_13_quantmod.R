#------------------------------------------------------------
# MUCD - Fundamentos
# Paquete quantmod
#------------------------------------------------------------

install.packages("quantmod")
library(quantmod)

#-------------------------------------------------------
# Serie y periodo
#-------------------------------------------------------
getSymbols("AMZN", from="2019-01-01", to="2023-09-010")
barChart(AMZN,theme = "white.mono")

#-------------------------------------------------------
# Rendimientos
#-------------------------------------------------------
AMZN$AMZN.Adjusted
RendAMZN <- diff(log(AMZN$AMZN.Adjusted))[-1]
tail(RendAMZN)
plot(RendAMZN, main="AMZN(Rend.Diarios)")

#-------------------------------------------------------
# Medidas Estadisticas
#-------------------------------------------------------
mean(RendAMZN)
summary(RendAMZN)
library(moments)
c(skewness(RendAMZN),kurtosis(RendAMZN))

#-------------------------------------------------------
# Histograma y kernel
#-------------------------------------------------------
hist(RendAMZN)
hist(RendAMZN, col = "lightblue", probability = "T",ylim=c(0,25))
lines(density(RendAMZN), ylim=c(0,25))
box(lwd=1)  
