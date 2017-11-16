context("unite")

test_that("unite pastes columns together & removes old col", {
  df <- tibble(x = "a", y = "b")
  out <- unite(df, z, x:y)
  expect_equal(names(out), "z")
  expect_equal(out$z, "a_b")
})

test_that("unite does not remove new col in case of name clash", {
  df <- tibble(x = "a", y = "b")
  out <- unite(df, x, x:y)
  expect_equal(names(out), "x")
  expect_equal(out$x, "a_b")
})

test_that("unite preserves grouping", {
  df <- tibble(g = 1, x = "a") %>% dplyr::group_by(g)
  rs <- df %>% unite(x, x)
  expect_equal(df, rs)
  expect_equal(class(df), class(rs))
  expect_equal(dplyr::groups(df), dplyr::groups(rs))
})

test_that("drops grouping when needed", {
  df <- tibble(g = 1, x = "a") %>% dplyr::group_by(g)
  rs <- df %>% unite(gx, g, x)
  expect_equal(rs$gx, "1_a")
  expect_equal(dplyr::groups(rs), NULL)
})

test_that("empty var spec uses all vars", {
  df <- tibble(x = "a", y = "b")
  expect_equal(unite(df, "z"), tibble(z = "a_b"))
})
