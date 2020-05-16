library(gapminder)
library(ggcharts)

gapminder <- gapminder

gapminder %>% 
  filter(year %in% c(1997,2007),
         country %in% c("Germany","France","Poland",
                        "Italy","Egypt","Austria")) %>% 
  select(one_of("country","year","gdpPercap")) %>% #View()
  pivot_wider(names_from = year,
              values_from = "gdpPercap") %>% 
  dumbbell_chart(x = country,
                 y1 = `1997`,
                 y2 = `2007`,
                 legend_labels = c("gdpPercap at 1997",
                                   "gdpPercap at 2007")) +
  labs(title = "How to do Dumbbell Chart",
       subtitle = "using {ggcharts}",
       caption = "Data: Gapminder",
       y = "gdp per capita") +
  theme_ng()
