test_that("empty call drops every row", {
  df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
  exp <- tibble(x = 1, y = "a")
  res <- drop_na(df)
  expect_identical(res, exp)
})

test_that("specifying (a) variables considers only that variable(s)", {
  df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))

  exp <- tibble(x = c(1, 2), y = c("a", NA))
  res <- drop_na(df, x)
  expect_identical(res, exp)

  exp <- tibble(x = c(1), y = c("a"))
  res <- drop_na(df, x:y)
  expect_identical(res, exp)
})

test_that("groups are preserved", {
  df <- tibble(g = c("A", "A", "B"), x = c(1, 2, NA), y = c("a", NA, "b"))
  exp <- tibble(g = c("A", "B"), x = c(1, NA), y = c("a", "b"))

  gdf <- dplyr::group_by(df, "g")
  gexp <- dplyr::group_by(exp, "g")

  res <- drop_na(gdf, y)

  expect_identical(res, gexp)
  expect_identical(dplyr::group_vars(res), dplyr::group_vars(gexp))
})

test_that("errors are raised", {
  df <- tibble(x = c(1, 2, NA), y = c("a", NA, "b"))
  expect_snapshot((expect_error(drop_na(df, list()))))
  expect_snapshot((expect_error(drop_na(df, "z"))))
})

test_that("single variable data.frame doesn't lose dimension", {
  df <- data.frame(x = c(1, 2, NA))
  res <- drop_na(df, "x")
  exp <- data.frame(x = c(1, 2))
  expect_identical(res, exp)
})

test_that("works with list-cols", {
  df <- tibble(x = list(1L, NULL, 3L), y = c(1L, 2L, NA))
  rs <- drop_na(df)

  expect_identical(rs, tibble(x = list(1L), y = 1L))
})

test_that("preserves attributes", {
  df <- tibble(x = structure(c(1, NA), attr = "!"))
  rs <- drop_na(df)

  expect_identical(rs$x, structure(1, attr = "!"))
})
