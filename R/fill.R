#' @importFrom Rcpp sourceCpp
NULL

#' Fill in missing values with previous or next value
#'
#' Fills missing values in selected columns using the next or previous entry.
#' This is useful in the common output format where values are not repeated,
#' and are only recorded when they change.
#'
#' Missing values are replaced in atomic vectors; `NULL`s are replaced in lists.
#'
#' @inheritParams gather
#' @param ... A selection of columns. If empty, nothing happens. You can
#'   supply bare variable names, select all variables between `x` and `z`
#'   with `x:z`, exclude `y` with `-y`. For more selection options, see the
#'   [dplyr::select()] documentation.
#' @param .direction Direction in which to fill missing values. Currently
#'   either "down" (the default), "up", "downup" (i.e. first down and then up)
#'   or "updown" (first up and then down).
#' @export
#' @examples
#' # Value (year) is recorded only when it changes
#' sales <- tibble::tribble(
#'   ~quarter, ~year, ~sales,
#'   "Q1",  2000,  66013,
#'   "Q2",    NA,  69182,
#'   "Q3",    NA,  53175,
#'   "Q4",    NA,  21001,
#'   "Q1",  2001,  46036,
#'   "Q2",    NA,  58842,
#'   "Q3",    NA,  44568,
#'   "Q4",    NA,  50197,
#'   "Q1",  2002,  39113,
#'   "Q2",    NA,  41668,
#'   "Q3",    NA,  30144,
#'   "Q4",    NA,  52897,
#'   "Q1",  2004,  32129,
#'   "Q2",    NA,  67686,
#'   "Q3",    NA,  31768,
#'   "Q4",    NA,  49094
#' )
#'
#' # `fill()` will default to replacing missing data from top to bottom
#' sales %>% fill(year)
#'
#'
#' # Value (pet_type) is missing above
#' tidy_pets <- tibble::tribble(
#'   ~rank, ~pet_type,                          ~breed,
#'   1,        NA,         "Retrievers (Labrador)",
#'   2,        NA,          "German Shepherd Dogs",
#'   3,        NA,           "Retrievers (Golden)",
#'   4,        NA,               "French Bulldogs",
#'   5,        NA,                      "Bulldogs",
#'   6,        NA,                       "Beagles",
#'   7,        NA,                       "Poodles",
#'   8,        NA,                   "Rottweilers",
#'   9,        NA, "Pointers (German Shorthaired)",
#'   10,     "Dog",            "Yorkshire Terriers",
#'   1,        NA,                       "Persian",
#'   2,        NA,                    "Maine Coon",
#'   3,        NA,                       "Ragdoll",
#'   4,        NA,                        "Exotic",
#'   5,        NA,                       "Siamese",
#'   6,        NA,                "American Short",
#'   7,        NA,                    "Abyssinian",
#'   8,        NA,                        "Birman",
#'   9,        NA,                        "Sphynx",
#'   10,     "Cat",                        "Bengal"
#' )
#'
#' # For values that are missing above you can use `.direction = "up"`
#' tidy_pets %>%
#'   fill(pet_type, .direction = "up")
#'
#'
#' # Value (n_squirrels) is missing above and below within a group
#' squirrels <- tibble::tribble(
#'   ~group,      ~name,         ~role, ~n_squirrels,
#'   1L,      "Sam",    "Observer",           NA,
#'   1L,     "Mara", "Scorekeeper",            8,
#'   1L,    "Jesse",    "Observer",           NA,
#'   1L,      "Tom",    "Observer",           NA,
#'   2L,     "Mike",    "Observer",           NA,
#'   2L,  "Rachael",    "Observer",           NA,
#'   2L,  "Sydekea", "Scorekeeper",           14,
#'   2L, "Gabriela",    "Observer",           NA,
#'   3L,  "Derrick",    "Observer",           NA,
#'   3L,     "Kara", "Scorekeeper",            9,
#'   3L,    "Emily",    "Observer",           NA,
#'   3L, "Danielle",    "Observer",           NA
#' )
#'
#' # The values are inconsistently missing by position within the group
#' # Use .direction = "downup" to fill missing values in both directions
#' squirrels %>%
#'   dplyr::group_by(group) %>%
#'   fill(n_squirrels, .direction = "downup") %>%
#'   dplyr::ungroup()
#'
#' # Using `.direction = "updown"` accomplishes the same goal in this example
#' squirrels %>%
#'   dplyr::group_by(group) %>%
#'   fill(n_squirrels, .direction = "updown") %>%
#'   dplyr::ungroup()

fill <- function(data, ..., .direction = c("down", "up", "downup", "updown")) {
  ellipsis::check_dots_unnamed()
  UseMethod("fill")
}
#' @export
fill.data.frame <- function(data, ..., .direction = c("down", "up", "downup", "updown")) {
  vec_fill <- vec_fill_fun(.direction)
  dplyr::mutate_at(data, dplyr::vars(...), vec_fill)
}

vec_fill_fun <- function(.direction = c("down", "up", "downup", "updown")) {
  .direction <- match.arg(.direction)
  switch(
    .direction,
    down = fillDown,
    up = fillUp,
    downup = function(x) fillUp(fillDown(x)),
    updown = function(x) fillDown(fillUp(x))
  )
}
