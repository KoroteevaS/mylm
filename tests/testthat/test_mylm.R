
##  Test inputs of the function

## 1.1. Test invalid
## 1.1.1. Test invalid formula
test_that("error comes with invalid formula", {
  expect_error(mylm(wrong_formula, data), "invalid formula")
})

## 1.1.2 Test invalid data
test_that("error comes with invalid data", {
  expect_error(mylm(formula, NULL), "missing 'data' input")
  expect_error(mylm(difficult_formula, NULL), "missing 'data' input")
  expect_error(mylm(formula, wrong_data1))
})

## 1.1.3 Test invalid subset
test_that("subset contains NA values", {
  expect_error(mylm(formula, data, subset = wrong_subset1), "subset contains NA values")
  expect_error(mylm(formula, data, subset = wrong_subset2),"subset contains NA values")
  })


## 1.2. Test valid
test_that("Input is valid",{
  expect_silent(mylm(formula, data))
  expect_silent(mylm(difficult_formula, data))
  expect_silent(mylm(formula,data, subset1))
  expect_silent(mylm(formula,data, subset2))


})

## 2. 

# 2.1. Validate output structure
# 2.1.1. Class output
test_that("return object of 'mylm'", {
  model <- mylm(formula, data)
  expect_s3_class(model, "mylm")
})
##2.1.2. Correct components
test_that("output has correct components", {
  expected_comp <- c("call", "formula", "data", "yname", "coef", "sigma", "vcov", "npar", "df.residual", "residuals","rsquared", "fitted.values")
  comp <- names(model)
  expect_identical(comp, expected_comp)
})


#3. Validate the numerical result for a specific example dataset
test_that("validates numerical result", {
  expected_lm <- lm(difficult_formula, data)
  expected_coefs <- coef(expected_lm)
  actual_coefs <- model2$coef
  expect_equal(actual_coefs, expected_coefs)
})




