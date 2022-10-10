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

# unnest_wider() input must be a data frame (#1224)

    Code
      (expect_error(unnest_wider(1)))
    Output
      <error/rlang_error>
      Error in `unnest_wider()`:
      ! `data` must be a data frame.

