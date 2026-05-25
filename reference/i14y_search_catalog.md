# Search the catalog for datasets, data services and public services.

Search the catalog for datasets, data services and public services.

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

  string. The search query

- language:

  string. The language to use for the search

- accessRights:

  vector of strings. Only results with one of the specified access
  rights (PUBLIC, NON_PUBLIC, RESTRICTED) are returned

- formats:

  vector of strings. Only results with at least one distribution
  providing one of the specified formats are returned

- publishers:

  vector of strings. Only results with one of the specified publishers
  are returned

- statuses:

  vector of strings. Only results with one of the specified registration
  statuses are returned

- themes:

  vector of strings. Only results corresponding to one of the specified
  themes are returned

- types:

  vector of strings. Only results with one of the specified types
  (Dataset, DataService, PublicService) are returned

- page:

  integer. The number of the result page to return

- pageSize:

  integer. The size of each result page

## Value

a tibble

## Examples

``` r
i14y_search_catalog(query = "noga")
#> # A tibble: 23 × 38
#>    businessEvents conceptValueType id    identifiers lifeEvents publicationLevel
#>    <list>         <chr>            <chr> <list>      <list>     <chr>           
#>  1 <list [0]>     NA               4f71… <chr [1]>   <list [0]> Public          
#>  2 <list [0]>     CodeList         08d9… <chr [1]>   <list [0]> Public          
#>  3 <list [0]>     CodeList         08d9… <chr [1]>   <list [0]> Public          
#>  4 <list [0]>     CodeList         08d9… <chr [1]>   <list [0]> Public          
#>  5 <list [0]>     CodeList         08dc… <chr [1]>   <list [0]> Public          
#>  6 <list [0]>     CodeList         001b… <chr [1]>   <list [0]> Public          
#>  7 <list [0]>     CodeList         08d9… <chr [1]>   <list [0]> Public          
#>  8 <list [0]>     CodeList         08d9… <chr [1]>   <list [0]> Public          
#>  9 <list [0]>     CodeList         08d9… <chr [1]>   <list [0]> Public          
#> 10 <list [0]>     CodeList         08d9… <chr [1]>   <list [0]> Public          
#> # ℹ 13 more rows
#> # ℹ 32 more variables: publicationLevelProposal <lgl>,
#> #   registrationStatus <chr>, registrationStatusProposal <lgl>, status <chr>,
#> #   structure <chr>, themes <list>, type <chr>, validFrom <chr>, validTo <chr>,
#> #   version <chr>, accessRights.code <chr>, accessRights.uri <chr>,
#> #   accessRights.name.de <chr>, accessRights.name.en <chr>,
#> #   accessRights.name.fr <chr>, accessRights.name.it <chr>, …
```
