context("Spread")
library(dplyr, warn.conflicts = FALSE)
library(data.table)

test_that("the spread-method for data.table is found", {
  expect_true("spread_.data.table" %in% methods(spread_))
})


test_that("order doesn't matter", {
  one <- data.table(x = c("a", "b"), y = 1:2) %>%
    spread(x, y)
  two <- data.table(x = c("b", "a"), y = 2:1) %>%
    spread(x, y) %>%
    select(a, b) %>%
    arrange(a, b)
  expect_equal(one, two)

  one <- data.table(z = c("b", "a"), x = c("a", "b"), y = 1:2) %>%
    spread(x, y) %>% arrange(z)
  two <- data.table(z = c("a", "b"), x = c("b", "a"), y = 2:1) %>%
    spread(x, y)
  expect_equal(one, two)
})

test_that("convert turns strings into integers", {
  df <- data.table(k = "a", value = "1")
  out <- spread(df, k, value, convert = TRUE)

  expect_is(df$value, "character")
  expect_is(out$a, "integer")
})

test_that("duplicate values for one key is an error", {
  df <- data.table(x = c("a", "b", "b"), y = c(1, 2, 2), z = c(1, 2, 2))

  expect_error(df %>% spread(x, y), "Duplicate identifiers")
})

test_that("factors are spread into columns (#35)", {
  data <- data.table(
    x = c("a", "a", "b", "b"),
    y = c("c", "d", "c", "d"),
    z = c("w", "x", "y", "z")
  )
  out <- data %>% spread(x, z)
  out.df <- data %>% setDF %>% spread(x,z)

  expect_equal(names(out), c("y", "a", "b"))
  expect_equal(setDF(out), out.df)
})

test_that("drop = FALSE keeps missing combinations (#25)", {
  df <- data.table(
    x = factor("a", levels = c("a", "b")),
    y = factor("b", levels = c("a", "b")),
    z = 1
  )

  out <- df %>% spread(x, z, drop = FALSE)
  out.df <- df %>% setDF %>% spread(x, z, drop = FALSE)
  expect_equal(nrow(out), 2)
  expect_equal(ncol(out), 3)
  expect_equal(out$a[2], 1)

  expect_equal(setDF(out), out.df)
})


