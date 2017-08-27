#' Gather columns into key-value pairs.
#'
#' Gather takes multiple columns and collapses into key-value pairs,
#' duplicating all other columns as needed. You use `gather()` when
#' you notice that you have columns that are not variables.
#'
#' @section Rules for selection:
#'
#' Arguments for selecting columns are passed to
#' [tidyselect::vars_select()] and are treated specially. Unlike other
#' verbs, selecting functions make a strict distinction between data
#' expressions and context expressions.
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
#' If you really need to refer to contextual objects from a data
#' expression, you can unquote them with the tidy eval operator
#' `!!`. This operator evaluates its argument in the context and
#' inlines the result in the surrounding function call. For instance,
#' `c(x, !! x)` selects the `x` column within the data frame and the
#' column referred to by the object `x` defined in the context (which
#' can contain either a column name as string or a column position).
#'
#' @inheritParams expand
#' @param key,value Names of new key and value columns, as strings or
#'   symbols.
#'
#'   This argument is passed by expression and supports
#'   [quasiquotation][rlang::quasiquotation] (you can unquote strings
#'   and symbols). The name is captured from the expression with
#'   [rlang::quo_name()] (note that this kind of interface where
#'   symbols do not represent actual objects is now discouraged in the
#'   tidyverse; we support it here for backward compatibility).
#' @param ... A selection of columns. If empty, all variables are
#'   selected. You can supply bare variable names, select all
#'   variables between x and z with `x:z`, exclude y with `-y`. For
#'   more options, see the [dplyr::select()] documentation. See also
#'   the section on selection rules below.
#' @param na.rm If `TRUE`, will remove rows from output where the
#'   value column in `NA`.
#' @param convert If `TRUE` will automatically run
#'   [type.convert()] on the key column. This is useful if the column
#'   names are actually numeric, integer, or logical.
#' @param factor_key If `FALSE`, the default, the key values will be
#'   stored as a character vector. If `TRUE`, will be stored as a factor,
#'   which preserves the original ordering of the columns.
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
gather <- function(data, key = "key", value = "value", ...,
                   na.rm = FALSE, convert = FALSE, factor_key = FALSE) {
  UseMethod("gather")
}
#' @export
gather.default <- function(data, key = "key", value = "value", ...,
                           na.rm = FALSE, convert = FALSE,
                           factor_key = FALSE) {
  gather_(data,
    key_col = compat_as_lazy(enquo(key)),
    value_col = compat_as_lazy(enquo(value)),
    ...,
    na.rm = na.rm,
    convert = convert,
    factor_key = factor_key
  )
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
  if (anyNA(gather_idx)) {
    missing_cols <- paste(gather_vars[is.na(gather_idx)], collapse = ", ")
    abort(glue("Unknown column names: ", missing_cols))
  }
  id_idx <- setdiff(seq_along(data), gather_idx)

  ## Get the attributes if common, NULL if not.
  args <- normalize_melt_arguments(data, gather_idx, factorsAsStrings = TRUE)
  valueAsFactor <- "factor" %in% class(args$attr_template)

  out <- melt_dataframe(data,
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
normalize_melt_arguments <- function(data, measure.ind, factorsAsStrings) {

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
       they will be dropped"))
    attr_template <- NULL
  }

  if (!factorsAsStrings && !measure.attrs.equal) {
    warn("cannot avoid coercion of factors when measure attributes not identical")
    factorsAsStrings <- TRUE
  }

  ## If we are going to be coercing any factors to strings, we don't want to
  ## copy the attributes
  any.factors <- any(map_lgl(measure.ind, function(i) is.factor(data[[i]])))

  if (factorsAsStrings && any.factors) {
    attr_template <- NULL
  }

  list(
    attr_template = attr_template,
    factorsAsStrings = factorsAsStrings
  )
}

all_identical <- function(xs) {
  if (length(xs) <= 1) return(TRUE)
  for (i in seq(2, length(xs))) {
    if (!identical(xs[[1]], xs[[i]])) return(FALSE)
  }
  TRUE
}


#' @rdname deprecated-se
#' @inheritParams gather
#' @param key_col,value_col Strings giving names of key and value columns to
#'   create.
#' @param gather_cols Character vector giving column names to be gathered into
#'   pair of key-value columns.
#' @keywords internal
#' @export
gather_ <- function(data, key_col, value_col, gather_cols, na.rm = FALSE,
                    convert = FALSE, factor_key = FALSE) {
  UseMethod("gather_")
}
#' @export
gather_.data.frame <- function(data, key_col, value_col, gather_cols,
                               na.rm = FALSE, convert = FALSE,
                               factor_key = FALSE) {
  key_col <- compat_lazy(key_col, caller_env())
  value_col <- compat_lazy(value_col, caller_env())
  gather_cols <- syms(gather_cols)

  gather(data,
    key = !! key_col,
    value = !! value_col,
    !!! gather_cols,
    na.rm = na.rm,
    convert = convert,
    factor_key = factor_key
  )
}
