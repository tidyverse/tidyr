library(dplyr)
library(tidyr)
library(readr)

pop <- read_csv("data-raw/TB_burden_countries_2014-11-07.csv",
  col_types = list(
    e_mort_tbhiv_num = col_double()
  )
)

population <- pop %>%
  select(country, year, population = e_pop_num) %>%
  filter(year >= 1995) %>%
  mutate(country = iconv(country, from = "UTF-8", to = "ASCII//TRANSLIT"))

write_csv(population, "data-raw/population.csv")
save(population, file = "data/population.rdata")
