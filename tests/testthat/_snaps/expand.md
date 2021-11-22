# crossing checks for bad inputs

    Code
      (expect_error(crossing(x = 1:10, y = quote(a))))
    Output
      <error/vctrs_error_scalar_type>
      `..2` must be a vector, not a symbol.

# expand() respects `.name_repair`

    Code
      out <- df %>% expand(x = x, x = x, .name_repair = "unique")
    Message <simpleMessage>
      New names:
      * x -> x...1
      * x -> x...2

# crossing() / nesting() respect `.name_repair`

    Code
      out <- crossing(x = x, x = x, .name_repair = "unique")
    Message <simpleMessage>
      New names:
      * x -> x...1
      * x -> x...2

---

    Code
      out <- nesting(x = x, x = x, .name_repair = "unique")
    Message <simpleMessage>
      New names:
      * x -> x...1
      * x -> x...2

# expand_grid() can control name_repair

    Code
      (expect_error(expand_grid(x = x, x = x)))
    Output
      <error/vctrs_error_names_must_be_unique>
      Names must be unique.
      x These names are duplicated:
        * "x" at locations 1 and 2.

---

    Code
      out <- expand_grid(x = x, x = x, .name_repair = "unique")
    Message <simpleMessage>
      New names:
      * x -> x...1
      * x -> x...2

# grid_dots() reject non-vector input

    Code
      (expect_error(grid_dots(lm(1 ~ 1))))
    Output
      <error/vctrs_error_scalar_type>
      `..1` must be a vector, not a <lm> object.

