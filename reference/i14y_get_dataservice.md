# Get a data service by ID

Calls the I14Y public API endpoint `/dataservices/{dataServiceId}`.

## Usage

``` r
i14y_get_dataservice(id = NULL)
```

## Arguments

- id:

  string. The UUID of the data service.

## Value

A list with the data service metadata. \`NULL\` when offline.
