context("test-pivot-wide")

test_that("can pivot all cols to wide", {
  df <- tibble(key = c("x", "y", "z"), val = 1:3)
  pv <- pivot_wide(df, key, val)

  expect_named(pv, c("x", "y", "z"))
  expect_equal(nrow(pv), 1)
})

test_that("non-pivoted cols are preserved", {
  df <- tibble(a = 1, key = c("x", "y"), val = 1:2)
  pv <- pivot_wide(df, key, val)

  expect_named(pv, c("a", "x", "y"))
  expect_equal(nrow(pv), 1)
})

test_that("implicit missings turn into explicit missings", {
  df <- tibble(a = 1:2, key = c("x", "y"), val = 1:2)
  pv <- pivot_wide(df, key, val)

  expect_equal(pv$a, c(1, 2))
  expect_equal(pv$x, c(1, NA))
  expect_equal(pv$y, c(NA, 2))
})

test_that("duplicated keys produce list column", {
  df <- tibble(a = c(1, 1, 2), key = c("x", "x", "x"), val = 1:3)
  expect_warning(pv <- pivot_wide(df, key, val), "list-col")

  expect_equal(pv$a, c(1, 2))
  expect_equal(pv$x, list_of(c(1L, 2L), 3L))
})

test_that("can pivot from multiple measure cols", {
  df <- tibble(row = 1, var = c("x", "y"), a = 1:2, b = 3:4)
  sp <- tibble::tribble(
    ~.name, ~.value, ~var,
    "x_a", "a", "x",
    "y_a", "a", "y",
    "x_b", "b", "x",
    "y_b", "b", "y",
  )
  pv <- pivot_wide(df, spec = sp)

  expect_named(pv, c("row", "x_a", "y_a", "x_b", "y_b"))
  expect_equal(pv$x_a, 1)
  expect_equal(pv$y_b, 4)
})

test_that("warn when overwriting existing column", {
  df <- tibble(
    a = c(1, 1),
    key = c("a", "b"),
    val = c(1, 2)
  )
  expect_message(pv <- pivot_wide(df, key, val), "New names")
})
