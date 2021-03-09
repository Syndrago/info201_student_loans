library(knitr)
library(tidyverse)
dashboard <- read.csv("data/dashboard_data.csv")
subsidized_state_most_average_disimbursement <- dashboard %>%
  mutate(Subsidized.Disimbursement.Ratio = Subsidized.Dollars.of.Disbursements/Subsidized.Dollars.of.Loans.Originated, na.rm = T) %>%
  group_by(State) %>%
  filter(Subsidized.Disimbursement.Ratio == max(Subsidized.Disimbursement.Ratio, na.rm = T))
tabledata <- subsidized_state_most_average_disimbursement %>% 
  select(School, State, Subsidized.Disimbursement.Ratio)