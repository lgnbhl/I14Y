test_that("i14y_export_codelist_search() returns a tibble for csv export", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  res <- i14y_export_codelist_search(
    id = "08d94604-e058-62a2-aa25-53f84b974201", # NOGA_DIVISION
    query = "agriculture",
    language = "fr",
    format = "csv"
  )
  expect_s3_class(res, "tbl_df")
})

test_that("i14y_export_codelist_search() validates its arguments", {
  expect_error(i14y_export_codelist_search(id = NULL))
  expect_error(i14y_export_codelist_search(id = "x", format = "xml"))
  expect_error(i14y_export_codelist_search(id = "x", language = "xx"))
})
