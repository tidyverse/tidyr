# nested lists generate a cast error if they can't be cast to the ptype

    Code
      (expect_error(hoist(df, x, "b", .ptype = list(b = double()))))
    Output
      <error/vctrs_error_incompatible_type>
      Error in `col_simplify()`:
      ! Can't convert `..1` <list> to <double>.

# non-vectors generate a cast error if a ptype is supplied

    Code
      (expect_error(hoist(df, x, "b", .ptype = list(b = integer()))))
    Output
      <error/vctrs_error_scalar_type>
      Error in `col_simplify()`:
      ! `..1` must be a vector, not a symbol.

# input validation catches problems

    Code
      (expect_error(df %>% hoist(y)))
    Output
      <error/rlang_error>
      Error in `hoist()`:
      ! `.col` must identify a list-column.
    Code
      (expect_error(df %>% hoist(x, 1)))
    Output
      <error/rlang_error>
      Error in `check_pluckers()`:
      ! All elements of `...` must be named.
    Code
      (expect_error(df %>% hoist(x, a = "a", a = "b")))
    Output
      <error/rlang_error>
      Error in `check_pluckers()`:
      ! The names of `...` must be unique.

# can't hoist() from a data frame column

    Code
      (expect_error(hoist(df, a, xx = 1)))
    Output
      <error/rlang_error>
      Error in `hoist()`:
      ! `.col` must identify a list-column.

# hoist() input must be a data frame (#1224)

    Code
      (expect_error(hoist(1)))
    Output
      <error/rlang_error>
      Error in `hoist()`:
      ! `.data` must be a data frame.

# unnest_wider - bad inputs generate errors

    Code
      (expect_error(unnest_wider(df, y)))
    Output
      <error/rlang_error>
      Error in `.f()`:
      ! Column `y` must contain a list of vectors.

# can unnest a vector with a mix of named/unnamed elements (#1200 comment)

    Code
      out <- unnest_wider(df, x, names_sep = "_")
    Message
      New names:
      * `` -> `...1`

# unique name repair is done on the elements before applying `names_sep` (#1200 comment)

    Code
      out <- unnest_wider(df, col, names_sep = "_")
    Message
      New names:
      * `` -> `...1`

---

    Code
      out <- unnest_wider(df, col, names_sep = "_")
    Message
      New names:
      * `` -> `...1`
      * `` -> `...2`

# output structure is the same whether or not `names_sep` is applied (#1200 comment)

    Code
      out1 <- unnest_wider(df, col)
    Message
      New names:
      * `` -> `...1`
      New names:
      * `` -> `...1`

---

    Code
      out2 <- unnest_wider(df, col, names_sep = "_")
    Message
      New names:
      * `` -> `...1`
      New names:
      * `` -> `...1`

# can't currently combine compatible `<list> + <list_of<ptype>>`

    Code
      (expect_error(unnest_wider(df, col)))
    Output
      <error/vctrs_error_incompatible_type>
      Error in `col_to_wide()`:
      ! Can't combine `..1$a` <list> and `..3$a` <list_of<integer>>.

# unnest_wider() input must be a data frame (#1224)

    Code
      (expect_error(unnest_wider(1)))
    Output
      <error/rlang_error>
      Error in `unnest_wider()`:
      ! `data` must be a data frame.

# unnest_longer - bad inputs generate errors

    Code
      (expect_error(unnest_longer(df, y)))
    Output
      <error/rlang_error>
      Error in `elt_to_long()`:
      ! Column `y` must contain a list of vectors.

# can't mix `indices_to` with `indices_include = FALSE`

    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_to = "x", indices_include = FALSE))
      )
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! Can't set `indices_include` to `FALSE` when `indices_to` is supplied.

# unnest_longer() input must be a data frame (#1224)

    Code
      (expect_error(unnest_longer(1)))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `data` must be a data frame.

# `values_to` is validated

    Code
      (expect_error(unnest_longer(mtcars, mpg, values_to = 1)))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `values_to` must be a single string or `NULL`.
    Code
      (expect_error(unnest_longer(mtcars, mpg, values_to = c("x", "y"))))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `values_to` must be a single string or `NULL`.

# `indices_to` is validated

    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_to = 1)))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `indices_to` must be a single string or `NULL`.
    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_to = c("x", "y"))))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `indices_to` must be a single string or `NULL`.

# `indices_include` is validated

    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_include = 1)))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `indices_include` must be `NULL` or a single `TRUE` or `FALSE`.
    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_include = c(TRUE, FALSE))))
    Output
      <error/rlang_error>
      Error in `unnest_longer()`:
      ! `indices_include` must be `NULL` or a single `TRUE` or `FALSE`.

# `simplify` is validated

    Code
      (expect_error(df_simplify(data.frame(), simplify = 1)))
    Output
      <error/rlang_error>
      Error in `df_simplify()`:
      ! `simplify` must be a list or a single `TRUE` or `FALSE`.
    Code
      (expect_error(df_simplify(data.frame(), simplify = NA)))
    Output
      <error/rlang_error>
      Error in `df_simplify()`:
      ! `simplify` must be a list or a single `TRUE` or `FALSE`.
    Code
      (expect_error(df_simplify(data.frame(), simplify = c(TRUE, FALSE))))
    Output
      <error/rlang_error>
      Error in `df_simplify()`:
      ! `simplify` must be a list or a single `TRUE` or `FALSE`.
    Code
      (expect_error(df_simplify(data.frame(), simplify = list(1))))
    Output
      <error/rlang_error>
      Error in `df_simplify()`:
      ! All elements of `simplify` must be named.
    Code
      (expect_error(df_simplify(data.frame(), simplify = list(x = 1, x = 1))))
    Output
      <error/rlang_error>
      Error in `df_simplify()`:
      ! The names of `simplify` must be unique.

# `ptype` is validated

    Code
      (expect_error(df_simplify(data.frame(), ptype = 1)))
    Output
      <error/rlang_error>
      Error in `check_list_of_ptypes()`:
      ! `ptype` must be `NULL`, an empty ptype, or a named list of ptypes.
    Code
      (expect_error(df_simplify(data.frame(), ptype = list(1))))
    Output
      <error/rlang_error>
      Error in `check_list_of_ptypes()`:
      ! All elements of `ptype` must be named.
    Code
      (expect_error(df_simplify(data.frame(), ptype = list(x = 1, x = 1))))
    Output
      <error/rlang_error>
      Error in `check_list_of_ptypes()`:
      ! The names of `ptype` must be unique.

# `transform` is validated

    Code
      (expect_error(df_simplify(data.frame(), transform = list(~.x))))
    Output
      <error/rlang_error>
      Error in `check_list_of_functions()`:
      ! All elements of `transform` must be named.
    Code
      (expect_error(df_simplify(data.frame(x = 1), transform = 1)))
    Output
      <error/rlang_error>
      Error in `map()`:
      ! Can't convert `.x[[i]]`, a number, to a function.
    Code
      (expect_error(df_simplify(data.frame(), transform = list(x = 1))))
    Output
      <error/rlang_error>
      Error in `map()`:
      ! Can't convert `.x[[i]]`, a number, to a function.
    Code
      (expect_error(df_simplify(data.frame(), transform = list(x = 1, x = 1))))
    Output
      <error/rlang_error>
      Error in `check_list_of_functions()`:
      ! The names of `transform` must be unique.

# ptype is applied after transform

    Code
      (expect_error(col_simplify(list(1, 2, 3), ptype = integer(), transform = ~ .x +
        1.5)))
    Output
      <error/vctrs_error_cast_lossy>
      Error in `col_simplify()`:
      ! Can't convert from `..1` <double> to <integer> due to loss of precision.
      * Locations: 1

