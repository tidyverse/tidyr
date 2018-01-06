library(tibble)

smiths <- frame_data(
  ~subject,    ~time, ~age, ~weight, ~height,
  "John Smith",    1,   33,      90,    1.87,
  "Mary Smith",    1,   NA,      NA,    1.54
)

devtools::use_data(smiths, overwrite = TRUE)
