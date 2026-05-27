#' Get dataset metadata by ID
#'
#' Calls the I14Y public API endpoint \verb{/datasets/\{datasetId\}} and returns
#' the dataset metadata: publication level, registration status, distributions,
#' contact points, themes, etc.
#'
#' @param id string. The UUID of the dataset.
#'
#' @return A list with the dataset metadata. `NULL` when offline.
#' @examples
#' \donttest{
#' i14y_get_dataset(
#'   id = "b902add5-9538-47ed-b663-f9fbfac92381" # SpiGes_Administratives
#' )
#' }
#' @export
i14y_get_dataset <- function(
  id = NULL
) {
  check_string(id)
  if (!check_internet()) return(NULL)

  req <- i14y_request(paste0("/datasets/", id))
  i14y_perform_json(req)
}
