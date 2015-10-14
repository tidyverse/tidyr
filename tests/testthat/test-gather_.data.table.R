context("Gather for data.table")
library(dplyr, warn.conflicts = FALSE)
library(data.table)

test_that("the gather-method for data.table is found", {
  expect_true("gather_.data.table" %in% methods(gather_))
})

test_that("gather all columns when ... is empty", {
  df <- data.table(
    x = 1:5,
    y = 6:10
  )
  out <- gather(df, key, val)
  out.df <- gather(as.data.frame(df), key, val)

  expect_equal(nrow(out), 10)
  expect_equal(names(out), c("key", "val"))

  expect_equal(setDF(out), out.df)
})

test_that("gather returns input if no columns gathered", {
  df <- data.table(x = 1:2, y = 1:2)
  out <- gather(df, a, b, -x, -y)
  out.df <- gather(as.data.frame(df), a, b, -x, -y)

  expect_equal(df, out)
  expect_equal(setDF(out), out.df)
})

test_that("if not supply, key and value default to key and value", {
  df <- data.table(x = 1:2)
  out <- gather(df)

  expect_equal(nrow(out), 2)
  expect_equal(names(out), c("key", "value"))
})

test_that("Missing values removed when na.rm = TRUE", {
  df <- data.table(x = c(1, NA))
  out <- gather(df, k, v)
  expect_equal(out$v, df$x)

  out <- gather(df, k, v, na.rm = TRUE)
  expect_equal(out$v, 1)
})

test_that("key preserves column ordering", {
  df <- data.table(y = 1, x = 2)
  out <- gather(df, k, v)
  expect_equal(out$k, factor(c("y", "x"), levels = c("y", "x")))
})

test_that("additional controls which columns to gather", {
  data <- data.table(a = 1, b1 = 1, b2 = 2, b3 = 3)
  out <- gather(data, key, val, b1:b3)

  expect_equal(names(out), c("a", "key", "val"))
  expect_equal(out$val, 1:3)
})


# Column types ------------------------------------------------------------

## data.table does not support POSIXlt columns at all
# test_that("gather throws error for POSIXlt", {
#   df <- data.table(y = 1)
#   df$x <- as.POSIXlt(Sys.time())
#
#   expect_error(gather(df, key, val, -x), "a POSIXlt")
# })

# slightly different warning
test_that("factors coerced to characters, not integers", {
  df <- data.table(
    v1 = 1:3,
    v2 = factor(letters[1:3])
  )

  expect_warning(out <- gather(df, k, v),
                 "'measure.vars' \\[v1, v2\\] are not all of the same type. By order of hierarchy, the molten data value column will be of type 'character'.")

  expect_equal(out$v, c(1:3, letters[1:3]))
})

# factors with different factor levels
# NOTE: This results in the general attributes warning with data.frames
#       but data.table doesn't produce a warning. data.table simple handles
#       certain types correctly instead of treating them as general attributes.
#       See also the POSIXct column test later on.
test_that("multiple factors coerced to characters, not integers", {
  df <- data.table(
    v1 = factor(letters[1:3]),
    v2 = factor(letters[4:6])
  )

  out <- gather(df, k, v)
  out.df <- gather(as.data.frame(df), k, v)

  expect_equal(out$v, letters[1:6])
  expect_equal(as.data.frame(out), out.df)
})

test_that("attributes of id variables are preserved", {
  df <- data.table(x = factor(1:3), y = 1:3, z = 3:1)
  out <- gather(df, key, val, -x)

  expect_equal(attributes(df$x), attributes(out$x))
})


test_that("common attributes are preserved", {
  df <- data.table(date1 = Sys.Date(), date2 = Sys.Date() + 10)
  out <- gather(df, k, v)

  expect_is(out$v, "Date")
})

## Not entirely applicable to data.table in this case as those types are handled
## correctly. But it might make a difference with other attributes.
## Should we test for those?
# test_that("varying attributes are dropped with a warning", {
#   df <- data.table(
#     date1 = as.POSIXct(Sys.Date()),
#     date2 = Sys.Date() + 10
#   )
#
#   expect_warning(gather(df, k, v),
#                  "attributes are not identical across measure variables")
# })

test_that("gather preserves OBJECT bit on e.g. POSIXct", {
  df <- data.table(now = Sys.time())
  out <- gather(df, k, v)

  object_bit_set <- function(x) {
    grepl("\\[OBJ", capture.output(.Internal(inspect(x)))[1])
  }
  expect_true(object_bit_set(out$v))
})

test_that("can handle list-columns", {
  df <- dplyr::data_frame(x = 1:2,
                          y = list(list("a","b"),
                                   list(TRUE, FALSE)))
  dt <- as.data.table(df)

  out.dt <- gather(dt, k, v, -y)
  out.df <- gather(df, k, v, -y)

  expect_identical(out.dt$y, dt$y)

  expect_identical(as.data.frame(out.dt),
                   as.data.frame(out.df))
})
