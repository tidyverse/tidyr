library(tidycensus)
library(readr)

# Find a few variables
v15 <- load_variables(2016, "acs5", cache = TRUE)
if (interactive())
  View(v15)
vars <- c("income" = "B06011_001", "rent" = "B25064_001")

# Retrieve the data
us_rent_income <- get_acs(geography = "state", variables = vars, year = 2017)

write_csv(us_rent_income, "data-raw/us_rent_income.csv")
usethis::use_data(us_rent_income, overwrite = TRUE)
