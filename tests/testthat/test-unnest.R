context("unnest")

test_that("unnesting combines atomic vectors", {
  df <- tibble(x = list(1, 2:3, 4:10))
  expect_equal(unnest(df)$x, 1:10)
})

test_that("unesting combines augmented vectors", {
  df <- tibble::tibble(x = as.list(as.factor(letters[1:3])))
  expect_equal(unnest(df)$x, factor(letters[1:3]))
})

test_that("vector unnest preserves names", {
  df <- tibble(x = list(1, 2:3), y = list("a", c("b", "c")))
  out <- unnest(df)
  expect_named(out, c("x", "y"))
})

test_that("unnesting row binds data frames", {
  df <- tibble(x = list(
    tibble(x = 1:5),
    tibble(x = 6:10)
  ))
  expect_equal(unnest(df)$x, 1:10)
})

test_that("can unnested lists", {
  df <- tibble(
    x = 1:2,
    y = list(list("a"), list("b"))
  )
  rs <- unnest(df, y)
  expect_identical(rs, tibble(x = 1:2, y = list("a", "b")))
})

test_that("elements must all be of same type", {
  df <- tibble(x = list(1, "a"))
  expect_error(unnest(df), "(incompatible type)|(numeric to character)|(character to numeric)")
})

test_that("can't combine vectors and data frames", {
  df <- tibble(x = list(1, tibble(1)))
  expect_error(unnest(df), "a list of vectors or a list of data frames")
})

test_that("multiple columns must be same length", {
  df <- tibble(x = list(1), y = list(1:2))
  expect_error(unnest(df), "same number of elements")

  df <- tibble(x = list(1), y = list(tibble(x = 1:2)))
  expect_error(unnest(df), "same number of elements")
})

test_that("nested is split as a list (#84)", {
  df <- tibble(x = 1:3, y = list(1, 2:3, 4), z = list(5, 6:7, 8))
  expect_warning(out <- unnest(df, y, z), NA)
  expect_equal(out$x, c(1, 2, 2, 3))
  expect_equal(out$y, unlist(df$y))
  expect_equal(out$z, unlist(df$z))
})

test_that("unnest has mutate semantics", {
  df <- tibble(x = 1:3, y = list(1, 2:3, 4))
  out <- df %>% unnest(z = map(y, `+`, 1))

  expect_equal(out$z, 2:5)
})

test_that(".id creates vector of names for vector unnest", {
  df <- tibble(x = 1:2, y = list(a = 1, b = 1:2))
  out <- unnest(df, .id = "name")

  expect_equal(out$name, c("a", "b", "b"))
})

test_that(".id creates vector of names for grouped vector unnest", {
  df <- tibble(x = 1:2, y = list(a = 1, b = 1:2)) %>%
    dplyr::group_by(x)
  out <- unnest(df, .id = "name")

  expect_equal(out$name, c("a", "b", "b"))
})

test_that(".id creates vector of names for data frame unnest", {
  df <- tibble(x = 1:2, y = list(
    a = tibble(y = 1),
    b = tibble(y = 1:2)
  ))
  out <- unnest(df, .id = "name")

  expect_equal(out$name, c("a", "b", "b"))
})

test_that(".id creates vector of names for grouped data frame unnest", {
  df <- tibble(x = 1:2, y = list(
    a = tibble(y = 1),
    b = tibble(y = 1:2)
  )) %>%
    dplyr::group_by(x)
  out <- unnest(df, .id = "name")

  expect_equal(out$name, c("a", "b", "b"))
})

test_that("can use non-syntactic names", {
  out <- tibble("foo bar" = list(1:2, 3)) %>% unnest()

  expect_named(out, "foo bar")
})

test_that("sep combines column names", {
  ldf <- list(tibble(x = 1))
  tibble(x = ldf, y = ldf) %>%
    unnest(.sep = "_") %>%
    expect_named(c("x_x", "y_x"))
})

test_that("can unnest empty data frame", {
  df <- tibble(x = integer(), y = list())
  out <- unnest(df, y)
  expect_equal(out, tibble(x = integer()))
})

test_that("empty ... returns df if no list-cols", {
  df <- tibble(x = integer(), y = integer())
  expect_equal(unnest(df), df)
})

test_that("can optional preserve list cols", {
  df <- tibble(x = list(3, 4), y = list("a", "b"))
  rs <- df %>% unnest(x, .preserve = y)
  expect_identical(rs, tibble(y = df$y, x = c(3, 4)))

  df <- tibble(x = list(c("d", "e")), y = list(1:2))
  rs <- df %>% unnest(.preserve = y)
  expect_identical(rs, tibble(y = rep(list(1:2), 2), x = c("d", "e")))
})

# Drop --------------------------------------------------------------------

test_that("unnest drops list cols if expanding", {
  df <- tibble(x = 1:2, y = list(3, 4), z = list(5, 6:7))
  out <- df %>% unnest(z)

  expect_equal(names(out), c("x", "z"))
})

test_that("unnest keeps list cols if not expanding", {
  df <- tibble(x = 1:2, y = list(3, 4), z = list(5, 6:7))
  out <- df %>% unnest(y)

  expect_equal(names(out), c("x", "z", "y"))
})

test_that("unnest respects .drop_lists", {
  df <- tibble(x = 1:2, y = list(3, 4), z = list(5, 6:7))

  expect_equal(df %>% unnest(y, .drop = TRUE) %>% names(), c("x", "y"))
  expect_equal(df %>% unnest(z, .drop = FALSE) %>% names(), c("x", "y", "z"))
})

test_that("grouping is preserved", {
  df <- tibble(g = 1, x = list(1:3)) %>% dplyr::group_by(g)
  rs <- df %>% unnest(x)

  expect_equal(rs$x, 1:3)
  expect_equal(class(df), class(rs))
  expect_equal(dplyr::groups(df), dplyr::groups(rs))
})
