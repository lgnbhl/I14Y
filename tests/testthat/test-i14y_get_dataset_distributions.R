test_that("i14y_get_dataset_distributions() returns a data.frame", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  df <- i14y_get_dataset_distributions(identifier = "HCL_NOGA",  language = "en")
  expect_s3_class(df, "data.frame")
  expect_true(nrow(df) >= 1)
})
