#' Spread a key column accross multiple sub-columns.
#' 
#' This works the same as \code{\link{spread}} but with multiple 
#' columns simultaneously.
#' 
#' @param ...  the bare (unquoted) names of columns that will populate 
#'             the cells and act as sub-columns of the values of 
#'             \code{key}.
#' @param sep  Separator that goes between the key value and "..." 
#'             column names.
#' @param key.first Should the generated new name be "{key}{sep}{col}"(TRUE) or 
#'                  "{col}{sep}{key}"(FALSE)
#' @inheritParams spread
#'
#' @seealso \code{\link{spread}} for the the single variable version.
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
function( data             #< A <data.frame> or <tbl>
        , key              #< unquoted variable name to make into columns
        , ...              #< (sub-)columns of values 
        , fill   =NA       #< passed to <spread>.
        , convert=FALSE    #< passed to <spread>.
        , drop   =FALSE    #< passed to <spread>.
        , sep    ='.'      #< Separator that goes between the key value and "..." column names.
        , key.first = TRUE #< Should the generated new name be 
                           #< <key><sep><col>(TRUE) or 
                           #< <col><sep><key>(FALSE).
        ){
    #! Spread a key column with multiple sub columns
    #! 
    #! Creates a <tbl> with a  the values of key as columns with 
    #! the variables listed in ... as sub columns.
    old_groups <- as.character(dplyr::groups(data))
    key_var    <- tidyselect::vars_pull(names(data), !! enquo(key))
    val_vars   <- tidyselect::vars_select(names(data), !!!quos(...))
    other_vars <- names(data) %>% 
                  setdiff(key_var) %>% 
                  setdiff(val_vars)
    key.ids <- paste(unique(data[[key_var]]))

    if (any(. <- old_groups %in% c(key_var, val_vars))) {
        dropped <- old_groups[.]
        old_groups <- old_groups[!.]
        warning(glue( "Grouping column{if(length(dropped)) 's'} "
                    , "`{paste(dropped, collapse=', ')}` "
                    , "will be spread out."
                    ))
    }

    if (length(fill) == 1 )
        fill <- rep_along(val_vars, fill) %>% set_names(val_vars)
    if (!is_named(fill) && all(val_vars %in% names(fill)) )
        stop( "Bad fill list! "
            , "Fill should be a single value for all replacements "
            , "or a named list of values for each spread value variable."
            )
            
    spread1 <- function(col){
        if (key.first) 
            rename <- dplyr::funs(paste( . , col, sep=sep))
        else      
            rename <- dplyr::funs(paste(col,  . , sep=sep))
        
        data  %>% 
        dplyr::select(other_vars, key_var, col) %>%
        spread( key_var, col, fill=fill[[col]]
              , convert=convert
              ) %>%
        dplyr::ungroup() %>%
        dplyr::rename_at(key.ids, rename)
    }
    map(val_vars, spread1) %>% 
        Reduce(f = purrr::partial(dplyr::full_join, by=other_vars)) %>%
        dplyr::grouped_df(old_groups)
}
