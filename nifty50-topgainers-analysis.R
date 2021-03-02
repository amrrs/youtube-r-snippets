library(tidyverse)
library(rvest)
library(janitor)

#nse top gainers

url <- 'https://www.moneycontrol.com/stocks/marketstats/nsegainer/index.php'

# extract html 

url_html <- read_html(url)

#table extraction

url_tables <- url_html %>% html_table(fill = TRUE)

#extract relevant table

top_gainers <- url_tables[[2]]

#extract relevant columns

top_gainers %>%
  select(1:7) -> top_gainers

top_gainers %>% 
  clean_names() -> top_gainers

top_gainers %>%
  filter(!is.na(low)) -> top_gainers

top_gainers %>%
  separate(company_name,
           into = 'company_name',
           sep = '\t') -> top_gainers
# Top Gainers Chart 

top_gainers %>% 
  arrange(-percent_gain) %>%
  head(10) %>%
  mutate(company_name = fct_reorder(company_name,percent_gain)) %>%
  ggplot() + 
  geom_col(aes(y = company_name,
                      x = percent_gain)) +
  geom_label(aes(y = company_name,
                 x = percent_gain,
                 label = last_price)) +
  theme_minimal()+
  labs(title = "Top Gainer - Nifty50",
       subtitle = 'using R')
  
