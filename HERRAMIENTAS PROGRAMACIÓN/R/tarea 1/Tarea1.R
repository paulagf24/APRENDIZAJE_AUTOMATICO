
#PAULA GONZALEZ, MARIA RODRIGUEZ, IAGO GORDO

# Ejercicio 1
# Crea un data.frame o tibble a partir del fichero credit. Tiene datos de ingresos y balance
# de tarjetas de crédito, así como datos sociodemográficos de los clientes.
# Calcula la media de los ingresos (columna Income) a nivel de Gender y Ethnicity. O sea,
# calcula la media de Income para cada posible par de valores de Gender y Ethnicity.

df_credit2 <- read.delim('credit', sep='|')

library(dplyr)

df_credit %>% 
group_by(Gender, Ethnicity) %>% 
summarize(mean(Income))


# Ejercicio 2
# Mete todo lo anterior en una función cuyo argumento de entrada sea la ruta al fichero.
# La función devolverá el resultado con la media a los niveles mencionados anteriormente (lo
# más cómodo para ti es que este resultado sea un data.frame o tibble, pero plantéalo como quieras).

funcion_media_in <- function(ruta){data <- read.table(ruta, header=TRUE,sep='|')
data %>% 
  group_by(Gender, Ethnicity) %>% 
  summarize(mean(Income))}

funcion_media_in('C:/Users/paula/Desktop/CUNEF/ASIGNATURAS/HERRAMIENTAS PROGRAMACIÓN/tarea 1/credit')
                       
# Ejercicio 3
# A partir de los datos calculados antes, replica este gráfico. He usado el tema claro con la capa
# theme_light() (el color de relleno es lo de menos: pon el que quieras, pero especifica uno):

library(ggplot2)

ggplot(df_credit, aes(x = Gender, y = Income)) +
  geom_bar(stat = "identity", fill='violet') +
  facet_wrap(~Ethnicity) +
  labs(x = "Gender", y = "Income") +
  ggtitle("Comparativa de ingresos")

# Ejercicio 4
# Completa ahora tu función anterior para que, en lugar de devolver los datos de antes, devuelva
# el gráfico anterior. La función tendrá ahora tres argumentos:
#   • La ruta al fichero
#   • El título del gráfico
#   • El color de relleno

funcion_guay <- function(ruta,titulo,color_fill){read.table(ruta, header=TRUE,sep='|')%>% 
  group_by(Gender, Ethnicity) %>% 
  summarize(mean=mean(Income)) %>% 
  ggplot(aes(x = Gender, y = mean )) +
  geom_bar(stat = "identity", fill=color_fill) +
  facet_wrap(~Ethnicity, scales = "free_y") +
  labs(x = "Gender", y = "Income") +
  ggtitle(titulo)}

funcion_guay('C:/Users/paula/Desktop/CUNEF/ASIGNATURAS/HERRAMIENTAS PROGRAMACIÓN/tarea 1/credit','patata','brown')





         