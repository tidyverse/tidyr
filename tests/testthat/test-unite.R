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
  expect_equal(dplyr::group_vars(df), dplyr::group_vars(rs))
})

test_that("drops grouping when needed", {
  df <- tibble(g = 1, x = "a") %>% dplyr::group_by(g)
  rs <- df %>% unite(gx, g, x)
  expect_equal(rs$gx, "1_a")
  expect_equal(dplyr::group_vars(rs), character())
})

test_that("empty var spec uses all vars", {
  df <- tibble(x = "a", y = "b")
  expect_equal(unite(df, "z"), tibble(z = "a_b"))
})

test_that("can remove missing vars on request", {
  df <- expand_grid(x = c("a", NA), y = c("b", NA))
  out <- unite(df, "z", x:y, na.rm = TRUE)

  expect_equal(out$z, c("a_b", "a", "b", ""))
})

test_that("regardless of the type of the NA", {
  vec_unite <- function(df, vars) {
    unite(df, "out", one_of(vars), na.rm = TRUE)$out
  }

  df <- tibble(
    x = c("x", "y", "z"),
    lgl = NA,
    dbl = NA_real_,
    chr = NA_character_
  )

  expect_equal(vec_unite(df, c("x", "lgl")), c("x", "y", "z"))
  expect_equal(vec_unite(df, c("x", "dbl")), c("x", "y", "z"))
  expect_equal(vec_unite(df, c("x", "chr")), c("x", "y", "z"))
})

