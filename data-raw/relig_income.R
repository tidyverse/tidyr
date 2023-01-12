library(readr)
library(dplyr)

relig_income <- as_tibble(
  read_csv("data-raw/relig_income.csv", col_types = list())
)
usethis::use_data(relig_income, overwrite = TRUE)
