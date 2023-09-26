# when `values_ptypes` is provided, the type error uses variable names (#1364)

    Code
      (expect_error(pivot_longer(df, x, values_ptypes = character())))
    Output
      <error/vctrs_error_cast>
      Error in `pivot_longer()`:
      ! Can't convert `x` <double> to <character>.

# when `names_ptypes` is provided, the type error uses `names_to` names (#1364)

    Code
      (expect_error({
        pivot_longer(df, cols = x, names_to = "name", names_ptypes = double())
      }))
    Output
      <error/vctrs_error_cast>
      Error in `pivot_longer()`:
      ! Can't convert `name` <character> to <double>.

# error when overwriting existing column

    Code
      (expect_error(pivot_longer(df, y, names_to = "x")))
    Output
      <error/vctrs_error_names_must_be_unique>
      Error in `pivot_longer()`:
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
      Error in `pivot_longer()`:
      ! `cols` must select at least one column.

# named `cols` gives clear error (#1104)

    Code
      pivot_longer(df, c(z = y))
    Condition
      Error in `pivot_longer()`:
      ! Can't rename variables in this context.

# `names_to` is validated

    Code
      (expect_error(build_longer_spec(df, x, names_to = 1)))
    Output
      <error/rlang_error>
      Error in `build_longer_spec()`:
      ! `names_to` must be a character vector or `NULL`, not the number 1.
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
      Error in `build_longer_spec()`:
      ! `names_ptypes` must be `NULL`, an empty ptype, or a named list of ptypes.
    Code
      (expect_error(build_longer_spec(df, x, names_ptypes = list(integer()))))
    Output
      <error/rlang_error>
      Error in `build_longer_spec()`:
      ! All elements of `names_ptypes` must be named.

# `names_transform` is validated

    Code
      (expect_error(build_longer_spec(df, x, names_transform = 1)))
    Output
      <error/rlang_error>
      Error in `build_longer_spec()`:
      ! `names_transform` must be `NULL`, a function, or a named list of functions.
    Code
      (expect_error(build_longer_spec(df, x, names_transform = list(~.x))))
    Output
      <error/rlang_error>
      Error in `build_longer_spec()`:
      ! All elements of `names_transform` must be named.

# `values_ptypes` is validated

    Code
      (expect_error(pivot_longer(df, x, values_ptypes = 1)))
    Output
      <error/rlang_error>
      Error in `pivot_longer()`:
      ! `values_ptypes` must be `NULL`, an empty ptype, or a named list of ptypes.
    Code
      (expect_error(pivot_longer(df, x, values_ptypes = list(integer()))))
    Output
      <error/rlang_error>
      Error in `pivot_longer()`:
      ! All elements of `values_ptypes` must be named.

# `values_transform` is validated

    Code
      (expect_error(pivot_longer(df, x, values_transform = 1)))
    Output
      <error/rlang_error>
      Error in `pivot_longer()`:
      ! `values_transform` must be `NULL`, a function, or a named list of functions.
    Code
      (expect_error(pivot_longer(df, x, values_transform = list(~.x))))
    Output
      <error/rlang_error>
      Error in `pivot_longer()`:
      ! All elements of `values_transform` must be named.

# `cols_vary` is validated

    Code
      (expect_error(pivot_longer(df, x, cols_vary = "fast")))
    Output
      <error/rlang_error>
      Error in `pivot_longer()`:
      ! `cols_vary` must be one of "fastest" or "slowest", not "fast".
      i Did you mean "fastest"?
    Code
      (expect_error(pivot_longer(df, x, cols_vary = 1)))
    Output
      <error/rlang_error>
      Error in `pivot_longer()`:
      ! `cols_vary` must be a string or character vector.

# `pivot_longer()` catches unused input passed through the dots

    Code
      (expect_error(pivot_longer(df, c(x, y), 1)))
    Output
      <error/rlib_error_dots_unused>
      Error in `pivot_longer()`:
      ! Arguments in `...` must be used.
      x Problematic argument:
      * ..1 = 1
      i Did you misspell an argument name?
    Code
      (expect_error(pivot_longer(df, c(x, y), col_vary = "slowest")))
    Output
      <error/rlib_error_dots_unused>
      Error in `pivot_longer()`:
      ! Arguments in `...` must be used.
      x Problematic argument:
      * col_vary = "slowest"
      i Did you misspell an argument name?

# `build_longer_spec()` requires empty dots

    Code
      (expect_error(build_longer_spec(df, c(x, y), 1)))
    Output
      <error/rlib_error_dots_nonempty>
      Error in `build_longer_spec()`:
      ! `...` must be empty.
      x Problematic argument:
      * ..1 = 1
      i Did you forget to name an argument?
    Code
      (expect_error(build_longer_spec(df, c(x, y), name_to = "name")))
    Output
      <error/rlib_error_dots_nonempty>
      Error in `build_longer_spec()`:
      ! `...` must be empty.
      x Problematic argument:
      * name_to = "name"

# `pivot_longer_spec()` requires empty dots

    Code
      (expect_error(pivot_longer_spec(df, spec, 1)))
    Output
      <error/rlib_error_dots_nonempty>
      Error in `pivot_longer_spec()`:
      ! `...` must be empty.
      x Problematic argument:
      * ..1 = 1
      i Did you forget to name an argument?
    Code
      (expect_error(pivot_longer_spec(df, spec, col_vary = "slowest")))
    Output
      <error/rlib_error_dots_nonempty>
      Error in `pivot_longer_spec()`:
      ! `...` must be empty.
      x Problematic argument:
      * col_vary = "slowest"

