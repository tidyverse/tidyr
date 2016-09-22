#' Spread a key column accross multiple sub-columns.
#' 
#' This works the same as \code{\link{spread}} but with multiple 
#' columns simultaneously.
#' 
#' @param ... the bare (unquoted) names of columns that will populate 
#'            the cells and act as sub-columns of the values of 
#'            \code{key}.
#' @param sep Separator that goes between the key value and "..." 
#'            column names.
#' @inheritParams spread
#'
#' @seealso \code{\link{spread_each_}} for a version that uses regular evaluation
#'   and is suitable for programming with.
#'          \code{\link{spread}} for the the single variable version.
#' @author Andrew Redd \email{andrew.redd@hsc.utah.edu}
#' @export
#' @examples
#'    library(dplyr)
#'    # generate some data
#'    data <- expand.grid( x = c( 'a', 'b', 'c')
#'                       , y = c( 'd', 'e', 'f')
#'                       , .rep = 1:10
#'                       , stringsAsFactors=FALSE
#'                       ) %>%
#'            mutate( v = rnorm(90)) %>%
#'            group_by(x, y) %>%
#'            summarise(N=n(), sum=sum(v))
#'    # a data.frame with columns x, y, N, and sum.
#'             
#'    # Spread column y over columns N and sum
#'    spread_each(data, y, N, sum)
#'    # creates a tbl_df dataset with columns:
#'    #   x, d.N, d.sum, e.N, e.sum, f.N, f.sum
spread_each <- 
function( data          
        , key           
        , ...           
        , fill=NA       
        , convert=FALSE 
        , drop=FALSE    
        , sep='.'       
        ){
    spread_each_( data
                , key_col   = col_name(substitute(key))
                , .dots     = lazyeval::lazy_dots(...)
                , fill=fill, convert=convert, drop=drop, sep=sep
                )
}
    
#' Standard evaluation version of \code{spread_each}
#' 
#' @param ...       strings giving names of columns that will populate
#'                  the cells and act as sub-columns of the values of 
#'                  \code{key}.
#' @param .dots     a character vector 
#' @inheritParams   spread_each
#' @seealso \code{\link{spread_each}} for the lazy evaluation version.
#'          \code{\link{spread_}} for the single variable version.
#' @author Andrew Redd \email{andrew.redd@hsc.utah.edu}
#' @keywords internal
#' @export
spread_each_ <- 
function( data          
        , key_col       
        , ...           
        , .dots        = list()      
        , fill=NA       
        , convert=FALSE 
        , drop=FALSE    
        , sep='.'       
        ){
    new.dots        <- c(...)
    value.cols      <- dplyr::select_vars_(names(data), .dots, include=new.dots)
    grouping.cols   <- names(data) %>% setdiff(key_col) %>% setdiff(value.cols)
    old.groups      <- dplyr::groups(data)
        
    grouping.dots <- grouping.cols %>% 
        (lazyeval::as.lazy_dots)(.) %>%
        dplyr:::resolve_vars(dplyr::tbl_vars(data))
    
    data <- dplyr::group_by_(data, .dots=grouping.dots)
        
    col.order <- 
        unique(getElement(data, key_col)) %>% as.character() %>%
        lapply(., function(x, env){
            lazyeval::as.lazy(call('starts_with', x), env=env)
        }, env=environment()) %>%
        c(lapply(grouping.cols, lazyeval::as.lazy, env=environment()), .)
    lapply(value.cols, function(col){
            select.vars <- c(key_col, col, grouping.cols) %>%
                            lapply(as.name) %>%
                            (lazyeval::as.lazy_dots)(.) %>%
                            dplyr:::resolve_vars(dplyr::tbl_vars(data))
            x <- 
            spread_( data       = dplyr::select_(data, .dots=select.vars), 
                   , key_col    = key_col
                   , value_col  = col
                   , fill       = fill
                   , sep        = NULL
                   )
            newcols <- setdiff(names(x), grouping.cols)
            new.names <-  
                structure( newcols %>% lapply(as.name)  %>% lapply(lazyeval::as.lazy)
                         , names=paste(newcols, col, sep=sep)
                         )
            dplyr::rename_(.data=x, .dots=new.names)
        }) %>% 
        Reduce(f=function(x, y){dplyr::full_join(x,y,by=grouping.cols)}, x=.) %>%
        dplyr::select_(., .dots=col.order) %>%
        dplyr::group_by_(.dots=setdiff(old.groups, list(as.name(key_col))))
}
