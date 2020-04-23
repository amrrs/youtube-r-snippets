# library tidyverse for data manipulation and plot

library(tidyverse)

# reading input dataset

co2 <- read_csv("C:/users/abdrs/Downloads/food_consumption.csv")


countries <- read_csv("C:/users/abdrs/Downloads/Countries-Continents.csv")


countries$some_number <- 6

co2 <- co2 %>% 
  left_join(countries, by = c('country' = 'Country')) 


co2 <- merge(co2, countries,  
      by.x = 'country',
      by.y = "Country")



  
