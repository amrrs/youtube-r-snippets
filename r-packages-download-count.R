library(cranlogs)
library(tidyverse)
library(hrbrthemes)


stats <- cran_downloads(package = "coinmarketcapr",
                          from = "2020-01-01", to = "2021-07-01")


stats %>%
  ggplot(aes(x = date, y = cumsum(count), group = package)) +
  geom_line(linetype=2, size = 2) +
  labs(title = "{coinmarketcapr} 15K+ Downloads since 2020",
       subtitle = "install.packages('coinmarketcapr')",
       x = "Month",
       y = "Cumulative Download",
       caption = "Data: CranLogs")  +
  theme_ipsum(base_size = 20,
              plot_title_size = 24)


