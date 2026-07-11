# Search the catalog for datasets, data services and public services.

Thin wrapper around \[i14y_search()\] that restricts the result to the
catalog resource types ("Dataset", "DataService", "PublicService").

## Usage

``` r
i14y_search_catalog(
  query = NULL,
  language = "de",
  accessRights = NULL,
  formats = NULL,
  publishers = NULL,
  statuses = NULL,
  themes = NULL,
  types = NULL,
  page = NULL,
  pageSize = NULL
)
```

## Arguments

- query:

  string. The search query.

- language:

  string. The language to use for the search.

- accessRights:

  character vector. Filter by access rights.

- formats:

  character vector. Filter by distribution formats.

- publishers:

  character vector. Filter by publisher identifiers.

- statuses:

  character vector. Filter by registration status. Forwarded to the
  \`registrationStatuses\` parameter of \[i14y_search()\].

- themes:

  character vector. Filter by theme codes.

- types:

  character vector. Restrict to a subset of catalog types. One or more
  of "Dataset", "DataService", "PublicService". Defaults to all three.

- page:

  integer. The number of the result page to return.

- pageSize:

  integer. The size of each result page.

## Value

A tibble of catalog search results. \`NULL\` when offline.

## Examples

``` r
# \donttest{
i14y_search_catalog(query = "noga")
#> # A tibble: 12 × 65
#>    businessEvents formats      id         identifier lifeEvents publicationLevel
#>    <list>         <list>       <chr>      <chr>      <list>     <chr>           
#>  1 <list [0]>     <df [1 × 6]> 4f71b53b-… HCL_NOGA   <list [0]> Public          
#>  2 <list [0]>     <df [0 × 0]> 019edf05-… 36576963@… <list [0]> Public          
#>  3 <list [0]>     <df [0 × 0]> 019edf05-… 36576962@… <list [0]> Public          
#>  4 <list [0]>     <df [0 × 0]> 019edf05-… 36576955@… <list [0]> Public          
#>  5 <list [0]>     <df [0 × 0]> 019edf06-… 36576934@… <list [0]> Public          
#>  6 <list [0]>     <df [5 × 6]> 1b9ac548-… CH_KT_BL_… <list [0]> Public          
#>  7 <list [0]>     <df [5 × 6]> 83cb7801-… CH_KT_BL_… <list [0]> Public          
#>  8 <list [0]>     <df [0 × 0]> 019edf06-… 36508698@… <list [0]> Public          
#>  9 <list [0]>     <df [5 × 6]> ce087cbd-… CH_KT_BL_… <list [0]> Public          
#> 10 <list [0]>     <df [0 × 0]> 019edf0a-… 36506617@… <list [0]> Public          
#> 11 <list [0]>     <df [0 × 0]> 019edf0a-… 36506623@… <list [0]> Public          
#> 12 <list [0]>     <df [0 × 0]> 019edf0a-… 36506622@… <list [0]> Public          
#> # ℹ 59 more variables: registrationStatus <chr>, structure <chr>,
#> #   themes <list>, type <chr>, accessRights.code <chr>, accessRights.uri <chr>,
#> #   accessRights.name.de <chr>, accessRights.name.en <chr>,
#> #   accessRights.name.fr <chr>, accessRights.name.it <chr>,
#> #   description.de <chr>, description.en <chr>, description.fr <chr>,
#> #   description.it <chr>, publisher.homePage <chr>, publisher.id <chr>,
#> #   publisher.identifier <chr>, publisher.images <list>, …
# }
```
