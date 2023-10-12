1:10

library(readr)

nueva_funcion <-  function(x)
{x+1 }

lapply(1:10, nueva_funcion)


#escribe nuevos csv
for(x in 1:10){
  write_csv(iris, paste0('iris', x,'.csv'))
}

a <- 5
#Si a es meor que 10 entonces di hola, si no adios
if (a<10){
  print("hola")
} else {print("adios")}


#si x es oar guarda el fichero, si no, muestra un mensaje que diga que no es par
3%%5
6%%3
6%%6
resto <- 3%%5

for(x in 1:20){
  resto <- x%%2
  if(resto==0){
    write_csv(iris, paste0('resto', x,'.csv'))
  } else{
    print('no es par')}}

# Ejercicio 1. Crea una función que reciba un vector x de números y otro número a y que
# dibuje, en función de esos, la curva de la función matemática 𝑓(𝑥) = 𝑥𝑙𝑛(𝑎𝑥), donde 𝑎 es un
# número positivo real. Asegúrate de que a es igual a 1 por defecto. La función debería incluir
# este vector x como la columna de un data frame (puedes hacerlo con la función tibble()).
# Después la función creará otra columna aplicando la fórmula de la función matemática, con
# dplyr. Finalmente, con ggplot2, dibujará la curva. Un gráfico de líneas valdrá. Para comprobar
# que la función hace lo que tiene que hacer, llámala con el vector generado con el siguiente
# código: seq(0.01, 1, by = 0.01). Prueba diferentes valores de x y a para ver cómo cambia
# el gŕafico.
library(dplyr)
library(ggplot2)

ejercicio1 <- function(x, a=1){
  if (a>0){
    df <- tibble (col1=x)
    df$col2 <- df$col1*log(a*df$col1)
    
    p <- ggplot(df)+
      geom_point(aes(x=col1, y=col2))
    return(p)
  }else{
    print('El número debe ser positivo')
  }}
  
  ejercicio1(seq(0.1,1, by = 0.0001))
  
  df <- (tibble)(col1=x)
}
        
  


