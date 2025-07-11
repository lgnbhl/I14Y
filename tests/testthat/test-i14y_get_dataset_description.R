test_that("i14y_get_dataset_description() returns a list", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  list <- i14y_get_dataset_description(
    identifier = "SpiGes_Erhebung_Administratives"
  )
  expect_equal(class(list), "list")
  expect_true(length(list) >= 1)
})
