# unnest_wider --------------------------------------------------------

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
