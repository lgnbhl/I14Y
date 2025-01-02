#' Get a data element
#'
#' @param id string. The id of the sms used variable.
#' @param language string. The language of the response data.
#'
#' @return a tibble
#' i14y_get_data_element(
#'   id = "af3b5919-0012-42ac-bbdd-24b591279899",
#'   language = "en"
#' )
#' @export
i14y_get_data_element <- function(
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
  req <- httr2::req_url_path_append(req, paste0("/api/DataElement/", id, "/", language))
  req <- httr2::req_retry(req, max_tries = 2)
  req <- httr2::req_perform(req)
  resp <- httr2::resp_body_json(req, simplifyVector = TRUE, flatten = TRUE)
  tbl <- tibble::as_tibble(resp)
  return(tbl)
}
