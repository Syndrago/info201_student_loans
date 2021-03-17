
library(shiny)
library(tidyverse)
library(scales)
library(plotly)
library(ggplot2)
library(DT)


loan_data <- read.csv(file = "dashboard_data.csv")

# create a table for average loan of each school
data_for_char3 <- loan_data %>%
  mutate(average_sub = Subsidized.Dollars.of.Loans.Originated
  / Subsidized.Num.of.Loans.Originated) %>%
  filter(School.Type == "Public") %>%
  select(School, State, average_sub)

# Heatmap -----------------------------------------------------------------
popdata <- read.csv(file = "2020.csv")

filt <- popdata %>%
  select(NAME, POPESTIMATE2020)

filt <- filt[6:56, ]

filt$NAME <- state.abb[match(tolower(filt$NAME), tolower(state.name))]

filt <- filt %>%
  rename(State = NAME, Population = POPESTIMATE2020)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$map <- renderPlot({
    selected <- loan_data %>%
      select(
        3:7,
        Unsubsidized.Undergrad.Recipients,
        Unsubsidized.Graduate.Recipients,
        Parent.Plus.Recipients
      )

    assign("drop", input$var) #get(input)

    filt_data <- selected %>%
      group_by(State) %>%
      summarise(state_total = sum(get(drop), na.rm = T)) %>%
      left_join(filt, by = "State") %>%
      na.omit() %>%
      mutate(percent_of_pop = round(state_total / Population, 4) * 100)

    state_shapes <- map_data("state") %>% # Get shape map of states
      rename(State = region)

    state_shapes$State <- state.abb[match(state_shapes$State, tolower(state.name))]

    joined <- state_shapes %>% # Join state shapes and stats
      left_join(filt_data, by = "State")

    if (input$bchoice == "Total") {
      choice <- "state_total"
      lab <- "Total Count"
    } else {
      choice <- "percent_of_pop"
      lab <- "Rate"
    }

    heatmap <- ggplot(joined) + # Create chart
      geom_polygon(
        mapping = aes(x = long, y = lat, group = group, fill = get(choice)),
        color = "white",
        size = .1
      ) +
      coord_map() +
      scale_fill_continuous(low = "Green4", high = "Red", labels = comma) +
      labs(fill = lab) +
      theme(
        axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        plot.background = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank()
      ) +
      theme(
        legend.key.size = unit(1.5, "cm"), legend.text = element_text(size = 15),
        legend.title = element_text(size = 25)
      ) +
      labs(title = paste("Heatmap of", gsub("[.]", " ", input$var), "as", input$bchoice)) +
      theme(plot.title = element_text(hjust = 0.5, size = 25, family = "TT Times New Roman"))

    return(heatmap)
  })
  output$tabletitle <- renderText({
    input$category
  })
  output$dollartable <- renderDataTable({
    assign("dtype", input$category)
    loantabled <- loan_data %>%
      filter(!is.na(get(dtype))) %>%
      select(School, State, dtype) %>%
      filter(between(
        get(dtype),
        input$dollars[1], input$dollars[2]
      )) %>%
      arrange(School)
    colnames(loantabled) <- c("School", "State", gsub("[.]", " ", dtype))
    loantabled
  })

  output$title_3 <- renderText({
    title_str <- paste0("Top ", input$x_val, " affordable schools in ", input$state)
    title_str
  })

  output$top_school <- renderPlotly({
    df <- data_for_char3 %>%
      filter(State == input$state) %>%
      arrange() %>%
      top_n(input$x_val * -1)
    bar_chart <- ggplot(df, aes(y = reorder(School, average_sub * -1), x = average_sub)) +
      geom_bar(stat = "identity") +
      labs(x = "Average Loan Per Recipient", y = "School")
    bar_chart
  })
})
