test_that("i14y_list_catalogs() returns a list/data.frame", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  res <- i14y_list_catalogs(pageSize = 3)
  expect_true(is.list(res) || is.data.frame(res))
})

test_that("i14y_get_catalog() and records work for the first listed catalog", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  catalogs <- i14y_list_catalogs(pageSize = 1)
  ids <- if (is.data.frame(catalogs)) catalogs$id else catalogs
  catalog_id <- if (length(ids) >= 1) ids[[1]] else NULL
  if (is.null(catalog_id)) {
    skip("No catalogs returned from API")
  }

  cat_res <- i14y_get_catalog(id = catalog_id)
  expect_type(cat_res, "list")

  records <- i14y_get_catalog_records(id = catalog_id)
  expect_true(is.list(records) || is.data.frame(records))
})

test_that("i14y_get_catalog_dcat() returns a non-empty raw string", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  catalogs <- i14y_list_catalogs(pageSize = 1)
  ids <- if (is.data.frame(catalogs)) catalogs$id else catalogs
  catalog_id <- if (length(ids) >= 1) ids[[1]] else NULL
  if (is.null(catalog_id)) {
    skip("No catalogs returned from API")
  }
  out <- i14y_get_catalog_dcat(id = catalog_id, format = "TTL")
  expect_type(out, "character")
  expect_gt(nchar(out), 0)
})

test_that("catalog functions validate their arguments", {
  expect_error(i14y_get_catalog(id = NULL))
  expect_error(i14y_get_catalog(id = 123))
  expect_error(i14y_get_catalog_records(id = NULL))
  expect_error(i14y_get_catalog_record(id = "x", recordId = NULL))
  expect_error(i14y_get_catalog_dcat(id = "x", format = "json"))
})
