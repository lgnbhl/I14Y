#' Search for a Concept Summary
#'
#' Thin wrapper around [i14y_search()] that restricts the result to
#' the "Concept" resource type.
#'
#' @param query string. Search query.
#' @param language string. The language of the response data.
#' @param page integer. The number of the result page to return.
#' @param pageSize integer. The size of each result page.
#' @param publishers character vector. Filter by publisher identifiers.
#' @param themes character vector. Filter by theme codes.
#' @param conceptValueTypes character vector. One or more concept value types
#'   to filter by ("CodeList", "Date", "Numeric", "String").
#' @param registrationStatuses character vector. One or more registration
#'   statuses to filter by.
#'
#' @return A tibble of concept search results. `NULL` when offline.
#' @export
#'
#' @examples
#' \donttest{
#' i14y_search_concept(query = "noga", language = "en")
#' }
i14y_search_concept <- function(
  query = NULL,
  language = "de",
  page = 1,
  pageSize = 1000,
  publishers = NULL,
  themes = NULL,
  conceptValueTypes = NULL,
  registrationStatuses = NULL
) {
  # Defaults `page = 1, pageSize = 1000` are preserved from the pre-0.2.0
  # signature (which targeted the now-removed `input-backend` host) so that
  # existing 0.1.x call sites keep returning the same result-set size.
  check_integer(page)
  check_integer(pageSize)
  i14y_search(
    query = query,
    language = language,
    types = "Concept",
    publishers = publishers,
    themes = themes,
    conceptValueTypes = conceptValueTypes,
    registrationStatuses = registrationStatuses,
    page = page,
    pageSize = pageSize
  )
}
