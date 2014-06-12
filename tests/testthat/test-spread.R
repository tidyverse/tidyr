context("Spread")
library(dplyr, warn.conflicts = FALSE)

test_that("order doesn't matter", {

  one <- data.frame(x = c("a", "b"), y = 1:2) %>% spread(x, y)
  two <- data.frame(x = c("b", "a"), y = 2:1) %>% spread(x, y) %>%
    select(a, b) %>% arrange(a, b)
  expect_equal(one, two)

  one <- data.frame(z = c("b", "a"), x = c("a", "b"), y = 1:2) %>%
    spread(x, y) %>% arrange(z)
  two <- data.frame(z = c("a", "b"), x = c("b", "a"), y = 2:1) %>%
    spread(x, y)
  expect_equal(one, two)
})


test_that("duplicate values for one key is an error", {
  df <- data.frame(x = c("a", "b", "b"), y = c(1, 2, 2), z = c(1, 2, 2))

  expect_error(df %>% spread(x, y), "Duplicate identifiers for rows (2, 3)",
    fixed = TRUE)
})
