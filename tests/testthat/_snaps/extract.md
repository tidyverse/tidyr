# informative error message if wrong number of groups

    Code
      extract(df, x, "y", ".")
    Condition
      Error in `extract()`:
      ! `regex` should define 1 groups; 0 found.

---

    Code
      extract(df, x, c("y", "z"), ".")
    Condition
      Error in `extract()`:
      ! `regex` should define 2 groups; 0 found.

# informative error if using stringr modifier functions (#693)

    Code
      extract(df, x, "x", regex = regex)
    Condition
      Error in `extract()`:
      ! `regex` can't use modifiers from stringr.

# validates its inputs

    Code
      extract(df)
    Condition
      Error in `extract()`:
      ! `col` is absent but must be supplied.

---

    Code
      extract(df, x, regex = 1)
    Condition
      Error in `extract()`:
      ! `regex` must be a single string, not the number 1.

---

    Code
      extract(df, x, into = 1:3)
    Condition
      Error in `extract()`:
      ! `into` must be a character vector, not an integer vector.

---

    Code
      extract(df, x, into = "x", convert = 1)
    Condition
      Error in `extract()`:
      ! `convert` must be `TRUE` or `FALSE`, not the number 1.

