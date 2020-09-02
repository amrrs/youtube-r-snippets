library(gtrendsR)
library(tidyverse)


res <- gtrends(c("covid"), geo = c('US','AR-C','IN','GB')) #this downloads the "covid" search rankings for different regions defined by these country codes "US", "AR-C", "IN", "GB"

# since the above object `res` is a list, we're trying to extract our relevant dataframe 

resp <- res$interest_over_time

resp %>% 
  filter(date > as.Date("2020-01-01")) %>%
  ggplot() + geom_line(aes(x = date,
                           y = as.numeric(hits),
                           color = geo)) +
  theme_minimal()

# saving the csv file in the current working directory

write.csv(resp,"results.csv",row.names = F)
