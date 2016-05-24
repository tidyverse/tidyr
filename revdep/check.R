library("devtools")

install.packages("tibble", lib = getOption("devtools.revdep.libpath"))

res <- revdep_check()
revdep_check_save_summary()
