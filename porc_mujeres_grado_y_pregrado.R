library(tidyverse)

total <-  read.csv("total_r.csv", sep=";", encoding = "UTF-8")

total <- rename(total, Categoría = X.U.FEFF.Categoría)

total$X <- NULL

total <- total %>%
  group_by(Categoría, Gestión) %>%
  mutate(Porcentaje = round (100* Cantidad/ sum(Cantidad),2))

write.csv(total,"C:/Users/Natasha/Desktop/Proyecto Mel/Proyecto Shiny/total_grado_pregrado.csv", row.names = F)

