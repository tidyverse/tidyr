# df_simplify ------------------------------------------------------------

test_that("`simplify` is validated", {
  expect_snapshot(error = TRUE, {
    df_simplify(data.frame(), simplify = 1)
    df_simplify(data.frame(), simplify = NA)
    df_simplify(data.frame(), simplify = c(TRUE, FALSE))
    df_simplify(data.frame(), simplify = list(1))
    df_simplify(data.frame(), simplify = list(x = 1, x = 1))
  })
})

test_that("`ptype` is validated", {
  expect_snapshot(error = TRUE, {
    df_simplify(data.frame(), ptype = 1)
    df_simplify(data.frame(), ptype = list(1))
    df_simplify(data.frame(), ptype = list(x = 1, x = 1))
  })
})

test_that("`transform` is validated", {
  expect_snapshot(error = TRUE, {
    df_simplify(data.frame(), transform = list(~.x))
    df_simplify(data.frame(x = 1), transform = 1)
    df_simplify(data.frame(), transform = list(x = 1))
    df_simplify(data.frame(), transform = list(x = 1, x = 1))
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

  expect_snapshot(error = TRUE, {
    col_simplify(list(1, 2, 3), ptype = integer(), transform = ~ .x + 1.5)
  })
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
