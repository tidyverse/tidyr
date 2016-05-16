context("full_seq")

test_that("full_seq errors if sequence isn't regular", {
  expect_error(full_seq(c(1, 3, 4), 2), "not a regular sequence")
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
