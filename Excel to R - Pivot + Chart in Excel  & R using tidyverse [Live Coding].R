library(tidyverse)

co2 <- read_csv("C:/users/abdrs/Downloads/food_consumption.csv")


co2 %>% 
  group_by(country) %>% 
  summarise(sum_of_co2 = sum(co2_emmission)) %>% 
  arrange(desc(sum_of_co2)) %>% 
  head(20) %>% 
  mutate(country = fct_reorder(country,-sum_of_co2)) %>% 
  ggplot() + geom_col(aes(x = country,
                          y = sum_of_co2), fill = "blue") + 
  ggeasy::easy_rotate_x_labels() +
  labs(title = "Total co2 Emission by Country",
       caption = "Source: Tidy Tuesday")





co2 %>% 
  group_by(country) %>% 
  summarise(sum_of_consumption = sum(consumption)) %>% 
  arrange(desc(sum_of_consumption)) %>% 
  head(20) %>% 
  mutate(country = fct_reorder(country,-sum_of_consumption)) %>% 
  ggplot() + geom_col(aes(x = country,
                          y = sum_of_consumption), fill = "blue") + 
  ggeasy::easy_rotate_x_labels() +
  labs(title = "Total consumption by Country",
       caption = "Source: Tidy Tuesday")


