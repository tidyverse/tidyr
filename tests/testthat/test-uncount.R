test_that("symbols weights are dropped in output", {
  df <- tibble(x = 1, w = 1)
  expect_equal(uncount(df, w), tibble(x = 1))
})

test_that("can request to preserve symbols", {
  df <- tibble(x = 1, w = 1)
  expect_equal(uncount(df, w, .remove = FALSE), df)
})

test_that("unique identifiers created on request", {
  df <- tibble(w = 1:3)
  expect_equal(uncount(df, w, .id = "id"), tibble(id = c(1L, 1:2, 1:3)))
})

test_that("expands constants and expressions", {
  df <- tibble(x = 1, w = 2)

  expect_equal(uncount(df, 2), df[c(1, 1), ])
  expect_equal(uncount(df, 1 + 1), df[c(1, 1), ])
})

test_that("works with groups", {
  df <- tibble(g = 1, x = 1, w = 1) |> dplyr::group_by(g)
  expect_equal(uncount(df, w), df |> dplyr::select(-w))
})

test_that("must evaluate to integer", {
  df <- tibble(x = 1, w = 1 / 2)
  expect_error(uncount(df, w), class = "vctrs_error_cast_lossy")

  df <- tibble(x = 1)
  expect_error(uncount(df, "W"), class = "vctrs_error_incompatible_type")
})

test_that("works with 0 weights", {
  df <- tibble(x = 1:2, w = c(0, 1))
  expect_equal(uncount(df, w), tibble(x = 2))
})

test_that("validates inputs", {
  df <- tibble(x = 1, y = "a", w = -1)

  expect_snapshot(error = TRUE, {
    uncount(df, y)
    uncount(df, w)
    uncount(df, x, .remove = 1)
    uncount(df, x, .id = "")
  })
})

test_that("preserves factor columns", {
  df <- tibble(x = factor(c("a", "b")), w = c(2L, 3L))
  out <- uncount(df, w)

  expect_s3_class(out$x, "factor")
  expect_equal(levels(out$x), c("a", "b"))
  expect_equal(nrow(out), 5)
})

test_that("preserves date columns", {
  dates <- as.Date(c("2024-01-01", "2024-06-15"))
  df <- tibble(d = dates, w = c(2L, 1L))
  out <- uncount(df, w)

  expect_s3_class(out$d, "Date")
  expect_equal(out$d, dates[c(1, 1, 2)])
})

test_that("preserves POSIXct columns", {
  times <- as.POSIXct(c("2024-01-01 10:00:00", "2024-06-15 14:30:00"), tz = "UTC")
  df <- tibble(t = times, w = c(1L, 2L))
  out <- uncount(df, w)

  expect_s3_class(out$t, "POSIXct")
  expect_equal(out$t, times[c(1, 2, 2)])
})

test_that(".id counter resets per group", {
  df <- tibble(g = c(1, 1, 2), x = c("a", "b", "c"), w = c(2L, 1L, 3L))
  out <- df |> dplyr::group_by(g) |> uncount(w, .id = "id")

  expect_equal(out$id, c(1L, 2L, 1L, 1L, 2L, 3L))
  expect_equal(dplyr::group_vars(out), "g")
})

test_that("all zero weights produce empty data frame", {
  df <- tibble(x = 1:3, w = c(0L, 0L, 0L))
  out <- uncount(df, w)

  expect_equal(nrow(out), 0)
  expect_named(out, c("x"))
})

test_that("errors on NA weights", {
  df <- tibble(x = 1:2, w = c(1L, NA_integer_))
  expect_error(uncount(df, w), "missing")
})

test_that("preserves list columns", {
  df <- tibble(x = list(1, "a"), w = c(2L, 3L))
  out <- uncount(df, w)

  expect_equal(length(out$x), 5)
  expect_equal(out$x, list(1, 1, "a", "a", "a"))
})
