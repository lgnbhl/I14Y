# Get all versions of an ID

Get all versions of an ID

## Usage

``` r
i14y_get_concept_all_versions(id = NULL, language = "de")
```

## Arguments

- id:

  string. The Id of the response data.

- language:

  string. The language of the response data.

## Value

a list

## Examples

``` r
i14y_get_concept_all_versions(
 id = "08d94604-e058-62a2-aa25-53f84b974201", # DV_NOGA_DIVISION
 language = "de"
)
#> # A tibble: 1 × 12
#>   conceptId             conceptType version validFrom validTo registrationStatus
#>   <chr>                 <chr>       <chr>   <chr>     <lgl>   <chr>             
#> 1 08d94604-e058-62a2-a… CodeList    3.0.0   2007-12-… NA      PreferredStandard 
#> # ℹ 6 more variables: publicationLevel <chr>, name.de <chr>, name.en <chr>,
#> #   name.fr <chr>, name.it <chr>, name.rm <lgl>
```
