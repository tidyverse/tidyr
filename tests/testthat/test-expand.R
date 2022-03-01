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

test_that("expand with nesting doesn't expand values", {
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

test_that("expand accepts expressions", {
  df <- expand(data.frame(), x = 1:3, y = 3:1)
  expect_equal(df, crossing(x = 1:3, y = 3:1))
})

test_that("expand will expand within each group (#396)", {
  df <- tibble(
    g = c("a", "b", "a"),
    a = c(1L, 1L, 2L),
    b = factor(c("a", "a", "b"), levels = c("a", "b", "c"))
  )
  gdf <- dplyr::group_by(df, g)

  out <- expand(gdf, a, b)

  # Still grouped
  expect_identical(dplyr::group_vars(out), "g")

  out <- nest(out, data = -g)

  expect_identical(out$data[[1]], crossing(a = 1:2, b = factor(levels = c("a", "b", "c"))))
  expect_identical(out$data[[2]], crossing(a = 1L, b = factor(levels = c("a", "b", "c"))))
})

test_that("expand does not allow expansion on grouping variable (#1299)", {
  df <- tibble(
    g = "x",
    a = 1L
  )
  gdf <- dplyr::group_by(df, g)

  # This is a dplyr error that we don't own
  expect_error(expand(gdf, g))
})

test_that("can use `.drop = FALSE` with expand (#1299)", {
  levels <- c("a", "b", "c")

  df <- tibble(
    g = factor(c("a", "b", "a"), levels = levels),
    a = c(1L, 1L, 2L),
    b = factor(c("a", "a", "b"), levels = levels)
  )
  gdf <- dplyr::group_by(df, g, .drop = FALSE)

  # No data in group "c" for `a`, so we don't get that in the result
  expect_identical(
    expand(gdf, a),
    vec_sort(gdf[c("g", "a")])
  )

  expect <- crossing(g = factor(levels = levels), b = factor(levels = levels))
  expect <- dplyr::group_by(expect, g, .drop = FALSE)

  # Levels of empty vector in `b` are expanded for group "c"
  expect_identical(expand(gdf, b), expect)
})

test_that("expand moves the grouping variables to the front", {
  df <- tibble(
    a = 1L,
    g = "x"
  )
  gdf <- dplyr::group_by(df, g)

  expect_named(expand(gdf, a), c("g", "a"))
})

test_that("preserves ordered factors", {
  df <- tibble(a = ordered("a"))
  out <- expand(df, a)
  expect_equal(df$a, ordered("a"))
})

test_that("NULL inputs", {
  tb <- tibble(x = 1:5)
  expect_equal(expand(tb, x, y = NULL), tb)
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

test_that("expand() with no inputs returns 1 row", {
  expect_identical(expand(tibble()), tibble(.rows = 1L))
})

test_that("expand() with empty nesting() / crossing() calls 'ignores' them (#1258)", {
  df <- tibble(x = factor(c("a", "c"), letters[1:3]))

  expect_identical(expand(df), expand(df, nesting()))
  expect_identical(expand(df), expand(df, crossing()))

  expect_identical(expand(df, x), expand(df, x, nesting()))
  expect_identical(expand(df, x), expand(df, x, crossing()))

  expect_identical(expand(df, x), expand(df, x, nesting(NULL)))
  expect_identical(expand(df, x), expand(df, x, crossing(NULL)))
})

test_that("expand() retains `NA` data in factors (#1275)", {
  df <- tibble(x = factor(c(NA, "x"), levels = "x"))

  expect_identical(
    expand(df, x),
    tibble(x = factor(c("x", NA), levels = "x"))
  )
})

# ------------------------------------------------------------------------------

test_that("crossing checks for bad inputs", {
  expect_snapshot((expect_error(crossing(x = 1:10, y = quote(a)))))
})

test_that("preserves NAs", {
  x <- c("A", "B", NA)
  expect_equal(crossing(x)$x, x)
  expect_equal(nesting(x)$x, x)
})

test_that("crossing() preserves factor levels", {
  x_na_lev_extra <- factor(c("a", NA), levels = c("a", "b", NA), exclude = NULL)
  expect_equal(levels(crossing(x = x_na_lev_extra)$x), c("a", "b", NA))
})

test_that("NULL inputs", {
  tb <- tibble(x = 1:5)
  expect_equal(nesting(x = tb$x, y = NULL), tb)
  expect_equal(crossing(x = tb$x, y = NULL), tb)
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

test_that("expand() respects `.name_repair`", {
  x <- 1:2
  df <- tibble(x)

  expect_snapshot(
    out <- df %>% expand(x = x, x = x, .name_repair = "unique")
  )
  expect_named(out, c("x...1", "x...2"))
})

test_that("crossing() / nesting() respect `.name_repair`", {
  x <- 1:2

  expect_snapshot(
    out <- crossing(x = x, x = x, .name_repair = "unique")
  )
  expect_named(out, c("x...1", "x...2"))

  expect_snapshot(
    out <- nesting(x = x, x = x, .name_repair = "unique")
  )
  expect_named(out, c("x...1", "x...2"))
})

test_that("crossing() / nesting() silently uniquely repairs names of unnamed inputs", {
  x <- 1:2

  expect_silent(out <- crossing(x, x))
  expect_named(out, c("x...1", "x...2"))

  expect_silent(out <- nesting(x, x))
  expect_named(out, c("x...1", "x...2"))
})

test_that("crossing() / nesting() works with very long inlined unnamed inputs (#1037)", {
  df1 <- tibble(a = c("a", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"), b = c(1, 2))
  df2 <- tibble(c = c("b", "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"), d = c(3, 4))

  out <- crossing(
    tibble(a = c("a", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"), b = c(1, 2)),
    tibble(c = c("b", "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"), d = c(3, 4))
  )
  expect_identical(out$a, vec_rep_each(df1$a, 2))
  expect_identical(out$b, vec_rep_each(df1$b, 2))
  expect_identical(out$c, vec_rep(df2$c, 2))
  expect_identical(out$d, vec_rep(df2$d, 2))

  out <- nesting(
    tibble(a = c("a", "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"), b = c(1, 2)),
    tibble(c = c("b", "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"), d = c(3, 4))
  )
  expect_identical(out$a, df1$a)
  expect_identical(out$b, df1$b)
  expect_identical(out$c, df2$c)
  expect_identical(out$d, df2$d)
})

test_that("crossing() / nesting() doesn't overwrite after auto naming (#1092)", {
  x <- list(0:1, 2:3)

  expect_silent(out <- crossing(!!!x))
  expect_identical(out[[1]], c(0L, 0L, 1L, 1L))
  expect_identical(out[[2]], c(2L, 3L, 2L, 3L))

  expect_silent(out <- nesting(!!!x))
  expect_identical(out[[1]], c(0L, 1L))
  expect_identical(out[[2]], c(2L, 3L))
})

test_that("crossing() with no inputs returns a 1 row data frame", {
  # Because it uses expand_grid(), which respects `prod() == 1L`
  expect_identical(crossing(), tibble(.rows = 1L))
  expect_identical(crossing(NULL), tibble(.rows = 1L))
})

test_that("nesting() with no inputs returns a 1 row data frame", {
  # Because computations involving the "number of combinations" of an empty
  # set return 1
  expect_identical(nesting(), tibble(.rows = 1L))
  expect_identical(nesting(NULL), tibble(.rows = 1L))
})

test_that("can use `do.call()` or `reduce()` with `crossing()` (#992)", {
  x <- list(tibble(a = 1:2), tibble(b = 2:4), tibble(c = 5:6))

  expect_identical(
    crossing(x[[1]], x[[2]], x[[3]]),
    do.call(crossing, x)
  )

  expect_identical(
    crossing(crossing(x[[1]], x[[2]]), x[[3]]),
    purrr::reduce(x, crossing)
  )
})

test_that("crossing() / nesting() retain `NA` data in factors (#1275)", {
  x <- factor(c(NA, "x"), levels = "x")

  expect_identical(
    crossing(x),
    tibble(x = factor(c("x", NA), levels = "x"))
  )

  expect_identical(
    nesting(x),
    tibble(x = factor(c("x", NA), levels = "x"))
  )
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
# grid_dots()

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
  expect_snapshot((expect_error(grid_dots(lm(1 ~ 1)))))
})

# ------------------------------------------------------------------------------
# fct_unique()

test_that("fct_unique() retains `NA` at the end even if it isn't a level", {
  x <- factor(c(NA, "x"))
  expect_identical(fct_unique(x), factor(c("x", NA)))
  expect_identical(levels(fct_unique(x)), "x")
})

test_that("fct_unique() doesn't alter level order if `NA` is an existing level", {
  x <- factor(c(NA, "x"), levels = c(NA, "x"), exclude = NULL)
  expect_identical(fct_unique(x), x)
  expect_identical(levels(fct_unique(x)), c(NA, "x"))
})
