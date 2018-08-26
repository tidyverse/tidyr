#' Gather selected variables into key-value pairs.
#'
#' A scoped variant of `gather()` operate on a selection of variables.
#'
#' @inheritParams expand
#' @param .predicate A predicate function to be applied to the columns
#'   or a logical vector. The variables for which `.predicate` is or
#'   returns TRUE are gathered. This argument is passed to
#'   `rlang::as_function()``and thus supports quosure-style lambda
#'   functions and strings representing function names.
#'
#'   This argument is passed by expression and supports
#'   [quasiquotation][rlang::quasiquotation] (you can unquote strings
#'   and symbols). The name is captured from the expression with
#'   [rlang::quo_name()] (note that this kind of interface where
#'   symbols do not represent actual objects is now discouraged in the
#'   tidyverse; we support it here for backward compatibility).
#' @param ... An additional selection of columns after `.predicate`.
#'   If empty, all variables selected by `.predicate` are selected.
#'   You can supply bare variable names, select all variables between
#'   x and z with `x:z`, exclude y with `-y`. For more options, see
#'   the [dplyr::select()] documentation. See also the section on
#'   selection rules in `gather`.
#' @inheritParams gather
#' @inheritParams gather_
#' @export
#' @examples
#' library(dplyr)
#' # From http://stackoverflow.com/questions/1181060
#' stocks <- tibble(
#'   time = as.Date('2009-01-01') + 0:9,
#'   X = rnorm(10, 0, 1),
#'   Y = rnorm(10, 0, 2),
#'   Z = rnorm(10, 0, 4)
#' )
#'
#' gather(stocks, stock, price, -time)
#' stocks %>% gather(stock, price, -time)
#'
#' # get first observation for each Species in iris data -- base R
#' mini_iris <- iris[c(1, 51, 101), ]
#' # gather Sepal.Length, Sepal.Width, Petal.Length, Petal.Width
#' gather(mini_iris, key = flower_att, value = measurement,
#'        Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
#' # same result but less verbose
#' gather(mini_iris, key = flower_att, value = measurement, -Species)
#'
#' # repeat iris example using dplyr and the pipe operator
#' library(dplyr)
#' mini_iris <-
#'   iris %>%
#'   group_by(Species) %>%
#'   slice(1)
#' mini_iris %>% gather(key = flower_att, value = measurement, -Species)
gather_if <- function(data, .predicate, key = "key", value = "value", ...,
                   na.rm = FALSE, convert = FALSE, factor_key = FALSE) {
  UseMethod("gather")
}
#' @export
gather.data.frame <- function(data, key = "key", value = "value", ...,
                              na.rm = FALSE, convert = FALSE,
                              factor_key = FALSE) {
  key_var <- quo_name(enexpr(key))
  value_var <- quo_name(enexpr(value))

  quos <- quos(...)
  if (is_empty(quos)) {
    gather_vars <- setdiff(names(data), c(key_var, value_var))
  } else {
    gather_vars <- unname(tidyselect::vars_select(names(data), !!! quos))
  }

  if (is_empty(gather_vars)) {
    return(data)
  }

  gather_idx <- match(gather_vars, names(data))
  id_idx <- setdiff(seq_along(data), gather_idx)

  dup_indx <- match(c(key_var, value_var), names(data))
  id_idx <- setdiff(id_idx, dup_indx)

  ## Get the attributes if common, NULL if not.
  args <- normalize_melt_arguments(data, gather_idx)
  valueAsFactor <- "factor" %in% class(args$attr_template)

  out <- melt_dataframe(
    data,
    id_idx - 1L,
    gather_idx - 1L,
    as.character(key_var),
    as.character(value_var),
    args$attr_template,
    args$factorsAsStrings,
    as.logical(valueAsFactor),
    as.logical(factor_key)
  )

  if (na.rm && anyNA(out)) {
    missing <- is.na(out[[value_var]])
    out <- out[!missing, ]
  }

  if (convert) {
    out[[key_var]] <- type.convert(as.character(out[[key_var]]), as.is = TRUE)
  }

  reconstruct_tibble(data, out, gather_vars)
}

# Functions from reshape2 -------------------------------------------------

## Get the attributes if common, NULL if not.
normalize_melt_arguments <- function(data, measure.ind) {
  measure.attributes <- map(measure.ind, function(i) {
    attributes(data[[i]])
  })

  ## Determine if all measure.attributes are equal
  measure.attrs.equal <- all_identical(measure.attributes)

  if (measure.attrs.equal) {
    attr_template <- data[[measure.ind[1]]]
  } else {
    warn(glue(
      "attributes are not identical across measure variables;
       they will be dropped"
    ))
    attr_template <- NULL
  }

  ## If we are going to be coercing any factors to strings, we don't want to
  ## copy the attributes
  any.factors <- any(map_lgl(measure.ind, function(i) is.factor(data[[i]])))

  if (any.factors) {
    attr_template <- NULL
  }

  list(
    attr_template = attr_template,
    factorsAsStrings = TRUE
  )
}

all_identical <- function(xs) {
  if (length(xs) <= 1) return(TRUE)
  for (i in seq(2, length(xs))) {
    if (!identical(xs[[1]], xs[[i]])) return(FALSE)
  }
  TRUE
}
