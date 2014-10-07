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

test_that("factors are spread into columns (#35)", {
  data <- data.frame(
    x = c("a", "a", "b", "b"),
    y = c("c", "d", "c", "d"),
    z = c("w", "x", "y", "z")
  )
  out <- data %>% spread(x, z)
  expect_equal(names(out), c("y", "a", "b"))
})

test_that("drop = FALSE keeps missing combinations (#25)", {
  df <- data.frame(
    x = factor("a", levels = c("a", "b")),
    y = factor("b", levels = c("a", "b")),
    z = 1
  )
  out <- df %>% spread(x, z, drop = FALSE)
  expect_equal(nrow(out), 2)
  expect_equal(ncol(out), 3)
  expect_equal(out$a[2], 1)

})
