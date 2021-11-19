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
})

test_that("no input results in 1 row data frame", {
  tb <- tibble(x = "a")
  expect_identical(expand(tb), tibble(.rows = 1L))
  expect_identical(expand(tb, y = NULL), tibble(.rows = 1L))
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
  expect_s3_class(expand(mtcars), "data.frame")
  expect_s3_class(expand(as_tibble(mtcars)), "tbl_df")
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

test_that("crossing/nesting/expand respect .name_repair", {

  x <- 1:2
  suppressMessages(
    expect_named(crossing(x, x, .name_repair = "unique"), c("x...1", "x...2"))
  )

  suppressMessages(
    expect_named(nesting(x, x, .name_repair = "unique"), c("x...1", "x...2"))
  )

  df <- tibble(x)
  suppressMessages(
    expect_named(df %>% expand(x, x, .name_repair = "unique"), c("x...1", "x...2"))
  )
})


# dots_cols supports lazy evaluation --------------------------------------

test_that("dots_cols evaluates each expression in turn", {
  out <- dots_cols(x = seq(-2, 2), y = x)
  expect_equal(out$x, out$y)
})

# ------------------------------------------------------------------------------

test_that("expand_grid() can control name_repair", {
  x <- 1:2

  expect_snapshot((expect_error(expand_grid(x = x, x = x))))

  expect_snapshot(
    out <- expand_grid(x = x, x = x, .name_repair = "unique")
  )
  expect_named(out, c("x...1", "x...2"))

  out <- expand_grid(x = x, x = x, .name_repair = "minimal")
  expect_named(out, c("x", "x"))
})

test_that("zero length input gives zero length output", {
  expect_equal(
    expand_grid(x = integer(), y = 1:3),
    tibble(x = integer(), y = integer())
  )
})

test_that("no input results in 1 row data frame", {
  # Because `prod() == 1L` by definition
  expect_identical(expand_grid(), tibble(.rows = 1L))
  expect_identical(expand_grid(NULL), tibble(.rows = 1L))
})

test_that("unnamed data frames are flattened", {
  df <- tibble(x = 1:2, y = 1:2)
  col <- 3:4

  expect_identical(
    expand_grid(df, col),
    tibble(x = c(1L, 1L, 2L, 2L), y = c(1L, 1L, 2L, 2L), col = c(3L, 4L, 3L, 4L))
  )
})

test_that("packed and unpacked data frames are expanded identically", {
  df <- tibble(x = 1:2, y = 1:2)
  col <- 3:4

  expect_identical(
    expand_grid(df, col),
    unpack(expand_grid(df = df, col), df)
  )
})

test_that("expand_grid() works with unnamed inlined tibbles with long expressions (#1116)", {
  df <- expand_grid(
    dplyr::tibble(fruit = c("Apple", "Banana"), fruit_id = c("a", "b")),
    dplyr::tibble(status_id = c("c", "d"), status = c("cut_neatly", "devoured"))
  )

  expect <- vec_cbind(
    vec_slice(tibble(fruit = c("Apple", "Banana"), fruit_id = c("a", "b")), c(1, 1, 2, 2)),
    vec_slice(tibble(status_id = c("c", "d"), status = c("cut_neatly", "devoured")), c(1, 2, 1, 2))
  )

  expect_identical(df, expect)
})

test_that("expand_grid() works with 0 col tibbles (#1189)", {
  df <- tibble(.rows = 1)
  expect_identical(expand_grid(df), df)
  expect_identical(expand_grid(df, x = 1:2), tibble(x = 1:2))
})

test_that("expand_grid() works with 0 row tibbles", {
  df <- tibble(.rows = 0)
  expect_identical(expand_grid(df), df)
  expect_identical(expand_grid(df, x = 1:2), tibble(x = integer()))
})

# ------------------------------------------------------------------------------

test_that("grid_dots() silently repairs auto-names", {
  x <- 1
  expect_named(grid_dots(x, x), c("x...1", "x...2"))

  expect_named(grid_dots(1, 1), c("1...1", "1...2"))
})

test_that("grid_dots() doesn't repair duplicate supplied names", {
  expect_named(grid_dots(x = 1, x = 1), c("x", "x"))
})

test_that("grid_dots() evaluates each expression in turn", {
  out <- grid_dots(x = seq(-2, 2), y = x)
  expect_equal(out$x, out$y)
})

test_that("grid_dots() uses most recent override of column in iterative expressions", {
  out <- grid_dots(x = 1:2, x = 3:4, y = x)
  expect_identical(out, list(x = 1:2, x = 3:4, y = 3:4))
})

test_that("grid_dots() adds unnamed data frame columns into the mask", {
  out <- grid_dots(x = 1:2, data.frame(x = 3:4, y = 5:6), a = x, b = y)

  expect_identical(out$x, 1:2)
  expect_identical(out$a, 3:4)
  expect_identical(out$b, 5:6)

  expect_identical(out[[2]], data.frame(x = 3:4, y = 5:6))

  expect_named(out, c("x", "", "a", "b"))
})

test_that("grid_dots() drops `NULL`s", {
  expect_identical(
    grid_dots(NULL, x = 1L, y = NULL, y = 1:2),
    list(x = 1L, y = 1:2)
  )
})

test_that("grid_dots() reject non-vector input", {
  expect_snapshot((expect_error(grid_dots(lm(1~1)))))
})
