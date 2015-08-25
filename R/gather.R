#' Gather columns into key-value pairs.
#'
#' Gather takes multiple columns and collapses into key-value pairs,
#' duplicating all other columns as needed. You use \code{gather()} when
#' you notice that you have columns that are not variables.
#'
#' @param data A data frame.
#' @param key,value Names of key and value columns to create in output.
#' @param ... Specification of columns to gather. Use bare variable names.
#'   Select all variables between x and z with \code{x:z}, exclude y with
#'   \code{-y}. For more options, see the \link[dplyr]{select} documentation.
#' @inheritParams gather_
#' @seealso \code{\link{gather_}} for a version that uses regular evaluation
#'   and is suitable for programming with.
#' @export
#' @examples
#' library(dplyr)
#' # From http://stackoverflow.com/questions/1181060
#' stocks <- data.frame(
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
gather <- function(data, key, value, ..., na.rm = FALSE, convert = FALSE) {
  key_col <- col_name(substitute(key), "key")
  value_col <- col_name(substitute(value), "value")

  if (n_dots(...) == 0) {
    gather_cols <- setdiff(names(data), c(key_col, value_col))
  } else {
    gather_cols <- unname(dplyr::select_vars(names(data), ...))
  }

  gather_(data, key_col, value_col, gather_cols, na.rm = na.rm,
    convert = convert)
}

n_dots <- function(...) nargs()

#' Gather (standard-evaluation).
#'
#' This is a S3 generic.
#'
#' @param data A data frame
#' @param key_col,value_col Strings giving names of key and value columns to
#'   create.
#' @param gather_cols Character vector giving column names to be gathered into
#'   pair of key-value columns.
#' @param na.rm If \code{TRUE}, will remove rows from output where the
#'   value column in \code{NA}.
#' @param convert If \code{TRUE} will automatically run
#'   \code{\link{type.convert}} on the key column. This is useful if the column
#'   names are actually numeric, integer, or logical.
#' @keywords internal
#' @export
gather_ <- function(data, key_col, value_col, gather_cols, na.rm = FALSE,
                     convert = FALSE) {
  UseMethod("gather_")
}

#' @export
gather_.data.frame <- function(data, key_col, value_col, gather_cols,
                               na.rm = FALSE, convert = FALSE) {
  ## Return if we're not doing any gathering
  if (length(gather_cols) == 0) {
    return(data)
  }

  gather_idx <- match(gather_cols, names(data))
  if (anyNA(gather_idx)) {
    missing_cols <- paste(gather_cols[is.na(gather_idx)], collapse = ", ")
    stop("Unknown column names: ", missing_cols, call. = FALSE)
  }
  id_idx <- setdiff(seq_along(data), gather_idx)

  ## Get the attributes if common, NULL if not.
  args <- normalize_melt_arguments(data, gather_idx, factorsAsStrings = TRUE)
  measure.attributes <- args$measure.attributes
  factorsAsStrings <- args$factorsAsStrings
  valueAsFactor <- "factor" %in% measure.attributes$class

  df <- melt_dataframe(data,
    id_idx - 1L,
    gather_idx - 1L,
    as.character(key_col),
    as.character(value_col),
    as.pairlist(measure.attributes),
    as.logical(factorsAsStrings),
    as.logical(valueAsFactor)
  )

  if (na.rm) {
    missing <- is.na(df[[value_col]])
    df <- df[!missing, ]
  }

  if (convert) {
    df[[key_col]] <- type.convert(as.character(df[[key_col]]), as.is = TRUE)
  }

  df
}

#' @export
gather_.tbl_df <- function(data, key_col, value_col, gather_cols,
                           na.rm = FALSE, convert = FALSE) {
  dplyr::tbl_df(NextMethod())
}

#' @export
gather_.tbl_dt <- function(data, key_col, value_col, gather_cols,
                           na.rm = FALSE, convert = FALSE) {
  dplyr::tbl_dt(NextMethod())
}


# Functions from reshape2 -------------------------------------------------

## Get the attributes if common, NULL if not.
normalize_melt_arguments <- function(data, measure.ind, factorsAsStrings) {

  measure.attributes <- lapply(measure.ind, function(i) {
    attributes(data[[i]])
  })

  ## Determine if all measure.attributes are equal
  measure.attrs.equal <- all_identical(measure.attributes)

  if (measure.attrs.equal) {
    measure.attributes <- measure.attributes[[1]]
  } else {
    warning("attributes are not identical across measure variables; ",
      "they will be dropped", call. = FALSE)
    measure.attributes <- NULL
  }

  if (!factorsAsStrings && !measure.attrs.equal) {
    warning("cannot avoid coercion of factors when measure attributes not identical",
      call. = FALSE)
    factorsAsStrings <- TRUE
  }

  ## If we are going to be coercing any factors to strings, we don't want to
  ## copy the attributes
  any.factors <- any( sapply( measure.ind, function(i) {
    is.factor(data[[i]])
  }))

  if (factorsAsStrings && any.factors) {
    measure.attributes <- NULL
  }

  list(
    measure.attributes = measure.attributes,
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
