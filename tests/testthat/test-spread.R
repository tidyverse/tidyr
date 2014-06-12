context("Spread")
library(dplyr, warn.conflicts = FALSE)

test_that("order doesn't matter", {

  one <- data.frame(x = c("a", "b"), y = 1:2) %>% spread(x, y)
  two <- data.frame(x = c("b", "a"), y = 2:1) %>% spread(x, y) %>%
    select(a, b) %>% arrange(a, b)

  expect_identical(one, two)
})
