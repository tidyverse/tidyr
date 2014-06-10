#' Gather (standard-evaluation).
#'
#' @param data A data frame
#' @param key_var,value_var Strings giving names of key and value columns to
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
#' @examples
#' # From http://stackoverflow.com/questions/1181060
#' stocks <- data.frame(
#'  time = as.Date('2009-01-01') + 0:9,
#'  X = rnorm(10, 0, 1),
#'  Y = rnorm(10, 0, 2),
#'  Z = rnorm(10, 0, 4)
#' )
#' gather_q(stocks, "stock", "price", c("X", "Y", "Z"))
gather_q <- function(data, key_col, value_col, gather_cols, na.rm = FALSE,
                     convert = FALSE) {
  stopifnot(is.data.frame(data))

  data2 <- reshape2::melt(data, measure.vars = gather_cols,
    variable.name = key_col, value.name = value_col, na.rm = na.rm)

  if (convert) {
    data2[[key_col]] <- type.convert(data2[[key_col]], asis = TRUE)
  }

  data2
}
