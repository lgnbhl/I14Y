#' Get a concept by ID
#'
#' Calls the I14Y public API endpoint \verb{/concepts/\{conceptId\}} and returns
#' the concept metadata. Multilingual fields (`name`, `description`, ...) are
#' returned with one entry per language (de, en, fr, it).
#'
#' @param id string. The UUID of the concept.
#'
#' @return a list
#' @export
#'
#' @examples
#' i14y_get_concept(
#'  id = "08d94604-e058-62a2-aa25-53f84b974201" # DV_NOGA_DIVISION
#' )
i14y_get_concept <- function(
  id = NULL
) {
  check_not_null(id)
  check_string(id)
  if (!curl::has_internet()) {
    message("No internet connection")
    return(NULL)
  }

  req <- httr2::request("https://api.i14y.admin.ch/api/public/v1")
  req <- httr2::req_user_agent(
    req,
    "I14Y R package (https://github.com/lgnbhl/I14Y)"
  )
  req <- httr2::req_url_path_append(req, paste0("/concepts/", id))
  req <- httr2::req_retry(req, max_tries = 2)
  req <- httr2::req_perform(req)
  resp <- httr2::resp_body_json(req, simplifyVector = TRUE, flatten = TRUE)
  if (is.list(resp) && "data" %in% names(resp)) {
    return(resp$data)
  }
  return(resp)
}
