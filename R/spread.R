#' Spread a key-value pair across multiple columns.
#'
#' @param data A data frame.
#' @param key,value Column names or positions. This is passed to
#'   [tidyselect::vars_pull()].
#'
#'   These arguments are passed by expression and support
#'   [quasiquotation][rlang::quasiquotation] (you can unquote column
#'   names or column positions).
#' @param fill If set, missing values will be replaced with this value. Note
#'   that there are two types of missingness in the input: explicit missing
#'   values (i.e. `NA`), and implicit missings, rows that simply aren't
#'   present. Both types of missing value will be replaced by `fill`.
#' @param convert If `TRUE`, [type.convert()] with \code{asis =
#'   TRUE} will be run on each of the new columns. This is useful if the value
#'   column was a mix of variables that was coerced to a string. If the class of
#'   the value column was factor or date, note that will not be true of the new
#'   columns that are produced, which are coerced to character before type
#'   conversion.
#' @param drop If `FALSE`, will keep factor levels that don't appear in the
#'   data, filling in missing combinations with `fill`.
#' @param sep If `NULL`, the column names will be taken from the values of
#'   `key` variable. If non-`NULL`, the column names will be given
#'   by "<key_name><sep><key_value>".
#' @export
#' @examples
#' library(dplyr)
#' stocks <- data.frame(
#'   time = as.Date('2009-01-01') + 0:9,
#'   X = rnorm(10, 0, 1),
#'   Y = rnorm(10, 0, 2),
#'   Z = rnorm(10, 0, 4)
#' )
#' stocksm <- stocks %>% gather(stock, price, -time)
#' stocksm %>% spread(stock, price)
#' stocksm %>% spread(time, price)
#'
#' # Spread and gather are complements
#' df <- data.frame(x = c("a", "b"), y = c(3, 4), z = c(5, 6))
#' df %>% spread(x, y) %>% gather(x, y, a:b, na.rm = TRUE)
#'
#' # Use 'convert = TRUE' to produce variables of mixed type
#' df <- data.frame(row = rep(c(1, 51), each = 3),
#'                  var = c("Sepal.Length", "Species", "Species_num"),
#'                  value = c(5.1, "setosa", 1, 7.0, "versicolor", 2))
#' df %>% spread(var, value) %>% str
#' df %>% spread(var, value, convert = TRUE) %>% str
spread <- function(data, key, value, fill = NA, convert = FALSE,
                   drop = TRUE, sep = NULL) {
  UseMethod("spread")
}
#' @export
spread.default <- function(data, key, value, fill = NA, convert = FALSE,
                           drop = TRUE, sep = NULL) {
  key <- compat_as_lazy(enquo(key))
  value <- compat_as_lazy(enquo(value))
  spread_(data,
    key_col = key,
    value_col = value,
    fill = fill,
    convert = convert,
    drop = drop,
    sep = sep
  )
}
#' @export
spread.data.frame <- function(data, key, value, fill = NA, convert = FALSE,
                              drop = TRUE, sep = NULL) {
  key_var <- tidyselect::vars_pull(names(data), !! enquo(key))
  value_var <- tidyselect::vars_pull(names(data), !! enquo(value))

  col <- data[key_var]
  col_id <- id(col, drop = drop)
  col_labels <- split_labels(col, col_id, drop = drop)

  rows <- data[setdiff(names(data), c(key_var, value_var))]
  if (length(rows) == 0) {
    # Special case when there's only one row
    row_id <- structure(1L, n = 1L)
    row_labels <- as.data.frame(matrix(nrow = 1, ncol = 0))
  } else {
    row_id <- id(rows, drop = drop)
    row_labels <- split_labels(rows, row_id, drop = drop)
    rownames(row_labels) <- NULL
  }

  overall <- id(list(col_id, row_id), drop = FALSE)
  n <- attr(overall, "n")
  # Check that each output value occurs in unique location
  if (anyDuplicated(overall)) {
    groups <- split(seq_along(overall), overall)
    groups <- groups[map_int(groups, length) > 1]

    str <- map_chr(groups, function(x) paste0("(", paste0(x, collapse = ", "), ")"))
    rows <- paste(str, collapse = ", ")
    abort(glue("Duplicate identifiers for rows {rows}"))
  }

  # Add in missing values, if necessary
  if (length(overall) < n) {
    overall <- match(seq_len(n), overall, nomatch = NA)
  } else {
    overall <- order(overall)
  }

  value <- data[[value_var]]
  ordered <- value[overall]
  if (!is.na(fill)) {
    ordered[is.na(ordered)] <- fill
  }

  if (convert && !is_character(ordered)) {
    ordered <- as.character(ordered)
  }
  dim(ordered) <- c(attr(row_id, "n"), attr(col_id, "n"))
  colnames(ordered) <- enc2utf8(col_names(col_labels, sep = sep))

  ordered <- as_tibble_matrix(ordered)

  if (convert) {
    ordered[] <- map(ordered, type.convert, as.is = TRUE)
  }

  out <- append_df(row_labels, ordered)
  reconstruct_tibble(data, out, c(key_var, value_var))
}

col_names <- function(x, sep = NULL) {
  names <- as.character(x[[1]])

  if (is_null(sep)) {
    ifelse(are_na(names), "<NA>", names)
  } else {
    paste(names(x)[[1]], names, sep = sep)
  }
}
as_tibble_matrix <- function(x) {
  # getS3method() only available in R >= 3.3
  get("as_tibble.matrix", asNamespace("tibble"), mode = "function")(x)
}
split_labels <- function(df, id, drop = TRUE) {
  if (length(df) == 0) {
    return(df)
  }

  if (drop) {
    representative <- match(sort(unique(id)), id)
    df[representative, , drop = FALSE]
  } else {
    unique_values <- map(df, ulevels)
    rev(expand.grid(rev(unique_values), stringsAsFactors = FALSE))
  }
}
ulevels <- function(x) {
  if (is.factor(x)) {
    x <- addNA(x, ifany = TRUE)
    levs <- levels(x)
    factor(levs, levels = levs, ordered = is.ordered(x))
  } else {
    sort(unique(x))
  }
}


#' @rdname deprecated-se
#' @inheritParams spread
#' @param key_col,value_col Strings giving names of key and value cols.
#' @export
spread_ <- function(data, key_col, value_col, fill = NA, convert = FALSE,
                    drop = TRUE, sep = NULL) {
  UseMethod("spread_")
}
#' @export
spread_.data.frame <- function(data, key_col, value_col, fill = NA,
                               convert = FALSE, drop = TRUE, sep = NULL) {
  key_col <- sym(key_col)
  value_col <- sym(value_col)

  spread(data,
    key = !! key_col,
    value = !! value_col,
    fill = fill,
    convert = convert,
    drop = drop,
    sep = sep
  )
}
