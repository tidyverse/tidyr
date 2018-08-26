context("nest")

test_that("nest_if turns grouped values into one list-df", {
  df <- tibble(x = rep('a', 3), y = 1:3)
  out <- nest_if(df, is.numeric)
  expect_equal(out$x, 'a')
  expect_equal(out$data, list(data.frame(y = 1:3)))
})

test_that("can control output column name", {
  df <- tibble(x = rep('a', 3), y = 1:3)
  out <- nest_if(df, is.numeric, .key = 'y')
  expect_equal(names(out), c("x", "y"))
})

test_that("nest_if ungroups grouped data frame first and then nests data", {
  df <- tibble(x = rep('a', 3), y = 1:3)
  out <- df %>% dplyr::group_by(y) %>% nest_if(is.numeric)
  expect_equal(out$data[[1]], data.frame(y = 1:3))
})

test_that("nest_if specifies additionaly nest variables in ... which does not match by .predicate", {
  df <- tibble(x = rep('a', 3), y = 1:3)
  out <- df %>% nest_if(is.numeric, x)
  expect_equal(out$data[[1]], df)
})

test_that("nest_if specifies expections for .predicate in ...", {
  df <- tibble(x = rep(1, 3), y = 1:3)
  out <- df %>% nest_if(is.numeric, -x)
  expect_equal(out$x, 1)
  expect_equal(out$data[[1]], data.frame(y = 1:3))
})

test_that("if nothing matches by predicate function and/or ..., returns input data itself", {
  df <- tibble(x = rep(1,3), y = 1:3)
  out <- df %>% nest_if(is.character)
  expect_equal(df, out)
})
