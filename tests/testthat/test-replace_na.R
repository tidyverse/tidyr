# vector ------------------------------------------------------------------

test_that("empty call does nothing", {
  x <- c(1, NA)
  expect_equal(replace_na(x), x)
})

test_that("missing values are replaced", {
  x <- c(1, NA)
  expect_equal(replace_na(x, 0), c(1, 0))
})

test_that("can only be length 0", {
  expect_snapshot(replace_na(1, 1:10), error = TRUE)
})

test_that("can replace missing rows in arrays", {
  x <- matrix(c(NA, NA, NA, 6), nrow = 2)
  replace <- matrix(c(-1, -2), nrow = 1)
  expect <- matrix(c(-1, NA, -2, 6), nrow = 2)

  expect_identical(replace_na(x, replace), expect)
})

test_that("can replace missing values in rcrds", {
  x <- new_rcrd(list(x = c(1, NA, NA), y = c(1, NA, 2)))
  expect <- new_rcrd(list(x = c(1, 0, NA), y = c(1, 0, 2)))

  expect_identical(
    replace_na(x, new_rcrd(list(x = 0, y = 0))),
    expect
  )
})

test_that("replacement must be castable to `data`", {
  x <- c(1L, NA)
  expect_snapshot(replace_na(x, 1.5), error = TRUE)
})

test_that("empty atomic elements are not replaced in lists (#1168)", {
  x <- list(character(), NULL)

  expect_identical(
    replace_na(x, replace = list("foo")),
    list(character(), "foo")
  )
})

test_that("can replace value in `NULL` (#1292)", {
  expect_identical(replace_na(NULL, replace = "NA"), NULL)
  expect_identical(replace_na(NULL, replace = 1L), NULL)
})

# data frame -------------------------------------------------------------

test_that("empty call does nothing", {
  df <- tibble(x = c(1, NA))
  out <- replace_na(df)
  expect_equal(out, df)
})

test_that("missing values are replaced", {
  df <- tibble(x = c(1, NA))
  out <- replace_na(df, list(x = 0))
  expect_equal(out$x, c(1, 0))
})

test_that("don't complain about variables that don't exist", {
  df <- tibble(a = c(1, NA))
  out <- replace_na(df, list(a = 100, b = 0))
  expect_equal(out, tibble(a = c(1, 100)))
})

test_that("can replace NULLs in list-column", {
  df <- tibble(x = list(1, NULL))
  rs <- replace_na(df, list(x = list(1:5)))

  expect_identical(rs, tibble(x = list(1, 1:5)))
})

test_that("df-col rows must be completely missing to be replaceable", {
  col <- tibble(x = c(1, NA, NA), y = c(1, 2, NA))
  df <- tibble(a = col)

  col <- tibble(x = c(1, NA, -1), y = c(1, 2, -2))
  expect <- tibble(a = col)

  replace <- tibble(x = -1, y = -2)

  expect_identical(
    replace_na(df, list(a = replace)),
    expect
  )
})

test_that("replacement must be castable to corresponding column", {
  df <- tibble(a = c(1L, NA))
  expect_snapshot(replace_na(df, list(a = 1.5)), error = TRUE)
})

test_that("validates its inputs", {
  df <- tibble(a = c(1L, NA))
  expect_snapshot(error = TRUE, {
    replace_na(df, replace = 1)
  })
})

test_that("can replace NAs in factor columns", {
  fct <- factor(c("a", NA, "b"), levels = c("a", "b", "c"))
  df <- tibble(x = fct)
  out <- replace_na(df, list(x = "c"))

  expect_equal(out$x, factor(c("a", "c", "b"), levels = c("a", "b", "c")))
})

test_that("can replace NAs in factor vector", {
  fct <- factor(c("a", NA, "b"), levels = c("a", "b", "c"))
  out <- replace_na(fct, "c")

  expect_equal(out, factor(c("a", "c", "b"), levels = c("a", "b", "c")))
})

test_that("empty data frame returns empty data frame", {
  df <- tibble(x = integer(), y = character())
  out <- replace_na(df, list(x = 0L, y = "unknown"))

  expect_identical(out, df)
})

test_that("all-NA data frame is fully replaced", {
  df <- tibble(x = c(NA_real_, NA_real_), y = c(NA_character_, NA_character_))
  out <- replace_na(df, list(x = 0, y = "missing"))

  expect_equal(out$x, c(0, 0))
  expect_equal(out$y, c("missing", "missing"))
})

test_that("can replace NAs in Date columns", {
  df <- tibble(x = as.Date(c("2024-01-01", NA, "2024-01-03")))
  out <- replace_na(df, list(x = as.Date("2024-01-02")))

  expect_equal(out$x, as.Date(c("2024-01-01", "2024-01-02", "2024-01-03")))
})

test_that("can replace NAs in POSIXct columns", {
  dt <- as.POSIXct(c("2024-01-01 10:00:00", NA), tz = "UTC")
  replacement <- as.POSIXct("2024-01-02 12:00:00", tz = "UTC")
  df <- tibble(x = dt)
  out <- replace_na(df, list(x = replacement))

  expect_equal(out$x, c(dt[1], replacement))
})
