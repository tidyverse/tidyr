library(tidyverse)

url <- "https://github.com/Myfanwy/ReproducibleExamples/raw/master/encounterhistories/fishdata.csv"

raw <- read_csv(url)

fish_encounters <- raw %>%
  transmute(
    fish = fct_inorder(as.character(TagID)),
    station = fct_inorder(Station),
    seen = as.integer(value)
  ) %>%
  filter(seen == 1) %>%
  arrange(fish)

usethis::use_data(fish_encounters, overwrite = TRUE)
