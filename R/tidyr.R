#' @keywords internal
#' @import rlang
#' @importFrom glue glue
#' @importFrom purrr accumulate accumulate_right discard every keep
#'   map map2 map2_chr map2_dbl map2_df map2_int map2_lgl map_at
#'   map_call map_chr map_dbl map_df map_if map_int map_lgl pmap
#'   pmap_chr pmap_dbl pmap_df pmap_int pmap_lgl reduce reduce_right
#'   some transpose
#' @importFrom tibble tibble as_tibble
#' @importFrom utils type.convert
#' @useDynLib tidyr, .registration = TRUE
"_PACKAGE"

globalVariables(".")


#' Deprecated SE versions of main verbs
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
