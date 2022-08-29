test_that("checks arguments", {
  df <- tibble::tibble(
    id = 1,
    x = "a",
    children = list()
  )

  expect_snapshot({
    (expect_error(unnest_tree(1L)))

    (expect_error(unnest_tree(df, id_col = "not-there")))
    (expect_error(unnest_tree(df, id_col = 1:2)))

    (expect_error(unnest_tree(df, id_col, children = "not-there")))
    (expect_error(unnest_tree(df, id_col, children = 1:2)))

    (expect_error(unnest_tree(df, children, children)))
    (expect_error(unnest_tree(df, id, children, level_to = 1L)))
    (expect_error(unnest_tree(df, id, children, level_to = c("a", "b"))))

    (expect_error(unnest_tree(df, id, children, parent_to = "level")))
    (expect_error(unnest_tree(df, id, children, parent_to = 1L)))
    (expect_error(unnest_tree(df, id, children, parent_to = c("a", "b"))))

    (expect_error(unnest_tree(df, id, children, ancestors_to = "level")))
    (expect_error(unnest_tree(df, id, children, ancestors_to = "parent")))
    (expect_error(unnest_tree(df, id, children, ancestors_to = 1L)))
    (expect_error(unnest_tree(df, id, children, ancestors_to = c("a", "b"))))
  })

  expect_snapshot({

  })
})

test_that("child col type is checked", {
  df <- tibble::tibble(
    id = 1,
    x = "a",
    children = 1L
  )

  df2 <- df
  df2$children <- list(1L)

  expect_snapshot({
    (expect_error(unnest_tree(df, id, children)))
    (expect_error(unnest_tree(df2, id, children)))
  })

  df <- tibble::tibble(
    id = 1,
    x = "a",
    children = list(1L)
  )

  expect_snapshot({
    (expect_error(unnest_tree(df, id, children)))
  })
})

test_that("can unnest", {
  # simple case
  df <- tibble::tibble(
    id = 1L,
    x = "a",
    children = list(
      tibble::tibble(
        id = 2:3,
        x = c("b", "c"),
        children = list(NULL)
      )
    )
  )

  expect_equal(
    unnest_tree(df, id, children, ancestors_to = "ancestors"),
    tibble::tibble(
      id = 1:3,
      x = c("a", "b", "c"),
      level = c(1L, 2L, 2L),
      parent = c(NA, 1L, 1L),
      ancestors = list(NULL, 1L, 1L)
    )
  )

  # some elements with children, others not
  df <- tibble::tibble(
    id = 1:2,
    x = c("a", "b"),
    children = list(
      tibble::tibble(
        id = 3L,
        x = "c",
        children = list(NULL)
      ),
      NULL
    )
  )

  expect_equal(
    unnest_tree(df, id, children, ancestors_to = "ancestors"),
    tibble::tibble(
      id = 1:3,
      x = c("a", "b", "c"),
      level = c(1L, 1L, 2L),
      parent = c(NA, NA, 1L),
      ancestors = list(NULL, NULL, 1L)
    )
  )

  # deep nesting
  df <- tibble::tibble(
    id = 1:2,
    x = c("a", "b"),
    children = list(
      tibble::tibble(
        id = 3L,
        x = "c",
        children = list(
          tibble::tibble(
            id = 5L,
            x = "e",
            children = list(
              tibble::tibble(
                id = 6L, x = "f", children = list(NULL)
              )
            )
          )
        )
      ),
      tibble::tibble(
        id = 4,
        x = "d",
        children = list(NULL)
      )
    )
  )

  expect_equal(
    unnest_tree(df, id, children, ancestors_to = "ancestors"),
    tibble::tibble(
      id = 1:6,
      x = letters[1:6],
      level = c(1L, 1L, 2L, 2L, 3L, 4L),
      parent = c(NA, NA, 1L, 2L, 3L, 5L),
      ancestors = list(
        NULL,
        NULL,
        1L,
        2L,
        c(1L, 3L),
        c(1L, 3L, 5L)
      )
    )
  )
})

test_that("can handle children of differen types", {
  df <- tibble::tibble(
    id = 1:2,
    x = c("a", "b"),
    children = list(
      tibble::tibble(id = 3L, x = "c", children = list(NULL)),
      tibble::tibble(id = 4.0, x = "d", children = list(NULL))
    )
  )

  result <- unnest_tree(df, id, children)
  expect_identical(
    result,
    tibble(
      id = c(1, 2, 3, 4),
      x = c("a", "b", "c", "d"),
      level = c(1L, 1L, 2L, 2L),
      parent = c(NA, NA, 1, 2)
    )
  )
  expect_type(result$id, "double")

  df <- tibble::tibble(
    id = 1L,
    x = "a",
    children = list(
      tibble::tibble(id = "a", x = "c", children = list(NULL))
    )
  )

  # TODO produce a nicer error message here giving the path of the child?
  expect_snapshot({
    (expect_error(unnest_tree(df, id, children)))
  })
})

test_that("can handle if all childre have no children column", {
  df <- tibble::tibble(
    id = 1,
    x = "a",
    children = list(NULL)
  )
  expect_equal(
    unnest_tree(df, id, children),
    tibble(id = 1, x = "a", level = 1L, parent = NA_real_)
  )
})

test_that("can handle 0 row data", {
  df <- tibble::tibble(
    id = integer(),
    x = character(),
    children = list()
  )

  expect_equal(
    unnest_tree(df, id, children, ancestors_to = "ancestors"),
    tibble::tibble(
      id = integer(),
      x = character(),
      level = integer(),
      parent = integer(),
      ancestors = list()
    )
  )
})

test_that("checks ids", {
  df_duplicated <- tibble::tibble(
    id = 1L,
    x = "a",
    children = list(
      tibble::tibble(
        id = 1L,
        x = "b",
        children = list(NULL)
      )
    )
  )

  df_na <- df_duplicated
  df_na$children[[1]]$id <- NA

  expect_snapshot({
    (expect_error(unnest_tree(df_duplicated, id, children)))
    (expect_error(unnest_tree(df_na, id, children)))
  })
})
