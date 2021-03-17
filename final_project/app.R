library(shiny)
library(tidyverse)
library(scales)
library(plotly)
library(ggplot2)
library(DT)
library(maps)
library(mapproj)

source("app_server.R")
source("app_ui.R")

# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = shinyUI, server = shinyServer)