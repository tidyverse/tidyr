
test_that("number of rows is preserved", {
  df <- tibble(
    x = 1:3,
    y = list(NULL, c(a = 1), c(a = 1, b = 2))
  )
  out <- df %>% unnest_wider(y)
  expect_equal(nrow(out), 3)
})

test_that("simplifies length-1 lists", {
  df <- tibble(
    x = 1:2,
    y = list(
      list(a = 1, b = 2, c = c(1, 2)),
      list(a = 3)
    )
  )
  out <- df %>% unnest_wider(y)
  expect_equal(out$a, c(1, 3))
  expect_equal(out$b, c(2, NA))
  expect_equal(out$c, list(c(1, 2), NULL))

  # Works when casting too
  out <- df %>% unnest_wider(y,
    ptype = list(a = integer(), b = integer())
  )
  expect_equal(out$a, c(1L, 3L))
  expect_equal(out$b, c(2L, NA))
  expect_equal(out$c, list(c(1, 2), NULL))
})

test_that("treats data frames like lists where we have type info about each element", {
  df <- tibble(x = 1:2, y = list(tibble(a = 1:2)))
  out <- df %>% unnest_wider(y)

  expect_named(out, c("x", "a"))
  expect_equal(nrow(out), 2)

  # We know the types of this, even though we can't simplify it
  expect_identical(attr(out$a, "ptype"), integer())

  df <- tibble(x = 1:2, y = list(list(a = 1:2)))
  out <- df %>% unnest_wider(y)

  expect_named(out, c("x", "a"))
  expect_equal(nrow(out), 2)

  # We don't know the types of this
  expect_identical(class(out$a), "list")
})

test_that("unnest_wider - bad inputs generate errors", {
  df <- tibble(x = 1, y = list(mean))

  expect_snapshot((expect_error(
    unnest_wider(df, y)
  )))
})

test_that("list of 0-length vectors yields no new columns", {
  df <- tibble(x = 1:2, y = list(integer(), integer()))
  expect_named(unnest_wider(df, y), "x")

  # similarly when empty
  df <- tibble(x = integer(), y = list())
  expect_named(unnest_wider(df, y), "x")

  # similarly when using list_of() with 0-length elements
  df <- tibble(x = 1:2, y = list_of(integer(), integer()))
  expect_named(unnest_wider(df, y), "x")
})

test_that("list-col with only `NULL` works (#1186)", {
  df <- tibble(x = list(NULL))
  expect_identical(unnest_wider(df, x), tibble::new_tibble(list(), nrow = 1L))
})

test_that("empty list yields no new columns", {
  df <- tibble(x = list())
  expect_identical(unnest_wider(df, x), tibble())
})

test_that("list_of columns can be unnested", {
  df <- tibble(x = 1:2, y = list_of(c(a = 1L), c(a = 1L, b = 2L)))
  expect_named(unnest_wider(df, y), c("x", "a", "b"))

  df <- tibble(x = 1:2, y = list_of(c(a = 1L), c(b = 1:2)))
  expect_named(unnest_wider(df, y), c("x", "a", "b1", "b2"))
})

test_that("names_sep creates unique names", {
  df <- tibble(
    x = list("a", c("a", "b", "c")),
    y = list(c(a = 1), c(b = 2, a = 1))
  )
  expect_warning(out <- unnest_wider(df, x, names_sep = "_"), NA)
  expect_named(out, c("x_1", "x_2", "x_3", "y"))

  expect_warning(out <- unnest_wider(df, y, names_sep = "_"), NA)
  expect_named(out, c("x", "y_a", "y_b"))
  expect_equal(out$y_a, c(1, 1))
})

test_that("`names_sep` works with empty elements (#1185)", {
  df <- tibble(x = list(c(a = 1L), c(a = integer())))
  out <- unnest_wider(df, x, names_sep = "_")
  expect_identical(out, tibble(x_a = c(1L, NA)))
})

test_that("`names_sep` works with data frame columns", {
  df <- tibble(x = tibble(a = 1, b = 2))
  out <- unnest_wider(df, x, names_sep = "_")
  expect_named(out, c("x_a", "x_b"))
})

test_that("`names_sep` works with named non-list atomic vectors", {
  # Equivalent to `df <- tibble(x = list_of(c(a = 1), c(b = 2)))`
  df <- tibble(x = c(a = 1, b = 2))
  out <- unnest_wider(df, x, names_sep = "_")
  expect_named(out, c("x_a", "x_b"))
})

test_that("df-cols can be unnested (#1188)", {
  df <- tibble(a = 1:3, b = tibble(x = 1:3, y = 1:3))
  out <- unnest_wider(df, b)
  expect_identical(out, unpack(df, b))
})

test_that("df-cols result in list-ofs when `simplify = FALSE`", {
  df <- tibble(a = 1:3, b = tibble(x = 1:3, y = 1:3))
  out <- unnest_wider(df, b, simplify = FALSE)
  expect_identical(out, tibble(a = 1:3, x = list_of(1L, 2L, 3L), y = list_of(1L, 2L, 3L)))
})

test_that("unnesting mixed empty types retains the column (#1125)", {
  df <- tibble(col = list(list(a = list()), list(a = integer())))
  expect_identical(unnest_wider(df, col), tibble(a = c(NA, NA)))
})

test_that("can unnest mixed empty types with `strict = FALSE`", {
  df <- tibble(col = list(
    list(a = "x"),
    list(a = list()),
    list(a = integer())
  ))

  expect_identical(
    unnest_wider(df, col)$a,
    c("x", NA, NA)
  )

  # They are replaced with `NULL` before simplification
  expect_identical(
    unnest_wider(df, col, simplify = FALSE)$a,
    list("x", NULL, NULL)
  )
})

test_that("can't unnest mixed empty types when in strict mode", {
  df <- tibble(col = list(list(a = list()), list(a = 1L)))

  # Not strict, useful for JSON data but doesn't follow vctrs type rules
  expect_identical(unnest_wider(df, col), tibble(a = c(NA, 1L)))

  # Strict means they can't be combined
  expect_identical(
    unnest_wider(df, col, strict = TRUE),
    tibble(a = list(list(), 1L))
  )
})

test_that("can unnest multiple columns wider at once (#740)", {
  df <- tibble(
    x = list(list(a = 1), list(a = 2)),
    y = list(list(b = 1, c = "x"), list(b = 2, c = "y"))
  )

  expect_identical(
    unnest_wider(df, c(x, y)),
    tibble(a = c(1, 2), b = c(1, 2), c = c("x", "y"))
  )
})

test_that("can unnest a vector with a mix of named/unnamed elements (#1200 comment)", {
  df <- tibble(x = c(a = 1L, 2L))
  expect_snapshot(out <- unnest_wider(df, x, names_sep = "_"))
  expect_identical(out$x_a, c(1L, NA))
  expect_identical(out$x_...1, c(NA, 2L))
})

test_that("can unnest a list with a mix of named/unnamed elements (#1200 comment)", {
  df <- tibble(x = list(a = 1:2, 3:4))
  out <- unnest_wider(df, x, names_sep = "_")
  expect_identical(out$x_1, c(1L, 3L))
  expect_identical(out$x_2, c(2L, 4L))
})

test_that("unique name repair is done on the elements before applying `names_sep` (#1200 comment)", {
  df <- tibble(col = list(set_names(1, "")))
  expect_snapshot(out <- unnest_wider(df, col, names_sep = "_"))
  expect_named(out, "col_...1")

  df <- tibble(col = list(set_names(1:2, c("", ""))))
  expect_snapshot(out <- unnest_wider(df, col, names_sep = "_"))
  expect_named(out, c("col_...1", "col_...2"))
})

test_that("output structure is the same whether or not `names_sep` is applied (#1200 comment)", {
  col <- list(
    set_names(1, "a"),
    set_names(1, NA_character_),
    set_names(1, "")
  )
  df <- tibble(col = col)

  # Column structure between these two must be the same,
  # we consider an `NA_character_` name as identical to `""`.
  expect_snapshot(out1 <- unnest_wider(df, col))
  expect_snapshot(out2 <- unnest_wider(df, col, names_sep = "_"))

  expect_identical(out1$a, c(1, NA, NA))
  expect_identical(out1$...1, c(NA, 1, 1))

  expect_identical(out2$col_a, c(1, NA, NA))
  expect_identical(out2$col_...1, c(NA, 1, 1))
})

test_that("can't currently combine compatible `<list> + <list_of<ptype>>`", {
  # Turn this into a working test after this issue is resolved
  # https://github.com/r-lib/vctrs/pull/1231
  skip_on_cran()

  df <- tibble(col = list(list(a = 1:2), list_of(a = 1L)))

  expect_snapshot((expect_error(
    unnest_wider(df, col)
  )))
})

test_that("unnest_wider() input must be a data frame (#1224)", {
  expect_snapshot((expect_error(unnest_wider(1))))
})

test_that("invariant - final number of columns depends on element sizes", {
  df <- tibble(x = list_of(.ptype = integer()))
  expect_identical(dim(unnest_wider(df, x)), c(0L, 0L))

  df <- tibble(x = list_of(NULL, .ptype = integer()))
  expect_identical(dim(unnest_wider(df, x)), c(1L, 0L))

  df <- tibble(x = list_of(integer()))
  expect_identical(dim(unnest_wider(df, x)), c(1L, 0L))

  df <- tibble(x = list_of(c(a = 1L)))
  expect_identical(dim(unnest_wider(df, x)), c(1L, 1L))

  df <- tibble(x = list_of(c(a = 1L), c(a = 1L, b = 2L, c = 3L)))
  expect_identical(dim(unnest_wider(df, x)), c(2L, 3L))

  df <- tibble(x = list_of(c(a = 1L, c = 3L), c(a = 1L, b = 2L)))
  expect_identical(dim(unnest_wider(df, x)), c(2L, 3L))
})

test_that("invariant - for list_of<dataframe> special case, final number of columns and types comes from ptype columns (#1187)", {
  df <- tibble(x = list_of(.ptype = tibble(a = integer())))
  expect_identical(unnest_wider(df, x), tibble(a = integer()))

  df <- tibble(x = list_of(NULL, .ptype = tibble(a = integer())))
  expect_identical(unnest_wider(df, x), tibble(a = NA_integer_))

  df <- tibble(x = list_of(tibble(a = integer())))
  expect_identical(unnest_wider(df, x), tibble(a = NA_integer_))

  df <- tibble(x = list_of(tibble(a = 1L)))
  expect_identical(unnest_wider(df, x), tibble(a = 1L))

  df <- tibble(x = list_of(tibble(a = 1:2)))
  expect_identical(unnest_wider(df, x), tibble(a = list_of(1:2)))
})
