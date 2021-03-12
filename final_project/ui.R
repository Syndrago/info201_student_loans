
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
    includeCSS("css_file.css"),
    tags$div(
        class = "intro",
        h1("Fill in later"),
        tags$p(
            "A paragraph is a self-contained unit
        of discourse in writing dealing with a particular point or idea.
        A paragraph consists of one or more sentences. Though not required by
        the syntax of any language, paragraphs are usually an expected part of
        formal writing, used to organize longer prose."
        )
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
