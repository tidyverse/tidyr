library(dplyr)
library(tidyr)
library(readr)

who_raw <- read_csv("data-raw/TB_notifications_2014-11-13.csv")

who <- who_raw %>%
  select(
    country:iso3, year, new_sp_m014:new_sp_m65, new_sp_f014:new_sp_f65,
    new_sn_m014:new_sn_m65, new_sn_f014:new_sn_f65, new_ep_m014:new_ep_m65,
    new_ep_f014:new_ep_f65, newrel_m014:newrel_m65, newrel_f014:newrel_f65
  ) %>%
  mutate(country = iconv(country, from = "UTF-8", to = "ASCII//TRANSLIT"))

write_csv(who, "data-raw/who.csv")
save(who, file = "data/who.rdata")
