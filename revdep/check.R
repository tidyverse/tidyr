library("devtools")

res <- revdep_check()

writeLines(revdep_check_summary(res), "revdep/summary.md")
revdep_check_save_logs(res)
