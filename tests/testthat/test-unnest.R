context("unnest")

test_that("unnesting combines atomic vectors", {
  df <- data_frame(x = list(1, 2:3, 4:10))
  expect_equal(unnest(df)$x, 1:10)
})

test_that("vector unnest preseves names", {
  df <- data_frame(x = list(1, 2:3), y = list("a", c("b", "c")))
  out <- unnest(df)
  expect_named(out, c("x", "y"))
})

test_that("unnesting row binds data frames", {
  df <- data_frame(x = list(
    data_frame(x = 1:5),
    data_frame(x = 6:10)
  ))
  expect_equal(unnest(df)$x, 1:10)
})

test_that("elements must all be of same type", {
  df <- data_frame(x = list(1, "a"))
  expect_error(unnest(df), "incompatible type")
})

test_that("can't combine vectors and data frames", {
  df <- data_frame(x = list(1, data_frame(1)))
  expect_error(unnest(df), "a list of vectors or a list of data frames")
})

test_that("multiple columns must be same length", {
  df <- data_frame(x = list(1), y = list(1:2))
  expect_error(unnest(df), "same number of elements")

  df <- data_frame(x = list(1), y = list(data_frame(x = 1:2)))
  expect_error(unnest(df), "same number of elements")
})

test_that("can handle strings", {
  df <- data_frame(x = 1:3, y = c("a", "d,e,f", "g,h"))
  expect_equal(separate_rows(df, y)$y, unlist(strsplit(df$y, "\\,")))
})

test_that("default pattern does not split decimals in nested strings", {
  df <- dplyr::data_frame(x = 1:3, y = c("1", "1.0,1.1", "2.1"))
  expect_equal(separate_rows(df, y)$y, unlist(strsplit(df$y, ",")))
})

test_that("nested is split as a list (#84)", {
  df <- data_frame(x = 1:3, y = list(1,2:3,4), z = list(5,6:7,8))
  expect_warning(out <- unnest(df, y, z), NA)
  expect_equal(out$x, c(1, 2, 2, 3))
  expect_equal(out$y, unlist(df$y))
  expect_equal(out$z, unlist(df$z))
})

test_that("unnest has mutate semantics", {
  df <- data_frame(x = 1:3, y = list(1,2:3,4))
  out <- df %>% unnest(z = lapply(y, `+`, 1))

  expect_equal(out$z, 2:5)
})

test_that(".id creates vector of names for vector unnest", {
  df <- data_frame(x = 1:2, y = list(a = 1, b = 1:2))
  out <- unnest(df, .id = "name")

  expect_equal(out$name, c("a", "b", "b"))
})

test_that(".id creates vector of names for data frame unnest", {
  df <- data_frame(x = 1:2, y = list(
    a = data_frame(y = 1),
    b = data_frame(y = 1:2)
  ))
  out <- unnest(df, .id = "name")

  expect_equal(out$name, c("a", "b", "b"))
})

test_that("can use non-syntactic names", {
  out <- data_frame("foo bar" = list(1:2, 3)) %>% unnest()

  expect_named(out, "foo bar")
})

test_that("sep combines column names", {
  ldf <- list(data_frame(x = 1))
  data_frame(x = ldf, y = ldf) %>%
    unnest(.sep = "_") %>%
    expect_named(c("x_x", "y_x"))
})

# Drop --------------------------------------------------------------------

test_that("unnest drops list cols if expanding", {
  df <- data_frame(x = 1:2, y = list(3, 4), z = list(5, 6:7))
  out <- df %>% unnest(z)

  expect_equal(names(out), c("x", "z"))
})

test_that("unnest keeps list cols if not expanding", {
  df <- data_frame(x = 1:2, y = list(3, 4), z = list(5, 6:7))
  out <- df %>% unnest(y)

  expect_equal(names(out), c("x", "z", "y"))
})

test_that("unnest respects .drop_lists", {
  df <- data_frame(x = 1:2, y = list(3, 4), z = list(5, 6:7))

  expect_equal(df %>% unnest(y, .drop = TRUE) %>% names(), c("x", "y"))
  expect_equal(df %>% unnest(z, .drop = FALSE) %>% names(), c("x", "y", "z"))

})

test_that("grouping is preserved", {
  df <- data_frame(g = 1, x = list(1:3)) %>% dplyr::group_by(g)
  rs <- df %>% unnest(x)

  expect_equal(rs$x, 1:3)
  expect_equal(class(df), class(rs))
  expect_equal(dplyr::groups(df), dplyr::groups(rs))
})
