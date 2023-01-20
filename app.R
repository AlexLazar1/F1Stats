library(shiny)
library(shinydashboard)


source("src/server/server.R")
source("src/ui/ui.R")

shinyApp(ui, server)
