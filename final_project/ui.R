
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
                    "Unsubsidized Undergrad Recipients" = "Unsubsidized.Undergrad.Recipients",
                    "Parent Recipients" = "Parent.Plus.Recipients"
                )
            ),
            radioButtons(
                inputId = "bchoice",
                label = "Choice",
                choices = c("Total", "Percent of Population")
            ),
            tags$div(
                h4("Eplanation:"),
                tags$p("Subsidized Recipients are those students who have
                       recieved loans with interest payed for by the government."),
                tags$p("Unsubsidized Graduate Recipients are those graduate students who recieved
                       loans WITHOUT interest payed for bythe government."),
                tags$p("Unsubsidized Undergrad Recipients are those undergraduate students
                       who have recieved loans WITHOUT interest payed for by the government."),
                tags$p("Parent (plus) Recipients are those parents who have recieved student
                       loans on behalf of thier children.")
            )
            
    ),
    mainPanel(
        plotOutput("map")
    )
)

# Pages -------------------------------------------------------------------

main_page <- tabPanel(
    "Introduction",
    includeCSS("css_file.css"),
    tags$div(
        class = "intro",
        h1("An Examination of Federal Student Loans"),
        h4(class = "by","By Luke, Ray, and Synclair"),
        tags$div(
            tags$p(class = "para","For our project, we are interested in looking at student loans,
            and asking
            several questions about them. We chose this topic because we feel
            it is
            not only relevant to ourselves, but to many students
            (and student's families)
            throughout the country. It's also topical, as there has been some
            talk of student loan forgiveness under the new Biden administration."),
            
            tags$p(class = "para","The data we our working with is from the
            government about the Title IV program, which concerns federal
            student aid.
            We are focusing on federal student loans, as not much data is
            available about
            private loans, although this data would no doubt be very
            informative. Specifically we
            are looking at data from the end of 2020 through the beginning of
            2021, so as to
            get insights on the most recent data. The data itself covers
            multiple
            loan types
            from every college in he country where students have recieved
            government issued
            student loans. We hope to ucover some valuable insights
            through the examination of this data.")
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
