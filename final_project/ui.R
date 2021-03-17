
# Chart Page Layout -------------------------------------------------------

chart_layout <- sidebarLayout(
  sidebarPanel(
    selectInput(
      inputId = "var",
      label = "Variable of Interest",
      choices = list(
        "Subsidized Recipients" = "Subsidized.Recipients",
        "Unsubsidized Graduate Recipients" =
          "Unsubsidized.Graduate.Recipients",
        "Unsubsidized Undergrad Recipients" =
          "Unsubsidized.Undergrad.Recipients",
        "Parent Recipients" = "Parent.Plus.Recipients"
      )
    ),
    radioButtons(
      inputId = "bchoice",
      label = "Choice",
      choices = c("Total", "Percent of Population")
    ),
    tags$div(
      h4("Explanation:"),
      tags$p("Subsidized Recipients are those students who have
                       recieved loans with interest
             payed for by the government."),
      tags$p("Unsubsidized Graduate Recipients are
      those graduate students who recieved
                       loans WITHOUT interest payed
             for bythe government."),
      tags$p("Unsubsidized Undergrad Recipients are
      those undergraduate students
                       who have recieved loans
             WITHOUT interest payed for by the government."),
      tags$p("Parent (plus) Recipients are those
      parents who have recieved student
                       loans on behalf of thier children.")
    )
  ),
  mainPanel(
    plotOutput("map")
  )
)

# chart 2 -----------------------------------------------------------------


chart2_layout <- sidebarLayout(
  sidebarPanel(
    selectInput(
      inputId = "category",
      label = "Student Loan Type",
      choices = list(
        "Subsidized" = "Subsidized.Dollars.of.Loans.Originated",
        "Unsubsidized Undergraduate" =
          "Unsubsidized.Undergrad.Dollars.of.Loans.Originated",
        "Unsubsidized Graduate" =
          "Unsubsidized.Graduate.Dollars.of.Loans.Originated",
        "Parent Plus" = "Parent.Plus.Dollars.of.Loans.Originated",
        "Graduate Plus" = "Grad.Plus.Dollars.of.Loans.Originated"
      )
    ),
    sliderInput(
      inputId = "dollars",
      label = "Choose Dollar Range",
      min = 0,
      max = max(loan_data$Unsubsidized.Graduate.Dollars.of.Loans.Originated, na.rm = T),
      value = c(5200000, 136000000)
    )
  ),
  mainPanel(
    dataTableOutput("dollartable")
  )
)

# chart 3 -----------------------------------------------------------------


chart3_layout <- sidebarLayout(
  sidebarPanel(
    selectInput(
      inputId = "state",
      label = "Choose a State",
      choices = filt$State,
      selected = "WA"
    ),
    numericInput( # how many schools users want show
      inputId = "x_val",
      label = "How many schools do you want to show?",
      value = 10,
      min = 1,
      max = 20,
      step = 1
    )
  ),
  mainPanel(
    tags$span(textOutput("title_3"), style = "color:red"),
    plotlyOutput("top_school")
  )
)
# Pages -------------------------------------------------------------------

main_page <- tabPanel(
  "Introduction",
  includeCSS("css_file.css"),
  tags$div(
    class = "intro",
    h1("An Examination of Federal Student Loans"),
    h4(class = "by", "By Luke, Ray, and Synclair"),
    tags$div(
      tags$p(class = "para", "For our project,
      we are interested in looking at student loans,
            and asking
            several questions about them. We chose this topic because we feel
            it is
            not only relevant to ourselves, but to many students
            (and student's families)
            throughout the country. It's also topical, as there has been some
            talk of student loan forgiveness under the new
             Biden administration."),

      tags$p(class = "para", "The data we our working with is from the
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
            student loans. We hope to uncover some valuable insights
            through the examination of this data.")
    )
  )
)

chart_one <- tabPanel(
  "Geographic Variation",
  chart_layout
)

chart_two <- tabPanel(
  " Loan Range",
  chart2_layout,
)

chart_three <- tabPanel(
  "Affordable Schools",
  h1("Find the most affordable schools"),
  p("*Affordable means students borrow less amount of loan when they apply for subsidized loan.",
    style = "font-weight: 500; color: #4d3a7d;"
  ),
  chart3_layout,
)

summary <- tabPanel(
  "Summary",
  tags$div(
    class = "intro",
    h1("Insights"),
    h3("Geographic Variation"),
    tags$p("When looking at geographic variation I was originally looking
             at just the total numbers. Unsurprisingly, when measuring this
             way, the most populous states are the ones that tend to have the
             most loan recipients for every type of loan. One interesting thing
             here is that Texas has more undergraduate recipients, while
             California has more graduate recipients. To get a better picture
             of things, I switched to measuring the recipients as a percentage
             of the total population, which reveals a few insightful patterns.
             One interesting pattern that emerged form measuring this way is
             that the West Coast has a lower rate in each category, compared
             to the rest of the country. Another interesting pattern that came
             out in the visualization is that New Hampshire is high in
             recipients no matter the category and is the highest for
             subsidized recipients and unsubsidized undergrad recipients.
             For unsubsidized graduate recipients, the highest receiving
             state is Minnesota, despite not having nearly the same rate
             in other categories. The final thing I noticed is that when
             you switch to parent recipients, a lot of the states that
             appear to have higher rates are those more rural states, such
             as Montana, Nebraska, Kansas, and Iowa. Overall, this
             visualization revealed geographic patterns as intended. However,
             it shows the what and not the why. It would be interesting to
             cross reference this with other factors, such as more specific
             population data, or go in closer and examine at the county level
             to possibly establish some correlation or even causality. This
             graphic also excludes Alaska, Hawaii, and any US territories,
             which is also a shortcoming. "),
    h3("Loan Range"),
    tags$p(" Often when we receive our student loans, we find ourselves
             wondering why the amount disimbursed are not the same as the
             initiated fees that was listed in the beginning. This is because
             there are some fees that are deducted from the originated loan
             amount for administrative purposes. The table helps us narrow
             down the ranges of originated loan that we are comfortable with
             (loan + fees). Upon utilizing the tool, we found out that Arizona
             State University has the most loan originated for Subsidized,
             Unsubsidized Undergraduate, and Unsubsidized Graduate. For Parent
             Plus, the school with the most originated loan is Pennsylvania
             State University. Lastly, New York University has the most dollar
             originated for Graduate Plus student loan."),
    h3("Affordable School"),
    tags$p("This app is for people who are looking for school and might want
             to apply for student loan. In WA, almost all the schools that 
             have less average loan per recipient are colleges, and the average 
             amount is around 3000 dollars. And in Vermont, there are only 12 
             public and private colleges, which I feel funny."),
    h3("Conclusion"),
    tags$p("At the beginning of this project, we set out to ask and answer 
             several questions. Questions such as whether there is any 
             geographic variation in loan recipients, finding schools that 
             provide loans in a certain range, and what schools get the most 
             affordable loans in each state. We originally designed this 
             ShinyApp specifically with students who are in trouble looking 
             for the schools with the student loans that fit their needs, 
             and we think that we have achieved so using our relatively 
             easy to understand visualizations.")
  )
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
