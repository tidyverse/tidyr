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
#' # Here we have some spreadsheet data where the analyst has only updated year
#' # when the year has changed, leading to a consistent placement of year at the top
#' # followed by trailing NAs up to the next year
#'
#' sales <- tibble(quarter = rep(c("Q1", "Q2", "Q3", "Q4"), 4),
#'                 year = c(2000, rep(NA, 3),
#'                          2001, rep(NA, 3),
#'                          2002, rep(NA, 3),
#'                          2004, rep(NA, 3)
#'                 ),
#'                 sales = c(66013, 69182, 53175, 21001, 46036, 58842, 44568, 50197,
#'                           39113, 41668, 30144, 52897, 32129, 67686, 31768, 49094)
#' )
#'
#' sales
#'
#' # We can call `fill()` and only need to specify the column to fill since the
#' # default for the `.direction` argument is "down"
#' # As such `fill()` will replace missing data from top to bottom in this example
#'
#' sales %>% fill(year)
#'
#'
#' # In this next example we are looking at the most popular pet breeds for cats and dogs
#' # The pet type (dog or cat) is missing in a consistent way up to the last
#' # observation within the respective pet type
#'
#' tidy_pets <- tibble(pet_type = c(rep(NA, 9), "Dog", rep(NA, 9), "Cat"),
#'                     breed = c("Retrievers (Labrador)", "German Shepherd Dogs",
#'                               "Retrievers (Golden)", "French Bulldogs", "Bulldogs",
#'                               "Beagles", "Poodles", "Rottweilers",
#'                               "Pointers (German Shorthaired)", "Yorkshire Terriers",
#'                               "Persian", "Maine Coon", "Ragdoll", "Exotic", "Siamese",
#'                               "American Short", "Abyssinian", "Birman", "Sphynx", "Bengal"),
#'                     rank = rep(c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"), 2)
#' )
#'
#' tidy_pets
#'
#' # Notice in this example the data to fill is now at the _bottom_, rather than the top
#' # If we were to use the default of fill (.direction = "down") it would actually
#' # add the "dog" `pet_type` to all the cats!
#' # So let's specify the direction with `.direction = "up")`
#'
#' tidy_pets %>%
#'   fill(pet_type, .direction = "up")
#'
#'
#' # In this example, some squirrel enthusiasts are walking around Central Park and
#' # counting the number of squirrels observed by their respective groups
#'
#' squirrels <- tibble(
#'   group = rep(1:3, each = 4),
#'   name = c("Sam", "Mara", "Jesse", "Tom",
#'            "Mike", "Rachael", "Sydekea", "Gabriela",
#'            "Derrick", "Kara", "Emily", "Danielle"),
#'   role = c("Observer", "Scorekeeper", rep("Observer", 4), "Scorekeeper",
#'            rep("Observer", 2), "Scorekeeper", rep("Observer", 2)),
#'   n_squirrels = c(NA, 8, NA, NA, NA, NA, 14, NA, NA, 9, NA, NA)
#' )
#'
#' # Note that there are four people per team, but only one "scorekeeper" who tracks
#' # the groups total observed squirrels in their notebook.
#' # The data is inconsistently missing by position within the group, so using
#' # .direction = "up" or "down" once doesn't fully solve the problem
#'
#' squirrels
#'
#' # We can now use the specify the direction via `.direction = 'downup'`
#' # along with a `dplyr::group_by()` to fill in the missing data for the entire group!
#' # Note that this will first fill down and then fill back up
#'
#' squirrels %>%
#'   dplyr::group_by(group) %>%
#'   fill(n_squirrels, .direction = 'downup') %>%
#'   dplyr::ungroup()
#'
#' # Similar problems could also be solved with the argument `.direction = updown`
#' # These options are very helpful in situations where data is
#' # inconsistently missing by actual location, and is not simply
#' # at the top or bottom of the respective groups
#'
#' squirrels %>%
#'   dplyr::group_by(group) %>%
#'   fill(n_squirrels, .direction = 'updown') %>%
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
