library(tidyr)
library(magrittr)
library(dplyr)
library(stringr)

dadmom <- foreign::read.dta("http://www.ats.ucla.edu/stat/stata/modules/dadmomw.dta")
dadmom %>%
  gather(key, value, named:incm) %>%
  mutate(type = str_sub(key, -1, -1), variable = str_sub(key, 1, -2)) %>%
  select(-key) %>%
  spread(variable, value, convert = TRUE)
