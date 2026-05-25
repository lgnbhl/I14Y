test_that("i14y_get_content_information() returns a list", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  res <- i14y_get_content_information(
    id = "b902add5-9538-47ed-b663-f9fbfac92381" # SpiGes_Administratives
  )
  expect_type(res, "list")
  expect_true(length(res) >= 1)
})
