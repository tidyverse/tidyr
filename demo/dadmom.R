library(tidyr)
library(dplyr)

dadmom <- foreign::read.dta("https://stats.idre.ucla.edu/stat/stata/modules/dadmomw.dta")
dadmom %>%
  gather(key, value, named:incm) %>%
  separate(key, c("variable", "type"), -2) %>%
  spread(variable, value, convert = TRUE)
