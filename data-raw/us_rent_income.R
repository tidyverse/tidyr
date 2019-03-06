library(tidycensus)

# Find a few variables
v15 <- load_variables(2016, "acs5", cache = TRUE)
View(v15)
vars <- c("income" = "B06011_001", "rent" = "B25064_001")

# Retrieve the data
us_rent_income <- get_acs(geography = "state", variables = vars, year = 2017)

usethis::use_data(us_rent_income, overwrite = TRUE)
