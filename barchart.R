library(ggplot2)
library(dplyr)
database <- read.csv("data/dashboard_data.csv")
national_ave <- mean(database$Subsidized.Dollars.of.Disbursements, na.rm = T) %>%
  round()

wa_ave <- database %>%
  filter(State == "WA") %>%
  summarise(state_average = mean(Subsidized.Dollars.of.Disbursements, na.rm = T)) %>%
  pull(state_average) %>%
  round()

df <- data.frame(
  name = c("National Average", "WA Average"),
  loan = c(national_ave, wa_ave)
)

p <- ggplot(data = df, aes(x = name, y = loan)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_text(aes(label = loan),
    vjust = 1.6,
    color = "white", size = 3.5
  ) +
  theme_minimal() +
  labs(
    y = "Dollar Amount", x = "",
    title = "National Vs WA Student Loan Subsidized Disburements"
  )

major_school <- database %>% 
  filter(School.Type == "Public" | School.Type == "Private-Nonprofit")

plot_chart <- ggplot(major_school, aes(x = School.Type, y = Subsidized.Recipients)) +
  geom_boxplot(outlier.shape = NA) +
  ylim(c(0, 2000)) +
  labs(title = "School Type and their Loan Recipient")
