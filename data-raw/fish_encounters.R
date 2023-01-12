library(readr)
library(dplyr)

url <- "https://github.com/Myfanwy/ReproducibleExamples/raw/master/encounterhistories/fishdata.csv"

raw <- as_tibble(read_csv(url, col_types = list()))

fish_encounters <- raw %>%
  transmute(
    fish = forcats::fct_inorder(as.character(TagID)),
    station = forcats::fct_inorder(Station),
    seen = as.integer(value)
  ) %>%
  filter(seen == 1) %>%
  arrange(fish)

write_csv(fish_encounters, "data-raw/fish_encounters.csv")
usethis::use_data(fish_encounters, overwrite = TRUE)
