test_that("separate_longer_delim() creates rows", {
  df <- tibble(id = 1:2, x = c("x", "y,z"))
  out <- separate_longer_delim(df, x, delim = ",")
  expect_equal(out$id, c(1, 2, 2))
  expect_equal(out$x, c("x", "y", "z"))
})

test_that("separate_longer_delim() validates its inputs", {
  df <- tibble(x = "x")
  expect_snapshot(error = TRUE, {
    df |> separate_longer_delim()
  })
  expect_snapshot(error = TRUE, {
    df |> separate_longer_delim(x, sep = 1)
  })
})

test_that("separate_longer_position() creates rows", {
  df <- tibble(id = 1:2, x = c("x", "yz"))
  out <- separate_longer_position(df, x, width = 1)
  expect_equal(out$id, c(1, 2, 2))
  expect_equal(out$x, c("x", "y", "z"))
})

test_that("separate_longer_position() can keep empty rows", {
  df <- tibble(id = 1:2, x = c("", "x"))
  out <- separate_longer_position(df, x, width = 1)
  expect_equal(out$id, 2)
  expect_equal(out$x, "x")

  out <- separate_longer_position(df, x, width = 1, keep_empty = TRUE)
  expect_equal(out$id, c(1, 2))
  expect_equal(out$x, c(NA, "x"))
})

test_that("works with zero-row data frame", {
  df <- tibble(x = character())
  expect_equal(separate_longer_position(df, x, 1), df)
  expect_equal(separate_longer_delim(df, x, ","), df)
})

test_that("separate_longer_position() validates its inputs", {
  df <- tibble(x = "x")
  expect_snapshot(error = TRUE, {
    df |> separate_longer_position()
  })
  expect_snapshot(error = TRUE, {
    df |> separate_longer_position(y, width = 1)
  })
  expect_snapshot(error = TRUE, {
    df |> separate_longer_position(x, width = 1.5)
  })
})
