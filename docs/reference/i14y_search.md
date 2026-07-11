# Search the I14Y catalog

Calls the I14Y public API endpoint `/search`. This is the faceted search
over all resource types (datasets, data services, public services,
concepts, mapping tables) and replaces the previous private
\`input-backend\` host that powered \`i14y_search_catalog()\` and
\`i14y_search_concept()\` in earlier releases.

## Usage

``` r
i14y_search(
  query = NULL,
  language = "de",
  types = NULL,
  accessRights = NULL,
  businessEvents = NULL,
  conceptValueTypes = NULL,
  formats = NULL,
  publicationLevels = NULL,
  publicationLevelProposals = NULL,
  lifeEvents = NULL,
  publishers = NULL,
  registrationStatuses = NULL,
  registrationStatusProposals = NULL,
  structure = NULL,
  themes = NULL,
  page = NULL,
  pageSize = NULL
)
```

## Arguments

- query:

  string. The search query.

- language:

  string. The language to use for the search ("de", "en", "fr", "it",
  "rm"). Default "de".

- types:

  character vector. Filter by resource types. One or more of "Dataset",
  "DataService", "PublicService", "Concept", "MappingTable".

- accessRights:

  character vector. Filter by access rights.

- businessEvents:

  character vector. Filter by business events.

- conceptValueTypes:

  character vector. Filter by concept value type. One or more of
  "CodeList", "Date", "Numeric", "String".

- formats:

  character vector. Filter by distribution formats.

- publicationLevels:

  character vector. Filter by publication level ("Internal", "Public").

- publicationLevelProposals:

  character vector. Filter by proposed publication level ("Internal",
  "Public").

- lifeEvents:

  character vector. Filter by life events.

- publishers:

  character vector. Filter by publisher identifiers.

- registrationStatuses:

  character vector. Filter by registration status.

- registrationStatusProposals:

  character vector. Filter by proposed registration status.

- structure:

  string. One of "WithStructure", "WithoutStructure".

- themes:

  character vector. Filter by theme codes.

- page:

  integer. The number of the result page to return.

- pageSize:

  integer. The size of each result page.

## Value

A tibble of search results. \`NULL\` when offline.

## Examples

``` r
# \donttest{
i14y_search(query = "noga", language = "en")
#> # A tibble: 15 × 69
#>    businessEvents formats      id         identifier lifeEvents publicationLevel
#>    <list>         <list>       <chr>      <chr>      <list>     <chr>           
#>  1 <list [0]>     <df [1 × 6]> 4f71b53b-… HCL_NOGA   <list [0]> Public          
#>  2 <list [0]>     <df [0 × 0]> 08dc481b-… nogaCode   <list [0]> Public          
#>  3 <list [0]>     <df [0 × 0]> 001bfaa8-… nogaCode   <list [0]> Public          
#>  4 <list [0]>     <df [0 × 0]> 08d94603-… NOGA_SECT… <list [0]> Public          
#>  5 <list [0]>     <df [0 × 0]> 08d94604-… NOGA_CLASS <list [0]> Public          
#>  6 <list [0]>     <df [0 × 0]> 08d94604-… NOGA_DIVI… <list [0]> Public          
#>  7 <list [0]>     <df [0 × 0]> 08d94604-… NOGA_GROUP <list [0]> Public          
#>  8 <list [0]>     <df [0 × 0]> 08d94604-… NOGA_TYPE  <list [0]> Public          
#>  9 <list [0]>     <df [0 × 0]> 08d9f1f9-… NOGA_SECT… <list [0]> Public          
#> 10 <list [0]>     <df [0 × 0]> 08d94604-… NOGA_OFS50 <list [0]> Public          
#> 11 <list [0]>     <df [0 × 0]> 08dd28d2-… nogaCode   <list [0]> Public          
#> 12 <list [0]>     <df [0 × 0]> 08d9f6dd-… NOGA_ESTA… <list [0]> Public          
#> 13 <list [0]>     <df [0 × 0]> 019edf0a-… 36506617@… <list [0]> Public          
#> 14 <list [0]>     <df [0 × 0]> 019edf0a-… 36506623@… <list [0]> Public          
#> 15 <list [0]>     <df [0 × 0]> 019edf0a-… 36506622@… <list [0]> Public          
#> # ℹ 63 more variables: registrationStatus <chr>, structure <chr>,
#> #   themes <list>, type <chr>, conceptType <chr>, validFrom <chr>,
#> #   version <chr>, validTo <chr>, accessRights.code <chr>,
#> #   accessRights.uri <chr>, accessRights.name.de <chr>,
#> #   accessRights.name.en <chr>, accessRights.name.fr <chr>,
#> #   accessRights.name.it <chr>, description.de <chr>, description.en <chr>,
#> #   description.fr <chr>, description.it <chr>, publisher.homePage <chr>, …
# }
```
