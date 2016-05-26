library("devtools")

install.packages("tibble", lib = getOption("devtools.revdep.libpath"))

res <- revdep_check()
revdep_check_save_summary()
revdep_email(date = "June 10", only_problems = TRUE, draft = FALSE)
