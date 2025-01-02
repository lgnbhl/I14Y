#' Get the dataStructures
#'
#' @param identifier string. The identifier of the dcat dataset.
#' @param language string. The language of the response data.
#'
#' @return a list
#' @examples
#' df <- i14y_get_data_structure(
#'   identifier = "SpiGes_Erhebung_Administratives"
#' )
#' @export
i14y_get_data_structure <- function(
    identifier = NULL,
    language = "de"
) {
  check_not_null(identifier)
  check_not_null(language)
  check_string(identifier)
  check_string(language)
  language <- arg_match(language, c("de", "fr", "en", "it"))
  check_internet()

  req <- httr2::request("https://www.i14y.admin.ch")
  req <- httr2::req_url_path_append(req, paste0("/api/DataStructures/", identifier, "/", language))
  req <- httr2::req_retry(req, max_tries = 2)
  req <- httr2::req_perform(req)
  resp <- httr2::resp_body_json(req, simplifyVector = TRUE, flatten = TRUE)
  return(resp)
}
