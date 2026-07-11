#' Search entries within a codelist concept
#'
#' Calls the I14Y public API endpoint
#' \verb{/concepts/\{conceptId\}/codelist-entries/search}. This replaces the former
#' `i14y_search_nomenclature()`: in the new I14Y data model, what used to be a
#' single multi-level nomenclature is now a set of separate codelist concepts
#' (e.g. `NOGA_SECTION`, `NOGA_DIVISION`, `NOGA_GROUP`, `NOGA_CLASS`).
#'
#' @param id string. The UUID of the codelist concept.
#' @param query string. The search query. If `NULL`, all entries are returned
#'   (subject to `filters`, `page` and `pageSize`).
#' @param language string. The language of the response data
#'   ("de", "fr", "en", "it", "rm"). Default "de".
#' @param filters character vector. Optional filter expressions, passed through
#'   to the API as the `filters` array parameter.
#' @param page integer. The number of the result page to return.
#' @param pageSize integer. The size of each result page.
#'
#' @return A tibble of codelist entry summaries. `NULL` when offline.
#' @export
#' @examples
#' \donttest{
#' i14y_search_codelist(
#'   id = "08d94604-e058-62a2-aa25-53f84b974201", # NOGA_DIVISION
#'   query = "agriculture",
#'   language = "fr"
#' )
#' }
i14y_search_codelist <- function(
  id = NULL,
  query = NULL,
  language = "de",
  filters = NULL,
  page = NULL,
  pageSize = NULL
) {
  check_string(id)
  if (!is.null(query)) check_string(query)
  language <- arg_match(language, i14y_languages())
  if (!check_internet()) return(NULL)

  req <- i14y_request(
    paste0("/concepts/", id, "/codelist-entries/search"),
    query = list(
      query = query,
      language = language,
      filters = filters,
      page = page,
      pageSize = pageSize
    )
  )
  as_tibble_safe(i14y_perform_json(req))
}

#' Export search results from a codelist concept
#'
#' Calls the I14Y public API endpoint
#' \verb{/concepts/\{conceptId\}/codelist-entries/search/exports/\{dataFormat\}}.
#'
#' @inheritParams i14y_search_codelist
#' @param format string. The export format ("csv" or "json").
#' @param withAnnotations logical. If `TRUE`, annotations are included.
#'
#' @return A tibble for "csv", a list for "json". `NULL` when offline.
#' @export
i14y_export_codelist_search <- function(
  id = NULL,
  query = NULL,
  language = "de",
  filters = NULL,
  format = "csv",
  withAnnotations = FALSE
) {
  check_string(id)
  if (!is.null(query)) check_string(query)
  check_string(format)
  check_logical(withAnnotations)
  language <- arg_match(language, i14y_languages())
  format <- arg_match(format, c("csv", "json"))
  api_format <- c(csv = "Csv", json = "Json")[[format]]
  if (!check_internet()) return(NULL)

  req <- i14y_request(
    paste0(
      "/concepts/", id,
      "/codelist-entries/search/exports/", api_format
    ),
    query = list(
      query = query,
      language = language,
      filters = filters,
      withAnnotations = withAnnotations
    )
  )

  if (format == "csv") {
    return(readr::read_csv(i14y_perform_raw(req), show_col_types = FALSE))
  }
  i14y_perform_json(req, unwrap_data = FALSE)
}
