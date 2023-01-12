library(readr)
library(dplyr)
library(tidyr)

who <- as_tibble(
  read_csv("data-raw/who.csv", col_types = list())
)
population <- as_tibble(
  read_csv("data-raw/population.csv", col_types = list())
)

table1 <-
  who %>%
  filter(
    country %in% c("Afghanistan", "Brazil", "China"),
    year >= 1999, year <= 2000
  ) %>%
  gather("code", "value", 5:60) %>%
  summarise(cases = sum(value, na.rm = TRUE), .by = c(country, year)) %>%
  left_join(population, by = c("country", "year"))

table2 <-
  table1 %>%
  gather("type", "count", 3:4) %>%
  arrange(country, year)

table3 <-
  table1 %>%
  unite("rate", cases, population, sep = "/")

table4a <-
  table1 %>%
  select(country, year, cases) %>%
  spread(year, cases)

table4b <-
  table1 %>%
  select(country, year, population) %>%
  spread(year, population)

table5 <-
  table3 %>%
  separate(year, into = c("century", "year"), sep = 2)

write_csv(table1, "data-raw/table1.csv")
write_csv(table2, "data-raw/table2.csv")
write_csv(table3, "data-raw/table3.csv")
write_csv(table4a, "data-raw/table4a.csv")
write_csv(table4b, "data-raw/table4b.csv")
write_csv(table5, "data-raw/table6.csv")

usethis::use_data(table1, overwrite = TRUE)
usethis::use_data(table2, overwrite = TRUE)
usethis::use_data(table3, overwrite = TRUE)
usethis::use_data(table4a, overwrite = TRUE)
usethis::use_data(table4b, overwrite = TRUE)
usethis::use_data(table5, overwrite = TRUE)
