#----------------------------------------------------------
# MUCD: Tema 3 
# Practica PCA - Datos de Felicidad 2017
# Objetivo: Construir un Indice de Bienestar
# http://worldhappiness.report/ed/2017/
#----------------------------------------------------------

datos<-read.table("happiness.txt",header=T)
names(datos)

# Paquetes
library(ggplot2)
library(ggcorrplot)
library('corrr')
library("FactoMineR") 
library("factoextra")

#----------------------------------------------------------
# Comenzamos con Nueva Base de Datos prescindiendo de: 
# HappinessScore; Whisker_high; Whisker_low 
#----------------------------------------------------------

H_S<-datos$HappinessScore
summary(H_S)
hist(H_S)

datos2<-data.frame(datos$HappinessScore,
                   datos$GDP_PC, 
                   datos$Social_support, 
                   datos$Healthy_life_expectancy,
                   datos$Freedom_to_make_life_choices,
                   datos$Generosity,
                   datos$Perceptions_of_corruption,
                   datos$Dystopia_residual)
datos<-datos2
summary(datos)
length(datos)

#----------------------------------------------------------
# Analisis descriptivo de los datos
#----------------------------------------------------------
summary(datos)
boxplot(datos)
boxplot(log(datos+1))

require(graphics)
pairs(datos, panel = panel.smooth, main = "Felicidad")

library(TeachingDemos)
stars(datos) # Datos de paises

#----------------------------------------------------------
# Matriz de Correlaciones y determinante
#----------------------------------------------------------
round(cor(datos), 3)
cor(datos)
det(cor(datos))

#----------------------------------------------------------
# Autovalores
#----------------------------------------------------------
cor(datos)
eigen(cor(datos))

#----------------------------------------------------------
# Adecuacion del Modelo: Test de Bartlett y KMO
#----------------------------------------------------------
library(psych)
correl<-cor(datos)
cortest.bartlett(correl, n = nrow(datos))
KMO(correl)

#----------------------------------------------------------
# PCA
#----------------------------------------------------------
acp <- princomp(datos, cor=TRUE)
summary(acp) 

#----------------------------------------------------------
# Grafico de codo-Sedimentacion scree-plot
#----------------------------------------------------------
fviz_eig(acp, addlabels = TRUE)


#----------------------------------------------------------
# FACTORES: Cargas Factoriales
# Los Comp. tienen que inerpretarse
#----------------------------------------------------------
loadings(acp)

#----------------------------------------------------------
## Puntuaciones y Biplot
#----------------------------------------------------------
# acp$scores

biplot(acp, cex=0.60)

# Biplot circular
fviz_pca_var(acp, col.var = "blue")

# Calidad de cada variable
fviz_cos2(acp, choice = "var", axes = 1:2)


#----------------------------------------------------------
# Puntuaciones sobre los factores: Se utiliza para construir 
# indices
#----------------------------------------------------------
acp$scores[,1:3]

#----------------------------------------------------------

library(ggfortify)

pcagrafico1<-prcomp(datos, scale. = TRUE)

autoplot(pcagrafico1)
autoplot(pcagrafico1, data=datos, loadings=TRUE,
         loadings.label=TRUE)


#----------------------------------------------------------
# Graficos Puntuaciones
#----------------------------------------------------------
score<-acp$scores[,1:3]

plot(score[,1], score[,2], type='n')
text(score[,1], score[,2], labels=rownames(datos), lwd=1,cex=0.50)

plot(score[,1], score[,3], type='n')
text(score[,1], score[,3], labels=rownames(datos), lwd=1,cex=0.50)

plot(score[,2], score[,3], type='n')
text(score[,2], score[,3], labels=rownames(datos), lwd=1,cex=0.50)

#----------------------------------------------------------
# Rotacion varimax
# Muchas veces ayudan a la interpretacion de los factores
#----------------------------------------------------------
library(psych)

acp.varimax <- principal(datos, nfactors=3, rotate="varimax", scores=TRUE)
summary(acp.varimax)
# FACTORES: Interpretacion mas facil
loadings(acp.varimax)

acp.varimax2 <- principal(datos, nfactors=4, rotate="varimax", scores=TRUE)
summary(acp.varimax2)
loadings(acp.varimax2)

#----------------------------------------------------------
# Puntuaciones y Biplot Varimax
#----------------------------------------------------------
acp.varimax$scores 
biplot(acp.varimax) 

#----------------------------------------------------------
# Construir dos Indices I_1 e I_2 segun la metodologia estudiada
# -Correlacion
# -Grafica
# -Spearman
#----------------------------------------------------------

# Normalizar los factores
F1<-(acp$score[,1]-min(acp$score[,1]))/(max(acp$score[,1])-min(acp$score[,1]))
F2<-(acp$score[,2]-min(acp$score[,2]))/(max(acp$score[,2])-min(acp$score[,2]))

# Otra forma de hacerlo con scale()
F11<-scale(acp$score[,1], center=min(acp$score[,1]), scale=max(acp$score[,1])-min(acp$score[,1]))
F12<-scale(acp$score[,2], center=min(acp$score[,2]), scale=max(acp$score[,2])-min(acp$score[,2]))

# Se comprueba que es lo mismo
plot(F1,F11)
plot(F2,F12)

# Estos son los pesos de los factores
w1<-acp$sdev[1]^2
w2<-acp$sdev[2]^2
w1
w2
# Estos son los valores de los indices para cada pais
IB_1<-(w1/(w1+w2))*F1+(w2/(w1+w2))*F2
IB_2<-F1^(w1/(w1+w2))*F2^(w2/(w1+w2))

