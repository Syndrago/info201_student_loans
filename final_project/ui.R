
library(shiny)

source("server.R")


# Chart Page Layout -------------------------------------------------------

chart_layout <- sidebarLayout(
    sidebarPanel(
        selectInput(
            inputId = "var",
            label = "Variable of Interest",
            choices = colnames(selected %>%
                select(5:8)) 
        ),
        
        radioButtons(
            inputId = "bchoice",
            label = "Choice",
            choices = c("Total", "Percent of Population")
        )
        
    ),
    mainPanel(
        plotOutput("map")
    )
)
# Pages -------------------------------------------------------------------

main_page <- tabPanel(
    "Main Page",
    h1("Fill in later"),
)

chart_one <- tabPanel(
    "Chart 1",
    chart_layout
)

chart_two <- tabPanel(
    "Chart 2",
    h1("Fill in later"),
)

chart_three <- tabPanel(
    "Chart 3",
    h1("Fill in later"),
)

summary <- tabPanel(
    "Summary",
    h1("Fill in later"),
)




shinyUI(navbarPage(
    "Final Project",
    main_page,
    chart_one,
    chart_two,
    chart_three,
    summary
    
))
