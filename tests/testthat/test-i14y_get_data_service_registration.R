test_that("i14y_get_data_service_registration() returns a character object", {
  if (!curl::has_internet()) {
    skip("No internet connection")
  }
  a_character <- i14y_get_data_service_registration(
    id = "0aaed69d-15ff-415a-8a38-4f9f0c3b429e"
  )
  expect_equal(class(a_character), "character")
})
