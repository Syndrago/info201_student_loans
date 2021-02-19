library(knitr)
library(tidyverse)
dashboard <- read.csv("https://raw.githubusercontent.com/info201a-w21/info201_student_loans/main/data/dashboard_data.csv?token=ASLHHB4HYL4A2S5EYWTEQI3AHB4X4")
subsidized_state_most_average_disimbursement <- dashboard %>% 
  mutate(Subsidized.Disimbursement.Ratio = Subsidized.Dollars.of.Disbursements/Subsidized.Dollars.of.Loans.Originated, na.rm = T) %>%
  group_by(State) %>% 
  filter(Subsidized.Disimbursement.Ratio == max(Subsidized.Disimbursement.Ratio, na.rm = T))
tabledata <- subsidized_state_most_average_disimbursement %>% select(School, State, Subsidized.Disimbursement.Ratio)
uniq_states <- unique(dashboard$State)
