library(tidyverse)
library(shiny)
library(shinythemes)
library(rsconnect)

total_grado_pregrado <- read.csv("total_grado_pregrado.csv")

ui <- fluidPage(theme = shinytheme("sandstone"),
                title = "Trayectoria académica e inserción laboral femenina",
                titlePanel(title = h1(strong("Trayectoria académica e inserción laboral femenina"), style="text-align: center")),
                tabsetPanel(type = "tabs",
                            tabPanel("Grado y pregrado", fluid = TRUE,
                                     titlePanel("Participación femenina en carreras de grado y pregrado"),
                                     sidebarPanel(
                                       selectInput(inputId = "categoria", 
                                                   label = strong("Categoría"),
                                                   choices = unique(total_grado_pregrado$Categoría),
                                                   selected = "Estudiantes"),
                                       selectInput(inputId = "gestion", 
                                                   label = strong("Gestión"),
                                                   choices = unique(total_grado_pregrado$Gestión),
                                                   selected = "Estatal")),
                                     mainPanel(plotOutput(outputId = "total_grado_pregrado_bars", height = 500)),
                                     tabPanel("Referencias",
                                              p(HTML("<b>Estudiantes, nuevas/os inscriptas/os y egresadas/os de títulos de pregrado y grado por género según sector de gestión. Año 2019.</b>")),																								
                                              p(HTML("<b>Fuente: Anuario de Estadísticas Universitarias 2019 - Ministerio de Educación </b>"))))))