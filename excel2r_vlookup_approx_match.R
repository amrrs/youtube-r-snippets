library(tidyverse)
library(fuzzyjoin)


sheet <- tibble::tibble(
  Company = c("Apple Inc",
              "Apple Incorp",
              "Microsoft",
              "Google",
              "Facebook")
)


main <- tibble::tibble(
  Company = c("Apple Inc",
              "Microsoft",
              "Google",
              "Facebook Inc"),
  Value = c(300,200,100,50)
)



left_join(sheet, main,
          by = "Company")

stringdist_left_join(sheet,main,
                     by = "Company",
                     max_dist = 5)
