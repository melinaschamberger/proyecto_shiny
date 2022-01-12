#Porcentaje de mujeres en carreras de grado y pregrado. Todas las facultades. 2019.
#https://drive.google.com/file/d/1IiKj1ILMrR91J8-GCvVblA4UFjMZ3Eb9/view (datos transformados)

#Librería
library(tidyverse)

#Cargo datos
total <-  read_csv("https://github.com/melinaschamberger/proyecto_shiny/blob/main/Datos/trayectoria_educativa/total_grado_pregrado.csv")

#Renombro variables
total <- rename(total, Categoría = X.U.FEFF.Categoría)

#Elimino variables que no voy a utilizar
total$X <- NULL

#Calculo porcentaje de participación femenina sobre el total
total <- total %>%
  group_by(Categoría, Gestión) %>%
  mutate(Porcentaje = round (100* Cantidad/ sum(Cantidad),2))

#Guardo archivo con los porcentajes
write.csv(total,"C:/Users/Natasha/Desktop/Proyecto Mel/Proyecto Shiny/total_grado_pregrado.csv", row.names = F)


