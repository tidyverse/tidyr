library(dplyr)
library(tidyr)
library(readr)
library(stringr)

who_raw <- as_tibble(
  read_csv("data-raw/TB_notifications_2014-11-13.csv", col_types = list())
)

who <- who_raw %>%
  select(
    country:iso3, year, new_sp_m014:new_sp_m65, new_sp_f014:new_sp_f65,
    new_sn_m014:new_sn_m65, new_sn_f014:new_sn_f65, new_ep_m014:new_ep_m65,
    new_ep_f014:new_ep_f65, newrel_m014:newrel_m65, newrel_f014:newrel_f65
  ) %>%
  mutate(
    country = iconv(country, from = "UTF-8", to = "ASCII//TRANSLIT"),
    country = gsub("^o", "o", country, fixed = TRUE)
  )

write_csv(who, "data-raw/who.csv", quote = "needed")
usethis::use_data(who, overwrite = TRUE)

who2 <- who |>
  rename_with(~ str_remove(.x, "new_?")) |>
  rename_with(~ str_replace(.x, "([mf])", "\\1_")) |>
  select(!starts_with("iso"))

usethis::use_data(who2, overwrite = TRUE)
