library(tidyverse)
data <- read.csv(file = "data/dashboard_data.csv")
data$Subsidized.Recipients <- suppressWarnings(as.numeric(gsub(",", "", data$Subsidized.Recipients, fixed = TRUE)))

summary_info <- list()

summary_info$highest_recipient_name <- data %>% 
  filter(Subsidized.Recipients == max(Subsidized.Recipients, na.rm = T)) %>% 
  pull(School)

summary_info$average_recipients <- round(mean(data$Subsidized.Recipients, na.rm = T))

summary_info$num_colleges <- nrow(data)

summary_info$average_amount <- round(mean(data$Subsidized.Dollars.of.Disbursements, na.rm = T))

summary_info$highest_amount <- round(max(data$Subsidized.Dollars.of.Disbursements, na.rm = T))



