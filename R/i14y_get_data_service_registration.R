#' Get the current registration status of the specified dataservice.
#'
#' @param id string. The id of the dcat data service.
#'
#' @return a list
#' @export
#'
#' @examples
#' i14y_get_data_service_registration(
#'  id = "0aaed69d-15ff-415a-8a38-4f9f0c3b429e"
#' )
i14y_get_data_service_registration <- function(
    id = NULL
) {
  check_not_null(id)
  check_string(id)
  check_internet()

  req <- httr2::request("https://www.i14y.admin.ch")
  req <- httr2::req_user_agent(req, "I14Y R package (https://github.com/lgnbhl/I14Y)")
  req <- httr2::req_url_path_append(req, paste0("/api/DataServices/", id, "/registrationStatus"))
  req <- httr2::req_retry(req, max_tries = 2)
  req <- httr2::req_perform(req)
  resp <- httr2::resp_body_json(req, simplifyVector = TRUE, flatten = TRUE)
  return(resp)
}
