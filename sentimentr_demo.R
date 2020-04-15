library(sentimentr)
library(tidyverse)


text <- "This tutorial is awesome. The creator is not boring"

sentiment()

sentiment_by()

sentiment(text)

sentiment_by(text, by = NULL)

profanity(text)

debates <- presidential_debates_2012  


debates_with_pol <- debates %>% 
  get_sentences() %>% 
  sentiment() %>% 
  mutate(polarity_level = ifelse(sentiment < 0.2, "Negative",
                                 ifelse(sentiment > 0.2, "Positive","Neutral")))
           

debates_with_pol %>% filter(polarity_level == "Negative") %>% View()


debates_with_senti %>% 
  ggplot() + geom_boxplot(aes(y = person, x = sentiment))

debates$dialogue %>% 
  get_sentences() %>% 
  sentiment_by() %>% #View()
  highlight()
  


debates %>% 
  get_sentences() %>% 
  sentiment_by(by = NULL) %>% #View()
  ggplot() + geom_density(aes(ave_sentiment))




