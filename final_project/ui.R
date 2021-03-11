
library(shiny)

source("server.R")


# Chart Page Layout -------------------------------------------------------

chart_layout <- sidebarLayout(
    sidebarPanel(
        selectInput(
            inputId = "var",
            label = "Variable of Interest",
            choices = list(
                "Subsidized Recipients" = "Subsidized.Recipients",
                "Unsubsidized Graduate Recipients" = "Unsubsidized.Graduate.Recipients",
                "Unsubsidized.Undergrad.Recipients" = "Unsubsidized.Undergrad.Recipients",
                "Parent Recipients" = "Parent.Plus.Recipients"
            )
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
    HTML(
        "<style>
            body {
                background-image: url('bg.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
            }
        </style>"
    )
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



# Main UI -----------------------------------------------------------------

shinyUI(navbarPage(
    "Student Loans",
    main_page,
    chart_one,
    chart_two,
    chart_three,
    summary
    
))
