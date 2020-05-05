library(readr)
relig_income <- tibble::as_tibble(read_csv("data-raw/relig_income.csv"))
usethis::use_data(relig_income, overwrite = TRUE)
