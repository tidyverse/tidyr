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

