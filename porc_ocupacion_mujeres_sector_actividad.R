#Porcentaje de puestos ocupados por mujeres, por sector de actividad
# https://datos.gob.ar/dataset/produccion-porcentaje-puestos-ocupados-por-mujeres-por-sector-actividad

#Librerías
library(readr)
library(tidyverse)


#Porcentaje de mujeres en el sector privado, por sector de actividad
dos_digitos <- read_csv("https://raw.githubusercontent.com/melinaschamberger/proyecto_shiny/main/Datos/Mujeres_sector_privado/share_mujer_privado_mensual_por_clae2_06122021.csv")
dos_digitos <- dos_digitos %>% rename( "por_mu_sector_privado_clae2" = share_mujer)
tres_digitos <- read_csv("https://raw.githubusercontent.com/melinaschamberger/proyecto_shiny/main/Datos/Mujeres_sector_privado/share_mujer_privado_mensual_por_clae3_06122021.csv")
tres_digitos <- tres_digitos %>% rename( "por_mu_sector_privado_clae3" = share_mujer)
seis_digitos <- read_csv("https://raw.githubusercontent.com/melinaschamberger/proyecto_shiny/main/Datos/Mujeres_sector_privado/share_mujer_privado_mensual_por_clae6_06122021.csv")
seis_digitos <- seis_digitos %>% rename( "por_mu_sector_privado_clae6" = share_mujer)
letras <- read_csv("https://raw.githubusercontent.com/melinaschamberger/proyecto_shiny/main/Datos/Mujeres_sector_privado/share_mujer_privado_mensual_por_letra_06122021.csv")
letras <- letras %>% rename( "por_mu_sector_privado_letra" = share_mujer)

#Porcentaje de mujeres en el sector privado (total)
privado_total <- read_csv("https://raw.githubusercontent.com/melinaschamberger/proyecto_shiny/main/Datos/Mujeres_sector_privado/share_mujer_privado_total_06122021.csv")
privado_total <- privado_total %>% rename( "por_mu_sector_privado_total" = share_mujer)

#Porcentaje de mujeres en el total de empresas, por sector de actividad
empresas_dos_digitos <- read_csv("share_mujer_total_empresas_mensual_por_clae2_06122021.csv")
empresas_tres_digitos <- read_csv("share_mujer_total_empresas_mensual_por_clae3_06122021.csv")
empresas_seis_digitos <- read_csv("share_mujer_total_empresas_mensual_por_clae6_06122021.csv")
empresas_letras <- read_csv("share_mujer_total_empresas_mensual_por_letra_06122021.csv")
empresas_total <- read_csv("share_mujer_total_empresas_total_06122021.csv")

#Diccionario de clases: porcentaje de ocupación femenina por sector privado y sector de actividad
datos_sector_privado <- read_csv("https://datos.produccion.gob.ar/dataset/162dc5a6-7a95-4f19-9d85-063c9be23208/resource/145dd127-630e-40a5-9a31-239e34a01d36/download/clae_diccionario.csv")
datos_sector_privado <- left_join(datos_sector_privado, dos_digitos)
datos_sector_privado <- left_join(datos_sector_privado, tres_digitos)
datos_sector_privado <- left_join(datos_sector_privado, seis_digitos)
datos_sector_privado <- left_join(datos_sector_privado, letras)
datos_sector_privado <- left_join(datos_sector_privado, privado_total)

