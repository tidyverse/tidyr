# Rectangling

## Introduction

Rectangling is the art and craft of taking a deeply nested list (often
sourced from wild caught JSON or XML) and taming it into a tidy data set
of rows and columns. There are three functions from tidyr that are
particularly useful for rectangling:

- [`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md)
  takes each element of a list-column and makes a new row.
- [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
  takes each element of a list-column and makes a new column.
- [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md) is
  similar to
  [`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
  but only plucks out selected components, and can reach down multiple
  levels.

A very large number of data rectangling problems can be solved by
combining
[`jsonlite::read_json()`](https://jeroen.r-universe.dev/jsonlite/reference/read_json.html)
with these functions and a splash of dplyr (largely eliminating prior
approaches that combined
[`mutate()`](https://dplyr.tidyverse.org/reference/mutate.html) with
multiple
[`purrr::map()`](https://purrr.tidyverse.org/reference/map.html)s). Note
that jsonlite has another important function called `fromJSON()`. We
don’t recommend it here because it performs its own automatic
simplification (`simplifyVector = TRUE`). This often works well,
particularly in simple cases, but we think you’re better off doing the
rectangling yourself so you know exactly what’s happening and can more
easily handle the most complicated nested structures.

To illustrate these techniques, we’ll use the repurrrsive package, which
provides a number deeply nested lists originally mostly captured from
web APIs.

``` r
library(tidyr)
library(dplyr)
library(repurrrsive)
```

## GitHub users

We’ll start with `gh_users`, a list which contains information about six
GitHub users. To begin, we put the `gh_users` list into a data frame:

``` r
users <- tibble(user = gh_users)
```

This seems a bit counter-intuitive: why is the first step in making a
list simpler to make it more complicated? But a data frame has a big
advantage: it bundles together multiple vectors so that everything is
tracked together in a single object.

Each `user` is a named list, where each element represents a column.

``` r
names(users$user[[1]])
#>  [1] "login"               "id"                  "avatar_url"         
#>  [4] "gravatar_id"         "url"                 "html_url"           
#>  [7] "followers_url"       "following_url"       "gists_url"          
#> [10] "starred_url"         "subscriptions_url"   "organizations_url"  
#> [13] "repos_url"           "events_url"          "received_events_url"
#> [16] "type"                "site_admin"          "name"               
#> [19] "company"             "blog"                "location"           
#> [22] "email"               "hireable"            "bio"                
#> [25] "public_repos"        "public_gists"        "followers"          
#> [28] "following"           "created_at"          "updated_at"
```

There are two ways to turn the list components into columns.
[`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
takes every component and makes a new column:

``` r
users |> unnest_wider(user)
#> # A tibble: 6 × 30
#>   login          id avatar_url gravatar_id url   html_url followers_url
#>   <chr>       <int> <chr>      <chr>       <chr> <chr>    <chr>        
#> 1 gaborcsar… 6.60e5 https://a… ""          http… https:/… https://api.…
#> 2 jennybc    5.99e5 https://a… ""          http… https:/… https://api.…
#> 3 jtleek     1.57e6 https://a… ""          http… https:/… https://api.…
#> 4 juliasilge 1.25e7 https://a… ""          http… https:/… https://api.…
#> 5 leeper     3.51e6 https://a… ""          http… https:/… https://api.…
#> 6 masalmon   8.36e6 https://a… ""          http… https:/… https://api.…
#> # ℹ 23 more variables: following_url <chr>, gists_url <chr>,
#> #   starred_url <chr>, subscriptions_url <chr>,
#> #   organizations_url <chr>, repos_url <chr>, events_url <chr>,
#> #   received_events_url <chr>, type <chr>, site_admin <lgl>,
#> #   name <chr>, company <chr>, blog <chr>, location <chr>,
#> #   email <chr>, hireable <lgl>, bio <chr>, public_repos <int>,
#> #   public_gists <int>, followers <int>, following <int>, …
```

But in this case, there are many components and we don’t need most of
them so we can instead use
[`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md).
[`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md) allows
us to pull out selected components using the same syntax as
[`purrr::pluck()`](https://purrr.tidyverse.org/reference/pluck.html):

``` r
users |> hoist(user,
  followers = "followers",
  login = "login",
  url = "html_url"
)
#> # A tibble: 6 × 4
#>   followers login       url                            user        
#>       <int> <chr>       <chr>                          <list>      
#> 1       303 gaborcsardi https://github.com/gaborcsardi <named list>
#> 2       780 jennybc     https://github.com/jennybc     <named list>
#> 3      3958 jtleek      https://github.com/jtleek      <named list>
#> 4       115 juliasilge  https://github.com/juliasilge  <named list>
#> 5       213 leeper      https://github.com/leeper      <named list>
#> 6        34 masalmon    https://github.com/masalmon    <named list>
```

[`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md) removes
the named components from the `user` list-column, so you can think of it
as moving components out of the inner list into the top-level data
frame.

## GitHub repos

We start off `gh_repos` similarly, by putting it in a tibble:

``` r
repos <- tibble(repo = gh_repos)
repos
#> # A tibble: 6 × 1
#>   repo       
#>   <list>     
#> 1 <list [30]>
#> 2 <list [30]>
#> 3 <list [30]>
#> 4 <list [26]>
#> 5 <list [30]>
#> 6 <list [30]>
```

This time the elements of `repos` are a list of repositories that belong
to that user. These are observations, so should become new rows, so we
use
[`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md)
rather than
[`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md):

``` r
repos <- repos |> unnest_longer(repo)
repos
#> # A tibble: 176 × 1
#>    repo             
#>    <list>           
#>  1 <named list [68]>
#>  2 <named list [68]>
#>  3 <named list [68]>
#>  4 <named list [68]>
#>  5 <named list [68]>
#>  6 <named list [68]>
#>  7 <named list [68]>
#>  8 <named list [68]>
#>  9 <named list [68]>
#> 10 <named list [68]>
#> # ℹ 166 more rows
```

Then we can use
[`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md)
or [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md):

``` r
repos |> hoist(repo,
  login = c("owner", "login"),
  name = "name",
  homepage = "homepage",
  watchers = "watchers_count"
)
#> # A tibble: 176 × 5
#>    login       name        homepage watchers repo             
#>    <chr>       <chr>       <chr>       <int> <list>           
#>  1 gaborcsardi after       NA              5 <named list [65]>
#>  2 gaborcsardi argufy      NA             19 <named list [65]>
#>  3 gaborcsardi ask         NA              5 <named list [65]>
#>  4 gaborcsardi baseimports NA              0 <named list [65]>
#>  5 gaborcsardi citest      NA              0 <named list [65]>
#>  6 gaborcsardi clisymbols  ""             18 <named list [65]>
#>  7 gaborcsardi cmaker      NA              0 <named list [65]>
#>  8 gaborcsardi cmark       NA              0 <named list [65]>
#>  9 gaborcsardi conditions  NA              0 <named list [65]>
#> 10 gaborcsardi crayon      NA             52 <named list [65]>
#> # ℹ 166 more rows
```

Note the use of `c("owner", "login")`: this allows us to reach two
levels deep inside of a list. An alternative approach would be to pull
out just `owner` and then put each element of it in a column:

``` r
repos |>
  hoist(repo, owner = "owner") |>
  unnest_wider(owner)
#> # A tibble: 176 × 18
#>    login         id avatar_url gravatar_id url   html_url followers_url
#>    <chr>      <int> <chr>      <chr>       <chr> <chr>    <chr>        
#>  1 gaborcsa… 660288 https://a… ""          http… https:/… https://api.…
#>  2 gaborcsa… 660288 https://a… ""          http… https:/… https://api.…
#>  3 gaborcsa… 660288 https://a… ""          http… https:/… https://api.…
#>  4 gaborcsa… 660288 https://a… ""          http… https:/… https://api.…
#>  5 gaborcsa… 660288 https://a… ""          http… https:/… https://api.…
#>  6 gaborcsa… 660288 https://a… ""          http… https:/… https://api.…
#>  7 gaborcsa… 660288 https://a… ""          http… https:/… https://api.…
#>  8 gaborcsa… 660288 https://a… ""          http… https:/… https://api.…
#>  9 gaborcsa… 660288 https://a… ""          http… https:/… https://api.…
#> 10 gaborcsa… 660288 https://a… ""          http… https:/… https://api.…
#> # ℹ 166 more rows
#> # ℹ 11 more variables: following_url <chr>, gists_url <chr>,
#> #   starred_url <chr>, subscriptions_url <chr>,
#> #   organizations_url <chr>, repos_url <chr>, events_url <chr>,
#> #   received_events_url <chr>, type <chr>, site_admin <lgl>,
#> #   repo <list>
```

## Game of Thrones characters

`got_chars` has a similar structure to `gh_users`: it’s a list of named
lists, where each element of the inner list describes some attribute of
a GoT character. We start in the same way, first by creating a data
frame and then by unnesting each component into a column:

``` r
chars <- tibble(char = got_chars)
chars
#> # A tibble: 30 × 1
#>    char             
#>    <list>           
#>  1 <named list [18]>
#>  2 <named list [18]>
#>  3 <named list [18]>
#>  4 <named list [18]>
#>  5 <named list [18]>
#>  6 <named list [18]>
#>  7 <named list [18]>
#>  8 <named list [18]>
#>  9 <named list [18]>
#> 10 <named list [18]>
#> # ℹ 20 more rows

chars2 <- chars |> unnest_wider(char)
chars2
#> # A tibble: 30 × 18
#>    url         id name  gender culture born  died  alive titles aliases
#>    <chr>    <int> <chr> <chr>  <chr>   <chr> <chr> <lgl> <list> <list> 
#>  1 https:/…  1022 Theo… Male   "Ironb… "In … ""    TRUE  <chr>  <chr>  
#>  2 https:/…  1052 Tyri… Male   ""      "In … ""    TRUE  <chr>  <chr>  
#>  3 https:/…  1074 Vict… Male   "Ironb… "In … ""    TRUE  <chr>  <chr>  
#>  4 https:/…  1109 Will  Male   ""      ""    "In … FALSE <chr>  <chr>  
#>  5 https:/…  1166 Areo… Male   "Norvo… "In … ""    TRUE  <chr>  <chr>  
#>  6 https:/…  1267 Chett Male   ""      "At … "In … FALSE <chr>  <chr>  
#>  7 https:/…  1295 Cres… Male   ""      "In … "In … FALSE <chr>  <chr>  
#>  8 https:/…   130 Aria… Female "Dorni… "In … ""    TRUE  <chr>  <chr>  
#>  9 https:/…  1303 Daen… Female "Valyr… "In … ""    TRUE  <chr>  <chr>  
#> 10 https:/…  1319 Davo… Male   "Weste… "In … ""    TRUE  <chr>  <chr>  
#> # ℹ 20 more rows
#> # ℹ 8 more variables: father <chr>, mother <chr>, spouse <chr>,
#> #   allegiances <list>, books <list>, povBooks <list>,
#> #   tvSeries <list>, playedBy <list>
```

This is more complex than `gh_users` because some component of `char`
are themselves a list, giving us a collection of list-columns:

``` r
chars2 |> select_if(is.list)
#> # A tibble: 30 × 7
#>    titles    aliases    allegiances books  povBooks  tvSeries  playedBy
#>    <list>    <list>     <list>      <list> <list>    <list>    <list>  
#>  1 <chr [2]> <chr [4]>  <chr [1]>   <chr>  <chr [2]> <chr [6]> <chr>   
#>  2 <chr [2]> <chr [11]> <chr [1]>   <chr>  <chr [4]> <chr [6]> <chr>   
#>  3 <chr [2]> <chr [1]>  <chr [1]>   <chr>  <chr [2]> <chr [1]> <chr>   
#>  4 <chr [1]> <chr [1]>  <NULL>      <chr>  <chr [1]> <chr [1]> <chr>   
#>  5 <chr [1]> <chr [1]>  <chr [1]>   <chr>  <chr [2]> <chr [2]> <chr>   
#>  6 <chr [1]> <chr [1]>  <NULL>      <chr>  <chr [1]> <chr [1]> <chr>   
#>  7 <chr [1]> <chr [1]>  <NULL>      <chr>  <chr [1]> <chr [1]> <chr>   
#>  8 <chr [1]> <chr [1]>  <chr [1]>   <chr>  <chr [1]> <chr [1]> <chr>   
#>  9 <chr [5]> <chr [11]> <chr [1]>   <chr>  <chr [4]> <chr [6]> <chr>   
#> 10 <chr [4]> <chr [5]>  <chr [2]>   <chr>  <chr [3]> <chr [5]> <chr>   
#> # ℹ 20 more rows
```

What you do next will depend on the purposes of the analysis. Maybe you
want a row for every book and TV series that the character appears in:

``` r
chars2 |>
  select(name, books, tvSeries) |>
  pivot_longer(c(books, tvSeries), names_to = "media", values_to = "value") |>
  unnest_longer(value)
#> # A tibble: 179 × 3
#>    name             media    value            
#>    <chr>            <chr>    <chr>            
#>  1 Theon Greyjoy    books    A Game of Thrones
#>  2 Theon Greyjoy    books    A Storm of Swords
#>  3 Theon Greyjoy    books    A Feast for Crows
#>  4 Theon Greyjoy    tvSeries Season 1         
#>  5 Theon Greyjoy    tvSeries Season 2         
#>  6 Theon Greyjoy    tvSeries Season 3         
#>  7 Theon Greyjoy    tvSeries Season 4         
#>  8 Theon Greyjoy    tvSeries Season 5         
#>  9 Theon Greyjoy    tvSeries Season 6         
#> 10 Tyrion Lannister books    A Feast for Crows
#> # ℹ 169 more rows
```

Or maybe you want to build a table that lets you match title to name:

``` r
chars2 |>
  select(name, title = titles) |>
  unnest_longer(title)
#> # A tibble: 59 × 2
#>    name              title                                             
#>    <chr>             <chr>                                             
#>  1 Theon Greyjoy     "Prince of Winterfell"                            
#>  2 Theon Greyjoy     "Lord of the Iron Islands (by law of the green la…
#>  3 Tyrion Lannister  "Acting Hand of the King (former)"                
#>  4 Tyrion Lannister  "Master of Coin (former)"                         
#>  5 Victarion Greyjoy "Lord Captain of the Iron Fleet"                  
#>  6 Victarion Greyjoy "Master of the Iron Victory"                      
#>  7 Will              ""                                                
#>  8 Areo Hotah        "Captain of the Guard at Sunspear"                
#>  9 Chett             ""                                                
#> 10 Cressen           "Maester"                                         
#> # ℹ 49 more rows
```

(Note that the empty titles (`""`) are due to an infelicity in the input
`got_chars`: ideally people without titles would have a title vector of
length 0, not a title vector of length 1 containing an empty string.)

## Geocoding with google

Next we’ll tackle a more complex form of data that comes from Google’s
geocoding service, stored in the repurrrsive package

``` r
repurrrsive::gmaps_cities
#> # A tibble: 5 × 2
#>   city       json            
#>   <chr>      <list>          
#> 1 Houston    <named list [2]>
#> 2 Washington <named list [2]>
#> 3 New York   <named list [2]>
#> 4 Chicago    <named list [2]>
#> 5 Arlington  <named list [2]>
```

`json` is a list-column of named lists, so it makes sense to start with
[`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md):

``` r
repurrrsive::gmaps_cities |>
  unnest_wider(json)
#> # A tibble: 5 × 3
#>   city       results    status
#>   <chr>      <list>     <chr> 
#> 1 Houston    <list [1]> OK    
#> 2 Washington <list [2]> OK    
#> 3 New York   <list [1]> OK    
#> 4 Chicago    <list [1]> OK    
#> 5 Arlington  <list [2]> OK
```

Notice that `results` is a list of lists. Most of the cities have 1
element (representing a unique match from the geocoding API), but
Washington and Arlington have two. We can pull these out into separate
rows with
[`unnest_longer()`](https://tidyr.tidyverse.org/dev/reference/unnest_longer.md):

``` r
repurrrsive::gmaps_cities |>
  unnest_wider(json) |>
  unnest_longer(results)
#> # A tibble: 7 × 3
#>   city       results          status
#>   <chr>      <list>           <chr> 
#> 1 Houston    <named list [5]> OK    
#> 2 Washington <named list [5]> OK    
#> 3 Washington <named list [5]> OK    
#> 4 New York   <named list [5]> OK    
#> 5 Chicago    <named list [5]> OK    
#> 6 Arlington  <named list [5]> OK    
#> 7 Arlington  <named list [5]> OK
```

Now these all have the same components, as revealed by
[`unnest_wider()`](https://tidyr.tidyverse.org/dev/reference/unnest_wider.md):

``` r
repurrrsive::gmaps_cities |>
  unnest_wider(json) |>
  unnest_longer(results) |>
  unnest_wider(results)
#> # A tibble: 7 × 7
#>   city       address_components formatted_address geometry     place_id
#>   <chr>      <list>             <chr>             <list>       <chr>   
#> 1 Houston    <list [4]>         Houston, TX, USA  <named list> ChIJAYW…
#> 2 Washington <list [2]>         Washington, USA   <named list> ChIJ-bD…
#> 3 Washington <list [4]>         Washington, DC, … <named list> ChIJW-T…
#> 4 New York   <list [3]>         New York, NY, USA <named list> ChIJOwg…
#> 5 Chicago    <list [4]>         Chicago, IL, USA  <named list> ChIJ7cv…
#> 6 Arlington  <list [4]>         Arlington, TX, U… <named list> ChIJ05g…
#> 7 Arlington  <list [4]>         Arlington, VA, U… <named list> ChIJD6e…
#> # ℹ 2 more variables: types <list>, status <chr>
```

We can find the latitude and longitude by unnesting `geometry`:

``` r
repurrrsive::gmaps_cities |>
  unnest_wider(json) |>
  unnest_longer(results) |>
  unnest_wider(results) |>
  unnest_wider(geometry)
#> # A tibble: 7 × 10
#>   city   address_components formatted_address bounds       location    
#>   <chr>  <list>             <chr>             <list>       <list>      
#> 1 Houst… <list [4]>         Houston, TX, USA  <named list> <named list>
#> 2 Washi… <list [2]>         Washington, USA   <named list> <named list>
#> 3 Washi… <list [4]>         Washington, DC, … <named list> <named list>
#> 4 New Y… <list [3]>         New York, NY, USA <named list> <named list>
#> 5 Chica… <list [4]>         Chicago, IL, USA  <named list> <named list>
#> 6 Arlin… <list [4]>         Arlington, TX, U… <named list> <named list>
#> 7 Arlin… <list [4]>         Arlington, VA, U… <named list> <named list>
#> # ℹ 5 more variables: location_type <chr>, viewport <list>,
#> #   place_id <chr>, types <list>, status <chr>
```

And then location:

``` r
repurrrsive::gmaps_cities |>
  unnest_wider(json) |>
  unnest_longer(results) |>
  unnest_wider(results) |>
  unnest_wider(geometry) |>
  unnest_wider(location)
#> # A tibble: 7 × 11
#>   city   address_components formatted_address bounds         lat    lng
#>   <chr>  <list>             <chr>             <list>       <dbl>  <dbl>
#> 1 Houst… <list [4]>         Houston, TX, USA  <named list>  29.8  -95.4
#> 2 Washi… <list [2]>         Washington, USA   <named list>  47.8 -121. 
#> 3 Washi… <list [4]>         Washington, DC, … <named list>  38.9  -77.0
#> 4 New Y… <list [3]>         New York, NY, USA <named list>  40.7  -74.0
#> 5 Chica… <list [4]>         Chicago, IL, USA  <named list>  41.9  -87.6
#> 6 Arlin… <list [4]>         Arlington, TX, U… <named list>  32.7  -97.1
#> 7 Arlin… <list [4]>         Arlington, VA, U… <named list>  38.9  -77.1
#> # ℹ 5 more variables: location_type <chr>, viewport <list>,
#> #   place_id <chr>, types <list>, status <chr>
```

We could also just look at the first address for each city:

``` r
repurrrsive::gmaps_cities |>
  unnest_wider(json) |>
  hoist(results, first_result = 1) |>
  unnest_wider(first_result) |>
  unnest_wider(geometry) |>
  unnest_wider(location)
#> # A tibble: 5 × 12
#>   city   address_components formatted_address bounds         lat    lng
#>   <chr>  <list>             <chr>             <list>       <dbl>  <dbl>
#> 1 Houst… <list [4]>         Houston, TX, USA  <named list>  29.8  -95.4
#> 2 Washi… <list [2]>         Washington, USA   <named list>  47.8 -121. 
#> 3 New Y… <list [3]>         New York, NY, USA <named list>  40.7  -74.0
#> 4 Chica… <list [4]>         Chicago, IL, USA  <named list>  41.9  -87.6
#> 5 Arlin… <list [4]>         Arlington, TX, U… <named list>  32.7  -97.1
#> # ℹ 6 more variables: location_type <chr>, viewport <list>,
#> #   place_id <chr>, types <list>, results <list>, status <chr>
```

Or use [`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md)
to dive deeply to get directly to `lat` and `lng`:

``` r
repurrrsive::gmaps_cities |>
  hoist(json,
    lat = list("results", 1, "geometry", "location", "lat"),
    lng = list("results", 1, "geometry", "location", "lng")
  )
#> # A tibble: 5 × 4
#>   city         lat    lng json            
#>   <chr>      <dbl>  <dbl> <list>          
#> 1 Houston     29.8  -95.4 <named list [2]>
#> 2 Washington  47.8 -121.  <named list [2]>
#> 3 New York    40.7  -74.0 <named list [2]>
#> 4 Chicago     41.9  -87.6 <named list [2]>
#> 5 Arlington   32.7  -97.1 <named list [2]>
```

## Sharla Gelfand’s discography

We’ll finish off with the most complex list, from [Sharla
Gelfand’s](https://github.com/sharlagelfand) discography. We’ll start
the usual way: putting the list into a single column data frame, and
then widening so each component is a column. I also parse the
`date_added` column into a real date-time[¹](#fn1).

``` r
discs <- tibble(disc = discog) |>
  unnest_wider(disc) |>
  mutate(date_added = as.POSIXct(strptime(date_added, "%Y-%m-%dT%H:%M:%S")))
discs
#> # A tibble: 155 × 5
#>    instance_id date_added          basic_information       id rating
#>          <int> <dttm>              <list>               <int>  <int>
#>  1   354823933 2019-02-16 17:48:59 <named list [11]>  7496378      0
#>  2   354092601 2019-02-13 14:13:11 <named list [11]>  4490852      0
#>  3   354091476 2019-02-13 14:07:23 <named list [11]>  9827276      0
#>  4   351244906 2019-02-02 11:39:58 <named list [11]>  9769203      0
#>  5   351244801 2019-02-02 11:39:37 <named list [11]>  7237138      0
#>  6   351052065 2019-02-01 20:40:53 <named list [11]> 13117042      0
#>  7   350315345 2019-01-29 15:48:37 <named list [11]>  7113575      0
#>  8   350315103 2019-01-29 15:47:22 <named list [11]> 10540713      0
#>  9   350314507 2019-01-29 15:44:08 <named list [11]> 11260950      0
#> 10   350314047 2019-01-29 15:41:35 <named list [11]> 11726853      0
#> # ℹ 145 more rows
```

At this level, we see information about when each disc was added to
Sharla’s discography, not any information about the disc itself. To do
that we need to widen the `basic_information` column:

``` r
discs |> unnest_wider(basic_information)
#> Error in `unnest_wider()`:
#> ! Can't duplicate names between the affected columns and the
#>   original data.
#> ✖ These names are duplicated:
#>   ℹ `id`, from `basic_information`.
#> ℹ Use `names_sep` to disambiguate using the column name.
#> ℹ Or use `names_repair` to specify a repair strategy.
```

Unfortunately that fails because there’s an `id` column inside
`basic_information`. We can quickly see what’s going on by setting
`names_repair = "unique"`:

``` r
discs |> unnest_wider(basic_information, names_repair = "unique")
#> New names:
#> • `id` -> `id...7`
#> • `id` -> `id...14`
#> # A tibble: 155 × 15
#>    instance_id date_added          labels      year master_url  artists
#>          <int> <dttm>              <list>     <int> <chr>       <list> 
#>  1   354823933 2019-02-16 17:48:59 <list [1]>  2015 NA          <list> 
#>  2   354092601 2019-02-13 14:13:11 <list [1]>  2013 https://ap… <list> 
#>  3   354091476 2019-02-13 14:07:23 <list [1]>  2017 https://ap… <list> 
#>  4   351244906 2019-02-02 11:39:58 <list [3]>  2017 https://ap… <list> 
#>  5   351244801 2019-02-02 11:39:37 <list [1]>  2015 https://ap… <list> 
#>  6   351052065 2019-02-01 20:40:53 <list [1]>  2019 https://ap… <list> 
#>  7   350315345 2019-01-29 15:48:37 <list [1]>  2014 https://ap… <list> 
#>  8   350315103 2019-01-29 15:47:22 <list [1]>  2015 https://ap… <list> 
#>  9   350314507 2019-01-29 15:44:08 <list [1]>  2017 https://ap… <list> 
#> 10   350314047 2019-01-29 15:41:35 <list [1]>  2017 NA          <list> 
#> # ℹ 145 more rows
#> # ℹ 9 more variables: id...7 <int>, thumb <chr>, title <chr>,
#> #   formats <list>, cover_image <chr>, resource_url <chr>,
#> #   master_id <int>, id...14 <int>, rating <int>
```

The problem is that `basic_information` repeats the `id` column that’s
also stored at the top-level, so we can just drop that:

``` r
discs |>
  select(!id) |>
  unnest_wider(basic_information)
#> # A tibble: 155 × 14
#>    instance_id date_added          labels      year master_url  artists
#>          <int> <dttm>              <list>     <int> <chr>       <list> 
#>  1   354823933 2019-02-16 17:48:59 <list [1]>  2015 NA          <list> 
#>  2   354092601 2019-02-13 14:13:11 <list [1]>  2013 https://ap… <list> 
#>  3   354091476 2019-02-13 14:07:23 <list [1]>  2017 https://ap… <list> 
#>  4   351244906 2019-02-02 11:39:58 <list [3]>  2017 https://ap… <list> 
#>  5   351244801 2019-02-02 11:39:37 <list [1]>  2015 https://ap… <list> 
#>  6   351052065 2019-02-01 20:40:53 <list [1]>  2019 https://ap… <list> 
#>  7   350315345 2019-01-29 15:48:37 <list [1]>  2014 https://ap… <list> 
#>  8   350315103 2019-01-29 15:47:22 <list [1]>  2015 https://ap… <list> 
#>  9   350314507 2019-01-29 15:44:08 <list [1]>  2017 https://ap… <list> 
#> 10   350314047 2019-01-29 15:41:35 <list [1]>  2017 NA          <list> 
#> # ℹ 145 more rows
#> # ℹ 8 more variables: id <int>, thumb <chr>, title <chr>,
#> #   formats <list>, cover_image <chr>, resource_url <chr>,
#> #   master_id <int>, rating <int>
```

Alternatively, we could use
[`hoist()`](https://tidyr.tidyverse.org/dev/reference/hoist.md):

``` r
discs |>
  hoist(basic_information,
    title = "title",
    year = "year",
    label = list("labels", 1, "name"),
    artist = list("artists", 1, "name")
  )
#> # A tibble: 155 × 9
#>    instance_id date_added          title              year label artist
#>          <int> <dttm>              <chr>             <int> <chr> <chr> 
#>  1   354823933 2019-02-16 17:48:59 Demo               2015 Tobi… Mollot
#>  2   354092601 2019-02-13 14:13:11 Observant Com El…  2013 La V… Una B…
#>  3   354091476 2019-02-13 14:07:23 I                  2017 La V… S.H.I…
#>  4   351244906 2019-02-02 11:39:58 Oído Absoluto      2017 La V… Rata …
#>  5   351244801 2019-02-02 11:39:37 A Cat's Cause, N…  2015 Kato… Ivy (…
#>  6   351052065 2019-02-01 20:40:53 Tashme             2019 High… Tashme
#>  7   350315345 2019-01-29 15:48:37 Demo               2014 Mind… Desgr…
#>  8   350315103 2019-01-29 15:47:22 Let The Miracles…  2015 Not … Phant…
#>  9   350314507 2019-01-29 15:44:08 Sub Space          2017 Not … Sub S…
#> 10   350314047 2019-01-29 15:41:35 Demo               2017 Pres… Small…
#> # ℹ 145 more rows
#> # ℹ 3 more variables: basic_information <list>, id <int>, rating <int>
```

Here I quickly extract the name of the first label and artist by
indexing deeply into the nested list.

A more systematic approach would be to create separate tables for artist
and label:

``` r
discs |>
  hoist(basic_information, artist = "artists") |>
  select(disc_id = id, artist) |>
  unnest_longer(artist) |>
  unnest_wider(artist)
#> # A tibble: 167 × 8
#>     disc_id join  name           anv   tracks role  resource_url     id
#>       <int> <chr> <chr>          <chr> <chr>  <chr> <chr>         <int>
#>  1  7496378 ""    Mollot         ""    ""     ""    https://api… 4.62e6
#>  2  4490852 ""    Una Bèstia In… ""    ""     ""    https://api… 3.19e6
#>  3  9827276 ""    S.H.I.T. (3)   ""    ""     ""    https://api… 2.77e6
#>  4  9769203 ""    Rata Negra     ""    ""     ""    https://api… 4.28e6
#>  5  7237138 ""    Ivy (18)       ""    ""     ""    https://api… 3.60e6
#>  6 13117042 ""    Tashme         ""    ""     ""    https://api… 5.21e6
#>  7  7113575 ""    Desgraciados   ""    ""     ""    https://api… 4.45e6
#>  8 10540713 ""    Phantom Head   ""    ""     ""    https://api… 4.27e6
#>  9 11260950 ""    Sub Space (2)  ""    ""     ""    https://api… 5.69e6
#> 10 11726853 ""    Small Man (2)  ""    ""     ""    https://api… 6.37e6
#> # ℹ 157 more rows

discs |>
  hoist(basic_information, format = "formats") |>
  select(disc_id = id, format) |>
  unnest_longer(format) |>
  unnest_wider(format) |>
  unnest_longer(descriptions)
#> # A tibble: 258 × 5
#>     disc_id descriptions text  name     qty  
#>       <int> <chr>        <chr> <chr>    <chr>
#>  1  7496378 "Numbered"   Black Cassette 1    
#>  2  4490852 "LP"         NA    Vinyl    1    
#>  3  9827276 "7\""        NA    Vinyl    1    
#>  4  9827276 "45 RPM"     NA    Vinyl    1    
#>  5  9827276 "EP"         NA    Vinyl    1    
#>  6  9769203 "LP"         NA    Vinyl    1    
#>  7  9769203 "Album"      NA    Vinyl    1    
#>  8  7237138 "7\""        NA    Vinyl    1    
#>  9  7237138 "45 RPM"     NA    Vinyl    1    
#> 10 13117042 "7\""        NA    Vinyl    1    
#> # ℹ 248 more rows
```

Then you could join these back on to the original dataset as needed.

------------------------------------------------------------------------

1.  I’d normally use
    [`readr::parse_datetime()`](https://readr.tidyverse.org/reference/parse_datetime.html)
    or `lubridate::ymd_hms()`, but I can’t here because it’s a vignette
    and I don’t want to add a dependency to tidyr just to simplify one
    example.
