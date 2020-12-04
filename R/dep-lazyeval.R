# nocov start

#' Deprecated SE versions of main verbs
#'
#' @description
#' `r lifecycle::badge("deprecated")`
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

#' @export
complete.default <- function(data, ..., fill = list()) {
  complete_(data, .dots = compat_as_lazy_dots(...), fill = fill)
}
#' @rdname deprecated-se
#' @inheritParams complete
#' @export
complete_ <- function(data, cols, fill = list(), ...) {
  lifecycle::deprecate_warn("1.0.0", "complete_()", "complete()")
  UseMethod("complete_")
}
#' @export
complete_.data.frame <- function(data, cols, fill = list(), ...) {
  cols <- compat_lazy_dots(cols, caller_env())
  complete(data, !!! cols, fill = fill)
}

#' @export
drop_na.default <- function(data, ...) {
  drop_na_(data, vars = compat_as_lazy_dots(...))
}
#' @rdname deprecated-se
#' @export
drop_na_ <- function(data, vars) {
  lifecycle::deprecate_warn("1.0.0", "drop_na_()", "drop_na()")
  UseMethod("drop_na_")
}
#' @export
drop_na_.data.frame <- function(data, vars) {
  drop_na(data, !!! vars)
}


#' @export
expand.default <- function(data, ...) {
  expand_(data, .dots = compat_as_lazy_dots(...))
}
#' @rdname deprecated-se
#' @param expand_cols Character vector of column names to be expanded.
#' @export
expand_ <- function(data, dots, ...) {
  lifecycle::deprecate_warn("1.0.0", "expand_()", "expand()")
  UseMethod("expand_")
}
#' @export
expand_.data.frame <- function(data, dots, ...) {
  dots <- compat_lazy_dots(dots, caller_env())
  expand(data, !!! dots)
}
#' @rdname deprecated-se
#' @param x For `nesting_` and `crossing_` a list of variables.
#' @export
crossing_ <- function(x) {
  lifecycle::deprecate_warn("1.0.0", "crossing_()", "crossing()")
  x <- compat_lazy_dots(x, caller_env())
  crossing(!!! x)
}
#' @rdname deprecated-se
#' @export
nesting_ <- function(x) {
  x <- compat_lazy_dots(x, caller_env())
  nesting(!!! x)
}

#' @export
extract.default <- function(data, col, into, regex = "([[:alnum:]]+)",
                            remove = TRUE, convert = FALSE, ...) {
  extract_(data,
    col = compat_as_lazy(enquo(col)),
    into = into,
    regex = regex,
    remove = remove,
    convert = convert,
    ...
  )
}
#' @rdname deprecated-se
#' @inheritParams extract
#' @export
extract_ <- function(data, col, into, regex = "([[:alnum:]]+)", remove = TRUE,
                      convert = FALSE, ...) {
  lifecycle::deprecate_warn("1.0.0", "extract_()", "extract()")
  UseMethod("extract_")
}
#' @export
extract_.data.frame <- function(data, col, into, regex = "([[:alnum:]]+)",
                                remove = TRUE, convert = FALSE, ...) {
  col <- compat_lazy(col, caller_env())
  extract(data,
    col = !! col,
    into = into,
    regex = regex,
    remove = remove,
    convert = convert,
    ...
  )
}

#' @export
fill.default <- function(data, ..., .direction = c("down", "up", "downup", "updown")) {
  fill_(data, fill_cols = compat_as_lazy_dots(...), .direction = .direction)
}
#' @rdname deprecated-se
#' @inheritParams fill
#' @param fill_cols Character vector of column names.
#' @export
fill_ <- function(data, fill_cols, .direction = c("down", "up")) {
  UseMethod("fill_")
}
#' @export
fill_.data.frame <- function(data, fill_cols, .direction = c("down", "up", "downup", "updown")) {
  vars <- syms(fill_cols)
  fill(data, !!! vars, .direction = .direction)
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
  key_col <- sym(key_col)
  value_col <- sym(value_col)
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

#' @rdname deprecated-se
#' @inheritParams nest
#' @keywords internal
#' @export
nest_ <- function(...) {
  lifecycle::deprecate_stop("1.0.0", "nest_()", "nest()")
}

#' @export
separate_rows.default <- function(data, ..., sep = "[^[:alnum:].]+",
                                  convert = FALSE) {
  cols <- compat_as_lazy_dots(...)
  separate_rows_(data, cols = cols, sep = sep)
}
#' @rdname deprecated-se
#' @inheritParams separate_rows
#' @export
separate_rows_ <- function(data, cols, sep = "[^[:alnum:].]+",
                           convert = FALSE) {
  UseMethod("separate_rows_")
}
#' @export
separate_rows_.data.frame <- function(data, cols, sep = "[^[:alnum:].]+",
                                      convert = FALSE) {
  cols <- syms(cols)
  separate_rows(data, !!! cols, sep = sep, convert = convert)
}

#' @export
separate.default <- function(data, col, into, sep = "[^[:alnum:]]+",
                             remove = TRUE, convert = FALSE,
                             extra = "warn", fill = "warn", ...) {
  col <- compat_as_lazy(enquo(col))
  separate_(data,
    col = col,
    into = into,
    sep = sep,
    remove = remove,
    convert = convert,
    extra = extra,
    fill = fill,
    ...
  )
}#' @rdname deprecated-se
#' @inheritParams separate
#' @export
separate_ <- function(data, col, into, sep = "[^[:alnum:]]+", remove = TRUE,
                      convert = FALSE, extra = "warn", fill = "warn", ...) {
  UseMethod("separate_")
}
#' @export
separate_.data.frame <- function(data, col, into, sep = "[^[:alnum:]]+",
                                 remove = TRUE, convert = FALSE,
                                 extra = "warn", fill = "warn", ...) {
  col <- sym(col)
  separate(data,
    col = !! col,
    into = into,
    sep = sep,
    remove = remove,
    convert = convert,
    extra = extra,
    fill = fill,
    ...
  )
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

#' @export
unite.default <- function(data, col, ..., sep = "_", remove = TRUE) {
  col <- compat_as_lazy(enquo(col))
  from <- compat_as_lazy_dots(...)
  unite_(data, col, from, sep = sep, remove = remove)
}
#' @rdname deprecated-se
#' @inheritParams unite
#' @param from Names of existing columns as character vector
#' @export
unite_ <- function(data, col, from, sep = "_", remove = TRUE) {
  UseMethod("unite_")
}
#' @export
unite_.data.frame <- function(data, col, from, sep = "_", remove = TRUE) {
  col <- quo_get_expr(compat_lazy(col, caller_env()))
  from <- syms(from)
  unite(data, !! col, !!! from, sep = sep, remove = remove)
}

#' @rdname deprecated-se
#' @inheritParams unnest
#' @export
unnest_ <- function(...) {
  lifecycle::deprecate_stop("1.0.0", "unnest_()", "unnest()")
}

# nocov end
