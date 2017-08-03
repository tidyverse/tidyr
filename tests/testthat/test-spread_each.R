context("spread_each")
library(dplyr, warn.conflicts = FALSE)

test_that("columns are named correctly", {
    data <- expand.grid( x = c( 'a', 'b', 'c')
                       , y = c( 'd', 'e', 'f')
                       , .rep = 1:10
                       , stringsAsFactors=FALSE
                       ) %>%
            mutate( v = rnorm(90)) %>%
            group_by(x, y) %>%
            summarise(N=n(), sum=sum(v))
    out <- spread_each(data, y, N, sum)
    expect_equal(dim(out), c(3, 7))
    expect_equal(names(out), c('x', 'd.N', 'e.N', 'f.N', 'd.sum', 'e.sum', 'f.sum'))
})
test_that("spread_each is silent", {
    data <- expand.grid( x = c( 'a', 'b', 'c')
                       , y = c( 'd', 'e', 'f')
                       , .rep = 1:10
                       , stringsAsFactors=FALSE
                       ) %>%
            mutate( v = rnorm(90)) %>%
            group_by(x, y) %>%
            summarise(N=n(), sum=sum(v))
    expect_silent( spread_each(data, y, N, sum) )
})
test_that("non-standard names are handled", {
    data <- expand.grid( x = c( 'a', 'b', 'c')
                       , y = c( 'd', 'e', 'f')
                       , .rep = 1:10
                       , stringsAsFactors=FALSE
                       ) %>%
            mutate( i = sample(c(TRUE, FALSE), 90 , replace=TRUE) ) %>%
            group_by(x, y) %>%
            summarise( "N with" = sum(i)
                     , "%"      = mean(i)
                     ) %>% 
            ungroup
    out1 <- spread_each(data, y, `N with`, `%`)
    expect_equal(names(out1), c("x", "d.N with", "e.N with", "f.N with", "d.%", "e.%", "f.%"))

    out2 <- spread_each(data, 'y', 'N with', '%')
    expect_equal(names(out2), c("x", "d.N with", "e.N with", "f.N with", "d.%", "e.%", "f.%"))
    
    expect_identical(out1, out2)
})
test_that("Preserves grouping colums", {
    data <- expand.grid( x = c( 'a', 'b', 'c')
                       , y = c( 'd', 'e', 'f')
                       , z = c( 'g', 'h')
                       , stringsAsFactors=FALSE
                       ) %>%
            mutate( N = sample(1:100, 18, replace=TRUE) ) %>%
            group_by(x)
    out <- spread_each(data, y, N)
    expect_identical(groups(data), groups(out))
    
    # grouping column is the key column
    data2 <- group_by(data, x, y)
    expect_warning(out2 <- spread_each(data2, y, N))
    expect_identical(groups(out2), groups(data))
})
