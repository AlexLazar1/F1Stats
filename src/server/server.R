server <- shinyServer(function(input, output, session){
 
##############   WORLD MAP   
  observeEvent(input$minus_button, {
    updateSliderInput(session, "year", value = input$year - 1)
  })
  
  observeEvent(input$plus_button, {
    updateSliderInput(session, "year", value = input$year + 1)
  })
  world_map_circutis <-reactive({ 
    races %>% select(circuitId, year) %>%
    left_join(circuits, by = "circuitId") %>%
    select(year, name, lat, lng, circuitId)
  })
  output$map <- renderLeaflet({
    leaflet() %>%
      addProviderTiles("CartoDB.Positron") %>%
      setView(lng = 0, lat = 0, zoom = 2)  # Set the initial view of the map
  })
  
  observe({
    subset_world_map_circutis <- world_map_circutis() %>%
      subset(year == input$year)
    
    leafletProxy("map") %>%
      clearMarkers() %>%
      addMarkers(
        data = subset_world_map_circutis,
        lng = ~lng,
        lat = ~lat,
        popup = ~name,
        label = ~name,
        labelOptions = labelOptions(noHide = TRUE),
        layerId = ~circuitId
      )
  })
  observeEvent(input$map_marker_click, {
    marker_name <- input$map_marker_click
    updateTabsetPanel(session, "tabs", selected = "readme")
  })
})