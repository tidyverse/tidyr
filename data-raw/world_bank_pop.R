library(dplyr)
library(readr)
# https://data.worldbank.org/topic/climate-change?view=chart

url <- "https://api.worldbank.org/v2/en/topic/19?downloadformat=csv"
temp <- tempfile()
download.file(url, temp)

out <- unzip(temp, exdir = tempdir())

# Pick a few indicators
indicators <- read_csv(out[[1]], col_types = list())

# indicators %>%
#   filter(str_sub(INDICATOR_CODE, 1, 2) == "SP") %>%
#   View()

# Urban and total population - total vs growth
ind <- c("SP.URB.TOTL", "SP.URB.GROW", "SP.POP.TOTL", "SP.POP.GROW")

wb <- as_tibble(read_csv(out[[2]], skip = 4, col_types = list()))
world_bank_pop <- wb %>%
  select(country = `Country Code`, indicator = `Indicator Code`, `2000`:`2017`) %>%
  filter(indicator %in% ind)

write_csv(world_bank_pop, "data-raw/world_bank_pop.csv")
usethis::use_data(world_bank_pop, overwrite = TRUE)
