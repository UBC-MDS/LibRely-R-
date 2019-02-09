
# input: a script
input <- "test_file/findme/summarized_data.R"

# expected output: a list of dependencies
exp_output <- c(tidyverse, ggplot2)
exp_output1 <- c()


test_that("In case the input is not a .R script", {
  
  expect_error(findme("test_file/findme/input.txt"))
  expect_error(findme("test_file/findme/input.pdf"))
  
})

test_that("If user specifies an additional argument, it throws an error", {
  
  expect_error(findme("test_file/findme/summarized_data.R", "script"))
  
})

test_that("In case the input is not a string", {
  
  expect_error(findme(123))
  expect_error(findme(c(1,2,3)))
})


test_that("In case the input path does not exist", {
  
  expect_error(findme("123/input.R"))
  expect_error(findme("test_file/input.R"))
})

test_that("In case the output vector is empty", {
  
  expect_equal(findme("test_file/findme/summarized_data.R"), exp_output1)
})





