library(readr)
library(dplyr)

construction <- as_tibble(read_csv("data-raw/construction.csv", col_types = list()))

construction <- construction %>%
  select(-Total) %>%
  filter(Year == 2018)

usethis::use_data(construction, overwrite = TRUE)
