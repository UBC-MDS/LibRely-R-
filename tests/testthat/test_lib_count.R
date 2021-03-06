context("Test lib_count")

# input: a script
input1 <- "file/script_for_test1.R"
input3 <- "file/script_for_test3.R"

# expected output: a dataframe of the package, function and count
exp_output1 <- tibble::tibble(package_name = c("dplyr", "dplyr","dplyr","tibble"),
                          function_name = c("mutate", "summarize_all","tibble","tibble"),
                          count = as.integer(c(1,1,1,1)))


test_that("If the function has correct output", {

  expect_equal(lib_count(input1), exp_output1)
  expect_equal(lib_count(input3), NULL)

})

test_that("In case the input is not a .R script", {

  expect_equal(lib_count("file/script_for_test1.txt"), "The input should be a .R script")
  expect_equal(lib_count("file/script_for_test1.pdf"), "The input should be a .R script")

})

test_that("If user specifies an additional argument, it throws an error", {

  expect_error(lib_count(input, "script"))

})

