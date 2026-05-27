#' Search the catalog for datasets, data services and public services.
#'
#' Thin wrapper around [i14y_search()] that restricts the result to
#' the catalog resource types ("Dataset", "DataService", "PublicService").
#'
#' @param query string. The search query.
#' @param language string. The language to use for the search.
#' @param accessRights character vector. Filter by access rights.
#' @param formats character vector. Filter by distribution formats.
#' @param publishers character vector. Filter by publisher identifiers.
#' @param statuses character vector. Filter by registration status. Forwarded
#'   to the `registrationStatuses` parameter of [i14y_search()].
#' @param themes character vector. Filter by theme codes.
#' @param types character vector. Restrict to a subset of catalog types. One or
#'   more of "Dataset", "DataService", "PublicService". Defaults to all three.
#' @param page integer. The number of the result page to return.
#' @param pageSize integer. The size of each result page.
#'
#' @return A tibble of catalog search results. `NULL` when offline.
#' @export
#'
#' @examples
#' \donttest{
#' i14y_search_catalog(query = "noga")
#' }
i14y_search_catalog <- function(
  query = NULL,
  language = "de",
  accessRights = NULL,
  formats = NULL,
  publishers = NULL,
  statuses = NULL,
  themes = NULL,
  types = NULL,
  page = NULL,
  pageSize = NULL
) {
  catalog_types <- c("Dataset", "DataService", "PublicService")
  if (is.null(types)) {
    types <- catalog_types
  } else {
    check_enum(types, catalog_types)
  }
  i14y_search(
    query = query,
    language = language,
    accessRights = accessRights,
    formats = formats,
    publishers = publishers,
    registrationStatuses = statuses,
    themes = themes,
    types = types,
    page = page,
    pageSize = pageSize
  )
}
