# checks arguments

    Code
      (expect_error(unnest_tree(1L)))
    Output
      <error/rlang_error>
      Error in `unnest_tree()`:
      ! `data` must be a data frame.
    Code
      (expect_error(unnest_tree(df, id_col = "not-there")))
    Output
      <error/vctrs_error_subscript_oob>
      Error in `chr_as_locations()`:
      ! Can't subset columns that don't exist.
      x Column `not-there` doesn't exist.
    Code
      (expect_error(unnest_tree(df, id_col = 1:2)))
    Output
      <error/rlang_error>
      Error in `eval_pull()`:
      ! `id_col` must select 1 column, not 2.
    Code
      (expect_error(unnest_tree(df, id_col, children = "not-there")))
    Output
      <simpleError in unnest_tree(df, id_col, children = "not-there"): unused argument (children = "not-there")>
    Code
      (expect_error(unnest_tree(df, id_col, children = 1:2)))
    Output
      <simpleError in unnest_tree(df, id_col, children = 1:2): unused argument (children = 1:2)>
    Code
      (expect_error(unnest_tree(df, children, children)))
    Output
      <error/rlang_error>
      Error in `unnest_tree()`:
      ! `child_col` must be different from `id_col`.
    Code
      (expect_error(unnest_tree(df, id, children, level_to = 1L)))
    Output
      <error/vctrs_error_incompatible_type>
      Error in `unnest_tree()`:
      ! Can't convert `level_to` <integer> to <character>.
    Code
      (expect_error(unnest_tree(df, id, children, level_to = c("a", "b"))))
    Output
      <error/vctrs_error_assert_size>
      Error in `unnest_tree()`:
      ! `level_to` must have size 1, not size 2.
    Code
      (expect_error(unnest_tree(df, id, children, parent_to = "level")))
    Output
      <error/rlang_error>
      Error in `unnest_tree()`:
      ! `parent_to` must be different from `level_to`.
    Code
      (expect_error(unnest_tree(df, id, children, parent_to = 1L)))
    Output
      <error/vctrs_error_incompatible_type>
      Error in `unnest_tree()`:
      ! Can't convert `parent_to` <integer> to <character>.
    Code
      (expect_error(unnest_tree(df, id, children, parent_to = c("a", "b"))))
    Output
      <error/vctrs_error_assert_size>
      Error in `unnest_tree()`:
      ! `parent_to` must have size 1, not size 2.
    Code
      (expect_error(unnest_tree(df, id, children, ancestors_to = "level")))
    Output
      <error/rlang_error>
      Error in `unnest_tree()`:
      ! `ancestors_to` must be different from `level_to`.
    Code
      (expect_error(unnest_tree(df, id, children, ancestors_to = "parent")))
    Output
      <error/rlang_error>
      Error in `unnest_tree()`:
      ! `ancestors_to` must be different from `parent_to`.
    Code
      (expect_error(unnest_tree(df, id, children, ancestors_to = 1L)))
    Output
      <error/vctrs_error_incompatible_type>
      Error in `unnest_tree()`:
      ! Can't convert `ancestors_to` <integer> to <character>.
    Code
      (expect_error(unnest_tree(df, id, children, ancestors_to = c("a", "b"))))
    Output
      <error/vctrs_error_assert_size>
      Error in `unnest_tree()`:
      ! `ancestors_to` must have size 1, not size 2.

---

    Code
      NULL
    Output
      NULL

# child col type is checked

    Code
      (expect_error(unnest_tree(df, id, children)))
    Output
      <error/rlang_error>
      Error in `unnest_tree()`:
      ! `children` must be a list, not an integer.
    Code
      (expect_error(unnest_tree(df2, id, children)))
    Output
      <error/rlang_error>
      Error in `unnest_tree()`:
      ! Each child must be NULL or a data frame.

---

    Code
      (expect_error(unnest_tree(df, id, children)))
    Output
      <error/rlang_error>
      Error in `unnest_tree()`:
      ! Each child must be NULL or a data frame.

# can handle children of differen types

    Code
      (expect_error(unnest_tree(df, id, children)))
    Output
      <error/vctrs_error_incompatible_type>
      Error in `unnest_tree()`:
      ! Can't combine `out_ptype$id` <integer> and `data$id` <character>.

# checks ids

    Code
      (expect_error(unnest_tree(df_duplicated, id, children)))
    Output
      <error/rlang_error>
      Error in `unnest_tree()`:
      ! Each value of column id must be unique.
      i The elements at locations 1 and 2 are duplicated.
    Code
      (expect_error(unnest_tree(df_na, id, children)))
    Output
      <error/rlang_error>
      Error in `unnest_tree()`:
      ! Each value of column id must be non-missing.
      i Element 2 is missing.

