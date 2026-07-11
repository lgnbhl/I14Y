# Export search results from a codelist concept

Calls the I14Y public API endpoint
`/concepts/{conceptId}/codelist-entries/search/exports/{dataFormat}`.

## Usage

``` r
i14y_export_codelist_search(
  id = NULL,
  query = NULL,
  language = "de",
  filters = NULL,
  format = "csv",
  withAnnotations = FALSE
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

- format:

  string. The export format ("csv" or "json").

- withAnnotations:

  logical. If \`TRUE\`, annotations are included.

## Value

A tibble for "csv", a list for "json". \`NULL\` when offline.
