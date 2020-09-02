library(gtrendsR)
library(tidyverse)


res <- gtrends(c("covid"), geo = c('US','AR-C','IN','GB'))

resp <- res$interest_over_time

resp %>% 
  filter(date > as.Date("2020-01-01")) %>%
  ggplot() + geom_line(aes(x = date,
                           y = as.numeric(hits),
                           color = geo)) +
  theme_minimal()
