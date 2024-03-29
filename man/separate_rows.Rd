% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/separate-rows.R
\name{separate_rows}
\alias{separate_rows}
\title{Separate a collapsed column into multiple rows}
\usage{
separate_rows(data, ..., sep = "[^[:alnum:].]+", convert = FALSE)
}
\arguments{
\item{data}{A data frame.}

\item{...}{<\code{\link[=tidyr_tidy_select]{tidy-select}}> Columns to separate across
multiple rows}

\item{sep}{Separator delimiting collapsed values.}

\item{convert}{If \code{TRUE} will automatically run
\code{\link[=type.convert]{type.convert()}} on the key column. This is useful if the column
types are actually numeric, integer, or logical.}
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#superseded}{\figure{lifecycle-superseded.svg}{options: alt='[Superseded]'}}}{\strong{[Superseded]}}

\code{separate_rows()} has been superseded in favour of \code{\link[=separate_longer_delim]{separate_longer_delim()}}
because it has a more consistent API with other separate functions.
Superseded functions will not go away, but will only receive critical bug
fixes.

If a variable contains observations with multiple delimited values,
\code{separate_rows()} separates the values and places each one in its own row.
}
\examples{
df <- tibble(
  x = 1:3,
  y = c("a", "d,e,f", "g,h"),
  z = c("1", "2,3,4", "5,6")
)
separate_rows(df, y, z, convert = TRUE)

# Now recommended
df \%>\%
  separate_longer_delim(c(y, z), delim = ",")
}
