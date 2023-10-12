#----------------------------------------
# PCA Basico - Proteinas
# MUCD 2023-24
#----------------------------------------

# Paquetes
library(ggcorrplot)
library('corrr')
library("FactoMineR") 
library("factoextra")
library("devtools")
# install_github("vqv/ggbiplot")

#----------------------------------------
# Datos
#----------------------------------------
protein_data <- read.csv("protein.csv")


# Nombres y datos
names(protein_data)
head(protein_data)
tail(protein_data)

dimensions <- dim(protein_data)
dimensions
n_rows <- dimensions[1]
n_columns <- dimensions[2]
n_rows
n_columns
str(protein_data)

# Ausentes
colSums(is.na(protein_data))

# Varibles numericas
numerical_data <- protein_data[,2:10]
head(numerical_data)

# Normalizar datos se busca escalar con 0, 1
data_normalized <- scale(numerical_data)
boxplot(numerical_data)

# Matriz correlacion
corr_matrix <- cor(data_normalized)
corr_matrix
det(corr_matrix)
ggcorrplot(corr_matrix)

#------------------------------------------------------
# Autovalores y autovectores de la Matriz de Correlaciones 
# Interpretaremos como varianzas
#------------------------------------------------------
eigen(cor(data_normalized))

#------------------------------------------------------
# Adecuacion del Modelo
# Test de Bartlett y KMO usando la libreria psych
#------------------------------------------------------
library(psych)
correl<-cor(data_normalized)
cortest.bartlett(correl, n = nrow(data_normalized))
KMO(correl)

#------------------------------------------------------
# Diagrama de codo o de sedimentacion
#------------------------------------------------------
data.pca <- princomp(corr_matrix)
fviz_eig(data.pca, addlabels = TRUE)

#------------------------------------------------------
# Obtencion y resumen PCA
#------------------------------------------------------
summary(data.pca)

#------------------------------------------------------
# Componentes: Interpretacion
#------------------------------------------------------
data.pca$loadings[, 1:3]

# Se trata de estudiar la saturacion de cada variable 
# en un factor

# FACTORES:
# F1: cereales, leche, huevos, nueces
# F2: pescado, fruta fresca, vegetales (almidon)
# F3: Carne blanca, carne roja

#------------------------------------------------------
# Graficos de los resultados
#------------------------------------------------------
protein_pca <- PCA(corr_matrix)
print(protein_pca)

#------------------------------------------------------
# Biplots 
#------------------------------------------------------
# Calidad de cada variable
fviz_cos2(data.pca, choice = "var", axes = 1:2)

# Biplot combinado con cos2
fviz_pca_var(data.pca, col.var = "cos2",
             gradient.cols = c("blue", "orange", "green"),
             repel = TRUE)

