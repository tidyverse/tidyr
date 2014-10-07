#' Expanding your data.frame more flexible then \code{\link{expand}}
#' @description
#' This function expands your data.frame by the selected columns. It does not have an global \code{by_unique} like \code{\link{expand}}, but for every single column.
#' @param df This is the dataframe you want to expand
#' @param ... Here you enter your arrays with columnname and \code{TRUE} or \code{FALSE}. The latter works like by_unique in \code{\link{expand}}.
#' @param replace.na = T Replaces the NA which occur by expanding with zeros, very convenient for aggregations 
#' @usage expand(df, ..., replace.na = T, by_unique = F)
#' @keywords dataframe, expand, aggregations
#' @export
#' @examples
#' data <- data.frame(c(1,2,5), c(3,5,3), c(1,2,3))
#' names(data) <- c("a", "b", "c")
#' expand2(data, c("a", F), c("b", T))
#' data%.%expand(c("a", T), c("b", F))
#' 
#' 

expand2 <- function(df, ..., replace.na = T){
  ex <- list()
  for (li in list(...)) {
    l <- li[1]
    if(li[2] == T) {
      ex[[l]] <- unique(df[,l])
    } else {
      ex[[l]] <- min(df[,l]):max(df[,l])
    }
  }
  grid <- expand.grid(ex)
  res <- merge(grid, df, all.x = T)
  if(replace.na){
    res[is.na(res)] <- 0
  }
  return(res)
}