library(dplyr)
library(readr)

pop <- as_tibble(read_csv("data-raw/TB_burden_countries_2014-11-07.csv",
  col_types = list(
    e_mort_tbhiv_num = col_double()
  )
))

population <- pop %>%
  select(country, year, population = e_pop_num) %>%
  filter(year >= 1995)

write_csv(population, "data-raw/population.csv")
usethis::use_data(population, overwrite = TRUE)
