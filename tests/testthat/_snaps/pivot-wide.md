# error when overwriting existing column

    Code
      (expect_error(pivot_wider(df, names_from = key, values_from = val)))
    Output
      <error/vctrs_error_names_must_be_unique>
      Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 2.
      i Use argument `names_repair` to specify repair strategy.

---

    Code
      out <- pivot_wider(df, names_from = key, values_from = val, names_repair = "unique")
    Message <simpleMessage>
      New names:
      * a -> a...1
      * a -> a...2

# `names_from` must be supplied if `name` isn't in `data` (#1240)

    Code
      (expect_error(pivot_wider(df, values_from = val)))
    Output
      <error/vctrs_error_subscript_oob>
      Can't subset columns that don't exist.
      x Column `name` doesn't exist.

# `values_from` must be supplied if `value` isn't in `data` (#1240)

    Code
      (expect_error(pivot_wider(df, names_from = key)))
    Output
      <error/vctrs_error_subscript_oob>
      Can't subset columns that don't exist.
      x Column `value` doesn't exist.

# `names_from` must identify at least 1 column (#1240)

    Code
      (expect_error(pivot_wider(df, names_from = starts_with("foo"), values_from = val))
      )
    Output
      <error/rlang_error>
      `names_from` must select at least one column.

# `values_from` must identify at least 1 column (#1240)

    Code
      (expect_error(pivot_wider(df, names_from = key, values_from = starts_with("foo")))
      )
    Output
      <error/rlang_error>
      `values_from` must select at least one column.

# `values_fn` emits an informative error when it doesn't result in unique values (#1238)

    Code
      (expect_error(pivot_wider(df, values_fn = list(value = ~.x))))
    Output
      <error/rlang_error>
      Applying `values_fn` to `value` must result in a single summary value per key.
      x Applying `values_fn` resulted in a value with length 2.

# `names_vary` is validated

    Code
      (expect_error(build_wider_spec(df, names_vary = 1)))
    Output
      <error/rlang_error>
      `names_vary` must be a character vector.
    Code
      (expect_error(build_wider_spec(df, names_vary = "x")))
    Output
      <error/rlang_error>
      `names_vary` must be one of "fastest" or "slowest".

# `names_expand` is validated

    Code
      (expect_error(build_wider_spec(df, names_expand = 1)))
    Output
      <error/rlang_error>
      `names_expand` must be a single `TRUE` or `FALSE`.
    Code
      (expect_error(build_wider_spec(df, names_expand = "x")))
    Output
      <error/rlang_error>
      `names_expand` must be a single `TRUE` or `FALSE`.

# `id_expand` is validated

    Code
      (expect_error(pivot_wider(df, id_expand = 1)))
    Output
      <error/rlang_error>
      `id_expand` must be a single `TRUE` or `FALSE`.
    Code
      (expect_error(pivot_wider(df, id_expand = "x")))
    Output
      <error/rlang_error>
      `id_expand` must be a single `TRUE` or `FALSE`.

# duplicated keys produce list column with warning

    Code
      pv <- pivot_wider(df, names_from = key, values_from = val)
    Warning <warning>
      Values from `val` are not uniquely identified; output will contain list-cols.
      * Use `values_fn = list` to suppress this warning.
      * Use `values_fn = {summary_fun}` to summarise duplicates.
      * Use the following dplyr code to identify duplicates.
        {data} %>%
          dplyr::group_by(a, key) %>%
          dplyr::summarise(n = dplyr::n(), .groups = "drop") %>%
          dplyr::filter(n > 1L)

# duplicated key warning mentions every applicable column

    Code
      pivot_wider(df, names_from = key, values_from = c(a, b, c))
    Warning <warning>
      Values from `a`, `b` and `c` are not uniquely identified; output will contain list-cols.
      * Use `values_fn = list` to suppress this warning.
      * Use `values_fn = {summary_fun}` to summarise duplicates.
      * Use the following dplyr code to identify duplicates.
        {data} %>%
          dplyr::group_by(key) %>%
          dplyr::summarise(n = dplyr::n(), .groups = "drop") %>%
          dplyr::filter(n > 1L)
    Output
      # A tibble: 1 x 3
        a_x       b_x       c_x      
        <list>    <list>    <list>   
      1 <dbl [2]> <dbl [2]> <dbl [2]>

---

    Code
      pivot_wider(df, names_from = key, values_from = c(a, b, c), values_fn = list(b = sum))
    Warning <warning>
      Values from `a` and `c` are not uniquely identified; output will contain list-cols.
      * Use `values_fn = list` to suppress this warning.
      * Use `values_fn = {summary_fun}` to summarise duplicates.
      * Use the following dplyr code to identify duplicates.
        {data} %>%
          dplyr::group_by(key) %>%
          dplyr::summarise(n = dplyr::n(), .groups = "drop") %>%
          dplyr::filter(n > 1L)
    Output
      # A tibble: 1 x 3
        a_x         b_x c_x      
        <list>    <dbl> <list>   
      1 <dbl [2]>     7 <dbl [2]>

# duplicated key warning backticks non-syntactic names

    Code
      pv <- pivot_wider(df, names_from = `the-key`, values_from = val)
    Warning <warning>
      Values from `val` are not uniquely identified; output will contain list-cols.
      * Use `values_fn = list` to suppress this warning.
      * Use `values_fn = {summary_fun}` to summarise duplicates.
      * Use the following dplyr code to identify duplicates.
        {data} %>%
          dplyr::group_by(`a 1`, a2, `the-key`) %>%
          dplyr::summarise(n = dplyr::n(), .groups = "drop") %>%
          dplyr::filter(n > 1L)

# values_fn is validated

    Code
      (expect_error(pivot_wider(df, values_fn = 1)))
    Output
      <error/rlang_error>
      Can't convert a double vector to function

# `unused_fn` must result in single summary values

    Code
      (expect_error(pivot_wider(df, id_cols = id, unused_fn = identity)))
    Output
      <error/rlang_error>
      Applying `unused_fn` to `unused` must result in a single summary value per key.
      x Applying `unused_fn` resulted in a value with length 2.

# `unused_fn` is validated

    Code
      (expect_error(pivot_wider(df, id_cols = id, unused_fn = 1)))
    Output
      <error/rlang_error>
      Can't convert a double vector to function

