test_that("symbols weights are dropped in output", {
  df <- tibble(x = 1, w = 1)
  expect_equal(uncount(df, w), tibble(x = 1))
})

test_that("can request to preserve symbols", {
  df <- tibble(x = 1, w = 1)
  expect_equal(uncount(df, w, .remove = FALSE), df)
})

test_that("unique identifiers created on request", {
  df <- tibble(w = 1:3)
  expect_equal(uncount(df, w, .id = "id"), tibble(id = c(1L, 1:2, 1:3)))
})

test_that("expands constants and expressions", {
  df <- tibble(x = 1, w = 2)

  expect_equal(uncount(df, 2), df[c(1, 1), ])
  expect_equal(uncount(df, 1 + 1), df[c(1, 1), ])
})


test_that("works with groups", {
  df <- tibble(g = 1, x = 1, w = 1) %>% dplyr::group_by(g)
  expect_equal(uncount(df, w), df %>% dplyr::select(-w))
})

test_that("must evaluate to integer", {
  df <- tibble(x = 1, w = 1 / 2)
  expect_error(uncount(df, w), class = "vctrs_error_cast_lossy")

  df <- tibble(x = 1)
  expect_error(uncount(df, "W"), class = "vctrs_error_incompatible_type")
})

test_that("works with 0 weights", {
  df <- tibble(x = 1:2, w = c(0, 1))
  expect_equal(uncount(df, w), tibble(x = 2))
})

test_that("validates inputs", {
  df <- tibble(x = 1, y = "a", w = -1)

  expect_snapshot(error = TRUE, {
    uncount(df, y)
    uncount(df, w)
    uncount(df, x, .remove = 1)
    uncount(df, x, .id = "")
  })
})
