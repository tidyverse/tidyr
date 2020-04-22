# nest --------------------------------------------------------------------

test_that("nest turns grouped values into one list-df", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- nest_legacy(df, y)
  expect_equal(out$x, 1)
  expect_equal(length(out$data), 1L)
  expect_equal(out$data[[1L]], tibble(y = 1:3))
})

test_that("nest works with data frames too", {
  df <- data.frame(x = c(1, 1, 1), y = 1:3)
  out <- nest_legacy(df, y)
  expect_equal(out$x, 1)
  expect_equal(length(out$data), 1L)
  expect_equal(out$data[[1L]], tibble(y = 1:3))
})

test_that("can control output column name", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- nest_legacy(df, y, .key = y)
  expect_equal(names(out), c("x", "y"))
  out <- nest_legacy(df, y, .key = "y")
  expect_equal(names(out), c("x", "y"))
})

test_that("nest doesn't include grouping vars in nested data", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- df %>% dplyr::group_by(x) %>% nest_legacy()
  expect_equal(out$data[[1]], tibble(y = 1:3))
})

test_that("can restrict variables in grouped nest", {
  df <- tibble(x = 1, y = 2, z = 3) %>% dplyr::group_by(x)
  out <- df %>% nest_legacy(y)
  expect_equal(names(out$data[[1]]), "y")
})

test_that("puts data into the correct row", {
  df <- tibble(x = 1:3, y = c("B", "A", "A"))
  out <- nest_legacy(df, x) %>% dplyr::filter(y == "B")
  expect_equal(out$data[[1]]$x, 1)
})

test_that("nesting everything yields a simple data frame", {
  df <- tibble(x = 1:3, y = c("B", "A", "A"))
  out <- nest_legacy(df, x, y)
  expect_equal(length(out$data), 1L)
  expect_equal(out$data[[1L]], df)
})

test_that("nest preserves order of data", {
  df <- tibble(x = c(1, 3, 2, 3, 2), y = 1:5)
  out <- nest_legacy(df, y)
  expect_equal(out$x, c(1, 3, 2))
})

test_that("empty factor levels don't affect nest", {
  df <- tibble(
    x = factor(c("z", "a"), levels = letters),
    y = 1:2
  )
  out <- nest_legacy(df, y)
  expect_equal(out$x, df$x)
})

test_that("nesting works for empty data frames", {
  df <- tibble(x = 1:3, y = c("B", "A", "A"))[0, ]

  out <- nest_legacy(df, x)
  expect_equal(names(out), c("y", "data"))

  expect_equal(nrow(out), 0L)
  expect_equal(length(out$data), 0L)

  out <- nest_legacy(df, x, y)
  expect_equal(length(out$data), 1L)
  expect_equal(out$data[[1L]], df)
})

test_that("tibble conversion occurs in the `nest.data.frame()` method", {
  tbl <- mtcars %>% nest_legacy(-am, -cyl)
  expect_s3_class(tbl, "tbl_df")
  expect_is(tbl$data[[1L]], "tbl_df")
})

test_that("nest_legacy() does not preserve grouping", {
  df <- tibble(x = c(1, 1, 2), y = 1:3) %>% dplyr::group_by(x)
  out <- nest_legacy(df)
  expect_false(inherits(out, "grouped_df"))
})

# unnest ------------------------------------------------------------------

test_that("unnesting combines atomic vectors", {
  df <- tibble(x = list(1, 2:3, 4:10))
  expect_equal(unnest_legacy(df)$x, 1:10)
})

test_that("unesting combines augmented vectors", {
  df <- tibble::tibble(x = as.list(as.factor(letters[1:3])))
  expect_equal(unnest_legacy(df)$x, factor(letters[1:3]))
})

test_that("vector unnest preserves names", {
  df <- tibble(x = list(1, 2:3), y = list("a", c("b", "c")))
  out <- unnest_legacy(df)
  expect_named(out, c("x", "y"))
})

test_that("unnesting row binds data frames", {
  df <- tibble(x = list(
    tibble(x = 1:5),
    tibble(x = 6:10)
  ))
  expect_equal(unnest_legacy(df)$x, 1:10)
})

test_that("can unnest nested lists", {
  df <- tibble(
    x = 1:2,
    y = list(list("a"), list("b"))
  )
  rs <- unnest_legacy(df, y)
  expect_identical(rs, tibble(x = 1:2, y = list("a", "b")))
})

test_that("can unnest mixture of name and unnamed lists of same length", {
  df <- tibble(
    x = c("a"),
    y = list(y = 1:2),
    z = list(1:2)
  )
  expect_identical(unnest_legacy(df), tibble(x = c("a","a"), y = c(1:2), z = c(1:2)))
})

test_that("elements must all be of same type", {
  df <- tibble(x = list(1, "a"))
  expect_error(unnest_legacy(df), class = "vctrs_error_incompatible_type")
})

test_that("can't combine vectors and data frames", {
  df <- tibble(x = list(1, tibble(1)))
  expect_error(unnest_legacy(df), "a list of vectors or a list of data frames")
})

test_that("multiple columns must be same length", {
  df <- tibble(x = list(1), y = list(1:2))
  expect_error(unnest_legacy(df), "same number of elements")

  df <- tibble(x = list(1), y = list(tibble(x = 1:2)))
  expect_error(unnest_legacy(df), "same number of elements")
})

test_that("nested is split as a list (#84)", {
  df <- tibble(x = 1:3, y = list(1, 2:3, 4), z = list(5, 6:7, 8))
  expect_warning(out <- unnest_legacy(df, y, z), NA)
  expect_equal(out$x, c(1, 2, 2, 3))
  expect_equal(out$y, unlist(df$y))
  expect_equal(out$z, unlist(df$z))
})

test_that("unnest has mutate semantics", {
  df <- tibble(x = 1:3, y = list(1, 2:3, 4))
  out <- df %>% unnest_legacy(z = map(y, `+`, 1))

  expect_equal(out$z, 2:5)
})

test_that(".id creates vector of names for vector unnest", {
  df <- tibble(x = 1:2, y = list(a = 1, b = 1:2))
  out <- unnest_legacy(df, .id = "name")

  expect_equal(out$name, c("a", "b", "b"))
})

test_that(".id creates vector of names for grouped vector unnest", {
  df <- tibble(x = 1:2, y = list(a = 1, b = 1:2)) %>%
    dplyr::group_by(x)
  out <- unnest_legacy(df, .id = "name")

  expect_equal(out$name, c("a", "b", "b"))
})

test_that(".id creates vector of names for data frame unnest", {
  df <- tibble(x = 1:2, y = list(
    a = tibble(y = 1),
    b = tibble(y = 1:2)
  ))
  out <- unnest_legacy(df, .id = "name")

  expect_equal(out$name, c("a", "b", "b"))
})

test_that(".id creates vector of names for grouped data frame unnest", {
  df <- tibble(x = 1:2, y = list(
    a = tibble(y = 1),
    b = tibble(y = 1:2)
  )) %>%
    dplyr::group_by(x)
  out <- unnest_legacy(df, .id = "name")

  expect_equal(out$name, c("a", "b", "b"))
})

test_that("can use non-syntactic names", {
  out <- tibble("foo bar" = list(1:2, 3)) %>% unnest_legacy()

  expect_named(out, "foo bar")
})

test_that("sep combines column names", {
  ldf <- list(tibble(x = 1))
  tibble(x = ldf, y = ldf) %>%
    unnest_legacy(.sep = "_") %>%
    expect_named(c("x_x", "y_x"))
})

test_that("can unnest empty data frame", {
  df <- tibble(x = integer(), y = list())
  out <- unnest_legacy(df, y)
  expect_equal(out, tibble(x = integer()))
})

test_that("empty ... returns df if no list-cols", {
  df <- tibble(x = integer(), y = integer())
  expect_equal(unnest_legacy(df), df)
})

test_that("can optional preserve list cols", {
  df <- tibble(x = list(3, 4), y = list("a", "b"))
  rs <- df %>% unnest_legacy(x, .preserve = y)
  expect_identical(rs, tibble(y = df$y, x = c(3, 4)))

  df <- tibble(x = list(c("d", "e")), y = list(1:2))
  rs <- df %>% unnest_legacy(.preserve = y)
  expect_identical(rs, tibble(y = rep(list(1:2), 2), x = c("d", "e")))
})

test_that("unnest drops list cols if expanding", {
  df <- tibble(x = 1:2, y = list(3, 4), z = list(5, 6:7))
  out <- df %>% unnest_legacy(z)

  expect_equal(names(out), c("x", "z"))
})

test_that("unnest keeps list cols if not expanding", {
  df <- tibble(x = 1:2, y = list(3, 4), z = list(5, 6:7))
  out <- df %>% unnest_legacy(y)

  expect_equal(names(out), c("x", "z", "y"))
})

test_that("unnest respects .drop_lists", {
  df <- tibble(x = 1:2, y = list(3, 4), z = list(5, 6:7))

  expect_equal(df %>% unnest_legacy(y, .drop = TRUE) %>% names(), c("x", "y"))
  expect_equal(df %>% unnest_legacy(z, .drop = FALSE) %>% names(), c("x", "y", "z"))
})

test_that("grouping is preserved", {
  df <- tibble(g = 1, x = list(1:3)) %>% dplyr::group_by(g)
  rs <- df %>% unnest_legacy(x)

  expect_equal(rs$x, 1:3)
  expect_equal(class(df), class(rs))
  expect_equal(dplyr::group_vars(df), dplyr::group_vars(rs))
})

test_that("unnesting zero row column preserves names", {
  df <- tibble(a = character(), b = character())
  expect_equal(df %>% unnest_legacy(b), tibble(a = character(), b = character()))
})

test_that("unnest_legacy() recognize ptype", {
  tbl <- tibble(x = integer(), y = structure(list(), ptype = double()))
  res <- unnest_legacy(tbl)
  expect_equal(res, tibble(x = integer(), y = double()))
})
