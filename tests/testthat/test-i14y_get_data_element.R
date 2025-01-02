test_that("i14y_get_data_element() returns a data.frame", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  df <- i14y_get_data_element(
    id = "af3b5919-0012-42ac-bbdd-24b591279899",
    language = "en"
  )
  expect_s3_class(df, "data.frame")
  expect_true(nrow(df) >= 1)
})
