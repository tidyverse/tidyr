
test_that("hoist extracts named elements", {
  df <- tibble(x = list(list(1, b = "b")))

  out <- df %>% hoist(x, a = 1, b = "b")
  expect_equal(out, tibble(a = 1, b = "b"))

  out <- df %>% hoist(x, a = 1, b = "b", .simplify = FALSE)
  expect_identical(out, tibble(a = list(1), b = list("b")))
})

test_that("can hoist named non-list elements at the deepest level", {
  df <- tibble(x = list(list(a = c(aa = 1, bb = 2))))
  out <- hoist(df, x, bb = list("a", "bb"))
  expect_identical(out$bb, 2)
})

test_that("can check check/transform values", {
  df <- tibble(x = list(
    list(a = 1),
    list(a = "a")
  ))

  expect_error(
    df %>% hoist(x, a = "a", .ptype = list(a = character())),
    class = "vctrs_error_incompatible_type"
  )

  out <- df %>% hoist(x, a = "a", .transform = list(a = as.character))
  expect_equal(out, tibble(a = c("1", "a")))
})

test_that("nested lists generate a cast error if they can't be cast to the ptype", {
  df <- tibble(x = list(list(b = list(1))))

  expect_snapshot((expect_error(
    hoist(df, x, "b", .ptype = list(b = double()))
  )))
})

test_that("non-vectors generate a cast error if a ptype is supplied", {
  df <- tibble(x = list(list(b = quote(a))))

  expect_snapshot((expect_error(
    hoist(df, x, "b", .ptype = list(b = integer()))
  )))
})

test_that("a ptype generates a list-of<ptype> if the col can't be simplified (#998)", {
  df <- tibble(x = list(list(a = 1:2), list(a = 1), list(a = 1)))
  ptype <- list(a = integer())

  out <- hoist(df, x, "a", .ptype = ptype)
  expect_identical(out$a, list_of(1:2, 1L, 1L, .ptype = integer()))
})

test_that("doesn't simplify uneven lengths", {
  df <- tibble(x = list(
    list(a = 1),
    list(a = 2:3)
  ))

  out <- df %>% hoist(x, a = "a")
  expect_identical(out$a, list(1, 2:3))
})

test_that("doesn't simplify lists of lists", {
  df <- tibble(x = list(
    list(a = list(1)),
    list(a = list(2))
  ))

  out <- df %>% hoist(x, a = "a")
  expect_identical(out$a, list(list(1), list(2)))
})

test_that("doesn't simplify non-vectors", {
  df <- tibble(x = list(
    list(a = quote(a)),
    list(a = quote(b))
  ))

  out <- df %>% hoist(x, a = "a")
  expect_identical(out$a, list(quote(a), quote(b)))
})

test_that("can hoist out scalars", {
  df <- tibble(
    x = 1:2,
    y = list(
      list(mod = lm(mpg ~ wt, data = mtcars)),
      list(mod = lm(mpg ~ wt, data = mtcars))
    )
  )
  out <- hoist(df, y, "mod")
  expect_identical(out$mod, list(df$y[[1]]$mod, df$y[[2]]$mod))
})

test_that("input validation catches problems", {
  df <- tibble(x = list(list(1, b = "b")), y = 1)

  expect_snapshot({
    (expect_error(df %>% hoist(y)))
    (expect_error(df %>% hoist(x, 1)))
    (expect_error(df %>% hoist(x, a = "a", a = "b")))
  })
})

test_that("string pluckers are automatically named", {
  out <- check_pluckers("x", y = "x", z = 1)
  expect_named(out, c("x", "y", "z"))
})

test_that("can't hoist() from a data frame column", {
  df <- tibble(a = tibble(x = 1))

  expect_snapshot((expect_error(
    hoist(df, a, xx = 1)
  )))
})

test_that("can hoist() without any pluckers", {
  df <- tibble(a = list(1))
  expect_identical(hoist(df, a), df)
})

test_that("can use a character vector for deep hoisting", {
  df <- tibble(x = list(list(b = list(a = 1))))
  out <- hoist(df, x, ba = c("b", "a"))
  expect_identical(out$ba, 1)
})

test_that("can use a numeric vector for deep hoisting", {
  df <- tibble(x = list(list(b = list(a = 1, b = 2))))
  out <- hoist(df, x, bb = c(1, 2))
  expect_identical(out$bb, 2)
})

test_that("can maintain type stability with empty elements (#1203)", {
  df <- tibble(
    col = list(
      list(a = integer()),
      list(a = integer())
    )
  )

  out <- hoist(df, col, "a")

  expect_identical(out$a, c(NA_integer_, NA_integer_))
})

test_that("can hoist out a rcrd style column (#999)", {
  x <- new_rcrd(list(x = 1, y = 2))
  df <- tibble(a = list(list(x = x), list(x = x)))

  out <- hoist(df, a, "x")

  expect_identical(out$x, vec_c(x, x))
})

test_that("hoist() validates its inputs (#1224)", {
  df <- tibble(a = list(1))

  expect_snapshot(error = TRUE, {
    hoist(1)
    hoist(df)
    hoist(df, a, .remove = 1)
    hoist(df, a, .ptype = 1)
    hoist(df, a, .transform = 1)
    hoist(df, a, .simplify = 1)
  })
})

test_that("hoist() can simplify on a per column basis (#995)", {
  df <- tibble(
    x = list(
      list(a = 1, b = 1),
      list(a = 2, b = 2)
    )
  )

  expect_identical(
    hoist(df, x, a = "a", b = "b", .simplify = list(a = FALSE)),
    tibble(a = list(1, 2), b = c(1, 2))
  )
})

test_that("hoist() retrieves first of duplicated names and leaves the rest alone (#1259)", {
  elt <- list(x = 1, y = 2, x = 3, z = 2)
  df <- tibble(col = list(elt))

  expect_identical(
    hoist(df, col, "x"),
    tibble(x = 1, col = list(list(y = 2, x = 3, z = 2)))
  )

  expect_identical(
    hoist(df, col, "y"),
    tibble(y = 2, col = list(list(x = 1, x = 3, z = 2)))
  )
})

test_that("known bug - hoist() doesn't strike after each pluck (related to #1259)", {
  # All pluckers operate on the same initial list-col.
  # We don't currently strike after each pluck, so the repeated plucks pull the
  # first of the duplicated `x` names each time. But then the strike() loop
  # removes both of them, because it strikes with `"x"` twice in a row.
  # Fixing this probably requires significant work and likely isn't worth it.

  elt <- list(x = 1, x = 3, z = 2)
  df <- tibble(col = list(elt))

  # Ideally we'd get `x1 = 1, x2 = 3` and no mention of `x` in `col`
  expect_identical(
    hoist(df, col, x1 = "x", x2 = "x"),
    tibble(x1 = 1, x2 = 1, col = list(list(z = 2)))
  )
})

# strike ------------------------------------------------------------------

test_that("strike can remove using a list", {
  x <- list(a = list(), b = list(a = 1, b = 2), c = "c")

  expect_equal(strike(x, list(1)), x[c(2, 3)])
  expect_equal(strike(x, list("a")), x[c(2, 3)])

  deep <- strike(x, list("b", 2))
  expect_equal(deep, list(a = list(), b = list(a = 1), c = "c"))
})

test_that("strike returns input if idx not present", {
  x <- list(a = list(), b = list(a = 1, b = 2), c = "c")

  expect_equal(strike(x, list(4)), x)
  expect_equal(strike(x, list("d")), x)
  expect_equal(strike(x, list("b", 3)), x)
  expect_equal(strike(x, list("d", 3)), x)
  expect_equal(strike(x, list("b", "c")), x)
  expect_equal(strike(x, list(3, "b")), x)
  expect_equal(strike(x, list(4, "b")), x)
})

test_that("ignores weird inputs", {
  x <- list(a = list(), b = list(a = 1, b = 2), c = "c")

  expect_equal(strike(x, list()), x)
  expect_equal(strike(x, list(mean, mean)), x)
})
