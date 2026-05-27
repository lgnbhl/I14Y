i14y_base_url <- function() {
  Sys.getenv("I14Y_BASE_URL", "https://api.i14y.admin.ch/api/public/v1")
}

i14y_user_agent <- function() {
  "I14Y R package (https://github.com/lgnbhl/I14Y)"
}

# httr2 formats logicals as "TRUE"/"FALSE"; the I14Y backend expects
# JSON-style "true"/"false". Convert at the edge.
format_query_value <- function(x) {
  if (is.logical(x)) tolower(as.character(x)) else x
}

format_query <- function(query) {
  if (is.null(query)) return(NULL)
  lapply(query, format_query_value)
}

i14y_request <- function(path, query = NULL) {
  req <- httr2::request(i14y_base_url())
  req <- httr2::req_user_agent(req, i14y_user_agent())
  req <- httr2::req_url_path_append(req, path)
  query <- drop_nulls(query %||% list())
  # The API silently ignores `pageSize` when `page` is not also set, so a
  # call like i14y_list_*(pageSize = 3) would otherwise return all rows.
  # `[[` is required: `$page` partial-matches `pageSize` in R.
  if (!is.null(query[["pageSize"]]) && is.null(query[["page"]])) {
    query[["page"]] <- 1
  }
  query <- format_query(query)
  if (length(query) > 0) {
    req <- rlang::inject(httr2::req_url_query(req, !!!query, .multi = "explode"))
  }
  req <- httr2::req_retry(
    req,
    max_tries = 3,
    is_transient = function(resp) {
      httr2::resp_status(resp) %in% c(408, 425, 429, 500, 502, 503, 504)
    }
  )
  req <- httr2::req_error(req, body = i14y_error_body)
  req
}

i14y_error_body <- function(resp) {
  body <- tryCatch(
    httr2::resp_body_json(resp),
    error = function(e) NULL
  )
  if (is.list(body)) {
    msg <- c(body$title, body$detail)
    if (length(msg) > 0) return(paste(msg, collapse = " - "))
  }
  txt <- tryCatch(httr2::resp_body_string(resp), error = function(e) NULL)
  if (!is.null(txt) && nzchar(txt)) txt else NULL
}

# The I14Y public API consistently wraps list responses in { "data": [...] }
# with no sibling pagination keys (pagination is encoded in headers, not the
# body), so the presence of a top-level `data` field is enough to identify
# the envelope.
is_envelope <- function(body) {
  is.list(body) && "data" %in% names(body)
}

i14y_perform_json <- function(req, unwrap_data = TRUE) {
  resp <- httr2::req_perform(req)
  body <- httr2::resp_body_json(resp, simplifyVector = TRUE, flatten = TRUE)
  if (unwrap_data && is_envelope(body)) {
    return(body$data)
  }
  body
}

i14y_perform_raw <- function(req) {
  resp <- httr2::req_perform(req)
  httr2::resp_body_string(resp)
}

drop_nulls <- function(x) {
  x[!vapply(x, is.null, logical(1))]
}

# Used by every exported function: if there is no internet, inform the user
# with a cli-styled message and return NULL. Returns TRUE when the caller
# should continue, FALSE otherwise.
check_internet <- function() {
  if (!curl::has_internet()) {
    cli::cli_inform("No internet connection.")
    return(FALSE)
  }
  TRUE
}

# Safe wrapper around tibble::as_tibble for API payloads that may be empty
# lists or NULL. Always returns a tibble.
as_tibble_safe <- function(x) {
  if (is.null(x)) return(tibble::tibble())
  if (is.data.frame(x)) return(tibble::as_tibble(x))
  if (is.list(x) && length(x) == 0) return(tibble::tibble())
  tibble::as_tibble(x)
}
