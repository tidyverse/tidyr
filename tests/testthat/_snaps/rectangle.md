# nested lists generate a cast error if they can't be cast to the ptype

    Code
      (expect_error(hoist(df, x, "b", .ptype = list(b = double()))))
    Output
      <error/vctrs_error_incompatible_type>
      Can't convert <list> to <double>.

# non-vectors generate a cast error if a ptype is supplied

    Code
      (expect_error(hoist(df, x, "b", .ptype = list(b = integer()))))
    Output
      <error/vctrs_error_scalar_type>
      Input must be a vector, not a symbol.

# input validation catches problems

    Code
      (expect_error(df %>% hoist(y)))
    Output
      <error/rlang_error>
      `.col` must identify a list-column.
    Code
      (expect_error(df %>% hoist(x, 1)))
    Output
      <error/rlang_error>
      All elements of `...` must be named.
    Code
      (expect_error(df %>% hoist(x, a = "a", a = "b")))
    Output
      <error/rlang_error>
      The names of `...` must be unique.

# can't hoist() from a data frame column

    Code
      (expect_error(hoist(df, a, xx = 1)))
    Output
      <error/rlang_error>
      `.col` must identify a list-column.

# hoist() input must be a data frame (#1224)

    Code
      (expect_error(hoist(1)))
    Output
      <error/rlang_error>
      `.data` must be a data frame.

# unnest_wider - bad inputs generate errors

    Code
      (expect_error(unnest_wider(df, y)))
    Output
      <error/rlang_error>
      Column `y` must contain a list of vectors.

# can unnest a vector with a mix of named/unnamed elements (#1200 comment)

    Code
      out <- unnest_wider(df, x, names_sep = "_")
    Message <simpleMessage>
      New names:
      * `` -> ...1

# unique name repair is done on the elements before applying `names_sep` (#1200 comment)

    Code
      out <- unnest_wider(df, col, names_sep = "_")
    Message <simpleMessage>
      New names:
      * `` -> ...1

---

    Code
      out <- unnest_wider(df, col, names_sep = "_")
    Message <simpleMessage>
      New names:
      * `` -> ...1
      * `` -> ...2

# output structure is the same whether or not `names_sep` is applied (#1200 comment)

    Code
      out1 <- unnest_wider(df, col)
    Message <simpleMessage>
      New names:
      * `` -> ...1
      New names:
      * `` -> ...1

---

    Code
      out2 <- unnest_wider(df, col, names_sep = "_")
    Message <simpleMessage>
      New names:
      * NA -> ...1
      New names:
      * `` -> ...1

# can't currently combine compatible `<list> + <list_of<ptype>>`

    Code
      (expect_error(unnest_wider(df, col)))
    Output
      <error/vctrs_error_incompatible_type>
      Can't combine `..1$a` <list> and `..3$a` <list_of<integer>>.

# unnest_wider() input must be a data frame (#1224)

    Code
      (expect_error(unnest_wider(1)))
    Output
      <error/rlang_error>
      `data` must be a data frame.

# unnest_longer - bad inputs generate errors

    Code
      (expect_error(unnest_longer(df, y)))
    Output
      <error/rlang_error>
      Column `y` must contain a list of vectors.

# can't mix `indices_to` with `indices_include = FALSE`

    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_to = "x", indices_include = FALSE))
      )
    Output
      <error/rlang_error>
      Can't set `indices_include` to `FALSE` when `indices_to` is supplied.

# unnest_longer() input must be a data frame (#1224)

    Code
      (expect_error(unnest_longer(1)))
    Output
      <error/rlang_error>
      `data` must be a data frame.

# `values_to` is validated

    Code
      (expect_error(unnest_longer(mtcars, mpg, values_to = 1)))
    Output
      <error/rlang_error>
      `values_to` must be a single string or `NULL`.
    Code
      (expect_error(unnest_longer(mtcars, mpg, values_to = c("x", "y"))))
    Output
      <error/rlang_error>
      `values_to` must be a single string or `NULL`.

# `indices_to` is validated

    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_to = 1)))
    Output
      <error/rlang_error>
      `indices_to` must be a single string or `NULL`.
    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_to = c("x", "y"))))
    Output
      <error/rlang_error>
      `indices_to` must be a single string or `NULL`.

# `indices_include` is validated

    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_include = 1)))
    Output
      <error/rlang_error>
      `indices_include` must be `NULL` or a single `TRUE` or `FALSE`.
    Code
      (expect_error(unnest_longer(mtcars, mpg, indices_include = c(TRUE, FALSE))))
    Output
      <error/rlang_error>
      `indices_include` must be `NULL` or a single `TRUE` or `FALSE`.

# `simplify` is validated

    Code
      (expect_error(df_simplify(data.frame(), simplify = 1)))
    Output
      <error/rlang_error>
      `simplify` must be a list or a single `TRUE` or `FALSE`.
    Code
      (expect_error(df_simplify(data.frame(), simplify = NA)))
    Output
      <error/rlang_error>
      `simplify` must be a list or a single `TRUE` or `FALSE`.
    Code
      (expect_error(df_simplify(data.frame(), simplify = c(TRUE, FALSE))))
    Output
      <error/rlang_error>
      `simplify` must be a list or a single `TRUE` or `FALSE`.
    Code
      (expect_error(df_simplify(data.frame(), simplify = list(1))))
    Output
      <error/rlang_error>
      All elements of `simplify` must be named.
    Code
      (expect_error(df_simplify(data.frame(), simplify = list(x = 1, x = 1))))
    Output
      <error/rlang_error>
      The names of `simplify` must be unique.

# `ptype` is validated

    Code
      (expect_error(df_simplify(data.frame(), ptype = 1)))
    Output
      <error/rlang_error>
      `ptype` must be `NULL`, an empty ptype, or a named list of ptypes.
    Code
      (expect_error(df_simplify(data.frame(), ptype = list(1))))
    Output
      <error/rlang_error>
      All elements of `ptype` must be named.
    Code
      (expect_error(df_simplify(data.frame(), ptype = list(x = 1, x = 1))))
    Output
      <error/rlang_error>
      The names of `ptype` must be unique.

# `transform` is validated

    Code
      (expect_error(df_simplify(data.frame(), transform = list(~.x))))
    Output
      <error/rlang_error>
      All elements of `transform` must be named.
    Code
      (expect_error(df_simplify(data.frame(x = 1), transform = 1)))
    Output
      <error/rlang_error>
      Can't convert a double vector to function
    Code
      (expect_error(df_simplify(data.frame(), transform = list(x = 1))))
    Output
      <error/rlang_error>
      Can't convert a double vector to function
    Code
      (expect_error(df_simplify(data.frame(), transform = list(x = 1, x = 1))))
    Output
      <error/rlang_error>
      The names of `transform` must be unique.

# ptype is applied after transform

    Code
      (expect_error(col_simplify(list(1, 2, 3), ptype = integer(), transform = ~.x +
        1.5)))
    Output
      <error/vctrs_error_cast_lossy>
      Can't convert from <double> to <integer> due to loss of precision.
      * Locations: 1

