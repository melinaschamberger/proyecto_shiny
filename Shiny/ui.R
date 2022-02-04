#Cargo librerías

library(tidyverse)
library(shiny)
library(shinythemes)
library(rsconnect)

#Cargo datos: esto quizás debamos pasarlo a un global antes de publicarlo
total_grado_pregrado <- read.csv("https://raw.githubusercontent.com/melinaschamberger/proyecto_shiny/main/Datos/trayectoria_ecucativa/porc_grado_pregrado.csv")
facultades_uba <- read.csv("https://raw.githubusercontent.com/melinaschamberger/proyecto_shiny/main/Datos/trayectoria_ecucativa/porc_facultades_uba.csv")

#Configuro la interfaz del usuario
ui <- fluidPage(
        tags$head(tags$style(
        HTML('
               #sidebar {
                  background-color: #c8b6ff;
              }
      
              body, label, input, button, select { 
                font-family: "Roboto light";
              }'))),
  
  
          theme = shinytheme("lumen"), #elijo tema:cambié standstone por el color de nuestros nombres, pero se puede usar tmb!
          title = "Trayectoria académica e inserción laboral femenina", #titulo la aplicación
                titlePanel(
                  fluidRow(
                    img(src = "R_day_dos.jpg", height = 145, width =320, align = "right"), 
                    column(7,((h1(strong("¿Qué estudian y dónde trabajan las mujeres?"),
                                  #br(),
                                  h3("Una mirada a la trayectoria académica e inserción laboral femenina 
                                  con perspectiva de género."), style="text-align: left"
                    ))), 
                    column(1.5, (h6(tags$a("Melina Schamberger",href="https://www.linkedin.com/in/melina-schamberger"),align="right"))),
                    column(1.5,(h6(tags$a("Natasha Siderman", href="https://www.linkedin.com/in/natashasiderman/"), align="right"))),
                    #br(),
                  ))),
        
        tabsetPanel(type = "tabs", #configuro la aplicación en pestañas
          
                    tabPanel("Trayectorias académicas",
                        navlistPanel(id="sidebar",
                          tabPanel("Grado y pregrado", 
                            fluid = TRUE, #Configuro la primera pestaña
                               h3("Participación femenina en carreras de grado y pregrado"), #titulo de la primera pestaña
                                     #sidebarPanel(id="sidebar",#Configuro barra lateral desplegable
                                       selectInput(inputId = "categoria", #Configuro el input categoría
                                                   label = strong("Categoría"), #Etiqueta visible para el usuario
                                                   choices = unique(total_grado_pregrado$Categoría), #Configuro opciones (valores únicos de variable "Categoría")
                                                   selected = "Estudiantes"), #Opción por default
                                       selectInput(inputId = "gestion", #Configuro el input gestión
                                                   label = strong("Gestión"), #Etiqueta visible para el usuario
                                                   choices = unique(total_grado_pregrado$Gestión), #Configuro opciones
                                                   selected = "Estatal"), #Opción por default
                                     #mainPanel(
                                       plotOutput(outputId = "total_grado_pregrado_bars", height = 500)),
                          #), #Configuro como output de la selección un gráfico de barras
                                     #tabPanel("Referencias", #Agrego referencias
                                              #p(HTML("<b>Estudiantes, nuevas/os inscriptas/os y egresadas/os de títulos de pregrado y grado por género según sector de gestión. Año 2019.</b>")),																								
                                              #p(HTML("<b>Fuente: Anuario de Estadísticas Universitarias 2019 - Ministerio de Educación </b>")))
                            #),
                            tabPanel("Facultades UBA", 
                                  fluid = TRUE, #Configuro la segunda pestaña
                                     h3("Participación femenina en facultades UBA"), #titulo de la segunda pestaña
                                      #sidebarPanel(id="sidebar", #Configuro barra lateral desplegable
                                       selectInput(inputId = "facultad", #Configuro el input facultad
                                                   label = strong("Facultad"), #Etiqueta visible para el usuario
                                                   choices = unique(facultades_uba$Facultad), #Configuro opciones (valores únicos de variable "Facultad")
                                                   selected = "Femenino"), #Opción por default
                                     #mainPanel(
                                       plotOutput(outputId = "facultades_uba_bars", height = 500)) #Configuro como output de la selección un gráfico de barras
                                     #tabPanel("Referencias", #Agrego referencias
                                      #       p(HTML("<b>Estudiantes de la Universidad de Buenos Aires según facultad y género. Año 2016.</b>")),																								
                                       #       p(HTML("<b>Fuente: UBA - Información Estadística </b>")))
                                     )),
                    tabPanel("Inserción laboral",
                             navlistPanel(id= "sidebar",
                                          tabPanel("Sector productivo",
                                                   fluid = TRUE),
                                          tabPanel("Empresas", 
                                                   fluid = TRUE)
                                          )
                             )
                    )
        )