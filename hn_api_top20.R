library(httr)
library(jsonlite)

url <- "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty"

response <- httr::GET(url)

top500 <- unlist(content(response))

top20 <- top500[1:20]

titles <- c()
scores <- c()
urls <- c()

for(one in top20){
  story_url <- paste0("https://hacker-news.firebaseio.com/v0/item/",one,".json?print=pretty")
  #print(story_url)
  story_response <- httr::GET(story_url)
  
  titles <- c(titles,content(story_response)$title)
  scores <- c(scores,content(story_response)$score)
  urls <- c(urls,content(story_response)$url)
  
}

hn_top20 <- as.data.frame(cbind(titles,urls,scores))



