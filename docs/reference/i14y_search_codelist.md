# Search entries within a codelist concept

Calls the I14Y public API endpoint
`/concepts/{conceptId}/codelist-entries/search`. This replaces the
former \`i14y_search_nomenclature()\`: in the new I14Y data model, what
used to be a single multi-level nomenclature is now a set of separate
codelist concepts (e.g. \`NOGA_SECTION\`, \`NOGA_DIVISION\`,
\`NOGA_GROUP\`, \`NOGA_CLASS\`).

## Usage

``` r
i14y_search_codelist(
  id = NULL,
  query = NULL,
  language = "de",
  filters = NULL,
  page = NULL,
  pageSize = NULL
)
```

## Arguments

- id:

  string. The UUID of the codelist concept.

- query:

  string. The search query. If \`NULL\`, all entries are returned
  (subject to \`filters\`, \`page\` and \`pageSize\`).

- language:

  string. The language of the response data ("de", "fr", "en", "it",
  "rm"). Default "de".

- filters:

  character vector. Optional filter expressions, passed through to the
  API as the \`filters\` array parameter.

- page:

  integer. The number of the result page to return.

- pageSize:

  integer. The size of each result page.

## Value

A tibble of codelist entry summaries. \`NULL\` when offline.

## Examples

``` r
# \donttest{
i14y_search_codelist(
  id = "08d94604-e058-62a2-aa25-53f84b974201", # NOGA_DIVISION
  query = "agriculture",
  language = "fr"
)
#> # A tibble: 2 × 8
#>   annotations  code  conceptId             id    name.de name.en name.fr name.it
#>   <list>       <chr> <chr>                 <chr> <chr>   <chr>   <chr>   <chr>  
#> 1 <df [2 × 8]> 02    08d94604-e058-62a2-a… 411e… Forstw… Forest… Sylvic… Silvic…
#> 2 <df [2 × 8]> 01    08d94604-e058-62a2-a… 056e… Landwi… Crop a… Cultur… Produz…
# }
```
