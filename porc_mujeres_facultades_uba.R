library(tidyverse)

facultades_uba <-  read.csv("facultades_uba.csv", sep=";", encoding = "UTF-8")

colnames(facultades_uba)

facultades_uba <- rename(facultades_uba, Facultad = X.U.FEFF.Facultad)

facultades_uba <- facultades_uba %>%
  group_by(Facultad) %>%
  mutate(Porcentaje = round (100* Cantidad/ sum(Cantidad),2))

write.csv(facultades_uba,"C:/Users/Natasha/Desktop/Proyecto Mel/Proyecto Shiny/facultades_uba.csv", row.names = F)
