library(readr)
library(dplyr)

billboard <- as_tibble(read_csv(
  "data-raw/billboard.csv",
  col_types = list(
    year = col_skip(),
    time = col_skip()
  )
))

usethis::use_data(billboard, overwrite = TRUE)
