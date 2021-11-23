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

