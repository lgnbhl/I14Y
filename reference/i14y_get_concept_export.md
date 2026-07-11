# Get the JSON export of a concept

Calls the I14Y public API endpoint `/concepts/{conceptId}/exports/json`.

## Usage

``` r
i14y_get_concept_export(id = NULL)
```

## Arguments

- id:

  string. The UUID of the concept.

## Value

A list with the JSON export of the concept. \`NULL\` when offline.
