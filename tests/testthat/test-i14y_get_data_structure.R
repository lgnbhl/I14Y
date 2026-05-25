test_that("i14y_get_data_structure() returns data for SpiGes_Administratives", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  res <- i14y_get_data_structure(
    id = "b902add5-9538-47ed-b663-f9fbfac92381" # SpiGes_Administratives
  )
  expect_true(is.data.frame(res) || is.list(res))
  expect_true(length(res) >= 1)
})
