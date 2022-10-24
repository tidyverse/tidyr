#' Gather columns into key-value pairs
#'
#' @description
#' `r lifecycle::badge("superseded")`
#'
#' Development on `gather()` is complete, and for new code we recommend
#' switching to `pivot_longer()`, which is easier to use, more featureful, and
#' still under active development.
#' `df %>% gather("key", "value", x, y, z)` is equivalent to
#' `df %>% pivot_longer(c(x, y, z), names_to = "key", values_to = "value")`
#'
#' See more details in `vignette("pivot")`.
#'
#' @section Rules for selection:
#'
#' Arguments for selecting columns are passed to [tidyselect::vars_select()]
#' and are treated specially. Unlike other verbs, selecting functions make a
#' strict distinction between data expressions and context expressions.
#'
#' * A data expression is either a bare name like `x` or an expression
#'   like `x:y` or `c(x, y)`. In a data expression, you can only refer
#'   to columns from the data frame.
#'
#' * Everything else is a context expression in which you can only
#'   refer to objects that you have defined with `<-`.
#'
#' For instance, `col1:col3` is a data expression that refers to data
#' columns, while `seq(start, end)` is a context expression that
#' refers to objects from the contexts.
#'
#' If you need to refer to contextual objects from a data expression, you can
#' use `all_of()` or `any_of()`. These functions are used to select
#' data-variables whose names are stored in a env-variable. For instance,
#' `all_of(a)` selects the variables listed in the character vector `a`.
#' For more details, see the [tidyselect::select_helpers()] documentation.
#'
#' @inheritParams expand
#' @param key,value Names of new key and value columns, as strings or
#'   symbols.
#'
#'   This argument is passed by expression and supports
#'   [quasiquotation][rlang::quasiquotation] (you can unquote strings
#'   and symbols). The name is captured from the expression with
#'   [rlang::ensym()] (note that this kind of interface where
#'   symbols do not represent actual objects is now discouraged in the
#'   tidyverse; we support it here for backward compatibility).
#' @param ... A selection of columns. If empty, all variables are
#'   selected. You can supply bare variable names, select all
#'   variables between x and z with `x:z`, exclude y with `-y`. For
#'   more options, see the [dplyr::select()] documentation. See also
#'   the section on selection rules below.
#' @param na.rm If `TRUE`, will remove rows from output where the
#'   value column is `NA`.
#' @param convert If `TRUE` will automatically run
#'   [type.convert()] on the key column. This is useful if the column
#'   types are actually numeric, integer, or logical.
#' @param factor_key If `FALSE`, the default, the key values will be
#'   stored as a character vector. If `TRUE`, will be stored as a factor,
#'   which preserves the original ordering of the columns.
#' @inheritParams gather_
#' @export
#' @examples
#' # From https://stackoverflow.com/questions/1181060
#' stocks <- tibble(
#'   time = as.Date("2009-01-01") + 0:9,
#'   X = rnorm(10, 0, 1),
#'   Y = rnorm(10, 0, 2),
#'   Z = rnorm(10, 0, 4)
#' )
#'
#' gather(stocks, "stock", "price", -time)
#' stocks %>% gather("stock", "price", -time)
#'
#' # get first observation for each Species in iris data -- base R
#' mini_iris <- iris[c(1, 51, 101), ]
#' # gather Sepal.Length, Sepal.Width, Petal.Length, Petal.Width
#' gather(mini_iris, key = "flower_att", value = "measurement",
#'        Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
#' # same result but less verbose
#' gather(mini_iris, key = "flower_att", value = "measurement", -Species)
gather <- function(data, key = "key", value = "value", ...,
                   na.rm = FALSE, convert = FALSE, factor_key = FALSE) {
  check_dots_unnamed()
  UseMethod("gather")
}
#' @export
gather.data.frame <- function(data, key = "key", value = "value", ...,
                              na.rm = FALSE, convert = FALSE,
                              factor_key = FALSE) {
  key_var <- as_string(ensym(key))
  value_var <- as_string(ensym(value))

  quos <- quos(...)
  if (is_empty(quos)) {
    gather_vars <- setdiff(names(data), c(key_var, value_var))
  } else {
    gather_vars <- unname(tidyselect::vars_select(tbl_vars(data), !!!quos))
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
  if (length(xs) <= 1) {
    return(TRUE)
  }
  for (i in seq(2, length(xs))) {
    if (!identical(xs[[1]], xs[[i]])) {
      return(FALSE)
    }
  }
  TRUE
}
