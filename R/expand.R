#' Expanding your data.frame with the magic of expand.grid.
#' @description
#' This function expands your data.frame by min to max of the selected columns.
#' @param df This is the dataframe you want to expand
#' @param ... Here you enter your colunms (as strings)
#' @param replace.na = T Replaces the NA which occur by expanding with zeros, very convenient for aggregations 
#' @param by_unique = F Expands by the unique values in the columns and not from min to max, convenient for strings 
#' @usage expand(df, ..., replace.na = T, by_unique = F)
#' @keywords dataframe, expand, aggregations
#' @export
#' @examples
#' data <- data.frame(c(1,2,5), c(3,5,3), c(1,2,3))
#' names(data) <- c("a", "b", "c")
#' expand(data, "a", "b")
#' data%.%expand("a", "b")
#' 
#' 

expand <- function(df, ..., replace.na = T, by_unique = F){
  if(nrow(df) == 0) {
    return(df)
  } else {   
    ex <- list()
    for (l in list(...)) {
      if(by_unique) {
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
}