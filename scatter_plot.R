library(tidyverse)

dash <- read.csv(file = "data/dashboard_data.csv")


scatter_plot <- ggplot(data = dash) +
  geom_point(mapping = aes(x = Subsidized.Recipients, y = Subsidized.Dollars.of.Disbursements),
  alpha = 0.3,
  size = 3,
  color = "dodgerblue2"
  ) +
  labs(y = "Dollar Amount", x = "Number of Subsidized Recipients", title = "Total Number of Recipients VS Amount Given") +
  scale_y_continuous(labels = scales::comma) +
  theme(plot.title = element_text(hjust = 0.5))