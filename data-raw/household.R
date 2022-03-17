library(tidyverse)

household <- tribble(
  ~family,  ~dob_child1,  ~dob_child2, ~name_child1, ~name_child2,
        1, "1998-11-26", "2000-01-29",      "Susan",       "Jose",
        2, "1996-06-22",           NA,       "Mark",           NA,
        3, "2002-07-11", "2004-04-05",        "Sam",       "Seth",
        4, "2004-10-10", "2009-08-27",      "Craig",       "Khai",
        5, "2000-12-05", "2005-02-28",     "Parker",     "Gracie",
)
household <- household |>
  mutate(
    family = as.integer(family),
    across(starts_with("dob"), parse_date)
  )

household

usethis::use_data(household, overwrite = TRUE)
