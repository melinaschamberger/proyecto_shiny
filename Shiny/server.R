#Cargo librerías

library(tidyverse)
library(shiny)
library(shinythemes)
library(rsconnect)

#Cargo datos
total_grado_pregrado <- read.csv("total_grado_pregrado.csv")
facultades_uba <- read.csv("facultades_uba.csv")

#Configuro reactividad
server <- function(input, output) {
  
  output$total_grado_pregrado_bars <-renderPlot({ #Configuro el gráfico de barras de la primera pestaña
    
    sub_grado_pregrado <- total_grado_pregrado %>% #Configuro una sub-base de datos que 
      filter(Categoría == input$categoria & Gestión == input$gestion) #filtre la principal según el input del usuario
    
    color_genero <- c("Femenino" = "darkviolet", "Masculino" = "grey") #Configuro los colores del gráfico
    
      ggplot(data=sub_grado_pregrado) + #Configuro el gráfico con los datos de la sub-base
      geom_bar(mapping = aes(x = Género, y = Porcentaje, fill=Género), #Porcentaje de estudiantes según género
               stat = "identity")+
      scale_fill_manual(values = color_genero) +
      labs(x = "Género", 
           y = "Porcentaje")+
      theme_minimal() +
      theme(legend.position = "none") +
      geom_text(aes(x = Género, y = Porcentaje, label = Porcentaje), 
                colour = "black",
                position=position_dodge(width=0.9), 
                vjust=-0.25)
  })
  
  output$facultades_uba_bars <-renderPlot({ #Configuro el gráfico de barras de la segunda pestaña
    
    sub_facultades_uba <- facultades_uba %>% #Configuro una sub-base de datos que 
      filter(Facultad == input$facultad) #filtre la principal según el input del usuario
    
    color_genero <- c("Femenino" = "darkviolet", "Masculino" = "grey") #Configuro los colores del gráfico
    
    ggplot(data=sub_facultades_uba) + #Configuro el gráfico con los datos de la sub-base
      geom_bar(mapping = aes(x = Género, y = Porcentaje, fill=Género), #Porcentaje de estudiantes según género
               stat = "identity")+
      scale_fill_manual(values = color_genero) +
      labs(x = "Género", 
           y = "Porcentaje")+
      theme_minimal() +
      theme(legend.position = "none") +
      geom_text(aes(x = Género, y = Porcentaje, label = Porcentaje), 
                colour = "black",
                position=position_dodge(width=0.9), 
                vjust=-0.25)
  })
  
  }

