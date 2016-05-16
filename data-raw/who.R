# who.R
# Making who data set

who <- read.csv("data-raw/TB_notifications_2014-11-13.csv", stringsAsFactors = FALSE)

library(dplyr)
library(tidyr)

who2 <- who %>% 
  tbl_df() %>%
  select(country:iso3, year, new_sp_m014:new_sp_m65, new_sp_f014:new_sp_f65, new_sn_m014:new_sn_m65, new_sn_f014:new_sn_f65, new_ep_m014:new_ep_m65, new_ep_f014:new_ep_f65, newrel_m014:newrel_m65, newrel_f014:newrel_f65)

dput(names(who2)[47:60])
names(who2)[47:60] <- c("new_rel_m014", "new_rel_m1524",
  "new_rel_m2534", "new_rel_m3544", "new_rel_m4554", 
  "new_rel_m5564", "new_rel_m65", "new_rel_f014", 
  "new_rel_f1524", "new_rel_f2534", "new_rel_f3544", 
  "new_rel_f4554", "new_rel_f5564", "new_rel_f65")

who <- who2
write.csv(who, file = "data-raw/who.csv", row.names = FALSE)
save(who, file = "data/who.rdata")