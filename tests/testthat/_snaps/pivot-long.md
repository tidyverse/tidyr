# when `values_ptypes` is provided, the type error uses variable names (#1364)

    Code
      (expect_error(pivot_longer(df, x, values_ptypes = character())))
    Output
      <error/vctrs_error_cast>
      Error in `pivot_longer_spec()`:
      ! Can't convert `x` <double> to <character>.

# when `names_ptypes` is provided, the type error uses `names_to` names (#1364)

    Code
      (expect_error({
        pivot_longer(df, cols = x, names_to = "name", names_ptypes = double())
      }))
    Output
      <error/vctrs_error_cast>
      Error in `build_longer_spec()`:
      ! Can't convert `name` <character> to <double>.

# error when overwriting existing column

    Code
      (expect_error(pivot_longer(df, y, names_to = "x")))
    Output
      <error/vctrs_error_names_must_be_unique>
      Error in `vec_cbind()`:
      ! Names must be unique.
      x These names are duplicated:
        * "x" at locations 1 and 2.
      i Use argument `names_repair` to specify repair strategy.

---

    Code
      out <- pivot_longer(df, y, names_to = "x", names_repair = "unique")
    Message
      New names:
      * `x` -> `x...1`
      * `x` -> `x...2`

# multiple names requires names_sep/names_pattern

    Code
      (expect_error(build_longer_spec(df, x_y, names_to = c("a", "b"))))
    Output
      <error/rlang_error>
      Error in `build_longer_spec()`:
      ! If you supply multiple names in `names_to` you must also supply one of `names_sep` or `names_pattern`.
    Code
      (expect_error(build_longer_spec(df, x_y, names_to = c("a", "b"), names_sep = "x",
      names_pattern = "x")))
    Output
      <error/rlang_error>
      Error in `build_longer_spec()`:
      ! If you supply multiple names in `names_to` you must also supply one of `names_sep` or `names_pattern`.

# names_sep fails with single name

    Code
      (expect_error(build_longer_spec(df, x_y, names_to = "x", names_sep = "_")))
    Output
      <error/rlang_error>
      Error in `build_longer_spec()`:
      ! `names_sep` can't be used with a length 1 `names_to`.

# Error if the `col` can't be selected.

    Code
      (expect_error(pivot_longer(iris, matches("foo"))))
    Output
      <error/rlang_error>
      Error in `build_longer_spec()`:
      ! `cols` must select at least one column.

# `names_to` is validated

    Code
      (expect_error(build_longer_spec(df, x, names_to = 1)))
    Output
      <error/rlang_error>
      Error in `build_longer_spec()`:
      ! `names_to` must be a character vector or `NULL`.
    Code
      (expect_error(build_longer_spec(df, x, names_to = c("x", "y"))))
    Output
      <error/rlang_error>
      Error in `build_longer_spec()`:
      ! If you supply multiple names in `names_to` you must also supply one of `names_sep` or `names_pattern`.
    Code
      (expect_error(build_longer_spec(df, x, names_to = c("x", "y"), names_sep = "_",
      names_pattern = "x")))
    Output
      <error/rlang_error>
      Error in `build_longer_spec()`:
      ! If you supply multiple names in `names_to` you must also supply one of `names_sep` or `names_pattern`.

# `names_ptypes` is validated

    Code
      (expect_error(build_longer_spec(df, x, names_ptypes = 1)))
    Output
      <error/rlang_error>
      Error in `check_list_of_ptypes()`:
      ! `names_ptypes` must be `NULL`, an empty ptype, or a named list of ptypes.
    Code
      (expect_error(build_longer_spec(df, x, names_ptypes = list(integer()))))
    Output
      <error/rlang_error>
      Error in `check_list_of_ptypes()`:
      ! All elements of `names_ptypes` must be named.

# `names_transform` is validated

    Code
      (expect_error(build_longer_spec(df, x, names_transform = 1)))
    Output
      <error/rlang_error>
      Error in `map()`:
      ! Can't convert `.x[[i]]`, a number, to a function.
    Code
      (expect_error(build_longer_spec(df, x, names_transform = list(~.x))))
    Output
      <error/rlang_error>
      Error in `check_list_of_functions()`:
      ! All elements of `names_transform` must be named.

# `values_ptypes` is validated

    Code
      (expect_error(pivot_longer(df, x, values_ptypes = 1)))
    Output
      <error/rlang_error>
      Error in `check_list_of_ptypes()`:
      ! `values_ptypes` must be `NULL`, an empty ptype, or a named list of ptypes.
    Code
      (expect_error(pivot_longer(df, x, values_ptypes = list(integer()))))
    Output
      <error/rlang_error>
      Error in `check_list_of_ptypes()`:
      ! All elements of `values_ptypes` must be named.

# `values_transform` is validated

    Code
      (expect_error(pivot_longer(df, x, values_transform = 1)))
    Output
      <error/rlang_error>
      Error in `map()`:
      ! Can't convert `.x[[i]]`, a number, to a function.
    Code
      (expect_error(pivot_longer(df, x, values_transform = list(~.x))))
    Output
      <error/rlang_error>
      Error in `check_list_of_functions()`:
      ! All elements of `values_transform` must be named.

# `cols_vary` is validated

    Code
      (expect_error(pivot_longer(df, x, cols_vary = "fast")))
    Output
      <error/rlang_error>
      Error in `pivot_longer_spec()`:
      ! `cols_vary` must be one of "fastest" or "slowest", not "fast".
      i Did you mean "fastest"?
    Code
      (expect_error(pivot_longer(df, x, cols_vary = 1)))
    Output
      <error/rlang_error>
      Error in `pivot_longer_spec()`:
      ! `cols_vary` must be a string or character vector.

