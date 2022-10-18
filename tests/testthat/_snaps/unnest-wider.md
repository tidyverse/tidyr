# unnest_wider - bad inputs generate errors

    Code
      (expect_error(unnest_wider(df, y)))
    Output
      <error/rlang_error>
      Error in `unnest_wider()`:
      ! List-column `y` must contain only vectors.

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

# unnest_wider() validates its inputs

    Code
      unnest_wider(1)
    Condition
      Error in `unnest_wider()`:
      ! `data` must be a data frame, not a number.
    Code
      unnest_wider(df)
    Condition
      Error in `unnest_wider()`:
      ! `col` is absent but must be supplied.
    Code
      unnest_wider(df, x, names_sep = 1)
    Condition
      Error in `unnest_wider()`:
      ! `names_sep` must be a single string or `NULL`, not the number 1.
    Code
      unnest_wider(df, x, strict = 1)
    Condition
      Error in `unnest_wider()`:
      ! `strict` must be `TRUE` or `FALSE`, not the number 1.

