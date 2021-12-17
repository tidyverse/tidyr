# nocov start

#' Defunct SE versions of main verbs
#'
#' @description
#' `r lifecycle::badge("defunct")`
#'
#' tidyr used to offer twin versions of each verb suffixed with an
#' underscore. These versions had standard evaluation (SE) semantics:
#' rather than taking arguments by code, like NSE verbs, they took
#' arguments by value. Their purpose was to make it possible to
#' program with tidyr. However, tidyr now uses tidy evaluation
#' semantics. NSE verbs still capture their arguments, but you can now
#' unquote parts of these arguments. This offers full programmability
#' with NSE verbs. Thus, the underscored versions are now superfluous.
#'
#' Unquoting triggers immediate evaluation of its operand and inlines
#' the result within the captured expression. This result can be a
#' value or an expression to be evaluated later with the rest of the
#' argument. See `vignette("programming", "dplyr")` for more information.
#'
#' @param data A data frame
#' @param vars,cols,col Name of columns.
#' @name deprecated-se
#' @keywords internal
NULL

#' @rdname deprecated-se
#' @inheritParams complete
#' @export
complete_ <- function(data, cols, fill = list(), ...) {
  lifecycle::deprecate_stop("1.2.0", "complete_()", "complete()")
}

#' @rdname deprecated-se
#' @export
drop_na_ <- function(data, vars) {
  lifecycle::deprecate_stop("1.2.0", "drop_na_()", "drop_na()")
}

#' @rdname deprecated-se
#' @param expand_cols Character vector of column names to be expanded.
#' @export
expand_ <- function(data, dots, ...) {
  lifecycle::deprecate_stop("1.2.0", "expand_()", "expand()")
}

#' @rdname deprecated-se
#' @param x For `nesting_` and `crossing_` a list of variables.
#' @export
crossing_ <- function(x) {
  lifecycle::deprecate_stop("1.2.0", "crossing_()", "crossing()")
}

#' @rdname deprecated-se
#' @export
nesting_ <- function(x) {
  lifecycle::deprecate_stop("1.2.0", "nesting_()", "nesting()")
}

#' @rdname deprecated-se
#' @inheritParams extract
#' @export
extract_ <- function(data, col, into, regex = "([[:alnum:]]+)", remove = TRUE,
                      convert = FALSE, ...) {
  lifecycle::deprecate_stop("1.2.0", "extract_()", "extract()")
}

#' @rdname deprecated-se
#' @inheritParams fill
#' @param fill_cols Character vector of column names.
#' @export
fill_ <- function(data, fill_cols, .direction = c("down", "up")) {
  lifecycle::deprecate_stop("1.2.0", "fill_()", "fill()")
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
  lifecycle::deprecate_stop("1.2.0", "gather_()", "gather()")
}

#' @rdname deprecated-se
#' @inheritParams nest
#' @keywords internal
#' @export
nest_ <- function(...) {
  lifecycle::deprecate_stop("1.0.0", "nest_()", "nest()")
}

#' @rdname deprecated-se
#' @inheritParams separate_rows
#' @export
separate_rows_ <- function(data, cols, sep = "[^[:alnum:].]+",
                           convert = FALSE) {
  lifecycle::deprecate_stop("1.2.0", "separate_rows_()", "separate_rows()")
}

#' @rdname deprecated-se
#' @inheritParams separate
#' @export
separate_ <- function(data, col, into, sep = "[^[:alnum:]]+", remove = TRUE,
                      convert = FALSE, extra = "warn", fill = "warn", ...) {
  lifecycle::deprecate_stop("1.2.0", "separate_()", "separate()")
}

#' @rdname deprecated-se
#' @inheritParams spread
#' @param key_col,value_col Strings giving names of key and value cols.
#' @export
spread_ <- function(data, key_col, value_col, fill = NA, convert = FALSE,
                    drop = TRUE, sep = NULL) {
  lifecycle::deprecate_stop("1.2.0", "spread_()", "spread()")
}

#' @rdname deprecated-se
#' @inheritParams unite
#' @param from Names of existing columns as character vector
#' @export
unite_ <- function(data, col, from, sep = "_", remove = TRUE) {
  lifecycle::deprecate_stop("1.2.0", "unite_()", "unite()")
}

#' @rdname deprecated-se
#' @inheritParams unnest
#' @export
unnest_ <- function(...) {
  lifecycle::deprecate_stop("1.0.0", "unnest_()", "unnest()")
}

# nocov end
