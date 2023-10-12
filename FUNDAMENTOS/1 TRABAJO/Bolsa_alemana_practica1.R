#-----------------------------------------------------------------
# Lectura datos Yahoo Finance en formato csv, 
# Construir dataframes y algunos analisis
# MUCD 2023-24
# Paula González y Regina Sánchez-Cuenca
#-----------------------------------------------------------------

library(ggplot2)
library(corrplot)
library(readr)
library(dplyr)
library(Hmisc)
library(janitor) # limpieza de datos
library(patchwork)

rm(list=ls())


# Lectura de datos de Yahoo Finance en formato csv
df_vw <- read.csv(file="VOW3.DE.csv", header = TRUE, sep = "," ,dec = ".")
df_daim <- read.csv(file="DTG.DE.csv", header = TRUE, sep = "," ,dec = ".")
df_dax <- read.csv(file="^GDAXI.csv", header = TRUE, sep = "," ,dec = ".")
       

# clean names
datos_vw <- clean_names(df_vw)
datos_daim <- clean_names(df_daim)
datos_dax <- clean_names(df_dax)

# Columna 6
attach(datos_vw)
names(datos_vw)
VW<-datos_vw[,6]

attach(datos_daim)
names(datos_daim)
DAIM<-datos_daim[,6]

attach(datos_dax)
names(datos_dax)
DAX<-datos_dax[,6]

# Construccion DF

# Data frame
df_coches <- data.frame(date, VW, DAIM, DAX)
head(df_coches)
tail(df_coches)

#Eliminamos las filas que contengan algun valor NA
#Hemos pasado de 455 filas a 450, primero hemos tenido que eliminar
#las filas que contengan valores null
df_coches_sin_null <- df_coches[!apply(df_coches, 1, function(x) any(x == "null")), ]
df_coches_sin_null
df_coches_sin_na <- na.omit(df_coches_sin_null)


# El siguiente paso es cambiar la clase de las variables 
#para que sean numericas y una date
df_coches_sin_na$DAIM <- as.numeric(df_coches_sin_na$DAIM)
df_coches_sin_na$VW <- as.numeric(df_coches_sin_na$VW)
df_coches_sin_na$date <- as.Date(df_coches_sin_na$date)
sapply(df_coches_sin_na, class)

#Cambiamos el nombre del date frame a df_coches
df_coches<- df_coches_sin_na

#Creamos una nueva variable que separe el dataframe en dos etapas distintas
df_coches <- df_coches%>% 
  mutate(
    fases = case_when(
      date < "2022-06-12" ~ "fase 1",
      date >= "2022-06-12" & date < "2023-09-21" ~ "fase 2",
      TRUE ~ "fase 2"  
    )) 
head(df_coches)
tail(df_coches)


# Series Temporales 
gVW<-ggplot(df_coches, aes(x=date, y=VW, col = fases))+
  geom_line()
gDAIM<-ggplot(df_coches, aes(x=date, y=DAIM, col = fases))+
  geom_line()
gDAX<-ggplot(df_coches, aes(x=date, y=DAX, col = fases))+
  geom_line()
gVW
gDAIM
gDAX
gVW/gDAIM/gDAX

# Anadir tendencia
ggvw<-ggplot(df_coches, aes(x=date, y=VW))+
  geom_line()+
  stat_smooth(method="loess", color="blue", fill="blue")
ggdaim<-ggplot(df_coches, aes(x=date, y=DAIM))+
  geom_line()+
  stat_smooth(method="loess", color="red", fill="red")
ggdax<-ggplot(df_coches, aes(x=date, y=DAX))+
  geom_line()+
  stat_smooth(method="loess", color="green", fill="green")

ggvw/ggdaim/ggdax


# BoxPlot
gVW1<-ggplot(df_coches)+
  geom_boxplot(aes(x=date, y=VW, fill = fases))
gDAIM1<-ggplot(df_coches)+
  geom_boxplot(aes(x=date, y=DAIM, fill = fases))
gDAX1<-ggplot(df_coches)+
  geom_boxplot(aes(x=date, y=DAX, fill = fases))

gVW1 / gDAIM1 / gDAX1

# Rendimientos
n <- dim(df_coches)[1]
RDAX <- DAX[2:n]/DAX[1:n-1] - 1
RVW <- df_coches$VW[2:n] / df_coches$VW[1:(n-1)] -1
RDAIM <- df_coches$DAIM[2:n] / df_coches$DAIM[1:(n-1)] -1
date <- date[2:n]

RVW
RDAIM
RDAX
date

# Data frame Rendimientos, quitamos los NA del nuevo data frame de rendimientos
rdatos_coches<-data.frame(date, RDAIM, RVW, RDAX)
head(rdatos_coches)
tail(rdatos_coches)
rdatos_coches_sin_na <- na.omit(rdatos_coches)
rdatos_coches<- rdatos_coches_sin_na

# Fechas
rdatos_coches <- rdatos_coches%>% 
  mutate(
    fases = case_when(
      date < "2022-06-12" ~ "fase 1",
      date >= "2022-06-12" & date < "2023-09-21" ~ "fase 2",
      TRUE ~ "fase 2"  
    )) 
head(rdatos_coches)
tail(rdatos_coches)
#Cambiamos la variable date a clase date
rdatos_coches$date <- as.Date(rdatos_coches$date)
class(rdatos_coches$date)

# graficos temporales de los rendimientos
g31<-ggplot(rdatos_coches)+
  geom_line( aes(x=date, y=RVW, col = fases))
g32<-ggplot(rdatos_coches)+
  geom_line(aes(x=date, y = RDAIM, col = fases))
g33<-ggplot(rdatos_coches)+
  geom_line(aes(x=date, y = RDAX,col= fases ))

g31/g32/g33


#df rendimientos
rendim_coches <- data.frame( RVW, RDAIM, RDAX)
head(rendim_coches)
tail(rendim_coches)

summary(rendim_coches)
cor(rendim_coches)
cov(rendim_coches)

# Correlaciones
rh <- rcorr(as.matrix(rendim_coches),type="pearson") 
rh
rh$r
col_palette <- colorRampPalette(c("white", 'grey', "black"))(50)
corrplot(rh$r, type = "upper", order="hclust", tl.srt=45, col = col_palette, tl.col='black')


# Modelos CAPM 
CAPM1<-lm(RVW ~ RDAX)
summary(CAPM1)
ggplot(rdatos_coches) +
  geom_point(aes(x=RDAX, y=RVW, col = fases)) +
  stat_smooth(aes(x=RDAX, y=RVW), col= "black", method = "lm")

CAPM2<-lm(RDAX ~ RDAIM)
summary(CAPM2)
ggplot(rdatos_coches) +
  geom_point(aes(x=RDAX, y=RDAIM, col = fases)) +
  stat_smooth(aes(x=RDAX, y=RDAIM), col= "black", method = "lm")


# Grafico matricial
pairs(rendim_coches, panel = panel.smooth, main = "Rendimientos", col="grey")


