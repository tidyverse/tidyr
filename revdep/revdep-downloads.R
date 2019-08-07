#' ---
#' output: github_document
#' ---
#'
#+ setup, include = FALSE, cache = FALSE
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", error = TRUE)
options(tidyverse.quiet = TRUE)

#' Look at the number of downloads in the past month of the packages exhibiting
#' problems in the tidyr revdep check. Useful for prioritizing the
#' investigation.

#+ body
library(tidyverse)

new_problems_path <- here::here("revdep/problems.md")
md <- readLines(new_problems_path)
pkg <- md %>%
  str_subset("^#[^#]") %>%
  str_extract("[[:alnum:]]+")

dl <- cranlogs::cran_downloads(when = "last-month", packages = pkg)

dl_count <- dl %>%
  count(package, wt = count) %>%
  mutate(package = fct_reorder(package, n)) %>%
  arrange(desc(package))

dl_count %>%
  mutate(
    prop = n / sum(n),
    cum_prop = cumsum(prop)
  ) %>%
  print(n = 20)

ggplot(head(dl_count, 20), aes(package, n)) +
  geom_col() +
  coord_flip()
