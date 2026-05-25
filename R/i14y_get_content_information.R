#' Get dataset content information by ID
#'
#' Returns metadata for a dataset including its publication level, registration
#' status, distributions and whether structures are available
#' (`hasDataStructures`).
#'
#' @param id string. The UUID of the dataset.
#'
#' @return a list
#' @examples
#' i14y_get_content_information(
#'   id = "b902add5-9538-47ed-b663-f9fbfac92381" # SpiGes_Administratives
#' )
#' @export
i14y_get_content_information <- function(
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
  req <- httr2::req_url_path_append(req, paste0("/datasets/", id))
  req <- httr2::req_retry(req, max_tries = 2)
  req <- httr2::req_perform(req)
  resp <- httr2::resp_body_json(req, simplifyVector = TRUE, flatten = TRUE)
  if (is.list(resp) && "data" %in% names(resp)) {
    return(resp$data)
  }
  return(resp)
}
