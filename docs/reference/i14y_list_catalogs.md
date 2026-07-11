# List catalogs

Calls the I14Y public API endpoint `/catalogs`.

## Usage

``` r
i14y_list_catalogs(page = NULL, pageSize = NULL)
```

## Arguments

- page:

  integer. The result page to return.

- pageSize:

  integer. The size of each result page.

## Value

A tibble of catalog summaries. \`NULL\` when offline.
