library(ggplot2)
library(dplyr)
database <- read.csv("https://raw.githubusercontent.com/info201a-w21/info201_student_loans/main/data/dashboard_data.csv?token=ASPLDNWOLRU7NNTQEHOFDFDAHBZRE")
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

plot_chart <- ggplot(database, aes(x = School.Type, y = Subsidized.Recipients)) +
  geom_boxplot(outlier.shape = NA) +
  ylim(c(0, 2000))
plot_chart
