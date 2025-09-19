# error if input is not a data.frame

    Code
      pivot_wider_spec(list(), spec)
    Condition
      Error in `pivot_wider_spec()`:
      ! `data` must be a data frame, not an empty list.

# error when overwriting existing column

    Code
      pivot_wider(df, names_from = key, values_from = val)
    Condition
      Error in `pivot_wider()`:
      ! Names must be unique.
      x These names are duplicated:
        * "a" at locations 1 and 2.
      i Use argument `names_repair` to specify repair strategy.

---

    Code
      out <- pivot_wider(df, names_from = key, values_from = val, names_repair = "unique")
    Message
      New names:
      * `a` -> `a...1`
      * `a` -> `a...2`

# `names_from` must be supplied if `name` isn't in `data` (#1240)

    Code
      pivot_wider(df, values_from = val)
    Condition
      Error in `pivot_wider()`:
      ! Can't select columns that don't exist.
      x Column `name` doesn't exist.

# `values_from` must be supplied if `value` isn't in `data` (#1240)

    Code
      pivot_wider(df, names_from = key)
    Condition
      Error in `pivot_wider()`:
      ! Can't select columns that don't exist.
      x Column `value` doesn't exist.

# `names_from` must identify at least 1 column (#1240)

    Code
      pivot_wider(df, names_from = starts_with("foo"), values_from = val)
    Condition
      Error in `pivot_wider()`:
      ! Must select at least one item.

# `values_from` must identify at least 1 column (#1240)

    Code
      pivot_wider(df, names_from = key, values_from = starts_with("foo"))
    Condition
      Error in `pivot_wider()`:
      ! Must select at least one item.

# `values_fn` emits an informative error when it doesn't result in unique values (#1238)

    Code
      pivot_wider(df, values_fn = list(value = ~.x))
    Condition
      Error in `pivot_wider()`:
      ! Applying `values_fn` to `value` must result in a single summary value per key.
      i Applying `values_fn` resulted in a vector of length 2.

# `build_wider_spec()` requires empty dots

    Code
      build_wider_spec(df, 1)
    Condition
      Error in `build_wider_spec()`:
      ! `...` must be empty.
      x Problematic argument:
      * ..1 = 1
      i Did you forget to name an argument?

---

    Code
      build_wider_spec(df, name_prefix = "")
    Condition
      Error in `build_wider_spec()`:
      ! `...` must be empty.
      x Problematic argument:
      * name_prefix = ""

# `pivot_wider_spec()` requires empty dots

    Code
      pivot_wider_spec(df, spec, 1)
    Condition
      Error in `pivot_wider_spec()`:
      ! `...` must be empty.
      x Problematic argument:
      * ..1 = 1
      i Did you forget to name an argument?

---

    Code
      pivot_wider_spec(df, spec, name_repair = "check_unique")
    Condition
      Error in `pivot_wider_spec()`:
      ! `...` must be empty.
      x Problematic argument:
      * name_repair = "check_unique"

# doesn't crash when `id_cols` selects column removed by `names_from` (#1609)

    Code
      pivot_wider(df, id_cols = x, values_from = y, names_from = x)
    Condition
      Error in `pivot_wider()`:
      ! Can't select columns past the end.
      i Locations 1, 100, 200, and 300 don't exist.
      i There are only 0 columns.

# doesn't crash when `id_cols` selects non-existent column (#1482)

    Code
      pivot_wider(df, id_cols = c("non", "existent"), names_from = name, values_from = value)
    Condition
      Error in `pivot_wider()`:
      ! Can't select columns that don't exist.
      x Column `non` doesn't exist.

---

    Code
      pivot_wider(df2, id_cols = all_of(c("a", "b", "c")), names_from = y,
      values_from = z)
    Condition
      Error in `pivot_wider()`:
      i In argument: `all_of(c("a", "b", "c"))`.
      Caused by error in `all_of()`:
      ! Can't subset elements that don't exist.
      x Elements `a`, `b`, and `c` don't exist.

---

    Code
      pivot_wider(df2, id_cols = 1:2, names_from = y, values_from = z)
    Condition
      Error in `pivot_wider()`:
      ! Can't select columns past the end.
      i Locations 1 and 2 don't exist.
      i There are only 0 columns.

# `names_vary` is validated

    Code
      build_wider_spec(df, names_vary = 1)
    Condition
      Error in `build_wider_spec()`:
      ! `names_vary` must be a string or character vector.

---

    Code
      build_wider_spec(df, names_vary = "x")
    Condition
      Error in `build_wider_spec()`:
      ! `names_vary` must be one of "fastest" or "slowest", not "x".

# `names_expand` is validated

    Code
      build_wider_spec(df, names_expand = 1)
    Condition
      Error in `build_wider_spec()`:
      ! `names_expand` must be `TRUE` or `FALSE`, not the number 1.

---

    Code
      build_wider_spec(df, names_expand = "x")
    Condition
      Error in `build_wider_spec()`:
      ! `names_expand` must be `TRUE` or `FALSE`, not the string "x".

# `id_cols` can't select columns from `names_from` or `values_from` (#1318)

    Code
      pivot_wider(df, id_cols = name, names_from = name, values_from = value)
    Condition
      Error in `pivot_wider()`:
      ! `id_cols` can't select a column already selected by `names_from`.
      i Column `name` has already been selected.

---

    Code
      pivot_wider(df, id_cols = value, names_from = name, values_from = value)
    Condition
      Error in `pivot_wider()`:
      ! `id_cols` can't select a column already selected by `values_from`.
      i Column `value` has already been selected.

# `id_cols` returns a tidyselect error if a column selection is OOB (#1318)

    Code
      pivot_wider(df, id_cols = foo)
    Condition
      Error in `pivot_wider()`:
      ! Can't select columns that don't exist.
      x Column `foo` doesn't exist.

# named `id_cols` gives clear error (#1104)

    Code
      pivot_wider(df, id_cols = c(z = x))
    Condition
      Error in `pivot_wider()`:
      ! Can't rename variables in this context.

# `id_expand` is validated

    Code
      pivot_wider(df, id_expand = 1)
    Condition
      Error in `pivot_wider()`:
      ! `id_expand` must be `TRUE` or `FALSE`, not the number 1.

---

    Code
      pivot_wider(df, id_expand = "x")
    Condition
      Error in `pivot_wider()`:
      ! `id_expand` must be `TRUE` or `FALSE`, not the string "x".

# duplicated keys produce list column with warning

    Code
      pv <- pivot_wider(df, names_from = key, values_from = val)
    Condition
      Warning:
      Values from `val` are not uniquely identified; output will contain list-cols.
      * Use `values_fn = list` to suppress this warning.
      * Use `values_fn = {summary_fun}` to summarise duplicates.
      * Use the following dplyr code to identify duplicates.
        {data} |>
        dplyr::summarise(n = dplyr::n(), .by = c(a, key)) |>
        dplyr::filter(n > 1L)

# duplicated key warning mentions every applicable column

    Code
      pivot_wider(df, names_from = key, values_from = c(a, b, c))
    Condition
      Warning:
      Values from `a`, `b` and `c` are not uniquely identified; output will contain list-cols.
      * Use `values_fn = list` to suppress this warning.
      * Use `values_fn = {summary_fun}` to summarise duplicates.
      * Use the following dplyr code to identify duplicates.
        {data} |>
        dplyr::summarise(n = dplyr::n(), .by = c(key)) |>
        dplyr::filter(n > 1L)
    Output
      # A tibble: 1 x 3
        a_x       b_x       c_x      
        <list>    <list>    <list>   
      1 <dbl [2]> <dbl [2]> <dbl [2]>

---

    Code
      pivot_wider(df, names_from = key, values_from = c(a, b, c), values_fn = list(b = sum))
    Condition
      Warning:
      Values from `a` and `c` are not uniquely identified; output will contain list-cols.
      * Use `values_fn = list` to suppress this warning.
      * Use `values_fn = {summary_fun}` to summarise duplicates.
      * Use the following dplyr code to identify duplicates.
        {data} |>
        dplyr::summarise(n = dplyr::n(), .by = c(key)) |>
        dplyr::filter(n > 1L)
    Output
      # A tibble: 1 x 3
        a_x         b_x c_x      
        <list>    <dbl> <list>   
      1 <dbl [2]>     7 <dbl [2]>

# duplicated key warning backticks non-syntactic names

    Code
      pv <- pivot_wider(df, names_from = `the-key`, values_from = val)
    Condition
      Warning:
      Values from `val` are not uniquely identified; output will contain list-cols.
      * Use `values_fn = list` to suppress this warning.
      * Use `values_fn = {summary_fun}` to summarise duplicates.
      * Use the following dplyr code to identify duplicates.
        {data} |>
        dplyr::summarise(n = dplyr::n(), .by = c(`a 1`, a2, `the-key`)) |>
        dplyr::filter(n > 1L)

# values_fn is validated

    Code
      pivot_wider(df, values_fn = 1)
    Condition
      Error in `pivot_wider()`:
      ! `values_fn` must be `NULL`, a function, or a named list of functions.

# `unused_fn` must result in single summary values

    Code
      pivot_wider(df, id_cols = id, unused_fn = identity)
    Condition
      Error in `pivot_wider()`:
      ! Applying `unused_fn` to `unused` must result in a single summary value per key.
      i Applying `unused_fn` resulted in a vector of length 2.

# `values_fill` is validated

    Code
      pivot_wider(df, values_fill = 1:2)
    Condition
      Error in `pivot_wider()`:
      ! `values_fill` must be `NULL`, a scalar, or a named list, not an integer vector.

# `unused_fn` is validated

    Code
      pivot_wider(df, id_cols = id, unused_fn = 1)
    Condition
      Error in `pivot_wider()`:
      ! `unused_fn` must be `NULL`, a function, or a named list of functions.

# `id_cols` has noisy compat behavior (#1353)

    Code
      out <- pivot_wider(df, id)
    Condition
      Warning:
      Specifying the `id_cols` argument by position was deprecated in tidyr 1.3.0.
      i Please explicitly name `id_cols`, like `id_cols = id`.

---

    Code
      expect <- pivot_wider(df, id_cols = id)

# `id_cols` compat behavior doesn't trigger if `id_cols` is specified too

    Code
      pivot_wider(df, id, id_cols = id2)
    Condition
      Error in `pivot_wider()`:
      ! `...` must be empty.
      x Problematic argument:
      * ..1 = id
      i Did you forget to name an argument?

# `id_cols` compat behavior doesn't trigger if multiple `...` are supplied

    Code
      pivot_wider(df, id, id2)
    Condition
      Error in `pivot_wider()`:
      ! `...` must be empty.
      x Problematic arguments:
      * ..1 = id
      * ..2 = id2
      i Did you forget to name an argument?

# `id_cols` compat behavior doesn't trigger if named `...` are supplied

    Code
      pivot_wider(df, ids = id)
    Condition
      Error in `pivot_wider()`:
      ! `...` must be empty.
      x Problematic argument:
      * ids = id

