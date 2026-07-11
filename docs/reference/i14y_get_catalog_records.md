# List records of a catalog

Calls the I14Y public API endpoint `/catalogs/{catalogId}/records`.

## Usage

``` r
i14y_get_catalog_records(id = NULL)
```

## Arguments

- id:

  string. The catalog identifier.

## Value

A tibble of catalog records. \`NULL\` when offline.
