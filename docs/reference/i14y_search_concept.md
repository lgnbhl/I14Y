# Search for a Concept Summary

Thin wrapper around \[i14y_search()\] that restricts the result to the
"Concept" resource type.

## Usage

``` r
i14y_search_concept(
  query = NULL,
  language = "de",
  page = 1,
  pageSize = 1000,
  publishers = NULL,
  themes = NULL,
  conceptValueTypes = NULL,
  registrationStatuses = NULL
)
```

## Arguments

- query:

  string. Search query.

- language:

  string. The language of the response data.

- page:

  integer. The number of the result page to return.

- pageSize:

  integer. The size of each result page.

- publishers:

  character vector. Filter by publisher identifiers.

- themes:

  character vector. Filter by theme codes.

- conceptValueTypes:

  character vector. One or more concept value types to filter by
  ("CodeList", "Date", "Numeric", "String").

- registrationStatuses:

  character vector. One or more registration statuses to filter by.

## Value

A tibble of concept search results. \`NULL\` when offline.

## Examples

``` r
# \donttest{
i14y_search_concept(query = "noga", language = "en")
#> # A tibble: 11 × 61
#>    businessEvents conceptType formats    id                identifier lifeEvents
#>    <list>         <chr>       <list>     <chr>             <chr>      <list>    
#>  1 <list [0]>     CodeList    <list [0]> 08dc481b-2add-12… nogaCode   <list [0]>
#>  2 <list [0]>     CodeList    <list [0]> 001bfaa8-fa57-4d… nogaCode   <list [0]>
#>  3 <list [0]>     CodeList    <list [0]> 08d94603-f490-f0… NOGA_SECT… <list [0]>
#>  4 <list [0]>     CodeList    <list [0]> 08d94604-db03-19… NOGA_CLASS <list [0]>
#>  5 <list [0]>     CodeList    <list [0]> 08d94604-e058-62… NOGA_DIVI… <list [0]>
#>  6 <list [0]>     CodeList    <list [0]> 08d94604-e5ac-f8… NOGA_GROUP <list [0]>
#>  7 <list [0]>     CodeList    <list [0]> 08d94604-f12a-5d… NOGA_TYPE  <list [0]>
#>  8 <list [0]>     CodeList    <list [0]> 08d9f1f9-3f89-00… NOGA_SECT… <list [0]>
#>  9 <list [0]>     CodeList    <list [0]> 08d94604-ecc0-66… NOGA_OFS50 <list [0]>
#> 10 <list [0]>     CodeList    <list [0]> 08dd28d2-a693-50… nogaCode   <list [0]>
#> 11 <list [0]>     CodeList    <list [0]> 08d9f6dd-f8a3-cb… NOGA_ESTA… <list [0]>
#> # ℹ 55 more variables: publicationLevel <chr>, registrationStatus <chr>,
#> #   themes <list>, type <chr>, validFrom <chr>, version <chr>, validTo <chr>,
#> #   description.de <chr>, description.en <chr>, description.fr <chr>,
#> #   description.it <chr>, publisher.homePage <chr>, publisher.id <chr>,
#> #   publisher.identifier <chr>, publisher.images <list>,
#> #   publisher.spatial <list>, publisher.spatialCH <list>,
#> #   publisher.subAgents <list>, publisher.uid <chr>, …
# }
```
