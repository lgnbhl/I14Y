# Get the dataStructures

Get the dataStructures

## Usage

``` r
i14y_get_data_structure(identifier = NULL, language = "de")
```

## Arguments

- identifier:

  string. The identifier of the dcat dataset.

- language:

  string. The language of the response data.

## Value

a list

## Examples

``` r
df <- i14y_get_data_structure(
  identifier = "SpiGes_Erhebung_Administratives"
)
#> Error in httr2::req_perform(req): HTTP 404 Not Found.
```
