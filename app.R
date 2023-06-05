library(shiny)
library(shinydashboard)
library(leaflet)
library(dplyr)
library(shinyWidgets)

source("src/pipelines/load_data.R")
source("src/server/server.R")
source("src/ui/ui.R")

shinyApp(ui, server)
