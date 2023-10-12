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
datos_players<-datos_players_2
summary(datos_players)
length(datos_players)

#----------------------------------------------------------
# Analisis descriptivo de los datos
#----------------------------------------------------------
summary(datos_players)
boxplot(datos_players)
boxplot(log(datos_players+1), col='#1874CD')

require(graphics)
pairs(datos_players, panel = panel.smooth, main = "Fifa")

library(TeachingDemos)
stars(datos_players) 

#----------------------------------------------------------
# Matriz de Correlaciones y determinante
#----------------------------------------------------------
round(cor(datos), 3)
cor(datos)
det(cor(datos))

#----------------------------------------------------------
# Autovalores
#----------------------------------------------------------
# cor(datos)
# eigen(cor(datos))

#NO HACE FALTA PONERLO

#----------------------------------------------------------
# Adecuacion del Modelo: Test de Bartlett y KMO
#----------------------------------------------------------
library(psych)
correl<-cor(datos)
cortest.bartlett(correl, n = nrow(datos))
KMO(correl)
#si el analisis tiene sentido, contrastar que estan correlacionadas las variables
#correlacion 0 es igual a variables independientes
#Necesitamos que las variables sean dependientes para poder hacer el test
#R=1 H0
#R!=1 H1 QUEREMOS ACEPTAR LA HIPOTESIS ALTERNATIVA P<0,05

#----------------------------------------------------------
# PCA con 4 componentes vale
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
## Puntuaciones y Biplot DECIDIR CON CUENTOS COMPONENTES NOS TENEMOS QUE QUEDAR
#----------------------------------------------------------
# acp$scores

biplot(acp, cex=0.60)

# Biplot circular
fviz_pca_var(acp, col.var = "blue")

# Calidad de cada variable
fviz_cos2(acp, choice = "var", axes = 1:2)


#----------------------------------------------------------
# Puntuaciones sobre los factores: Se utiliza para construir 
# indices el 3 son los factores con los que nos quedamos 
#varianza*la suma de los factores 

#----------------------------------------------------------
acp$scores[,1:3]

#----------------------------------------------------------
# CLUSTER EN BASE A LOS PAISES

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
# MEJORAR LA INTERPRETACION DEL ANALISIS, SATURAR CADA VARIABLE EN SU FACTOR
# PERMITIR LA INTERPRETACION
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
# F11<-scale(acp$score[,1], center=min(acp$score[,1]), scale=max(acp$score[,1])-min(acp$score[,1]))
# F12<-scale(acp$score[,2], center=min(acp$score[,2]), scale=max(acp$score[,2])-min(acp$score[,2]))
# 
# # Se comprueba que es lo mismo
# plot(F1,F11)
# plot(F2,F12)

#NO SE HACE

# Estos son los pesos de los factores
w1<-acp$sdev[1]^2
w2<-acp$sdev[2]^2
w1
w2
# Estos son los valores de los indices para cada pais
IB_1<-(w1/(w1+w2))*F1+(w2/(w1+w2))*F2 #MEDIA ARITMÉTICA PONDERADA
IB_2<-F1^(w1/(w1+w2))*F2^(w2/(w1+w2)) #MEDIA GEOMETRICA PONDERADA

