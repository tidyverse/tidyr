# error when overwriting existing column

    Code
      (expect_error(pivot_longer(df, y, names_to = "x")))
    Output
      <error/vctrs_error_names_must_be_unique>
      Names must be unique.
      x These names are duplicated:
        * "x" at locations 1 and 2.
      i Use argument `names_repair` to specify repair strategy.

---

    Code
      out <- pivot_longer(df, y, names_to = "x", names_repair = "unique")
    Message <simpleMessage>
      New names:
      * x -> x...1
      * x -> x...2

# multiple names requires names_sep/names_pattern

    Code
      (expect_error(build_longer_spec(df, x_y, names_to = c("a", "b"))))
    Output
      <error/rlang_error>
      If you supply multiple names in `names_to` you must also supply one of `names_sep` or `names_pattern`.
    Code
      (expect_error(build_longer_spec(df, x_y, names_to = c("a", "b"), names_sep = "x",
      names_pattern = "x")))
    Output
      <error/rlang_error>
      If you supply multiple names in `names_to` you must also supply one of `names_sep` or `names_pattern`.

# names_sep fails with single name

    Code
      (expect_error(build_longer_spec(df, x_y, names_to = "x", names_sep = "_")))
    Output
      <error/rlang_error>
      `names_sep` can't be used with a length 1 `names_to`.

# Error if the `col` can't be selected.

    Code
      (expect_error(pivot_longer(iris, matches("foo"))))
    Output
      <error/rlang_error>
      `cols` must select at least one column.

# `names_to` is validated

    Code
      (expect_error(build_longer_spec(df, x, names_to = 1)))
    Output
      <error/rlang_error>
      `names_to` must be a character vector or `NULL`.
    Code
      (expect_error(build_longer_spec(df, x, names_to = c("x", "y"))))
    Output
      <error/rlang_error>
      If you supply multiple names in `names_to` you must also supply one of `names_sep` or `names_pattern`.
    Code
      (expect_error(build_longer_spec(df, x, names_to = c("x", "y"), names_sep = "_",
      names_pattern = "x")))
    Output
      <error/rlang_error>
      If you supply multiple names in `names_to` you must also supply one of `names_sep` or `names_pattern`.

# `names_ptypes` is validated

    Code
      (expect_error(build_longer_spec(df, x, names_ptypes = 1)))
    Output
      <error/rlang_error>
      `names_ptypes` must be `NULL`, an empty ptype, or a named list of ptypes.
    Code
      (expect_error(build_longer_spec(df, x, names_ptypes = list(integer()))))
    Output
      <error/rlang_error>
      All elements of `names_ptypes` must be named.

# `names_transform` is validated

    Code
      (expect_error(build_longer_spec(df, x, names_transform = 1)))
    Output
      <error/rlang_error>
      Can't convert a double vector to function
    Code
      (expect_error(build_longer_spec(df, x, names_transform = list(~.x))))
    Output
      <error/rlang_error>
      All elements of `names_transform` must be named.

# `values_ptypes` is validated

    Code
      (expect_error(pivot_longer(df, x, values_ptypes = 1)))
    Output
      <error/rlang_error>
      `values_ptypes` must be `NULL`, an empty ptype, or a named list of ptypes.
    Code
      (expect_error(pivot_longer(df, x, values_ptypes = list(integer()))))
    Output
      <error/rlang_error>
      All elements of `values_ptypes` must be named.

# `values_transform` is validated

    Code
      (expect_error(pivot_longer(df, x, values_transform = 1)))
    Output
      <error/rlang_error>
      Can't convert a double vector to function
    Code
      (expect_error(pivot_longer(df, x, values_transform = list(~.x))))
    Output
      <error/rlang_error>
      All elements of `values_transform` must be named.

