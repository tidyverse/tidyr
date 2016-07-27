library(readr)
library(dplyr)
library(tidyr)

who <- read_csv("data-raw/who.csv")
population <- read_csv("data-raw/population.csv")

table1 <-
  who %>%
  filter(
    country %in% c("Afghanistan", "Brazil", "China"),
    year >= 1999, year <= 2000
  ) %>%
  gather("code", "value", 5:60) %>%
  group_by(country, year) %>%
  summarise(cases = sum(value, na.rm = TRUE)) %>%
  ungroup() %>%
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

save(table1, file = "data/table1.rdata")
save(table2, file = "data/table2.rdata")
save(table3, file = "data/table3.rdata")
save(table4a, file = "data/table4a.rdata")
save(table4b, file = "data/table4b.rdata")
save(table5, file = "data/table5.rdata")
