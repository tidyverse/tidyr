# hoist -------------------------------------------------------------------

test_that("hoist extracts named elements", {
  df <- tibble(x = list(list(1, b = "b")))

  out <- df %>% hoist(x, a = 1, b = "b")
  expect_equal(out, tibble(a = 1, b = "b"))

  out <- df %>% hoist(x, a = 1, b = "b", .simplify = FALSE)
  expect_identical(out, tibble(a = list(1), b = list("b")))
})

test_that("can hoist named non-list elements at the deepest level", {
  df <- tibble(x = list(list(a = c(aa = 1, bb = 2))))
  out <- hoist(df, x, bb = list("a", "bb"))
  expect_identical(out$bb, 2)
})

test_that("can check check/transform values", {
  df <- tibble(x = list(
    list(a = 1),
    list(a = "a")
  ))

  expect_error(
    df %>% hoist(x, a = "a", .ptype = list(a = character())),
    class = "vctrs_error_incompatible_type"
  )

  out <- df %>% hoist(x, a = "a", .transform = list(a = as.character))
  expect_equal(out, tibble(a = c("1", "a")))
})

test_that("nested lists generate a cast error if they can't be cast to the ptype", {
  df <- tibble(x = list(list(b = list(1))))

  expect_snapshot((expect_error(
    hoist(df, x, "b", .ptype = list(b = double()))
  )))
})

test_that("non-vectors generate a cast error if a ptype is supplied", {
  df <- tibble(x = list(list(b = quote(a))))

  expect_snapshot((expect_error(
    hoist(df, x, "b", .ptype = list(b = integer()))
  )))
})

test_that("a ptype generates a list-of<ptype> if the col can't be simplified (#998)", {
  df <- tibble(x = list(list(a = 1:2), list(a = 1), list(a = 1)))
  ptype <- list(a = integer())

  out <- hoist(df, x, "a", .ptype = ptype)
  expect_identical(out$a, list_of(1:2, 1L, 1L, .ptype = integer()))
})

test_that("doesn't simplify uneven lengths", {
  df <- tibble(x = list(
    list(a = 1),
    list(a = 2:3)
  ))

  out <- df %>% hoist(x, a = "a")
  expect_identical(out$a, list(1, 2:3))
})

test_that("doesn't simplify lists of lists", {
  df <- tibble(x = list(
    list(a = list(1)),
    list(a = list(2))
  ))

  out <- df %>% hoist(x, a = "a")
  expect_identical(out$a, list(list(1), list(2)))
})

test_that("doesn't simplify non-vectors", {
  df <- tibble(x = list(
    list(a = quote(a)),
    list(a = quote(b))
  ))

  out <- df %>% hoist(x, a = "a")
  expect_identical(out$a, list(quote(a), quote(b)))
})

test_that("can hoist out scalars", {
  df <- tibble(
    x = 1:2,
    y = list(
      list(mod = lm(mpg ~ wt, data = mtcars)),
      list(mod = lm(mpg ~ wt, data = mtcars))
    )
  )
  out <- hoist(df, y, "mod")
  expect_identical(out$mod, list(df$y[[1]]$mod, df$y[[2]]$mod))
})

test_that("input validation catches problems", {
  df <- tibble(x = list(list(1, b = "b")), y = 1)

  expect_snapshot({
    (expect_error(df %>% hoist(y)))
    (expect_error(df %>% hoist(x, 1)))
    (expect_error(df %>% hoist(x, a = "a", a = "b")))
  })
})

test_that("string pluckers are automatically named", {
  out <- check_pluckers("x", y = "x", z = 1)
  expect_named(out, c("x", "y", "z"))
})

test_that("can't hoist() from a data frame column", {
  df <- tibble(a = tibble(x = 1))

  expect_snapshot((expect_error(
    hoist(df, a, xx = 1)
  )))
})

test_that("can hoist() without any pluckers", {
  df <- tibble(a = list(1))
  expect_identical(hoist(df, a), df)
})

test_that("can use a character vector for deep hoisting", {
  df <- tibble(x = list(list(b = list(a = 1))))
  out <- hoist(df, x, ba = c("b", "a"))
  expect_identical(out$ba, 1)
})

test_that("can use a numeric vector for deep hoisting", {
  df <- tibble(x = list(list(b = list(a = 1, b = 2))))
  out <- hoist(df, x, bb = c(1, 2))
  expect_identical(out$bb, 2)
})

test_that("can't maintain type stability with empty elements due to `purrr::pluck()` (#1203)", {
  # We want to be notified if this changes in purrr, but not error on CRAN
  skip_on_cran()

  df <- tibble(
    col = list(
      list(a = integer()),
      list(a = integer())
    )
  )

  out <- hoist(df, col, "a")

  # Ideally:
  # expect_identical(out$a, c(NA_integer_, NA_integer_))
  expect_identical(out$a, c(NA, NA))
})

test_that("can hoist out a rcrd style column (#999)", {
  x <- new_rcrd(list(x = 1, y = 2))
  df <- tibble(a = list(list(x = x), list(x = x)))

  out <- hoist(df, a, "x")

  expect_identical(out$x, vec_c(x, x))
})

test_that("hoist() input must be a data frame (#1224)", {
  expect_snapshot((expect_error(hoist(1))))
})

test_that("hoist() can simplify on a per column basis (#995)", {
  df <- tibble(
    x = list(
      list(a = 1, b = 1),
      list(a = 2, b = 2)
    )
  )

  expect_identical(
    hoist(df, x, a = "a", b = "b", .simplify = list(a = FALSE)),
    tibble(a = list(1, 2), b = c(1, 2))
  )
})

test_that("hoist() retrieves first of duplicated names and leaves the rest alone (#1259)", {
  elt <- list(x = 1, y = 2, x = 3, z = 2)
  df <- tibble(col = list(elt))

  expect_identical(
    hoist(df, col, "x"),
    tibble(x = 1, col = list(list(y = 2, x = 3, z = 2)))
  )

  expect_identical(
    hoist(df, col, "y"),
    tibble(y = 2, col = list(list(x = 1, x = 3, z = 2)))
  )
})

test_that("known bug - hoist() doesn't strike after each pluck (related to #1259)", {
  # All pluckers operate on the same initial list-col.
  # We don't currently strike after each pluck, so the repeated plucks pull the
  # first of the duplicated `x` names each time. But then the strike() loop
  # removes both of them, because it strikes with `"x"` twice in a row.
  # Fixing this probably requires significant work and likely isn't worth it.

  elt <- list(x = 1, x = 3, z = 2)
  df <- tibble(col = list(elt))

  # Ideally we'd get `x1 = 1, x2 = 3` and no mention of `x` in `col`
  expect_identical(
    hoist(df, col, x1 = "x", x2 = "x"),
    tibble(x1 = 1, x2 = 1, col = list(list(z = 2)))
  )
})

# strike ------------------------------------------------------------------

test_that("strike can remove using a list", {
  x <- list(a = list(), b = list(a = 1, b = 2), c = "c")

  expect_equal(strike(x, list(1)), x[c(2, 3)])
  expect_equal(strike(x, list("a")), x[c(2, 3)])

  deep <- strike(x, list("b", 2))
  expect_equal(deep, list(a = list(), b = list(a = 1), c = "c"))
})

test_that("strike returns input if idx not present", {
  x <- list(a = list(), b = list(a = 1, b = 2), c = "c")

  expect_equal(strike(x, list(4)), x)
  expect_equal(strike(x, list("d")), x)
  expect_equal(strike(x, list("b", 3)), x)
  expect_equal(strike(x, list("d", 3)), x)
  expect_equal(strike(x, list("b", "c")), x)
  expect_equal(strike(x, list(3, "b")), x)
  expect_equal(strike(x, list(4, "b")), x)
})

test_that("ignores weird inputs", {
  x <- list(a = list(), b = list(a = 1, b = 2), c = "c")

  expect_equal(strike(x, list()), x)
  expect_equal(strike(x, list(mean, mean)), x)
})


# unnest_wider --------------------------------------------------------

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

# unnest_longer -----------------------------------------------------------

test_that("uses input for default column names", {
  df <- tibble(x = 1:2, y = list(1, 1:2))
  out <- df %>% unnest_longer(y)

  expect_named(out, c("x", "y"))
})

test_that("can adjust the column name with `values_to`", {
  df <- tibble(x = 1:2, y = list(1, 1:2))
  out <- df %>% unnest_longer(y, values_to = "y2")

  expect_named(out, c("x", "y2"))
})

test_that("automatically adds id col if named", {
  df <- tibble(x = 1:2, y = list(c(a = 1), c(b = 2)))
  out <- df %>% unnest_longer(y)

  expect_named(out, c("x", "y", "y_id"))
})

test_that("can force integer indexes", {
  df <- tibble(x = 1:2, y = list(1, 2))
  out <- df %>% unnest_longer(y, indices_include = TRUE)
  expect_named(out, c("x", "y", "y_id"))

  out <- df %>% unnest_longer(y, indices_to = "y2")
  expect_named(out, c("x", "y", "y2"))
})

test_that("preserves empty rows", {
  df <- tibble(
    x = 1:3,
    y = list(NULL, NULL, 1)
  )
  out <- df %>% unnest_longer(y)
  expect_equal(nrow(out), 3)
})

test_that("can handle data frames consistently with vectors", {
  df <- tibble(x = 1:2, y = list(tibble(a = 1:2, b = 2:3)))
  out <- df %>% unnest_longer(y)

  expect_named(out, c("x", "y"))
  expect_equal(nrow(out), 4)
})

test_that("can unested dates", {
  x <- as.Date(c("2019-08-01", "2019-12-01"))
  df <- tibble(x = as.list(x))
  out <- df %>% unnest_longer(x)
  expect_equal(out$x, x)
})

test_that("unnest_longer - bad inputs generate errors", {
  df <- tibble(x = 1, y = list(mean))

  expect_snapshot((expect_error(
    unnest_longer(df, y)
  )))
})

test_that("list_of columns can be unnested", {
  df <- tibble(x = 1:2, y = list_of(1L, 1:2))
  out <- unnest_longer(df, y)

  expect_named(out, c("x", "y"))
  expect_equal(nrow(out), 3)

  # With id column
  df <- tibble(x = 1:2, y = list_of(c(a = 1L), c(b = 1:2)))
  expect_named(unnest_longer(df, y), c("x", "y", "y_id"))
})

test_that("mix of unnamed and named can be unnested (#1029)", {
  df <- tibble(x = 1:3, y = list(1, c(b = 2), NULL))

  out <- unnest_longer(df, y, indices_include = NULL)
  expect_identical(out$y_id, c(NA, "b", NA))

  out <- unnest_longer(df, y, indices_include = TRUE)
  expect_identical(out$y_id, c(NA, "b", NA))
})

test_that("unnesting empty typed column is a no-op and retains column (#1199) (#1196)", {
  df <- tibble(x = integer())
  expect_identical(unnest_longer(df, x), df)

  df <- tibble(x = tibble())
  expect_identical(unnest_longer(df, x), df)

  df <- tibble(x = tibble(a = integer()))
  expect_identical(unnest_longer(df, x), df)

  # In particular, #1196
  df <- tibble(a = tibble(x = 1:2, y = 3:4, z = 5:6))
  expect_identical(unnest_longer(df, a), df)
})

test_that("unnesting empty list retains logical column (#1199)", {
  # Really an unspecified column that `vec_cast_common()` finalizes to logical
  df <- tibble(x = list())
  expect_identical(unnest_longer(df, x), tibble(x = logical()))
})

test_that("unnesting empty list with indices uses integer indices", {
  df <- tibble(x = list())
  out <- unnest_longer(df, x, indices_include = TRUE)
  expect_identical(out$x_id, integer())
})

test_that("unnesting empty list-of retains ptype (#1199)", {
  df <- tibble(x = list_of(.ptype = integer()))
  expect_identical(unnest_longer(df, x), tibble(x = integer()))
})

test_that("unnesting list of data frames utilizes `values_to` (#1195)", {
  df <- tibble(x = list(tibble(a = 1:2), tibble(a = 3:4)))

  expect_identical(
    unnest_longer(df, x, values_to = "foo"),
    tibble(foo = tibble(a = 1:4))
  )
})

test_that("unnesting list of data frames utilizes `indices_include` (#1194)", {
  df <- tibble(x = list(tibble(a = 1:2), tibble(a = 3:4)))

  expect_identical(
    unnest_longer(df, x, indices_include = TRUE),
    tibble(x = tibble(a = 1:4), x_id = c(1L, 2L, 1L, 2L))
  )
})

test_that("can unnest a column with just `list(NULL)` (#1193)", {
  df <- tibble(x = list(NULL))
  expect_identical(unnest_longer(df, x), tibble(x = NA))

  df <- tibble(x = list_of(NULL, .ptype = integer()))
  expect_identical(unnest_longer(df, x), tibble(x = NA_integer_))
})

test_that("unnesting `list(NULL)` with indices uses integer indices", {
  df <- tibble(x = list(NULL))
  out <- unnest_longer(df, x, indices_include = TRUE)
  expect_identical(out$x_id, 1L)
})

test_that("can unnest one row data frames (#1034)", {
  col <- list(tibble(x = 1, y = 2), tibble(x = 2, y = 3))
  df <- tibble(col = col)

  expect_identical(
    unnest_longer(df, col),
    tibble(col = tibble(x = c(1, 2), y = c(2, 3)))
  )
})

test_that("named vectors are converted to lists with `vec_chop()`", {
  # Equivalent to `df <- tibble(x = list_of(c(a = 1), c(b = 2)))`
  df <- tibble(x = c(a = 1, b = 2))

  out <- unnest_longer(df, x)

  expect_identical(out$x, c(a = 1, b = 2))
  expect_identical(out$x_id, c("a", "b"))
})

test_that("can unnest multiple columns (#740)", {
  df <- tibble(a = list(1:2, 3:4), b = list(1:2, 3:4))
  expect_identical(unnest_longer(df, c(a, b)), unchop(df, c(a, b)))
})

test_that("tidyverse recycling rules are applied when unnesting multiple cols", {
  df <- tibble(a = list(1L, 3:4), b = list(1:2, 4L))
  out <- unnest_longer(df, c(a, b))
  expect_identical(out$a, c(1L, 1L, 3L, 4L))
  expect_identical(out$b, c(1L, 2L, 4L, 4L))
})

test_that("unnesting multiple columns uses independent indices", {
  df <- tibble(a = list(c(x = 1), NULL), b = list(1, 2:3))
  out <- unnest_longer(df, c(a, b))

  expect_identical(out$a_id, c("x", NA, NA))
  expect_named(out, c("a", "a_id", "b"))
})

test_that("unnesting multiple columns works with `indices_include = TRUE`", {
  df <- tibble(a = list(c(x = 1), NULL), b = list(1, 2:3))
  out <- unnest_longer(df, c(a, b), indices_include = TRUE)

  expect_identical(out$a_id, c("x", NA, NA))
  expect_identical(out$b_id, c(1L, 1L, 2L))
})

test_that("can use glue to name multiple `values_to` cols", {
  df <- tibble(a = list(1, 2:3), b = list(1, 2:3))
  expect_named(
    unnest_longer(df, c(a, b), values_to = "{col}_"),
    c("a_", "b_")
  )
})

test_that("can use glue to name multiple `indices_to` cols", {
  df <- tibble(a = list(1, 2:3), b = list(1, 2:3))
  expect_named(
    unnest_longer(df, c(a, b), indices_to = "{col}_name"),
    c("a", "a_name", "b", "b_name")
  )
})

test_that("default `indices_to` is based on `values_to` (#1201)", {
  df <- tibble(a = list(c(x = 1), 2))
  expect_named(
    unnest_longer(df, a, values_to = "aa"),
    c("aa", "aa_id")
  )
})

test_that("can unnest a vector with a mix of named/unnamed elements (#1200 comment)", {
  df <- tibble(x = c(a = 1L, 2L))
  out <- unnest_longer(df, x)
  expect_identical(out$x, df$x)
  expect_identical(out$x_id, c("a", ""))
})

test_that("can unnest a list with a mix of named/unnamed elements (#1200 comment)", {
  df <- tibble(x = list(a = 1:2, 3:4))
  out <- unnest_longer(df, x)
  expect_identical(out$x, 1:4)
})

test_that("names are preserved when simplification isn't done and a ptype is supplied", {
  df <- tibble(x = list(list(a = 1L), list(b = 1L)))
  ptype <- list(x = integer())

  # Explicit request not to simplify
  out <- unnest_longer(df, x, indices_include = TRUE, ptype = ptype, simplify = FALSE)
  expect_named(out$x, c("a", "b"))
  expect_identical(out$x_id, c("a", "b"))

  df <- tibble(x = list(list(a = 1:2), list(b = 1L)))
  ptype <- list(x = integer())

  # Automatically can't simplify
  out <- unnest_longer(df, x, indices_include = TRUE, ptype = ptype)
  expect_named(out$x, c("a", "b"))
  expect_identical(out$x_id, c("a", "b"))
})

test_that("can't currently retain names when simplification isn't done and a ptype is supplied if there is a mix of named/unnamed elements (#1212)", {
  df <- tibble(x = list(list(a = 1L), list(1L)))
  ptype <- list(x = integer())

  out <- unnest_longer(df, x, indices_include = TRUE, ptype = ptype, simplify = FALSE)

  expect_named(out$x, c("a", ""))
  expect_identical(out$x_id, c("a", NA))
})

test_that("can't mix `indices_to` with `indices_include = FALSE`", {
  expect_snapshot((expect_error(
    unnest_longer(mtcars, mpg, indices_to = "x", indices_include = FALSE)
  )))
})

test_that("unnest_longer() input must be a data frame (#1224)", {
  expect_snapshot((expect_error(unnest_longer(1))))
})

test_that("`values_to` and `indices_to` glue can't reach into surrounding env", {
  x <- "foo"

  expect_error(unnest_longer(mtcars, mpg, indices_to = "{x}"))
  expect_error(unnest_longer(mtcars, mpg, values_to = "{x}"))
})

test_that("`values_to` is validated", {
  expect_snapshot({
    (expect_error(unnest_longer(mtcars, mpg, values_to = 1)))
    (expect_error(unnest_longer(mtcars, mpg, values_to = c("x", "y"))))
  })
})

test_that("`indices_to` is validated", {
  expect_snapshot({
    (expect_error(unnest_longer(mtcars, mpg, indices_to = 1)))
    (expect_error(unnest_longer(mtcars, mpg, indices_to = c("x", "y"))))
  })
})

test_that("`indices_include` is validated", {
  expect_snapshot({
    (expect_error(unnest_longer(mtcars, mpg, indices_include = 1)))
    (expect_error(unnest_longer(mtcars, mpg, indices_include = c(TRUE, FALSE))))
  })
})

# unnest_auto -------------------------------------------------------------

test_that("unnamed becomes longer", {
  df <- tibble(x = 1:2, y = list(1, 2:3))
  expect_message(out <- df %>% unnest_auto(y), "unnest_longer")
  expect_equal(out$y, c(1, 2, 3))
})

test_that("common name becomes wider", {
  df <- tibble(x = 1:2, y = list(c(a = 1), c(a = 2)))
  expect_message(out <- df %>% unnest_auto(y), "unnest_wider")
  expect_named(out, c("x", "a"))
})

test_that("no common name falls back to longer with index", {
  df <- tibble(x = 1:2, y = list(c(a = 1), c(b = 2)))
  expect_message(out <- df %>% unnest_auto(y), "unnest_longer")
  expect_named(out, c("x", "y", "y_id"))
})

test_that("mix of named and unnamed becomes longer", {
  df <- tibble(x = 1:2, y = list(c(a = 1), 2))
  expect_message(out <- df %>% unnest_auto(y), "unnest_longer")
  expect_named(out, c("x", "y"))
})

# https://github.com/tidyverse/tidyr/issues/959
test_that("works with an input that has column named `col`", {
  df <- tibble(
    col = 1L,
    list_col = list(list(x = "a", y = "b"), list(x = "c", y = "d"))
  )
  expect_message(out <- df %>% unnest_auto(list_col), "unnest_wider")
  expect_named(out, c("col", "x", "y"))
})

# df_simplify ------------------------------------------------------------

test_that("`simplify` is validated", {
  expect_snapshot({
    (expect_error(df_simplify(data.frame(), simplify = 1)))
    (expect_error(df_simplify(data.frame(), simplify = NA)))
    (expect_error(df_simplify(data.frame(), simplify = c(TRUE, FALSE))))
    (expect_error(df_simplify(data.frame(), simplify = list(1))))
    (expect_error(df_simplify(data.frame(), simplify = list(x = 1, x = 1))))
  })
})

test_that("`ptype` is validated", {
  expect_snapshot({
    (expect_error(df_simplify(data.frame(), ptype = 1)))
    (expect_error(df_simplify(data.frame(), ptype = list(1))))
    (expect_error(df_simplify(data.frame(), ptype = list(x = 1, x = 1))))
  })
})

test_that("`transform` is validated", {
  expect_snapshot({
    (expect_error(df_simplify(data.frame(), transform = list(~.x))))
    (expect_error(df_simplify(data.frame(x = 1), transform = 1)))
    (expect_error(df_simplify(data.frame(), transform = list(x = 1))))
    (expect_error(df_simplify(data.frame(), transform = list(x = 1, x = 1))))
  })
})

test_that("`simplify` can be a named list (#995)", {
  df <- tibble(x = list(1), y = list("a"))

  expect_identical(
    df_simplify(df, simplify = list(x = FALSE)),
    data_frame(x = list(1), y = "a")
  )

  expect_identical(
    df_simplify(df, simplify = list(x = TRUE, y = FALSE)),
    data_frame(x = 1, y = list("a"))
  )
})

test_that("`simplify` elements are ignored if they don't correspond to a column", {
  df <- tibble(x = list(1), y = list("a"))

  expect_identical(
    df_simplify(df, simplify = list(z = FALSE)),
    data_frame(x = 1, y = "a")
  )
})

test_that("`ptype` is allowed to be a single empty ptype (#1284)", {
  df <- tibble(x = list(1), y = list(1))

  expect_identical(
    df_simplify(df, ptype = integer()),
    data_frame(x = 1L, y = 1L)
  )
})

test_that("`transform` is allowed to be a single function (#1284)", {
  df <- tibble(x = list("1"), y = list("1"))

  expect_identical(
    df_simplify(df, transform = ~ as.integer(.x)),
    data_frame(x = 1L, y = 1L)
  )
})

# col_simplify -----------------------------------------------------------

test_that("non-list isn't simplified", {
  expect_identical(col_simplify(1:5), 1:5)
})

test_that("transform is applied to entire non-list", {
  expect_identical(col_simplify(1:5, transform = function(x) x + 1L), 2:6)
})

test_that("transform is applied to list elements individually", {
  expect_identical(
    col_simplify(list(1, 2), transform = length),
    c(1L, 1L)
  )
})

test_that("transform is applied even if you can't simplify", {
  expect_identical(
    col_simplify(list(1:2, 2L), transform = ~ .x + 1L),
    list(2:3, 3L)
  )
})

test_that("transform can result in simplification", {
  expect_identical(
    col_simplify(list(1:2, 2L), transform = sum),
    c(3L, 2L)
  )
})

test_that("lose list-of status after applying transform", {
  x <- list_of(1L, 1:2)

  expect_identical(
    col_simplify(x, transform = ~ .x + 1),
    list(2, c(2, 3))
  )

  x <- list_of(NULL, .ptype = integer())

  # Not `NA_integer_`
  expect_identical(
    col_simplify(x, transform = ~.x),
    NA
  )
})

test_that("ptype is applied to entire non-list", {
  expect_identical(col_simplify(1:5, ptype = double()), as.double(1:5))
})

test_that("ptype is applied to list elements individually", {
  expect_identical(
    col_simplify(list(1, 2, 3), ptype = integer()),
    c(1L, 2L, 3L)
  )
})

test_that("ptype is applied even if you can't simplify - and results in a list-of!", {
  expect_identical(
    col_simplify(list(c(1, 2), 2, 3), ptype = integer()),
    list_of(1:2, 2L, 3L)
  )
})

test_that("ptype is applied after transform", {
  expect_identical(
    col_simplify(list(1, 2, 3), ptype = integer(), transform = ~ .x + 1),
    c(2L, 3L, 4L)
  )

  expect_snapshot((expect_error(
    col_simplify(list(1, 2, 3), ptype = integer(), transform = ~ .x + 1.5)
  )))
})

test_that("lists of lists aren't simplified", {
  x <- list(list(1), list(2))
  expect_identical(col_simplify(x), x)

  x <- list_of(list(1), list(2))
  expect_identical(col_simplify(x), x)
})

test_that("lists of non-vectors aren't simplified", {
  x <- list(sym("x"), sym("y"))
  expect_identical(col_simplify(x), x)
})

test_that("lists with length >1 vectors aren't simplified", {
  x <- list(1, 1:2, 3)
  expect_identical(col_simplify(x), x)

  x <- list_of(1L, 1:2, 3L)
  expect_identical(col_simplify(x), x)
})

test_that("Empty elements are retained if we can't simplify", {
  x <- list(1, NULL, 1:2, integer())
  expect_identical(col_simplify(x), x)
})

test_that("`NULL` are initialized to size 1 equivalent", {
  x <- list(1, NULL, 2)
  expect_identical(col_simplify(x), c(1, NA, 2))
  expect_identical(col_simplify(x, ptype = integer()), c(1L, NA, 2L))

  x <- list_of(1, NULL, 2)
  expect_identical(col_simplify(x), c(1, NA, 2))
})

test_that("`NULL` is handled correctly when it is the only element", {
  x <- list(NULL)

  expect_identical(col_simplify(x), NA)
  expect_identical(col_simplify(x, ptype = integer()), NA_integer_)

  x <- list_of(NULL, .ptype = integer())

  expect_identical(col_simplify(x), NA_integer_)
  expect_identical(col_simplify(x, ptype = double()), NA_real_)
})

test_that("empty typed elements are initialized to size 1 equivalent", {
  x <- list(integer(), 1L, integer())
  expect_identical(col_simplify(x), c(NA, 1L, NA))

  x <- list_of(integer(), 1L)
  expect_identical(col_simplify(x), c(NA, 1L))
})

test_that("empty typed element is handled correctly if it is the only element", {
  x <- list(integer())

  expect_identical(col_simplify(x), NA_integer_)
  expect_identical(col_simplify(x, ptype = double()), NA_real_)

  x <- list_of(integer())

  expect_identical(col_simplify(x), NA_integer_)
  expect_identical(col_simplify(x, ptype = double()), NA_real_)
})

test_that("can simplify record style objects (#999)", {
  rcrd <- new_rcrd(list(x = 1, y = 2))
  x <- list(rcrd, rcrd)
  expect_identical(col_simplify(x), vec_c(rcrd, rcrd))
})

test_that("can simplify one row data frames (#1034)", {
  x <- list(tibble(x = 1, y = 2), tibble(x = 2, y = 3))
  expect_identical(col_simplify(x), vec_c(x[[1]], x[[2]]))
})
