test_that("mylm gives helpful errors for invalid inputs", {
  # Test invalid formula
  expect_error(mylm(123, mtcars), "The input 'formula' must be an object of class 'formula'.")
  
  # Test invalid data
  expect_error(mylm(~ mpg + hp, 123), "The input 'data' must be a data frame or a list.")
  
  # Test invalid subset
  expect_error(mylm(~ mpg + hp, mtcars, subset = "cyl > 4"), "The input 'subset' must be a logical vector.")
})