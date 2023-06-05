
sidebar <- dashboardSidebar(
  sidebarMenu(id="tabs",
              menuItem("World Map", tabName="tab_map", icon=icon("map")),
              menuItem("Table import", tabName = "table", icon=icon("table")),
              menuItem("Codes",
                       menuSubItem("global.R", tabName = "global", icon = icon("angle-right")),
                       menuSubItem("ui.R", tabName = "ui", icon = icon("angle-right")),
                       menuSubItem("server.R", tabName = "server", icon = icon("angle-right")),
                       menuSubItem("structure", tabName = "structure", icon = icon("angle-right"))
              ),
              menuItem("ReadMe", tabName = "readme", icon=icon("mortar-board")),
              menuItem("About", tabName = "about", icon = icon("question"))
  )
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = "readme",
            fluidPage(
              tags$iframe(src = './readme.html', 
                          width = '100%', height = '800px', 
                          frameborder = 0, scrolling = 'auto'
              )
            )
    ),
    tabItem(tabName = "tab_map",
            fluidPage(
              fluidRow(
                column(
                  width = 6,
                  sliderInput(
                    inputId = "year",
                    label = "Choose Year:",
                    min = min(races$year),
                    max = max(races$year),
                    value = 2023,
                    sep = '',
                    width = "100%"
                  )
                ),
                column(
                  width = 2,
                  actionButton(inputId = "minus_button", label = "-"),
                  actionButton(inputId = "plus_button", label = "+")
                )
              ),
              fluidRow(
                leafletOutput("map", height = "600px")
              )
            )
    )
            
    )
    
  )
  
ui <-  dashboardPage(
    dashboardHeader(title = "F1 Statistics"),
    sidebar,
    body
  )
  
  

