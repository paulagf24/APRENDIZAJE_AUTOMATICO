#----------------------------------------------------------
# TRABAJO 2
# Paula González y Regina Sánchez-Cuenca
#----------------------------------------------------------
# Paquetes
library(ggplot2)
library(ggcorrplot)
library('corrr')
library("FactoMineR") 
library("factoextra")

datos_players <- read.csv("players_22.csv")
names(datos_players)
summary(datos_players)

#----------------------------------------------------------
# Comenzamos con Nueva Base de Datos prescindiendo de: 
# HappinessScore; Whisker_high; Whisker_low 
#----------------------------------------------------------

datos_players_2<-data.frame(datos_players$sofifa_id,
                            datos_players$overall,
                            datos_players$value_eur,
                            datos_players$wage_eur,
                            datos_players$age,
                            datos_players$league_level,
                            datos_players$skill_moves)
colnames(datos_players_2) <- c('id', 'overall', 'value', 'wage', 'age', 'league_level', 'skill')
datos_players<-datos_players_2
summary(datos_players)
length(datos_players)
datos_players <- na.omit(datos_players)
#----------------------------------------------------------
# Analisis descriptivo de los datos
#----------------------------------------------------------
summary(datos_players)
boxplot(datos_players)
boxplot(log(datos_players+1), col='#c6c3e0ff')

require(graphics)
pairs(datos_players, panel = panel.smooth, main = "Fifa")

#----------------------------------------------------------
# Matriz de Correlaciones y determinante
#----------------------------------------------------------
round(cor(datos_players), 3)
cor(datos_players)
det(cor(datos_players))

#----------------------------------------------------------
# Adecuacion del Modelo: Test de Bartlett y KMO
#----------------------------------------------------------
library(psych)
correl<-cor(datos_players)
cortest.bartlett(correl, n = nrow(datos_players))
KMO(correl)
#si el analisis tiene sentido, contrastar que estan correlacionadas las variables
#correlacion 0 es igual a variables independientes
#Necesitamos que las variables sean dependientes para poder hacer el test
#R=1 H0
#R!=1 H1 QUEREMOS ACEPTAR LA HIPOTESIS ALTERNATIVA P<0,05

#----------------------------------------------------------
# PCA con 4 componentes vale
#----------------------------------------------------------
pca <- princomp(datos_players, cor=TRUE)
summary(pca) 
#----------------------------------------------------------
# Grafico de codo-Sedimentacion scree-plot
#----------------------------------------------------------
library(factoextra)
fviz_eig(pca, addlabels = TRUE)

#----------------------------------------------------------
# FACTORES: Cargas Factoriales
# Los Comp. tienen que inerpretarse
#----------------------------------------------------------
loadings(pca)
#----------------------------------------------------------
## Puntuaciones y Biplot 
#----------------------------------------------------------
# acp$scores
library(ggplot2)
library(dplyr)
biplot <- biplot(pca, cex=0.60)


# Biplot circular
fviz_pca_var(pca, col.var = "#9492a3ff")

# Calidad de cada variable
fviz_cos2(pca, choice = "var", axes = 1:2)


#----------------------------------------------------------
# Puntuaciones sobre los factores: Se utiliza para construir 
# indices el 3 son los factores con los que nos quedamos 
#varianza*la suma de los factores 

#----------------------------------------------------------
pca$scores[,1:4]

#----------------------------------------------------------
# CLUSTER EN BASE A LOS PAISES

library(ggfortify)

pcagrafico1<-prcomp(datos_players, scale. = TRUE)

autoplot(pcagrafico1)
autoplot(pcagrafico1, data=datos_players, loadings=TRUE,
         loadings.label=TRUE)


#----------------------------------------------------------
# Graficos Puntuaciones
#----------------------------------------------------------
score<-pca$scores[,1:4]

plot(score[,1], score[,2], type='n')
text(score[,1], score[,2], labels=rownames(datos_players), lwd=1,cex=0.50)

plot(score[,1], score[,3], type='n')
text(score[,1], score[,3], labels=rownames(datos_players), lwd=1,cex=0.50)

plot(score[,1], score[,4], type='n')
text(score[,1], score[,4], labels=rownames(datos_players), lwd=1,cex=0.50)

plot(score[,2], score[,3], type='n')
text(score[,2], score[,3], labels=rownames(datos_players), lwd=1,cex=0.50)

plot(score[,2], score[,4], type='n')
text(score[,2], score[,4], labels=rownames(datos_players), lwd=1,cex=0.50)

plot(score[,3], score[,4], type='n')
text(score[,3], score[,4], labels=rownames(datos_players), lwd=1,cex=0.50)

#----------------------------------------------------------
# Rotacion varimax
# Muchas veces ayudan a la interpretacion de los factores
# MEJORAR LA INTERPRETACION DEL ANALISIS, SATURAR CADA VARIABLE EN SU FACTOR
# PERMITIR LA INTERPRETACION
#----------------------------------------------------------
library(psych)

pca.varimax <- principal(datos_players, nfactors=4, rotate="varimax", scores=TRUE)
summary(pca.varimax)
# FACTORES: Interpretacion mas facil
loadings(pca.varimax)

#----------------------------------------------------------
# Puntuaciones y Biplot Varimax
#----------------------------------------------------------
pca.varimax$scores 
biplot(pca.varimax) 

#----------------------------------------------------------
# Construir dos Indices I_1 e I_2 segun la metodologia estudiada
# -Correlacion
# -Grafica
# -Spearman
#----------------------------------------------------------

# Normalizar los factores
F1<-(pca$score[,1]-min(pca$score[,1]))/(max(pca$score[,1])-min(pca$score[,1]))
F2<-(pca$score[,2]-min(pca$score[,2]))/(max(pca$score[,2])-min(pca$score[,2]))
F3<-(pca$score[,3]-min(pca$score[,3]))/(max(pca$score[,3])-min(pca$score[,3]))
F4<-(pca$score[,4]-min(pca$score[,4]))/(max(pca$score[,4])-min(pca$score[,4]))

# Otra forma de hacerlo con scale()
# F11<-scale(acp$score[,1], center=min(acp$score[,1]), scale=max(acp$score[,1])-min(acp$score[,1]))
# F12<-scale(acp$score[,2], center=min(acp$score[,2]), scale=max(acp$score[,2])-min(acp$score[,2]))
# 
# # Se comprueba que es lo mismo
# plot(F1,F11)
# plot(F2,F12)

#NO SE HACE

#QUE PESOS ASIGANAMOS A CADA COMPONENTE

 # Estos son los pesos de los factores
 w1<-pca$sdev[1]^2
 w2<-pca$sdev[2]^2
 w3<-pca$sdev[3]^2
 w4<-pca$sdev[4]^2
 
 #lo hago ahora queda añadir el w3 y w4
 w1
 w2
 w3
 w4
 # Estos son los valores de los indices para cada pais
 IB_1<-(w1/(w1+w2+w3+w4))*F1+(w2/(w1+w2+w3+w4))*F2+(w3/(w1+w2+w3+w4))*F3+(w4/(w1+w2+w3+w4))*F4 #MEDIA ARITMÉTICA PONDERADA
 IB_1
 IB_2<-F1^(w1/(w1+w2))*F2^(w2/(w1+w2)) #MEDIA GEOMETRICA PONDERADA

 