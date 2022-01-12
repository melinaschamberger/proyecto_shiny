#Cargo librerías

library(tidyverse)
library(shiny)
library(shinythemes)
library(rsconnect)

#Cargo datos
total_grado_pregrado <- read.csv("total_grado_pregrado.csv")
facultades_uba <- read.csv("facultades_uba.csv")

#Configuro la interfaz del usuario
ui <- fluidPage(theme = shinytheme("sandstone"), #elijo tema
                title = "Trayectoria académica e inserción laboral femenina", #titulo la aplicación
                titlePanel(title = h1(strong("Trayectoria académica e inserción laboral femenina"), 
                                      style="text-align: center")), #titolo el panel
                tabsetPanel(type = "tabs", #configuro la aplicación en pestañas
                            tabPanel("Grado y pregrado", fluid = TRUE, #Configuro la primera pestaña
                                     titlePanel("Participación femenina en carreras de grado y pregrado"), #titulo de la primera pestaña
                                     sidebarPanel( #Configuro barra lateral desplegable
                                       selectInput(inputId = "categoria", #Configuro el input categoría
                                                   label = strong("Categoría"), #Etiqueta visible para el usuario
                                                   choices = unique(total_grado_pregrado$Categoría), #Configuro opciones (valores únicos de variable "Categoría")
                                                   selected = "Estudiantes"), #Opción por default
                                       selectInput(inputId = "gestion", #Configuro el input gestión
                                                   label = strong("Gestión"), #Etiqueta visible para el usuario
                                                   choices = unique(total_grado_pregrado$Gestión), #Configuro opciones
                                                   selected = "Estatal")), #Opción por default
                                     mainPanel(plotOutput(outputId = "total_grado_pregrado_bars", height = 500)), #Configuro como output de la selección un gráfico de barras
                                     tabPanel("Referencias", #Agrego referencias
                                              p(HTML("<b>Estudiantes, nuevas/os inscriptas/os y egresadas/os de títulos de pregrado y grado por género según sector de gestión. Año 2019.</b>")),																								
                                              p(HTML("<b>Fuente: Anuario de Estadísticas Universitarias 2019 - Ministerio de Educación </b>")))),
                            tabPanel("Facultades UBA", fluid = TRUE, #Configuro la segunda pestaña
                                     titlePanel("Participación femenina en facultades UBA"), #titulo de la segunda pestaña
                                     sidebarPanel( #Configuro barra lateral desplegable
                                       selectInput(inputId = "facultad", #Configuro el input facultad
                                                   label = strong("Facultad"), #Etiqueta visible para el usuario
                                                   choices = unique(facultades_uba$Facultad), #Configuro opciones (valores únicos de variable "Facultad")
                                                   selected = "Femenino")), #Opción por default
                                     mainPanel(plotOutput(outputId = "facultades_uba_bars", height = 500)), #Configuro como output de la selección un gráfico de barras
                                     tabPanel("Referencias", #Agrego referencias
                                              p(HTML("<b>Estudiantes de la Universidad de Buenos Aires según facultad y género. Año 2016.</b>")),																								
                                              p(HTML("<b>Fuente: UBA - Información Estadística </b>"))))))