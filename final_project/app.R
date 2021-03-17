library(shiny)

source("server.R")
source("ui.R")

# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = ui, server = server)