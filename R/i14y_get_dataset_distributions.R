#' Get dataset distributions by identifier
#'
#' @param identifier string. The identifier of the dcat dataset.
#' @param language string. The language of the response data.
#'
#' @return a list
#' @export
#'
#' @examples
#' i14y_get_dataset_distributions(identifier = "HCL_NOGA",  language = "en")
i14y_get_dataset_distributions <- function(
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
  req <- httr2::req_url_path_append(req, paste0("/api/Datasets/", identifier, "/", language, "/distributions"))
  req <- httr2::req_retry(req, max_tries = 2)
  req <- httr2::req_perform(req)
  resp <- httr2::resp_body_json(req, simplifyVector = TRUE, flatten = TRUE)
  return(resp)
}
