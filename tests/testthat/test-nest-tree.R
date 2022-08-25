test_that("checks arguments", {
  df <- tibble::tibble(
    id = 1:3,
    x = c("a", "b", "c"),
    parent = c(NA, 1L, 1L)
  )

  expect_snapshot({
    (expect_error(nest_tree(1L)))

    (expect_error(nest_tree(df, "not-there")))
    (expect_error(nest_tree(df, 1:2)))

    (expect_error(nest_tree(df, id, parent_col = "not-there")))
    (expect_error(nest_tree(df, id, parent_col = 1:2)))
    (expect_error(nest_tree(df, id, parent_col = id)))

    (expect_error(nest_tree(df, id, parent, children_to = 1L)))
    (expect_error(nest_tree(df, id, parent, children_to = c("a", "b"))))
    (expect_error(nest_tree(df, id, parent, children_to = "id")))
    (expect_error(nest_tree(df, id, parent, children_to = "parent")))
  })
})

test_that("checks that ids are valid", {
  # missing ids
  df <- tibble::tibble(
    id = c(1, NA),
    x = c("a", "b"),
    parent = c(NA, 1)
  )

  expect_snapshot({
    (expect_error(nest_tree(df, id, parent, children_to = "children")))
  })

  # duplicated ids
  df <- tibble::tibble(
    id = c(1, 1),
    x = c("a", "b"),
    parent = c(NA, 1)
  )

  expect_snapshot({
    (expect_error(nest_tree(df, id, parent, children_to = "children")))
  })
})

test_that("checks column ids and parents have compatible types", {
  df <- tibble::tibble(
    id = 1:3,
    x = c("a", "b", "c"),
    parent = c("a", "b", "c")
  )

  expect_snapshot({
    (expect_error(nest_tree(df, id, parent, children_to = "children")))
  })
})

test_that("errors if not all parent ids found", {
  df <- tibble::tibble(
    id = 1:3,
    x = c("a", "b", "c"),
    parent = c(NA, 4L, 5L)
  )

  expect_snapshot({
    (expect_error(nest_tree(df, id, parent, children_to = "children")))
    (expect_error(nest_tree(df[1:2, ], id, parent, children_to = "children")))
  })
})

test_that("errors if parent references to itself", {
  df <- tibble::tibble(
    id = c(1, 2),
    x = c("a", "b"),
    parent = c(NA, 2)
  )

  expect_snapshot({
    (expect_error(nest_tree(df, id, parent, children_to = "children")))
  })
})

test_that("errors if there are no root elements", {
  df <- tibble::tibble(
    id = c(1, 2),
    x = c("a", "b"),
    parent = c(2, 1)
  )

  expect_snapshot({
    (expect_error(nest_tree(df, id, parent, children_to = "children")))
  })
})

test_that("errors if there are detached parts of the tree", {
  df <- tibble::tibble(
    id = c(1, 2, 3),
    x = c("a", "b", "c"),
    parent = c(NA, 3, 2)
  )

  expect_snapshot({
    (expect_error(nest_tree(df, id, parent, children_to = "children")))
  })
})

test_that("can nest", {
  # simple case
  df <- tibble::tibble(
    id = 1:3,
    x = c("a", "b", "c"),
    parent = c(NA, 1L, 1L)
  )

  expect_equal(
    nest_tree(df, id, parent, "children"),
    tibble::tibble(
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
  )

  # some elements with children, others not
  df <- tibble::tibble(
    id = 1:3,
    x = c("a", "b", "c"),
    parent = c(NA, NA, 1L)
  )

  expect_equal(
    nest_tree(df, id, parent, "children"),
    tibble::tibble(
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
  )

  # deep nesting
  df <- tibble::tibble(
    id = 1:6,
    x = letters[1:6],
    parent = c(NA, NA, 1L, 2L, 3L, 5L)
  )

  expect_equal(
    nest_tree(df, id, parent, "children"),
    tibble::tibble(
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
  )
})

test_that("can handle 0 row data", {
  df <- tibble::tibble(
    id = integer(),
    x = character(),
    parent = integer()
  )

  expect_equal(
    nest_tree(df, id, parent, "children"),
    tibble::tibble(
      id = integer(),
      x = character(),
      children = list()
    )
  )
})
