test_that("full_seq with tol > 0 allows sequences to fall short of period", {
  expect_equal(full_seq(c(0, 10, 20), 11, tol = 2), c(0, 11, 22))
})

test_that("full_seq pads length correctly for tol > 0", {
  expect_equal(full_seq(c(0, 10, 16), 11, tol = 5), c(0, 11))
})

test_that("sequences don't have to start at zero", {
  expect_equal(full_seq(c(1, 5), 2), c(1, 3, 5))
})

test_that("full_seq fills in gaps", {
  expect_equal(full_seq(c(1, 3), 1), c(1, 2, 3))
})

test_that("preserves attributes", {
  x1 <- as.Date("2001-01-01") + c(0, 2)
  x2 <- as.POSIXct(x1)

  expect_s3_class(full_seq(x1, 2), "Date")
  expect_s3_class(full_seq(x2, 86400), c("POSIXct", "POSIXt"))
})

test_that("full_seq errors if sequence isn't regular", {
  expect_snapshot(error = TRUE, {
    full_seq(c(1, 3, 4), 2)
    full_seq(c(0, 10, 20), 11, tol = 1.8)
  })
})

test_that("validates inputs", {
  x <- 1:5
  expect_snapshot(error = TRUE, {
    full_seq(x, period = "a")
    full_seq(x, 1, tol = "a")
  })
})

test_that("full_seq ignores infinite values (#1496)", {
  expect_equal(full_seq(c(1, Inf, 5), 1), 1:5)
  expect_equal(full_seq(c(-Inf, 1, 5), 1), 1:5)
  expect_equal(full_seq(c(-Inf, 1, 5, Inf), 1), 1:5)
  expect_equal(full_seq(c(1, Inf), 1), 1)
  expect_equal(full_seq(c(-Inf, 5), 1), 5)
})

test_that("full_seq ignores infinite values in Date (#1496)", {
  x <- as.Date("2019-01-05") + c(0, 5)
  expected <- seq(x[1], x[2], by = 1)
  x_inf <- c(x, Inf)
  expect_equal(full_seq(x_inf, 1), expected)
})
