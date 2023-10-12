#----------------------------------------------
# MUCD - Fundamentos 
# Analisis Exploratorio de datos univariados
#----------------------------------------------

#----------------------------------------------
# Datos y variables											
#----------------------------------------------
getwd() #Esta función se utiliza para obtener el directorio de trabajo actual en R.

datos <- read.table("DatosD1_1.txt", header = T)
#Cargamos los datos header=t para que nos salga la cabecera de los datos

names(datos) # Para ver que variables contiene el archivo
head(datos)# Para ver las primeras filas de la tabla

attach(datos) #Después de usar attach(datos), puedes acceder a las columnas
#de datos directamente por su nombre

# Comando basico, nos resume un conjunto de datos
# Minimo, 1 cuartil, mediana, media, 3 cuartil, máximo
summary(datos)

# Definimos nuestras variables de interes (creamos dos objetos)

renta <- PIBpc
educacion <- educ


#----------------------------------------------
# Medidas de posicion													
#----------------------------------------------
mean(renta) # Media aritmetica
#La media recortada quita el 10% por abajo y el 10% de arriba de los outlayers MEDIA ROBUSTA
#esto permite que la media no se vea tan influenciada por los outlayers
mean(renta, trim=0.2) # Media recortada 20% 

median(renta) # Mediana

# Calculo manual de la mediana 
# aprendemos: length, sort, seleccionar datos 
# de un vector, eliminar datos de un vector)
# cuantos elementos tiene la columna renta
length(renta) 
central <- length(renta) / 2 
central
# Porque tenemos un numero par de observaciones
# sort() nos ayuda a ordenar los valores de menor a mayor
rentaord <- sort(renta)
rentaord
(rentaord[central] + rentaord[central + 1]) / 2 

# Efecto de las observaciones extremas sobre media y mediana
mean(renta)
#es el valor mayor en que posicion de la columna esta
#tiene que ser igual al length
which.max(renta)
quitar <- which.max(renta)
#renta2 son los mismos valores quitando el último, ya que es un outlayer
renta2 <- renta[-quitar]
mean(renta2)
median(renta2)

# Cuantiles EMPIRICOS
quantile(renta, 0.5) #Mediana

quantile(renta, 0.1) #deja a la izquierda el 10%

# Cuartiles, 
# es una manera de hacer cuartiles más rápida
quantile(renta, c(0.25, 0.5, 0.75))

# Deciles
# gracias a seq() cogemos la secuencia entre 0.1 a 0.9 sumando 0.1
quantile(renta, seq(0.1, 0.9, 0.1))

# Percentiles
quantile(renta, seq(0.01, 0.99, 0.01))

#----------------------------------------------
# Medidas de dispersion												    
#----------------------------------------------
var(renta) # cuasivarianza
sd(renta) # cuasidesviacion tipica

var(educacion)
sd(educacion)

n <- length(renta)
n
var.e <- var(educacion) * (n - 1) / n # Varianza
var.e^0.5 # desviacion tipica

#----------------------------------------------
# Para comparar variables con distinta escala empleamos 
# el coeficiente de variacion (adimensional)
#abs() devuelve el valor abosoluto
#----------------------------------------------
sd(renta) / abs(mean(renta)) #mas variabilidad de la rente
sd(educacion) / abs(mean(educacion)) #menos variablilidad

# Las medidas anteriores se ven muy afectadas por valores extremos
# Una medida de dispersion menos sensible a las observaciones extremas
# es el RECORRIDO INTERCUARTILICO
# "names = F" se usa para que no muestre el porcentaje del cuantil
# calculado. Si no se especifica lo calcula igualmente y lo unico que
# teneis que hacer es ignorar esa informacion (compara RIr con RIe)

RIr <- quantile(renta, 0.75, names=F) - quantile(renta, 0.25, names=F)
RIe <- quantile(educacion, 0.75) - quantile(educacion, 0.25)
c(RIr, RIe)
#no se puede comparar ya que es ambismal la diferencia ya que no son la misma medida

# Viene determinado por la escala de la variable
# Para comparar variables con distinta escala empleamos el 
# recorrido semi-intercuartilico (adimensional) Si los sumamos podemos comparar

RSIr <- RIr/(quantile(renta, 0.75) + quantile(renta, 0.25))
RSIe <- RIe/(quantile(educacion, 0.75) + quantile(educacion, 0.25))
c(RSIr,RSIe)
#más homgeneidad en la educacion en comparación con la renta

#----------------------------------------------
# Resumen de los principales estadisticos descriptivos
summary(renta)
summary(educacion)
# fivenum() minimo, q1, q2 o mediana, q3, maximo
fivenum(renta) # medida propuesta por Tukey
fivenum(educacion) # medida propuesta por Tukey
#----------------------------------------------

#----------------------------------------------
# Representacion grafica												
#----------------------------------------------
boxplot(renta)
#logaritmo hace que se hagan más pequeños los valores. Se ve mejor
boxplot(log(renta))

hist(renta, freq = F)
#ylim= es la escala
#xlab es el titulo del eje de las x
#ylab es el titulo del ejere de las y
#border el borde de la grafica
#col el color de la grafica
#freq 
hist(renta, ylim = c(0, 100), xlab = "PIB per capita", 
     ylab = "Frecuencia", main = "Histograma del PIB per capita",
  border = "lightskyblue2", col = "navy", freq = T)
box(lwd = 2) #cerrar el recuadre, el grosor

# Vamos a ver como variar las particiones
par(mfrow = c(1, 3)) # Abrimos una ventana para tres graficos en una misma fila. Divide la pantalla en tres
hist(renta, breaks = seq(0, 120000, 20000))
hist(renta)
hist(renta, breaks = 50)
par(mfrow = c(1, 1))

# Para dibujar la estimacion kernel:
plot(density(renta), main = "Estimacion kernel de la funcion de 
     densidad", ylab = "densidad", 
  xlab = "PIB per capita", col="Blue")

# Suele presentarse junto con el histograma
hist(renta, freq = F,ylim = c(0, 0.00006))
lines(density(renta), col = "Blue")
box(lwd = 1)

# Otra forma
hist(renta, probability = "T", col="orange")
lines(density(renta), col = "Blue")
box(lwd = 1)

# Variamos el tipo de ventana: triangular, gaussiana, rectangular
hist(renta, freq = F,ylim = c(0, 0.00006))
lines(density(renta, kernel = "triangular"), col = "green") 
lines(density(renta, kernel = "rectangular", bw=5000), col = "Red")
lines(density(renta, kernel = "gaussian"), col = "Blue")
box(lwd = 2)

# Anadimos una leyenda al grafico
# La leyenda hay que hacerla a mano con el comando legend
# La mejor estrategia para aprender el significado de cada argumento es jugar con la funci?n
# Los dos primeros son la posicion de la leyenda, el siguiente los titulos,
# lty = estilo de linea, 
# pch = estilo de punto (ambos deben coincidir con el del grafico
# o la leyenda no sera informativa)
# bg = color del fondo de la leyenda.

legend(76000, 6*10^-5, c("Ventana triangular", "Ventana rectangular", "Ventana gausiana"), 
  col = c("Green", "Red", "Blue"), lty = c(1, 1, 1), bg = "gray90")

# Variamos el ancho de banda cuanto más grande mas smooth y mas pequeño mas irregularidades: 
hist(renta, freq = F, ylim = c(0, 0.00009))
lines(density(renta, bw = 8000), col = "green")
lines(density(renta), col = "Red")
lines(density(renta, bw = 1000), col = "Blue")
box(lwd = 2)
legend("topright", c("Ancho de banda = 8000", "Ancho de banda optimo", "Ancho de banda = 1000"), 
  col = c("Green", "Red", "Blue"), lty = c(1, 1, 1), bg = "gray90")

#----------------------------------------------
# Medidas de forma:													   
#----------------------------------------------
# Necesitamos cargar la librera "moments" 
install.packages("moments")
library(moments)
skewness(renta) # Asimetria
kurtosis(renta)-3 # Curtosis

# Boxplot con dos variables, nos pone las dos variables
boxplot(renta, educacion)
boxplot(log(renta), educacion, col="orange")

#----------------------------------------------
# Datos bivariantes													
#----------------------------------------------
# Covarianza
cov(renta, educacion) 
# Coeficiente de correlacion. es una medida de dependencia es positiva es medio importante
cor(renta, educacion) 
# Grafico de dispersion
plot(c(1,2),c(5,8)) #no sale el grafico ya que coge ambas

plot(educacion, renta, pch=20) #pch tamaños y formas
plot(educacion, log(renta), pch=20)



