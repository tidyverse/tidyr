#' @keywords internal
#' @import rlang
#' @import vctrs
#' @importFrom glue glue
#' @importFrom dplyr tbl_vars
#' @importFrom utils type.convert
#' @importFrom lifecycle deprecated
#' @importFrom tidyselect any_of
#' @useDynLib tidyr, .registration = TRUE
"_PACKAGE"

globalVariables(".")

#' @importFrom tibble tribble
#' @export
tibble::tribble

#' @importFrom tibble tibble
#' @export
tibble::tibble

#' @importFrom tibble as_tibble
#' @export
tibble::as_tibble


#' @aliases select_helpers
#' @importFrom tidyselect contains
#' @export
tidyselect::contains
#' @importFrom tidyselect ends_with
#' @export
tidyselect::ends_with
#' @importFrom tidyselect everything
#' @export
tidyselect::everything
#' @importFrom tidyselect matches
#' @export
tidyselect::matches
#' @importFrom tidyselect num_range
#' @export
tidyselect::num_range
#' @importFrom tidyselect one_of
#' @export
tidyselect::one_of
#' @importFrom tidyselect starts_with
#' @export
tidyselect::starts_with
#' @importFrom tidyselect last_col
#' @export
tidyselect::last_col
