# pack --------------------------------------------------------------------

test_that("can pack multiple columns", {
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  out <- df |> pack(a = c(a1, a2), b = c(b1, b2))

  expect_named(out, c("a", "b"))
  expect_equal(out$a, df[c("a1", "a2")])
  expect_equal(out$b, df[c("b1", "b2")])
})

test_that("packing no columns returns input", {
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)
  expect_equal(pack(df), df)
})

test_that("can strip outer names from inner names", {
  df <- tibble(ax = 1, ay = 2)
  out <- pack(df, a = c(ax, ay), .names_sep = "")
  expect_named(out$a, c("x", "y"))
})

test_that("grouping is preserved", {
  df <- tibble(g1 = 1, g2 = 1, g3 = 1)
  out <- df |>
    dplyr::group_by(g1, g2) |>
    pack(g = c(g2, g3))
  expect_equal(dplyr::group_vars(out), "g1")
})

test_that("pack disallows renaming", {
  df <- tibble(x = 1, y = 2)

  expect_snapshot(error = TRUE, {
    pack(df, data = c(a = x))
  })
  expect_snapshot(error = TRUE, {
    pack(df, data1 = x, data2 = c(a = y))
  })
})

test_that("pack validates its inputs", {
  df <- tibble(a1 = 1, a2 = 2, b1 = 1, b2 = 2)

  expect_snapshot(error = TRUE, {
    pack(1)
    pack(df, c(a1, a2), c(b1, b2))
    pack(df, a = c(a1, a2), c(b1, b2))
    pack(df, a = c(a1, a2), .names_sep = 1)
  })
})

# unpack ------------------------------------------------------------------

test_that("grouping is preserved", {
  df <- tibble(g = 1, x = tibble(y = 1))
  out <- df |>
    dplyr::group_by(g) |>
    unpack(x)
  expect_equal(dplyr::group_vars(out), "g")
})

test_that("non-df-cols are skipped (#1153)", {
  df <- tibble(x = 1:2, y = tibble(a = 1:2, b = 1:2))

  expect_identical(unpack(df, x), df)
  expect_identical(unpack(df, everything()), unpack(df, y))
})

test_that("empty columns that aren't data frames aren't unpacked (#1191)", {
  df <- tibble(x = integer())
  expect_identical(unpack(df, x), df)
})

test_that("df-cols are directly unpacked", {
  df <- tibble(x = 1:3, y = tibble(a = 1:3, b = 3:1))
  out <- df |> unpack(y)
  expect_named(out, c("x", "a", "b"))
  expect_equal(out[c("a", "b")], df$y)
})

test_that("can unpack 0-col dataframe", {
  df <- tibble(x = 1:3, y = tibble(.rows = 3))
  out <- df |> unpack(y)
  expect_named(out, c("x"))
})

test_that("can unpack 0-row dataframe", {
  df <- tibble(x = integer(), y = tibble(a = integer()))
  out <- df |> unpack(y)
  expect_named(out, c("x", "a"))
})

test_that("can choose to add separtor", {
  df <- tibble(x = 1, y = tibble(a = 2), z = tibble(a = 3))
  out <- df |> unpack(c(y, z), names_sep = "_")
  expect_named(out, c("x", "y_a", "z_a"))
})

test_that("can unpack 1-row but 0-col dataframe (#1189)", {
  df <- tibble(x = tibble(.rows = 1))
  expect_identical(unpack(df, x), tibble::new_tibble(list(), nrow = 1L))
})

test_that("catches across inner name duplication (#1425)", {
  df <- tibble(
    x = tibble(a = 3, b = 4),
    y = tibble(b = 5),
    z = tibble(a = 6, b = 6)
  )

  expect_snapshot(error = TRUE, {
    unpack(df, c(x, y))
  })
  expect_snapshot(error = TRUE, {
    unpack(df, c(x, y, z))
  })
})

test_that("catches outer / inner name duplication (#1367)", {
  df <- tibble(
    a = 1,
    b = 2,
    c = 3,
    d = tibble(a = 4),
    e = tibble(d = 5),
    f = tibble(b = 6, c = 7, g = 8)
  )

  expect_snapshot(error = TRUE, {
    unpack(df, d)
  })
  expect_snapshot(error = TRUE, {
    unpack(df, c(d, e, f))
  })
})

test_that("duplication error isn't triggered on the names you are unpacking", {
  df <- tibble(x = tibble(x = 1))
  expect_identical(unpack(df, x), tibble(x = 1))
})

test_that("duplication errors aren't triggered if `names_sep` is specified", {
  df1 <- tibble(
    x = 1,
    y = tibble(x = 2)
  )
  df2 <- tibble(
    x = tibble(a = 1),
    y = tibble(a = 2)
  )

  expect_identical(
    unpack(df1, y, names_sep = "_"),
    tibble(x = 1, y_x = 2)
  )
  expect_identical(
    unpack(df2, c(x, y), names_sep = "_"),
    tibble(x_a = 1, y_a = 2)
  )
})

test_that("duplication errors aren't triggered on duplicates within a single column you are unpacking", {
  df <- tibble(
    x = tibble(a = 1, a = 2, .name_repair = "minimal")
  )

  # `vec_as_names()` handles this one
  expect_snapshot(error = TRUE, {
    unpack(df, x)
  })
})

test_that("unpack disallows renaming", {
  df <- tibble(x = tibble(a = 1))

  expect_snapshot(error = TRUE, {
    unpack(df, c(y = x))
  })
})

test_that("unpack() validates its inputs", {
  df <- tibble(x = 1:2, y = tibble(a = 1:2, b = 1:2))

  expect_snapshot(error = TRUE, {
    unpack(1)
  })
  expect_snapshot(error = TRUE, {
    unpack(df)
  })
  expect_snapshot(error = TRUE, {
    unpack(df, y, names_sep = 1)
  })
})
