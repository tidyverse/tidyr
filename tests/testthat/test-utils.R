context("test-utils")

test_that("tidyr_legacy copies old approach", {
  expect_equal(tidyr_legacy(c()), character())
  expect_equal(tidyr_legacy(c("x", "x", "y")), c("x", "x1", "y"))
  expect_equal(tidyr_legacy(c("", "", "")), c("V1", "V2", "V3"))
})

test_that("reconstruct doesn't repair names", {
  # This ensures that name repair elsewhere isn't overridden
  df <- tibble(x = 1, x = 2, .name_repair = "minimal")
  expect_equal(reconstruct_tibble(df, df), df)
})
