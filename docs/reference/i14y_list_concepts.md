# List concepts

Calls the I14Y public API endpoint `/concepts`.

## Usage

``` r
i14y_list_concepts(
  conceptIdentifier = NULL,
  publisherIdentifier = NULL,
  version = NULL,
  publicationLevel = NULL,
  registrationStatus = NULL,
  page = NULL,
  pageSize = NULL
)
```

## Arguments

- conceptIdentifier:

  string. Filter by concept identifier.

- publisherIdentifier:

  string. Filter by publisher identifier.

- version:

  string. Filter by version.

- publicationLevel:

  string. One of "Internal", "Public".

- registrationStatus:

  string. A registration status value.

- page:

  integer. The result page to return.

- pageSize:

  integer. The size of each result page.

## Value

A tibble of concept summaries. \`NULL\` when offline.
