#' Search for a Concept Summary
#'
#' @param search string. Search query.
#' @param language string. The language of the response data.
#' @param page integer. The number of the result page to return.
#' @param pageSize integer. The size of each result page.
#' @param publishers vector of strings. Filter with Publishers identifiers.
#' @param themeCodes vector of strings. Filter with theme codes.
#'
#' @return a tibble
#' @export
#'
#' @examples
#' i14y_search_concept(search = "noga", language = "en")
i14y_search_concept <- function(
    search = NULL,
    language = "de",
    page = 1,
    pageSize = 1000,
    publishers = NULL,
    themeCodes = NULL
) {
  check_not_null(language)
  check_not_null(page)
  check_not_null(pageSize)
  check_integer(page)
  check_integer(pageSize)
  language <- arg_match(language, c("de", "fr", "en", "it"))
  # TODO: validate args
  check_internet()

  req <- httr2::request("https://www.i14y.admin.ch")
  req <- httr2::req_url_path_append(req, "/api/ConceptSummary/search")
  req <- httr2::req_url_query(req,
    language = language, page = page, pageSize = pageSize, search = search,
    publishers = publishers, themeCodes = themeCodes
  )
  req <- httr2::req_retry(req, max_tries = 2)
  req <- httr2::req_perform(req)
  resp <- httr2::resp_body_json(req, simplifyVector = TRUE, flatten = TRUE)
  tbl <- tibble::as_tibble(resp)
  return(tbl)
}
