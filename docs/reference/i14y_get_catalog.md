# Get a catalog by ID

Calls the I14Y public API endpoint `/catalogs/{catalogId}`.

## Usage

``` r
i14y_get_catalog(id = NULL)
```

## Arguments

- id:

  string. The catalog identifier.

## Value

A list of catalog metadata. \`NULL\` when offline.
