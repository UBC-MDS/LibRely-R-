context("Test lib_count")

# input: a script
input1 <- "file/script_for_test1.R"
input3 <- "file/script_for_test3.R"

# expected output: a dataframe of the package, function and count
library(tidyverse)
exp_output1 <- tibble(package_name = c("dplyr", "dplyr","dplyr","tibble"),
                          function_name = c("mutate", "summarize_all","tibble","tibble"),
                          count = as.integer(c(1,1,1,1)))


test_that("If the function has correct output", {

  expect_equal(lib_count(input1), exp_output1)
  expect_equal(lib_count(input3), NULL)

})

test_that("In case the input is not a .R script", {

  expect_error(lib_count("test.txt"))
  expect_error(lib_count("test.pdf"))

})

test_that("If user specifies an additional argument, it throws an error", {

  expect_error(lib_count(input, "script"))

})

test_that("In case the input is not a path", {

  expect_error(lib_count(123))
  expect_error(lib_count(c(1,2,3)))
  expect_error(lib_count("This is a string"))
  expect_error(lib_count(data.frame(a=c(1,2),b=c("one","second"))))
})
