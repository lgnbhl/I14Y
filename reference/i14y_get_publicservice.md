# Get a public service by ID

Calls the I14Y public API endpoint `/publicservices/{publicServiceId}`.

## Usage

``` r
i14y_get_publicservice(id = NULL)
```

## Arguments

- id:

  string. The UUID of the public service.

## Value

A list with the public service metadata. \`NULL\` when offline.
