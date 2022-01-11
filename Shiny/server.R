library(tidyverse)
library(shiny)
library(shinythemes)
library(rsconnect)


total_grado_pregrado <- read.csv("total_grado_pregrado.csv")

server <- function(input, output) {
  
  output$total_grado_pregrado_bars <-renderPlot({
    
    sub_grado_pregrado <- total_grado_pregrado %>%
      filter(Categoría == input$categoria & Gestión == input$gestion)
    
    color_genero <- c("Femenino" = "darkviolet", "Masculino" = "grey")
    
      ggplot(data=sub_grado_pregrado) +
      geom_bar(mapping = aes(x = Género, y = Porcentaje, fill=Género), 
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

