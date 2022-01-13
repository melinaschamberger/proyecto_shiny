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

#Elimino columna X
programacion$X <- NULL

#Selecciono variables con las que voy a trabajar





