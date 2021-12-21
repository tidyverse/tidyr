test_that("complete with no variables returns data as is", {
  expect_equal(complete(mtcars), mtcars)
})

test_that("basic invocation works", {
  df <- tibble(x = 1:2, y = 1:2, z = 3:4)
  out <- complete(df, x, y)
  expect_equal(nrow(out), 4)
  expect_equal(out$z, c(3, NA, NA, 4))
})

test_that("preserves grouping", {
  local_options(lifecycle_verbosity = "quiet")

  df <- tibble(x = 1:2, y = 1:2, z = 3:4) %>% dplyr::group_by(x)
  out <- complete(df, x, y)
  expect_s3_class(out, "grouped_df")
  expect_equal(dplyr::group_vars(out), dplyr::group_vars(df))
})

test_that("complete allows expanding on grouping variable (#396)", {
  df <- tibble(
    g = factor(c("a", "b", "b")),
    a = c(1, 1, 3),
    x = c(1, 2, 3)
  )
  gdf <- dplyr::group_by(df, g)

  out <- complete(gdf, g, a)

  # Same as split by group, complete, combine
  expect <- vec_rbind(
    complete(df[1,], g, a),
    complete(df[2:3,], g, a)
  )
  expect <- dplyr::group_by(expect, g)

  expect_identical(out, expect)
})

test_that("expands empty factors", {
  f <- factor(levels = c("a", "b", "c"))
  df <- tibble(one = f, two = f)

  expect_equal(nrow(complete(df, one, two)), 9)
  expect_equal(ncol(complete(df, one, two)), 2)
})

test_that("empty expansion returns original", {
  df <- tibble(x = character())
  rs <- complete(df, y = NULL)
  expect_equal(rs, df)

  df <- tibble(x = 1:4)
  rs <- complete(df, y = NULL)
  expect_equal(rs, df)
})

test_that("not drop unspecified levels in complete", {
  df <- tibble(x = 1:3, y = 1:3, z = c("a", "b", "c"))
  df2 <- df %>% complete(z = c("a", "b"))
  expect <- df[c("z", "x", "y")]
  expect_equal(df2, expect)
})

test_that("complete() with empty nesting() / crossing() calls 'ignores' them (#1258)", {
  df <- tibble(x = factor(c("a", "c"), letters[1:3]))

  expect_identical(complete(df, x), complete(df, x, nesting()))
  expect_identical(complete(df, x), complete(df, x, crossing()))

  expect_identical(complete(df, x), complete(df, x, nesting(NULL)))
  expect_identical(complete(df, x), complete(df, x, crossing(NULL)))
})

test_that("complete() fills missing values even when there are no `...` (#1272)", {
  df <- tibble(a = c(1, NA, 3))

  expect_identical(
    complete(df, fill = list(a = 0)),
    tibble(a = c(1, 0, 3))
  )
})

test_that("both implicit and explicit missing values are filled by default", {
  df <- tibble(
    x = factor(1:2, levels = 1:3),
    a = c(1, NA)
  )

  expect_identical(
    complete(df, x, fill = list(a = 0)),
    tibble(x = factor(1:3), a = c(1, 0, 0))
  )
})

test_that("can limit the fill to only implicit missing values with `explicit` (#1270)", {
  df <- tibble(
    x = factor(1:2, levels = 1:3),
    a = c(1, NA)
  )

  expect_identical(
    complete(df, x, fill = list(a = 0), explicit = FALSE),
    tibble(x = factor(1:3), a = c(1, NA, 0))
  )
})

test_that("if the completing variables have missings, `fill` will fill them after expansion", {
  # This behavior is admittedly a little weird, but should not be common
  # because you rarely specify a completing variable in `fill`

  df <- tibble(
    x = c(1, NA),
    y = c(NA, 1)
  )

  # Expanded combinations that involved missings get filled
  expect_identical(
    complete(df, x, y, fill = list(x = 0, y = 0)),
    tibble(x = c(1, 1, 0, 0), y = c(1, 0, 1, 0))
  )

  # Can limit the fill to only the "new" combinations that weren't in the
  # original data. Here, the `x = NA, y = NA` combination that gets created.
  expect_identical(
    complete(df, x, y, fill = list(x = 0, y = 0), explicit = FALSE),
    tibble(x = c(1, 1, NA, 0), y = c(1, NA, 1, 0))
  )
})
