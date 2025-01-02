test_that("i14y_get_data_service() returns a list", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  list <- i14y_get_data_service(
    id = "0aaed69d-15ff-415a-8a38-4f9f0c3b429e",
    language = "en"
  )
  expect_equal(class(list), "list")
  expect_true(length(list) >= 1)
})
