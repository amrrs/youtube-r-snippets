library(gtrendsR)
library(tidyverse)


res <- gtrends(c("zoom", "slack"))

iot <- res$interest_over_time

iot2020 <- iot %>% 
  filter(date > as.Date("2020-01-01"))

iot2020 %>% 
  ggplot() + geom_line(aes(x = date,
                           y = hits,
                           color = keyword)) +
  theme_minimal() +
  labs(title = "Zoom vs Slack - in 2020",
       subtitle = "Google Trends Report",
       caption = "Courtesy: gtrendsR package")
