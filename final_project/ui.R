
library(shiny)




# Pages -------------------------------------------------------------------

main_page <- tabPanel(
    "Main Page",
    h1("Fill in later"),
)

chart_one <- tabPanel(
    "Chart 1",
    h1("Fill in later"),
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
