context("expand")

test_that("expand completes all values", {
  df <- data.frame(x = 1:2, y = 1:2)
  out <- expand(df, x, y)
  expect_equal(nrow(out), 4)
})

test_that("multiple variables in one arg doesn't expand", {
  df <- data.frame(x = 1:2, y = 1:2)
  out <- expand(df, c(x, y))
  expect_equal(nrow(out), 2)
})

test_that("nesting doesn't expand values", {
  df <- tibble(x = 1:2, y = 1:2)
  expect_equal(expand(df, nesting(x, y)), df)
})

test_that("unnamed data frames are flattened", {
  df <- data.frame(x = 1:2, y = 1:2)
  out <- expand(df, nesting(x, y))
  expect_equal(out$x, df$x)

  out <- crossing(df)
  expect_equal(out$x, df$x)
})

test_that("named data frames are not flattened", {
  df <- tibble(x = 1:2, y = 1:2)
  out <- expand(df, x = nesting(x, y))
  expect_equal(out$x, df)

  out <- crossing(x = df)
  expect_equal(out$x, df)
})

test_that("expand works with non-standard col names", {
  df <- tibble(` x ` = 1:2, `/y` = 1:2)
  out <- expand(df, ` x `, `/y`)
  expect_equal(nrow(out), 4)
})

test_that("expand excepts expressions", {
  df <- expand(data.frame(), x = 1:3, y = 3:1)
  expect_equal(df, crossing(x = 1:3, y = 3:1))
})

test_that("expand respects groups", {
  local_options(lifecycle_verbosity = "quiet")

  df <- tibble(
    a = c(1L, 1L, 2L),
    b = c(1L, 2L, 1L),
    c = c(2L, 1L, 1L)
  )
  out <- df %>% dplyr::group_by(a) %>% expand(b, c) %>% nest()

  expect_equal(out$data[[1]], crossing(b = 1:2, c = 1:2))
  expect_equal(out$data[[2]], tibble(b = 1L, c = 1L))
})

test_that("preserves ordered factors", {
  df <- tibble(a = ordered("a"))
  out <- expand(df, a)
  expect_equal(df$a, ordered("a"))
})

test_that("preserves NAs", {
  x <- c("A", "B", NA)
  expect_equal(crossing(x)$x, x)
  expect_equal(nesting(x)$x, x)
})

test_that("crossing preserves factor levels", {
  x_na_lev_extra <- factor(c("a", NA), levels = c("a", "b", NA), exclude = NULL)
  expect_equal(levels(crossing(x = x_na_lev_extra)$x), c("a", "b", NA))
})

test_that("NULL inputs", {
  tb <- tibble(x = 1:5)
  expect_equal(expand(tb, x, y = NULL), tb)
  expect_equal(nesting(x = tb$x, y = NULL), tb)
  expect_equal(crossing(x = tb$x, y = NULL), tb)
})

test_that("zero length input gives zero length output", {
  tb <- tibble(x = character())
  expect_equal(expand(tb, x), tb)
  expect_equal(expand(tb, y = NULL), tibble())

  expect_equal(
    expand_grid(x = integer(), y = 1:3),
    tibble(x = integer(), y = integer())
  )
})

test_that("expand & crossing expand missing factor leves; nesting does not", {
  tb <- tibble(
    x = 1:3,
    f = factor("a", levels = c("a", "b"))
  )

  expect_equal(nrow(expand(tb, x, f)), 6)
  expect_equal(nrow(crossing(!!!tb)), 6)
  expect_equal(nrow(nesting(!!!tb)), nrow(tb))
})

test_that("expand() reconstructs input dots is empty", {
  expect_is(expand(mtcars), "data.frame")
  expect_is(expand(as_tibble(mtcars)), "tbl_df")
})

test_that("crossing checks for bad inputs", {
  expect_error(
    crossing(x = 1:10, y = quote(a)),
    class = "vctrs_error_scalar_type"
  )
})

test_that("crossing handles list columns", {
  x <- 1:2
  y <- list(1, 1:2)
  out <- crossing(x, y)

  expect_equal(nrow(out), 4)
  expect_s3_class(out, "tbl_df")
  expect_equal(out$x, rep(x, each = 2))
  expect_equal(out$y, rep(y, 2))
})

test_that("expand_grid can control name_repair", {
  x <- 1:2

  if (packageVersion("tibble") > "2.99") {
    expect_error(expand_grid(x, x), class = "rlang_error")
  } else {
    expect_error(expand_grid(x, x), "must not be duplicated")
  }

  expect_message(out <- expand_grid(x, x, .name_repair = "unique"), "New names:")
  expect_named(out, c("x...1", "x...2"))

  out <- expand_grid(x, x, .name_repair = "minimal")
  expect_named(out, c("x", "x"))
})

test_that("crossing/nesting/expand respect .name_repair", {

  x <- 1:2
  expect_named(crossing(x, x, .name_repair = "unique"), c("x...1", "x...2"))

  expect_named(nesting(x, x, .name_repair = "unique"), c("x...1", "x...2"))

  df <- tibble(x)
  expect_named(df %>% expand(x, x, .name_repair = "unique"), c("x...1", "x...2"))
})


# dots_cols supports lazy evaluation --------------------------------------

test_that("dots_cols evaluates each expression in turn", {
  out <- dots_cols(x = seq(-2, 2), y = x)
  expect_equal(out$x, out$y)
})
