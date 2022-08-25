# checks arguments

    Code
      (expect_error(nest_tree(1L)))
    Output
      <error/rlang_error>
      Error in `nest_tree()`:
      ! `data` must be a data frame.
    Code
      (expect_error(nest_tree(df, "not-there")))
    Output
      <error/vctrs_error_subscript_oob>
      Error in `chr_as_locations()`:
      ! Can't subset columns that don't exist.
      x Column `not-there` doesn't exist.
    Code
      (expect_error(nest_tree(df, 1:2)))
    Output
      <error/rlang_error>
      Error in `eval_pull()`:
      ! `id_col` must select 1 column, not 2.
    Code
      (expect_error(nest_tree(df, id, parent_col = "not-there")))
    Output
      <error/vctrs_error_subscript_oob>
      Error in `chr_as_locations()`:
      ! Can't subset columns that don't exist.
      x Column `not-there` doesn't exist.
    Code
      (expect_error(nest_tree(df, id, parent_col = 1:2)))
    Output
      <error/rlang_error>
      Error in `eval_pull()`:
      ! `parent_col` must select 1 column, not 2.
    Code
      (expect_error(nest_tree(df, id, parent_col = id)))
    Output
      <error/rlang_error>
      Error in `check_parent_col()`:
      ! `parent_col` must be different from `id_col`.
    Code
      (expect_error(nest_tree(df, id, parent, children_to = 1L)))
    Output
      <error/vctrs_error_incompatible_type>
      Error in `nest_tree()`:
      ! Can't convert `children_to` <integer> to <character>.
    Code
      (expect_error(nest_tree(df, id, parent, children_to = c("a", "b"))))
    Output
      <error/vctrs_error_assert_size>
      Error in `nest_tree()`:
      ! `children_to` must have size 1, not size 2.
    Code
      (expect_error(nest_tree(df, id, parent, children_to = "id")))
    Output
      <error/rlang_error>
      Error in `nest_tree()`:
      ! `children_to` must be different from `id_col`.
    Code
      (expect_error(nest_tree(df, id, parent, children_to = "parent")))
    Output
      <error/rlang_error>
      Error in `nest_tree()`:
      ! `children_to` must be different from `parent_col`.

# checks that ids are valid

    Code
      (expect_error(nest_tree(df, id, parent, children_to = "children")))
    Output
      <error/rlang_error>
      Error in `nest_tree()`:
      ! Each value of column id must be non-missing.
      i Element 2 is missing.

---

    Code
      (expect_error(nest_tree(df, id, parent, children_to = "children")))
    Output
      <error/rlang_error>
      Error in `nest_tree()`:
      ! Each value of column id must be unique.
      i The elements at locations 1 and 2 are duplicated.

# checks column ids and parents have compatible types

    Code
      (expect_error(nest_tree(df, id, parent, children_to = "children")))
    Output
      <error/vctrs_error_incompatible_type>
      Error in `check_parent_col()`:
      ! Can't convert `data$parent` <character> to match type of `data$id` <integer>.

# errors if not all parent ids found

    Code
      (expect_error(nest_tree(df, id, parent, children_to = "children")))
    Output
      <error/rlang_error>
      Error in `nest_tree()`:
      ! The parent of each element must be found.
      i The parent ids 4 and 5 are not found.
    Code
      (expect_error(nest_tree(df[1:2, ], id, parent, children_to = "children")))
    Output
      <error/rlang_error>
      Error in `nest_tree()`:
      ! The parent of each element must be found.
      i The parent id 4 is not found.

# errors if parent references to itself

    Code
      (expect_error(nest_tree(df, id, parent, children_to = "children")))
    Output
      <error/rlang_error>
      Error in `nest_tree()`:
      ! An element must not be its own parent
      i Element 2 refers to itself as parent.

# errors if there are no root elements

    Code
      (expect_error(nest_tree(df, id, parent, children_to = "children")))
    Output
      <error/rlang_error>
      Error in `nest_tree()`:
      ! There must be root elements.
      i A root element is an elements whose parent id is missing.

# errors if there are detached parts of the tree

    Code
      (expect_error(nest_tree(df, id, parent, children_to = "children")))
    Output
      <error/rlang_error>
      Error in `nest_tree()`:
      ! Each element must be connected to a root element.
      i The elements 2 and 3 are not connected.

