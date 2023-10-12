#----------------------------------------------------------------------
# MUCD - Clasificacion mediante Naive Bayes - Datos Wages
# Practica 2 
#----------------------------------------------------------------------

library(ISLR)
data("Wage")
help(Wage)
variable.names(Wage)
str(Wage)
attach(Wage)
names(Wage)
head(Wage)
summary(logwage)
hist(logwage)

# Dividimos los salarios en 2 grupos, es mejor coger los percentiles
y<-cut(logwage, breaks = c(3.000, 4.653, 5.763))
labels = c("pobre","rico")

table(y)
ypre<-as.factor(y)

Wage<-Wage[,-c(10,11)]
pie(table(y))


# Dataframe ----------------------------------------------
datos<-data.frame(Wage,ypre)
head(datos)

library(e1071)

#----------------------------------------------------------------------
# Modelo Naive Bayes
#----------------------------------------------------------------------
modelo1 <- naiveBayes(ypre ~ ., data = datos)
modelo1

#----------------------------------------------------------------------
# Prediccion Naive Bayes
#----------------------------------------------------------------------
prediccion <- predict(modelo1, newdata=datos, type = "class")
head(prediccion)
tail(prediccion)

# En terminos de probabilidades
prediccion1 <- predict(modelo1, newdata=datos, type = "raw")
head(prediccion1)
tail(prediccion1)

#----------------------------------------------------------------------
# Matriz de Confusion y Probabilidad de Acierto
#----------------------------------------------------------------------
matrizconfusion <- table(datos$ypre, prediccion)
matrizconfusion

# Porcentaje de aciertos
sum(diag(matrizconfusion))/sum(matrizconfusion)

# Otros paquetes Naive Bayes klaR
