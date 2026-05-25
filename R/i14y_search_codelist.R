#' Search entries within a codelist concept
#'
#' Calls the I14Y public API endpoint
#' \verb{/concepts/\{conceptId\}/codelist-entries/search}. This replaces the former
#' `i14y_search_nomenclature()`: in the new I14Y data model, what used to be a
#' single multi-level nomenclature is now a set of separate codelist concepts
#' (e.g. `NOGA_SECTION`, `NOGA_DIVISION`, `NOGA_GROUP`, `NOGA_CLASS`).
#'
#' @param id string. The UUID of the codelist concept.
#' @param query string. The search query.
#' @param language string. The language of the response data
#'   ("de", "fr", "en" or "it"). Default "de".
#' @param page integer. The number of the result page to return.
#' @param pageSize integer. The size of each result page.
#'
#' @return a list
#' @export
#' @examples
#' i14y_search_codelist(
#'   id = "08d94604-e058-62a2-aa25-53f84b974201", # NOGA_DIVISION
#'   query = "agriculture",
#'   language = "fr"
#' )
i14y_search_codelist <- function(
  id = NULL,
  query = NULL,
  language = "de",
  page = NULL,
  pageSize = NULL
) {
  check_not_null(id)
  check_not_null(query)
  check_not_null(language)
  check_string(id)
  check_string(query)
  check_string(language)
  language <- arg_match(language, c("de", "fr", "en", "it"))
  if (!curl::has_internet()) {
    message("No internet connection")
    return(NULL)
  }

  req <- httr2::request("https://api.i14y.admin.ch/api/public/v1")
  req <- httr2::req_user_agent(
    req,
    "I14Y R package (https://github.com/lgnbhl/I14Y)"
  )
  req <- httr2::req_url_path_append(
    req,
    paste0("/concepts/", id, "/codelist-entries/search")
  )
  req <- httr2::req_url_query(
    req,
    query = query,
    language = language,
    page = page,
    pageSize = pageSize
  )
  req <- httr2::req_retry(req, max_tries = 2)
  req <- httr2::req_perform(req)
  resp <- httr2::resp_body_json(req, simplifyVector = TRUE, flatten = TRUE)
  if (is.list(resp) && "data" %in% names(resp)) {
    return(resp$data)
  }
  return(resp)
}
