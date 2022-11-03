test_that("nest turns grouped values into one list-df", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- nest(df, data = y)
  expect_equal(out$x, 1)
  expect_equal(length(out$data), 1L)
  expect_equal(out$data[[1L]], tibble(y = 1:3))
})

test_that("nest uses grouping vars if present", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  out <- nest(dplyr::group_by(df, x))
  expect_s3_class(out, "grouped_df")
  expect_equal(out$data[[1]], tibble(y = 1:3))
})

test_that("provided grouping vars override grouped defaults", {
  df <- tibble(x = 1, y = 2, z = 3) %>% dplyr::group_by(x)
  out <- df %>% nest(data = y)
  expect_s3_class(out, "grouped_df")
  expect_named(out, c("x", "z", "data"))
  expect_named(out$data[[1]], "y")
})

test_that("puts data into the correct row", {
  df <- tibble(x = 1:3, y = c("B", "A", "A"))
  out <- nest(df, data = x) %>% dplyr::filter(y == "B")
  expect_equal(out$data[[1]]$x, 1)
})

test_that("nesting everything yields a simple data frame", {
  df <- tibble(x = 1:3, y = c("B", "A", "A"))
  out <- nest(df, data = c(x, y))
  expect_equal(length(out$data), 1L)
  expect_equal(out$data[[1L]], df)
})

test_that("nest preserves order of data", {
  df <- tibble(x = c(1, 3, 2, 3, 2), y = 1:5)
  out <- nest(df, data = y)
  expect_equal(out$x, c(1, 3, 2))
})

test_that("can strip names", {
  df <- tibble(x = c(1, 1, 1), ya = 1:3, yb = 4:6)
  out <- nest(df, y = starts_with("y"), .names_sep = "")
  expect_named(out$y[[1]], c("a", "b"))
})

test_that("`.names_sep` is passed through with bare data.frames (#1174)", {
  df <- data.frame(x = c(1, 1, 1), ya = 1:3, yb = 4:6)
  out <- nest(df, y = starts_with("y"), .names_sep = "")
  expect_named(out$y[[1]], c("a", "b"))
})

test_that("empty factor levels don't affect nest", {
  df <- tibble(
    x = factor(c("z", "a"), levels = letters),
    y = 1:2
  )
  out <- nest(df, data = y)
  expect_equal(out$x, df$x)
})

test_that("nesting works for empty data frames", {
  df <- tibble(x = integer(), y = character())

  out <- nest(df, data = x)
  expect_named(out, c("y", "data"))
  expect_equal(nrow(out), 0L)

  out <- nest(df, data = c(x, y))
  expect_named(out, "data")
  expect_equal(nrow(out), 0L)
})

test_that("tibble conversion occurs in the `nest.data.frame()` method", {
  df <- data.frame(x = 1, y = 1:2)
  out <- df %>% nest(data = y)
  expect_s3_class(out, "tbl_df")
  expect_s3_class(out$data[[1L]], "tbl_df")
})

test_that("can nest multiple columns", {
  df <- tibble(x = 1, a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  out <- df %>% nest(a = c(a1, a2), b = c(b1, b2))

  expect_named(out, c("x", "a", "b"))
  expect_equal(as.list(out$a), list(df[c("a1", "a2")]))
  expect_equal(as.list(out$b), list(df[c("b1", "b2")]))
})

test_that("nesting no columns nests all inputs", {
  # included only for backward compatibility
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  expect_snapshot(out <- nest(df))
  expect_named(out, "data")
  expect_equal(out$data[[1]], df)
})

test_that("validates its inputs", {
  df <- tibble(x = c(1, 1, 1), ya = 1:3, yb = 4:6)
  expect_snapshot(error = TRUE, {
    nest(df, y = ya:yb, .names_sep = 1)
  })
})

# Deprecated behaviours ---------------------------------------------------


test_that("warn about old style interface", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)

  expect_snapshot(out <- nest(df, y))
  expect_named(out, c("x", "data"))

  expect_snapshot(out <- nest(df, -y))
  expect_named(out, c("y", "data"))
})

test_that("only warn about unnamed inputs (#1175)", {
  df <- tibble(x = 1:3, y = 1:3, z = 1:3)
  expect_snapshot(out <- nest(df, x, y, foo = z))
  expect_named(out, c("foo", "data"))
})

test_that("unnamed expressions are kept in the warning", {
  df <- tibble(x = 1:3, z = 1:3)
  expect_snapshot(out <- nest(df, x, starts_with("z")))
  expect_named(out, "data")
})

test_that("can control output column name", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  expect_snapshot(out <- nest(df, y, .key = "y"))
  expect_named(out, c("x", "y"))
})

test_that("can control output column name when nested", {
  df <- dplyr::group_by(tibble(x = c(1, 1, 1), y = 1:3), x)
  expect_snapshot(out <- nest(df, .key = "y"))
  expect_named(out, c("x", "y"))
})

test_that(".key gets warning with new interface", {
  df <- tibble(x = c(1, 1, 1), y = 1:3)
  expect_snapshot(out <- nest(df, y = y, .key = "y"))
  expect_named(df, c("x", "y"))
})
