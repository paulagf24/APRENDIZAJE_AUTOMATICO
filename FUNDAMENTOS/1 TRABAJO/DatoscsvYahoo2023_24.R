#-----------------------------------------------------------------
# Lectura datos Yahoo Finance en formato csv, 
# Construir dataframes y algunos analisis
# MUCD 2023-24
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
       
nrow(datos_vw)
nrow(datos_daim)
nrow(datos_dax)

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

df_coches$DAIM <- as.numeric(df_coches$DAIM)
df_coches$VW <- as.numeric(df_coches$VW)

# Fechas

df_coches$date <- as.Date(df_coches$date)

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

# Combinar las tres series PREGUNTAR 
combina<-ggplot(data=df_coches, aes(x=date, y=VW, colour="1"))+
  geom_line(colour="blue")+
  ylab("Serie")+xlab("date")+
  scale_y_continuous(limits=c(1,10))+
  geom_line(aes(x=date, y=DAIM, colour="2"), colour="red")+
  geom_line(aes(x=date, y=DAX, colour="3"), colour="green")+
  scale_colour_manual(values=c("blue", "red", "green"))
combina

combina <- ggplot(data = df_coches, aes(x = date)) +
  geom_line(aes(y = VW / 10000, colour = "VW"), linetype = "solid", size = 1) +
  geom_line(aes(y = DAIM / 10000 , colour = "DAIM"), linetype = "solid", size = 1) +
  geom_line(aes(y = DAX / 10000, colour = "DAX"), linetype = "solid", size = 1) +
  ylab("Serie") + xlab("date") +
  scale_y_continuous(limits = c(1, 10)) +
  scale_colour_manual(values = c("VW" = "blue", "DAIM" = "red", "DAX" = "green")) +
  labs(colour = "Legend") +
  guides(colour = guide_legend(override.aes = list(linewidth = 1)))
combina

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
RVW  <- VW[2:n] / VW[1:n-1] - 1
RDAIM  <- DAIM[2:n] / DAIM[1:n-1] - 1
date <- date[2:n]

RVW
RDAIM
RDAX

# Data frame Rendimientos
rdatos_coches<-data.frame(date, DAIM, VW, DAX)
head(rdatos_coches)
tail(rdatos_coches)

# Fechas
r_datos <- rdatos%>% 
  mutate(
    twar = case_when(
      date < "2022-02-24" ~ "prewar",
      date >= "2022-02-24" & date < "2023-09-14" ~ "postwar",
      TRUE ~ "postwar"  
    )) 
head(r_datos)
tail(r_datos)

df_coches <- df_coches%>% 
  mutate(
    fases = case_when(
      date < "2022-06-12" ~ "fase 1",
      date >= "2022-06-12" & date < "2023-09-21" ~ "fase 2",
      TRUE ~ "fase 2"  
    )) 

r_datos$date <- as.Date(r_datos$date)
class(r_datos$date)

# graficos temporales de los rendimientos
g31<-ggplot(r_datos)+
  geom_line( aes(x=date, y=RMELIA, col = twar))
g32<-ggplot(r_datos)+
  geom_line(aes(x=date, y = RMAP, col = twar))
g33<-ggplot(r_datos)+
  geom_line(aes(x=date, y = RIBEX,col= twar ))

g31/g32/g33


#df rendimientos
rendim <- data.frame( RIBEX, RMELIA, RMAP)
head(rendim)
tail(rendim)


summary(rendim)
cor(rendim)
cov(rendim)

# Correlaciones
rh <- rcorr(as.matrix(rendim),type="pearson") 
rh
rh$r

corrplot(rh$r, type = "upper", order="hclust", tl.srt=45)


# Modelos CAPM 
CAPM1<-lm(RMELIA ~ RIBEX)
summary(CAPM1)
ggplot(r_datos) +
  geom_point(aes(x=RIBEX, y=RMELIA, col = twar)) +
  stat_smooth(aes(x=RIBEX, y=RMELIA), col= "orange", method = "lm")

CAPM2<-lm(RMAP ~ RIBEX)
summary(CAPM2)
ggplot(r_datos) +
  geom_point(aes(x=RIBEX, y=RMAP, col = twar)) +
  stat_smooth(aes(x=RIBEX, y=RMAP), col= "orange", method = "lm")


# Grafico matricial
pairs(rendim, panel = panel.smooth, main = "Rendimientos", col="orange")

FRONTERA EFICIENTE

