#' Spread a key-value pair across multiple columns
#'
#' @description
#' \Sexpr[results=rd, stage=render]{lifecycle::badge("retired")}
#'
#' Development on `spread()` is complete, and for new code we recommend
#' switching to `pivot_wider()`, which is easier to use, more featureful, and
#' still under active development.
#' `df %>% spread(key, value)` is equivalent to
#' `df %>% pivot_wider(names_from = key, values_from = value)`
#'
#' See more details in `vignette("pivot")`.
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
#' df %>% spread(x, y) %>% gather("x", "y", a:b, na.rm = TRUE)
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
spread.data.frame <- function(data, key, value, fill = NA, convert = FALSE,
                              drop = TRUE, sep = NULL) {
  key_var <- tidyselect::vars_pull(names(data), !! enquo(key))
  value_var <- tidyselect::vars_pull(names(data), !! enquo(value))

  col <- data[key_var]
  col_id <- id(col, drop = drop)
  col_labels <- split_labels(col, col_id, drop = drop)

  rows <- data[setdiff(names(data), c(key_var, value_var))]
  if (ncol(rows) == 0 && nrow(rows) > 0) {
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

    shared <- sum(map_int(groups, length))

    str <- map_chr(groups, function(x) paste0(x, collapse = ", "))
    rows <- paste0(paste0("* ", str, "\n"), collapse = "")
    abort(glue(
      "Each row of output must be identified by a unique combination of keys.",
      "\nKeys are shared for {shared} rows:",
      "\n{rows}"
    ))
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
    if (length(names) == 0) {
      # ifelse will return logical()
      character()
    } else {
      ifelse(are_na(names), "<NA>", names)
    }
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
    out <- df[representative, , drop = FALSE]
    rownames(out) <- NULL
    out
  } else {
    unique_values <- map(df, ulevels)
    rev(expand.grid(rev(unique_values), stringsAsFactors = FALSE))
  }
}
ulevels <- function(x) {
  if (is.factor(x)) {
    orig_levs <- levels(x)
    x <- addNA(x, ifany = TRUE)
    levs <- levels(x)
    factor(levs, levels = orig_levs, ordered = is.ordered(x), exclude = NULL)
  } else if (is.list(x)) {
    unique(x)
  } else {
    sort(unique(x), na.last = TRUE)
  }
}
