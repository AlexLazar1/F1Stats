
sidebar <- dashboardSidebar(
  sidebarMenu(id="tabs",
              menuItem("World Map", tabName="tab_map", icon=icon("map")),
              menuItem("Table import", tabName = "table", icon=icon("table"), selected=TRUE),
              menuItem("Codes",  icon = icon("file-text-o"),
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
    )
            
    )
    
  )
  
ui <-  dashboardPage(
    dashboardHeader(title = "F1 Statistics"),
    sidebar,
    body
  )
  
  

