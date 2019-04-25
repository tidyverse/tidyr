context("unnest")

# unnest ------------------------------------------------------------------

test_that("can keep empty rows", {
  df <- tibble(x = 1:2, y = list(NULL, tibble(a = 1)))
  out1 <- df %>% unnest(y)
  expect_equal(nrow(out1), 1)

  out2 <- df %>% unnest(y, keep_empty = TRUE)
  expect_equal(nrow(out2), 2)
  expect_equal(out2$a, c(NA, 1))
})

test_that("bad inputs generate errors", {
  df <- tibble(x = 1, y = list(mean))
  expect_error(unnest(df, y), "must be list of vectors")
})


test_that("unesting combines augmented vectors", {
  df <- tibble::tibble(x = as.list(as.factor(letters[1:3])))
  expect_equal(unnest(df, x)$x, factor(letters[1:3]))
})

test_that("vector unnest preserves names", {
  df <- tibble(x = list(1, 2:3), y = list("a", c("b", "c")))
  out <- unnest(df, x)
  expect_named(out, c("x", "y"))
})

test_that("rows and cols of nested-dfs are expanded", {
  df <- tibble(x = 1:2, y = list(tibble(a = 1), tibble(b = 1:2)))
  out <- df %>% unnest(y)

  expect_named(out, c("x", "a", "b"))
  expect_equal(nrow(out), 3)
})

test_that("can unnest nested lists", {
  df <- tibble(
    x = 1:2,
    y = list(list("a"), list("b"))
  )
  rs <- unnest(df, y)
  expect_identical(rs, tibble(x = 1:2, y = list("a", "b")))
})

test_that("can unnest mixture of name and unnamed lists of same length", {
  df <- tibble(
    x = c("a"),
    y = list(y = 1:2),
    z = list(1:2)
  )
  expect_identical(
    unnest(df, c(y, z)),
    tibble(x = c("a","a"), y = c(1:2), z = c(1:2))
  )
})

test_that("can combine NULL with vectors or data frames", {
  df1 <- tibble(x = 1:2, y = list(NULL, tibble(z = 1)))
  out <- unnest(df1, y)
  expect_named(out, c("x", "z"))
  expect_equal(out$z, 1)

  df2 <- tibble(x = 1:2, y = list(NULL, 1))
  out <- unnest(df2, y)
  expect_named(out, c("x", "y"))
  expect_equal(out$y, 1)
})

test_that("vectors become columns", {
  df <- tibble(x = 1:2, y = list(1, 1:2))
  out <- unnest(df, y)
  expect_equal(out$y, c(1L, 1:2))
})

test_that("multiple columns must be same length", {
  df <- tibble(x = list(1:2), y = list(1:3))
  expect_error(unnest(df, c(x, y)), "Incompatible lengths")

  df <- tibble(x = list(1:2), y = list(tibble(y = 1:3)))
  expect_error(unnest(df, c(x, y)), "Incompatible lengths")
})

test_that("can use non-syntactic names", {
  out <- tibble("foo bar" = list(1:2, 3)) %>% unnest(`foo bar`)
  expect_named(out, "foo bar")
})

# Empty inputs ------------------------------------------------------------

test_that("can unnest empty data frame", {
  df <- tibble(x = integer(), y = list())
  out <- unnest(df, y)
  expect_equal(out, tibble(x = integer()))
})

test_that("unnest() preserves ptype", {
  tbl <- tibble(x = integer(), y = list_of(ptype = tibble(a = integer())))
  res <- unnest(tbl, y)
  expect_equal(res, tibble(x = integer(), a = integer()))
})

test_that("unnest keeps list cols", {
  df <- tibble(x = 1:2, y = list(3, 4), z = list(5, 6:7))
  out <- df %>% unnest(y)

  expect_equal(names(out), c("x", "y", "z"))
})

# Deprecated behaviours ---------------------------------------------------

test_that("cols must go in cols", {
  df <- tibble(x = list(3, 4), y = list("a", "b"))
  expect_warning(unnest(df, x, y), "c(x, y)", fixed = TRUE)
})

test_that("need supply column names", {
  df <- tibble(x = 1:2, y = list("a", "b"))
  expect_warning(unnest(df), "c(y)", fixed = TRUE)
})

test_that("sep combines column names", {
  df <- tibble(x = list(tibble(x = 1)), y = list(tibble(x = 1)))
  out <- expect_warning(df %>% unnest(c(x, y), .sep = "_"), "name_sep")
  expect_named(out, c("x_x", "y_x"))
})

test_that("unnest has mutate semantics", {
  df <- tibble(x = 1:3, y = list(1, 2:3, 4))
  out <- expect_warning(df %>% unnest(z = map(y, `+`, 1)), "mutate")
  expect_equal(out$z, 2:5)
})

test_that(".drop and .preserve are deprecated", {
  df <- tibble(x = list(3, 4), y = list("a", "b"))
  expect_warning(df %>% unnest(x, .preserve = y), ".preserve")

  df <- tibble(x = list(3, 4), y = list("a", "b"))
  expect_warning(df %>% unnest(x, .drop = FALSE), ".drop")
})

test_that(".id creates vector of names for vector unnest", {
  df <- tibble(x = 1:2, y = list(a = 1, b = 1:2))
  out <- expect_warning(unnest(df, y, .id = "name"), "names")

  expect_equal(out$name, c("a", "b", "b"))
})

test_that("grouping is preserved", {
  df <- tibble(g = 1, x = list(1:3)) %>% dplyr::group_by(g)
  rs <- df %>% unnest(x)

  expect_equal(rs$x, 1:3)
  expect_equal(class(df), class(rs))
  expect_equal(dplyr::groups(df), dplyr::groups(rs))
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

test_that("can handle data frames consistently with vectors" , {
  df <- tibble(x = 1:2, y = list(tibble(a = 1:2, b = 2:3)))
  out <- df %>% unnest_wider(y)

  expect_named(out, c("x", "a", "b"))
  expect_equal(nrow(out), 2)
})

test_that("bad inputs generate errors", {
  df <- tibble(x = 1, y = list(mean))
  expect_error(unnest_wider(df, y), "must be list of vectors")
})

test_that("list of 0-length vectors yields no new columns", {
  df <- tibble(x = 1:2, y = list(integer(), integer()))
  expect_named(unnest_wider(df, y), "x")

  # similarly when empty
  df <- tibble(x = integer(), y = list())
  expect_named(unnest_wider(df, y), "x")
})

# unnest_longer -----------------------------------------------------------

test_that("can preserve empty rows", {
  df <- tibble(
    x = 1:3,
    y = list(NULL, NULL, 1)
  )
  out <- df %>% unnest_longer(y, keep_empty = TRUE)
  expect_equal(nrow(out), 3)
})

test_that("can handle data frames consistently with vectors" , {
  df <- tibble(x = 1:2, y = list(tibble(a = 1:2, b = 2:3)))
  out <- df %>% unnest_longer(y)

  expect_named(out, c("x", "y"))
  expect_equal(nrow(out), 4)
})

test_that("bad inputs generate errors", {
  df <- tibble(x = 1, y = list(mean))
  expect_error(unnest_longer(df, y), "must be list of vectors")
})
