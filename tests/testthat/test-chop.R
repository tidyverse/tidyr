context("test-chop")


# chop --------------------------------------------------------------------

test_that("can chop multiple columns", {
  df <- tibble(x = c(1, 1, 2), a = 1:3, b = 1:3)
  out <- df %>% chop(c(a, b))

  expect_named(out, c("x", "a", "b"))
  expect_equal(out$a, list_of(1:2, 3L))
  expect_equal(out$b, list_of(1:2, 3L))
})

test_that("chopping no columns returns input", {
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  expect_equal(chop(df), df)
})

test_that("grouping is preserved", {
  df <- tibble(g = c(1, 1), x = 1:2)
  out <- df %>% dplyr::group_by(g) %>% chop(x)
  expect_equal(dplyr::group_vars(out), "g")
})

test_that("can chop empty data frame", {
  df <- tibble(x = integer(), y = integer())
  expect_identical(chop(df, y), df)
  expect_identical(chop(df, x), df[2:1])
})


# unchop ------------------------------------------------------------------

test_that("extends into rows", {
  df <- tibble(x = 1:2, y = list(NULL, 1:4))
  out <- df %>% unchop(y)
  expect_equal(out$x, rep(2, 4))
  expect_equal(out$y, 1:4)
})

test_that("can unchop multiple cols", {
  df <- tibble(x = 1:2, y = list(1, 2:3), z = list(4, 5:6))
  out <- df %>% unchop(c(y, z))
  expect_equal(out$x, c(1, 2, 2))
  expect_equal(out$y, 1:3)
  expect_equal(out$z, 4:6)
})

test_that("unchopping nothing leaves input unchanged", {
  df <- tibble(x = 1:3, y = 4:6)
  expect_equal(unchop(df, integer()), df)
})

test_that("NULL inputs are automatically dropped", {
  df <- tibble(x = 1:4, y = list(NULL, 1:2, 4, NULL), z = list(NULL, 1:2, NULL, 5))
  out <- df %>% unchop(c(y, z))

  expect_equal(out$x, c(2, 2, 3, 4))
  expect_equal(out$y, c(1, 2, 4, NA))
  expect_equal(out$z, c(1, 2, NA, 5))
})

test_that("optionally keep empty rows", {
  df <- tibble(x = 1:2, y = list(NULL, 1:2), z = list(tibble(x = integer()), tibble(x = 1:2)))
  out <- df %>% unchop(y, keep_empty = TRUE)
  expect_equal(out$x, c(1, 2, 2))
  expect_equal(out$y, c(NA, 1, 2))

  out <- df %>% unchop(z, keep_empty = TRUE)
  expect_equal(out$x, c(1, 2, 2))
  expect_equal(out$z, tibble(x = c(NA, 1L, 2L)))
})

test_that("preserves colums of empty inputs", {
  df <- tibble(x = integer(), y = list(), z = list())
  expect_named(df %>% unchop(y), c("x", "y", "z"))
  expect_named(df %>% unchop(c(y, z)), c("x", "y", "z"))
})

test_that("respects list_of types", {
  df <- tibble(x = integer(), y = list_of(.ptype = integer()))
  expect_equal(df %>% unchop(y), tibble(x = integer(), y = integer()))
})

test_that("grouping is preserved", {
  df <- tibble(g = 1, x = list(1, 2))
  out <- df %>% dplyr::group_by(g) %>% unchop(x)
  expect_equal(dplyr::group_vars(out), "g")
})

test_that("unchop() only creates unspecified vectors for empty lists", {
  df <- data.frame(x = integer(), y = integer())
  expect_identical(unchop(df, y)$y, integer())

  df <- tibble(x = integer(), y = data.frame(z = integer()))
  expect_identical(unchop(df, y)$y, data.frame(z = integer()))
})

test_that("correctly performs tidy recycling with size 1 inputs", {
  df <- tibble(x = list(1, 2:3), y = list(2:3, 1))
  expect <- tibble(x = c(1, 1, 2, 3), y = c(2, 3, 1, 1))
  expect_identical(unchop(df, c(x, y)), expect)
})

test_that("can specify a ptype with extra columns", {
  df <- tibble(x = 1, y = list(1, 2))
  ptype <- tibble(y = numeric(), z = numeric())

  expect <- tibble(x = c(1, 1), y = c(1, 2), z = c(NA_real_, NA_real_))

  expect_identical(unchop(df, y, ptype = ptype), expect)
})

test_that("can specify a ptype to force an output type", {
  df <- tibble(x = list(1L, 2L))
  ptype <- tibble(x = numeric())

  expect_identical(unchop(df, x, ptype = ptype), tibble(x = c(1, 2)))
})

test_that("the ptype must be a data frame", {
  expect_error(unchop(mtcars, mpg, ptype = 1), "`ptype` must be a data frame")
})

test_that("can unchop empty data frame", {
  chopped <- tibble(x = integer(), y = list())
  expect_identical(unchop(chopped, y), tibble(x = integer(), y = unspecified()))
})

test_that("unchop retrieves correct types with emptied chopped df", {
  chopped <- chop(tibble(x = 1:3, y = 4:6), y)
  empty <- vec_slice(chopped, 0L)
  expect_identical(unchop(empty, y), tibble(x = integer(), y = integer()))
})
