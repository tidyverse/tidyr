context("test-chop")


# chop --------------------------------------------------------------------

test_that("can chop multiple columns", {
  df <- tibble(x = c(1, 1, 2), a = 1:3, b = 1:3)
  out <- df %>% chop(c(a, b))

  expect_named(out, c("x", "a", "b"))
  expect_equal(out$a, list(1:2, 3L))
  expect_equal(out$b, list(1:2, 3L))
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
