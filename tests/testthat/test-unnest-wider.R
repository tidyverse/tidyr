test_that("number of rows is preserved", {
  df <- tibble(
    x = 1:3,
    y = list(NULL, c(a = 1), c(a = 1, b = 2))
  )
  out <- df |> unnest_wider(y)
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
  out <- df |> unnest_wider(y)
  expect_equal(out$a, c(1, 3))
  expect_equal(out$b, c(2, NA))
  expect_equal(out$c, list(c(1, 2), NULL))

  # Works when casting too
  out <- df |> unnest_wider(y, ptype = list(a = integer(), b = integer()))
  expect_equal(out$a, c(1L, 3L))
  expect_equal(out$b, c(2L, NA))
  expect_equal(out$c, list(c(1, 2), NULL))
})

test_that("treats data frames like lists where we have type info about each element", {
  df <- tibble(x = 1:2, y = list(tibble(a = 1:2)))
  out <- df |> unnest_wider(y)

  expect_named(out, c("x", "a"))
  expect_equal(nrow(out), 2)

  # We know the types of this, even though we can't simplify it
  expect_identical(attr(out$a, "ptype"), integer())

  df <- tibble(x = 1:2, y = list(list(a = 1:2)))
  out <- df |> unnest_wider(y)

  expect_named(out, c("x", "a"))
  expect_equal(nrow(out), 2)

  # We don't know the types of this
  expect_identical(class(out$a), "list")
})

test_that("unnest_wider - bad inputs generate errors", {
  df <- tibble(x = 1, y = list(mean))

  expect_snapshot(unnest_wider(df, y), error = TRUE)
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
  expect_no_warning(out <- unnest_wider(df, x, names_sep = "_"))
  expect_named(out, c("x_1", "x_2", "x_3", "y"))

  expect_no_warning(out <- unnest_wider(df, y, names_sep = "_"))
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
  expect_identical(
    out,
    tibble(a = 1:3, x = list_of(1L, 2L, 3L), y = list_of(1L, 2L, 3L))
  )
})

test_that("unnesting mixed empty types retains the column (#1125)", {
  df <- tibble(col = list(list(a = list()), list(a = integer())))
  expect_identical(unnest_wider(df, col), tibble(a = c(NA, NA)))
})

test_that("can unnest mixed empty types with `strict = FALSE`", {
  df <- tibble(
    col = list(
      list(a = "x"),
      list(a = list()),
      list(a = integer())
    )
  )

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

test_that("can unnest a vector with a mix of named/unnamed elements (#1200 comment, #1367)", {
  df <- tibble(x = c(a = 1L, 2L))
  out <- unnest_wider(df, x, names_sep = "_")
  expect_identical(out$x_a, c(1L, NA))
  expect_identical(out$x_1, c(NA, 2L))
})

test_that("can unnest a list with a mix of named/unnamed elements (#1200 comment)", {
  df <- tibble(x = list(a = 1:2, 3:4))
  out <- unnest_wider(df, x, names_sep = "_")
  expect_identical(out$x_1, c(1L, 3L))
  expect_identical(out$x_2, c(2L, 4L))
})

test_that("integer names are generated before applying `names_sep` (#1200 comment, #1367)", {
  df <- tibble(col = list(set_names(1, "")))
  out <- unnest_wider(df, col, names_sep = "_")
  expect_named(out, "col_1")

  df <- tibble(col = list(set_names(1:2, c("", ""))))
  out <- unnest_wider(df, col, names_sep = "_")
  expect_named(out, c("col_1", "col_2"))
})

test_that("integer names are generated for partially named vectors (#1367)", {
  df <- tibble(col = list(set_names(1:4, c("x", "", "z", ""))))
  out <- unnest_wider(df, col, names_sep = "_")
  expect_named(out, c("col_x", "col_2", "col_z", "col_4"))

  df <- tibble(
    col = list(
      set_names(1:4, c("x", "", "z", "")),
      set_names(5:8, c("", "", "z", ""))
    )
  )
  out <- unnest_wider(df, col, names_sep = "_")
  expect_named(out, c("col_x", "col_2", "col_z", "col_4", "col_1"))
  expect_identical(out$col_x, c(1L, NA))
  expect_identical(out$col_1, c(NA, 5L))
})

test_that("`NA_character_` name is treated like the empty string (#1200 comment)", {
  col <- list(
    set_names(1, "a"),
    set_names(1, NA_character_),
    set_names(1, "")
  )
  df <- tibble(col = col)

  out <- unnest_wider(df, col, names_sep = "_")

  expect_identical(out$col_a, c(1, NA, NA))
  expect_identical(out$col_1, c(NA, 1, 1))
})

test_that("can combine `<list> + <list_of<ptype>>`", {
  df <- tibble(col = list(list(a = 1:2), list_of(a = 1L)))
  out <- unnest_wider(df, col)
  expect_identical(out$a, list(1:2, 1L))
})

test_that("can't unnest unnamed elements without `names_sep` (#1367)", {
  df <- tibble(col = list(1))
  expect_snapshot(error = TRUE, {
    unnest_wider(df, col)
  })

  df <- tibble(col = list(set_names(1, "")))
  expect_snapshot(error = TRUE, {
    unnest_wider(df, col)
  })

  df <- tibble(col = list(set_names(1, NA_character_)))
  expect_snapshot(error = TRUE, {
    unnest_wider(df, col)
  })

  # Partially missing within an element
  df <- tibble(col = list(c(a = 1), c(a = 1, 2)))
  expect_snapshot(error = TRUE, {
    unnest_wider(df, col)
  })
})

test_that("catches duplicate inner names in the same vector", {
  df <- tibble(col = list(c(a = 1, a = 2)))

  expect_snapshot(error = TRUE, {
    unnest_wider(df, col)
  })

  expect_snapshot({
    out <- unnest_wider(df, col, names_repair = "unique")
  })
  expect_named(out, c("a...1", "a...2"))
})

test_that("unnest_wider() advises on outer / inner name duplication (#1367)", {
  df <- tibble(x = 1, y = list(list(x = 2)))

  expect_snapshot(error = TRUE, {
    unnest_wider(df, y)
  })
})

test_that("unnest_wider() advises on inner / inner name duplication (#1367)", {
  df <- tibble(x = 1, y = list(list(a = 2)), z = list(list(a = 3)))

  expect_snapshot(error = TRUE, {
    unnest_wider(df, c(y, z))
  })
})

test_that("unnest_wider() works with foreign lists recognized by `vec_is_list()` (#1327)", {
  new_foo <- function(...) {
    structure(list(...), class = c("foo", "list"))
  }

  # With empty types
  df <- tibble(x = new_foo(new_foo(a = 1, b = integer())))
  expect_identical(
    unnest_wider(df, x, strict = TRUE),
    tibble(a = 1, b = NA_integer_)
  )

  # With `NULL`s
  df <- tibble(x = new_foo(new_foo(a = 1, b = NULL)))
  expect_identical(unnest_wider(df, x), tibble(a = 1, b = NA))
})

test_that("unnest_wider() validates its inputs", {
  df <- tibble(x = list(a = 1:2, b = 3:4))
  expect_snapshot(error = TRUE, {
    unnest_wider(1)
  })
  expect_snapshot(error = TRUE, {
    unnest_wider(df)
  })
  expect_snapshot(error = TRUE, {
    unnest_wider(df, x, names_sep = 1)
  })
  expect_snapshot(error = TRUE, {
    unnest_wider(df, x, strict = 1)
  })
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
