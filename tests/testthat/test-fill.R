test_that("all missings left unchanged", {
  df <- tibble(
    lgl = c(NA, NA),
    int = c(NA_integer_, NA),
    dbl = c(NA_real_, NA),
    chr = c(NA_character_, NA)
  )

  down <- fill(df, lgl, int, dbl, chr)
  up <- fill(df, lgl, int, dbl, chr, .direction = "up")

  expect_identical(down, df)
  expect_identical(up, df)
})

test_that("missings are filled correctly", {
  # filled down from last non-missing
  df <- tibble(x = c(NA, 1, NA, 2, NA, NA))

  out <- fill(df, x)
  expect_equal(out$x, c(NA, 1, 1, 2, 2, 2))

  out <- fill(df, x, .direction = "up")
  expect_equal(out$x, c(1, 1, 2, 2, NA, NA))

  out <- fill(df, x, .direction = "downup")
  expect_equal(out$x, c(1, 1, 1, 2, 2, 2))

  out <- fill(df, x, .direction = "updown")
  expect_equal(out$x, c(1, 1, 2, 2, 2, 2))
})

test_that("missings filled down for each atomic vector", {
  df <- tibble(
    lgl = c(T, NA),
    int = c(1L, NA),
    dbl = c(1, NA),
    chr = c("a", NA),
    lst = list(1:5, NULL)
  )

  out <- fill(df, tidyselect::everything())
  expect_equal(out$lgl, c(TRUE, TRUE))
  expect_equal(out$int, c(1L, 1L))
  expect_equal(out$dbl, c(1, 1))
  expect_equal(out$chr, c("a", "a"))
  expect_equal(out$lst, list(1:5, 1:5))
})

test_that("missings filled up for each vector", {
  df <- tibble(
    lgl = c(NA, T),
    int = c(NA, 1L),
    dbl = c(NA, 1),
    chr = c(NA, "a"),
    lst = list(NULL, 1:5)
  )

  out <- fill(df, tidyselect::everything(), .direction = "up")
  expect_equal(out$lgl, c(TRUE, TRUE))
  expect_equal(out$int, c(1L, 1L))
  expect_equal(out$dbl, c(1, 1))
  expect_equal(out$chr, c("a", "a"))
  expect_equal(out$lst, list(1:5, 1:5))
})

test_that("NaN is treated as missing (#982)", {
  df <- tibble(x = c(1, NaN, 2))

  out <- fill(df, x)
  expect_identical(out$x, c(1, 1, 2))

  out <- fill(df, x, .direction = "up")
  expect_identical(out$x, c(1, 2, 2))
})

test_that("can fill rcrd types", {
  col <- new_rcrd(list(x = c(1, NA, NA), y = c("x", NA, "y")))
  df <- tibble(x = col)

  out <- fill(df, x)
  expect_identical(field(out$x, "x"), c(1, 1, NA))
  expect_identical(field(out$x, "y"), c("x", "x", "y"))
})

test_that("can fill df-cols", {
  # Uses vctrs missingness rules, so partially missing rows aren't filled
  df <- tibble(x = tibble(a = c(1, NA, NA), b = c("x", NA, "y")))

  out <- fill(df, x)
  expect_identical(out$x$a, c(1, 1, NA))
  expect_identical(out$x$b, c("x", "x", "y"))

  out <- fill(df, x, .direction = "up")
  expect_identical(out$x$a, c(1, NA, NA))
  expect_identical(out$x$b, c("x", "y", "y"))
})

test_that("fill preserves attributes", {
  df <- tibble(x = factor(c(NA, "a", NA)))

  out_d <- fill(df, x)
  out_u <- fill(df, x, .direction = "up")

  expect_equal(attributes(out_d$x), attributes(df$x))
  expect_equal(attributes(out_u$x), attributes(df$x))
})

test_that("fill respects existing grouping and `.by`", {
  df <- tibble(x = c(1, 1, 2), y = c(1, NA, NA))

  out <- df %>%
    dplyr::group_by(x) %>%
    fill(y)
  expect_identical(out$y, c(1, 1, NA))
  expect_identical(dplyr::group_vars(out), "x")

  out <- df %>%
    fill(y, .by = x)
  expect_identical(out$y, c(1, 1, NA))
  expect_identical(dplyr::group_vars(out), character())
})

test_that("works when there is a column named `.direction` in the data (#1319)", {
  df <- tibble(x = c(1, NA, 2), .direction = 1:3)
  out <- fill(df, x)
  expect_identical(out$x, c(1, 1, 2))
})

test_that("errors on named `...` inputs", {
  df <- tibble(x = c(1, NA, 2))

  expect_snapshot(error = TRUE, {
    fill(df, fooy = x)
  })
})

test_that("validates its inputs", {
  df <- tibble(x = c(1, NA, 2))
  expect_snapshot(error = TRUE, {
    df %>% fill(x, .direction = "foo")
  })
})

test_that("`.by` can't select columns that don't exist", {
  df <- tibble(x = 1, y = 2)

  # This shows `mutate()` in the error, but we accept that to not have to handle
  # `.by` in any way.
  expect_snapshot(error = TRUE, {
    fill(df, y, .by = z)
  })
})

test_that("`.by` can't be used on a grouped data frame", {
  df <- tibble(x = 1, y = 2)
  df <- dplyr::group_by(df, x)

  # This shows `mutate()` in the error, but we accept that to not have to handle
  # `.by` in any way.
  expect_snapshot(error = TRUE, {
    fill(df, y, .by = x)
  })
})
