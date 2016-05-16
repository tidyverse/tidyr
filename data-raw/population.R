# making population data set
library(dplyr)
library(tidyr)

pop <- read.csv("data-raw/TB_burden_countries_2014-11-07.csv", stringsAsFactors = FALSE)

population <- pop %>%
  tbl_df() %>%
  select(country, year, e_pop_num) %>%
  filter(year >= 1995)
names(population)[3] <- "population"
write.csv(population, file = "data-raw/population.csv", row.names = FALSE)
save(population, file = "data/population.rdata")
