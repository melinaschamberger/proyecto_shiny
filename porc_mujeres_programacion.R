#Librería
library(tidyverse)

#Cargo datos
programacion <-  read.csv("https://raw.githubusercontent.com/melinaschamberger/proyecto_shiny/main/Datos/trayectoria_ecucativa/mujeres_programaci%C3%B3n.csv", encoding = "UTF-8")

#Veo nombres de las columnas
colnames(programacion)

#Veo valores únicos de algunas variables
unique(programacion$Año)
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

#Chequeo que las cantidades sean clase integer
class(df.estudiantes$Total.de.Estudiantes)
class(df.estudiantes$Estudiantes.Varones)
class(df.estudiantes$Estudiantes.Mujeres)

#Los configuro como integer
df.estudiantes$Total.de.Estudiantes<-as.integer(df.estudiantes$Total.de.Estudiantes)
df.estudiantes$Estudiantes.Varones<-as.integer(df.estudiantes$Estudiantes.Varones)

#Omito NA
limpia.estudiantes <- na.omit (df.estudiantes)

#Agrupo por año, calculo los totales y porcentajes de varones y mujeres

porcentajes_estudiantes <- limpia.estudiantes %>%
group_by(Año) %>%
summarise_all(sum) %>%
mutate(porc_mujeres = round(100 * Estudiantes.Mujeres/Total.de.Estudiantes,2)) %>%
mutate(porc_varones = round(100 * Estudiantes.Varones/Total.de.Estudiantes,2))

#Grafico

color_genero <- c(porc_mujeres = "darkviolet", porc_varones = "grey")






  







