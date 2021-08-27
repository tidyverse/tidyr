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

test_that("unchopping vectors is a no-op", {
  df <- tibble(x = 1:3, y = 4:6)
  expect_identical(unchop(df, c(x, y)), df)
})

test_that("NULL inputs are automatically dropped", {
  df <- tibble(x = 1:4, y = list(NULL, 1:2, 4, NULL), z = list(NULL, 1:2, NULL, 5))
  out <- df %>% unchop(c(y, z))

  expect_equal(out$x, c(2, 2, 3, 4))
  expect_equal(out$y, c(1, 2, 4, NA))
  expect_equal(out$z, c(1, 2, NA, 5))
})

test_that("empty typed inputs are automatically dropped", {
  df <- tibble(
    x = 1:4,
    y = list(integer(), 1:2, 4L, integer()),
    z = list(integer(), 1:2, integer(), 5L)
  )

  out <- unchop(df, c(y, z))

  expect_identical(out$x, c(2L, 2L))
  expect_identical(out$y, c(1L, 2L))
  expect_identical(out$z, c(1L, 2L))
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

test_that("mixing vectors with lists prevents NULLs from being dropped", {
  df <- tibble(x = 1:2, y = list(NULL, 1))
  expect_identical(unchop(df, c(x, y)), tibble(x = 1:2, y = c(NA, 1)))
})

test_that("preserves columns of empty inputs", {
  df <- tibble(x = integer(), y = list(), z = list())
  expect_named(df %>% unchop(y), c("x", "y", "z"))
  expect_named(df %>% unchop(c(y, z)), c("x", "y", "z"))
})

test_that("respects list_of types", {
  df <- tibble(x = integer(), y = list_of(.ptype = integer()))

  expect_equal(unchop(df, y), tibble(x = integer(), y = integer()))
  expect_equal(unchop(df, y, keep_empty = TRUE), tibble(x = integer(), y = integer()))

  df <- tibble(x = 1L, y = list_of(NULL, .ptype = integer()))
  expect_equal(unchop(df, y), tibble(x = integer(), y = integer()))
  expect_equal(unchop(df, y, keep_empty = TRUE), tibble(x = 1L, y = NA_integer_))
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

test_that("nonexistent `ptype` columns are ignored", {
  df <- tibble(x = 1, y = list(1, 2))
  ptype <- list(y = numeric(), z = numeric())

  expect_identical(unchop(df, y, ptype = ptype), unchop(df, y))
})

test_that("can specify a ptype to force an output type", {
  df <- tibble(x = list(1L, 2L))
  ptype <- list(x = numeric())

  expect_identical(unchop(df, x, ptype = ptype), tibble(x = c(1, 2)))
})

test_that("ptype overrides unspecified() result", {
  df <- tibble(x = list())

  expect_identical(
    unchop(df, x, ptype = list(x = integer())),
    tibble(x = integer())
  )

  df <- tibble(x = list(NULL, NULL))

  expect_identical(
    unchop(df, x, ptype = list(x = integer())),
    tibble(x = integer())
  )

  expect_identical(
    unchop(df, x, ptype = list(x = integer()), keep_empty = TRUE),
    tibble(x = c(NA_integer_, NA_integer_))
  )
})

test_that("ptype overrides list-of ptype", {
  df <- tibble(x = list_of(1L, 2:3))

  expect_identical(
    unchop(df, x, ptype = list(x = double())),
    tibble(x = c(1, 2, 3))
  )
})

test_that("the ptype must be a list", {
  expect_error(unchop(mtcars, mpg, ptype = 1), "`ptype` must be a list")
})

test_that("unchopping a bare empty list results in unspecified()", {
  df <- tibble(x = integer(), y = list())
  expect <- tibble(x = integer(), y = unspecified())

  expect_identical(unchop(df, y), expect)
  expect_identical(unchop(df, y, keep_empty = TRUE), expect)
})

test_that("unchopping a bare fully `NULL` list results in unspecified()", {
  df <- tibble(x = 1:2, y = list(NULL, NULL), z = list(NULL, NULL))
  expect <- tibble(x = integer(), y = unspecified(), z = unspecified())
  expect_identical(unchop(df, c(y, z)), expect)
})

test_that("unchopping a bare fully `NULL` list with `keep_empty = TRUE` results in logical missings", {
  df <- tibble(x = 1:2, y = list(NULL, NULL), z = list(NULL, NULL))
  expect <- tibble(x = 1:2, y = c(NA, NA), z = c(NA, NA))
  expect_identical(unchop(df, c(y, z), keep_empty = TRUE), expect)
})

test_that("unchopping list of empty types retains type", {
  df <- tibble(x = 1:2, y = list(integer(), double()))

  expect <- tibble(x = integer(), y = double())
  expect_identical(unchop(df, y), expect)

  expect <- tibble(x = 1:2, y = c(NA_real_, NA_real_))
  expect_identical(unchop(df, y, keep_empty = TRUE), expect)
})

test_that("unchop retrieves correct types with emptied chopped df", {
  chopped <- chop(tibble(x = 1:3, y = 4:6), y)
  empty <- vec_slice(chopped, 0L)
  expect_identical(unchop(empty, y), tibble(x = integer(), y = integer()))
})

test_that("unchop works with data frame columns (treating them like vectors) (#1128)", {
  df <- tibble(x = tibble(a = 1:2, b = "a"), y = list(3:4))
  expect_identical(unchop(df, c(x, y)), unchop(df, y))
})

test_that("unchop works with record columns (treating them like vectors)", {
  df <- tibble(x = list(1:2, 1), y = new_rcrd(list(x = 1:2)))

  expect_identical(
    unchop(df, c(x, y)),
    tibble(x = c(1, 2, 1), y = new_rcrd(list(x = c(1L, 1L, 2L))))
  )
})

test_that("incompatible sizes are caught", {
  df <- tibble(x = list(1:2), y = list(1:3))
  expect_snapshot(error = TRUE, unchop(df, c(x, y)))
})

test_that("empty typed inputs are considered in common size, but NULLs aren't", {
  df <- tibble(x = list(NULL), y = list(1:2))
  expect_error(unchop(df, c(x, y)), NA)

  df <- tibble(x = list(integer()), y = list(1:2))
  expect_snapshot(error = TRUE, unchop(df, c(x, y)))
})

test_that("unchopping retains inner names from tibble elements", {
  df <- tibble(x = list(tibble(col = list(NAMED = "x"))))
  out <- unchop(df, x)
  expect_named(out$x$col, "NAMED")
})

test_that("unchopping retains inner names from atomic elements (#1154)", {
  df <- tibble(x = list(c(a = 1), c(b = 2)))
  out <- unchop(df, x)
  expect_named(out$x, c("a", "b"))
})

test_that("unchopping drops outer names", {
  df <- tibble(col = list(a = 1, b = 2:3))
  out <- unchop(df, col)
  expect_named(out$col, NULL)
})
