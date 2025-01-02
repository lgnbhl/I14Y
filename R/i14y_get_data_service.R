#' Get the dcat data service.
#'
#' @param id string. The id of the dcat data service.
#' @param language string. The language of the response data.
#'
#' @return a list
#' @export
#'
#' @examples
#' i14y_get_data_service(
#'  id = "0aaed69d-15ff-415a-8a38-4f9f0c3b429e",
#'  language = "en"
#' )
i14y_get_data_service <- function(
    id = NULL,
    language = "de"
) {
  check_not_null(id)
  check_not_null(language)
  check_string(id)
  check_string(language)
  language <- arg_match(language, c("de", "fr", "en", "it"))
  check_internet()

  req <- httr2::request("https://www.i14y.admin.ch")
  req <- httr2::req_url_path_append(req, paste0("/api/DataServices/", id, "/", language))
  req <- httr2::req_retry(req, max_tries = 2)
  req <- httr2::req_perform(req)
  resp <- httr2::resp_body_json(req, simplifyVector = TRUE, flatten = TRUE)
  return(resp)
}
