#Librería
library(tidyverse)

#Cargo datos
programacion <-  read.csv("https://raw.githubusercontent.com/melinaschamberger/proyecto_shiny/main/Datos/trayectoria_ecucativa/mujeres_programaci%C3%B3n.csv", encoding = "UTF-8")

#Veo nombres de las columnas
colnames(programacion)

#Veo valores únicos de algunas variables
unique(programacion$Año)
unique(programacion$Carrera)
unique(programacion$Tipo.de.Institución)
unique(programacion$Institución)
unique(programacion$Unidad.Académica)
unique(programacion$Carrera)
unique(programacion$Título)
unique(programacion$Gestión) 
unique(programacion$Nivel.de.la.Oferta)
unique(programacion$X)

#Limpio la base -> Elimino fila 1714
programacion<-programacion[-c(1714),]

#Genero un nuevo dataframe de estudiantes, que solo contenga las variables con las que voy a trabajar.

estudiantes <- c("Año", "Total.de.Estudiantes", "Estudiantes.Varones", "Estudiantes.Mujeres")
df.estudiantes <- programacion[estudiantes]

#Chequeo que las cantidades sean clase numeric
class(programacion$Total.de.Estudiantes)
class(programacion$Estudiantes.Varones)
class(programacion$Estudiantes.Mujeres)

#Los configuro como numeric
programacion$Total.de.Estudiantes<-as.numeric(programacion$Total.de.Estudiantes)
programacion$Estudiantes.Varones<-as.numeric(programacion$Estudiantes.Varones)
programacion$Estudiantes.Mujeres<-as.numeric(programacion$Estudiantes.Mujeres)

#Agrupo por año, calculo los totales de estudiantes y los porcentajes de varones y mujeres

  







