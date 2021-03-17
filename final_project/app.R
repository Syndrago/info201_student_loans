library(shiny)

source("app_server.R")
source("app_ui.R")

# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = shinyUI, server = shinyServer)