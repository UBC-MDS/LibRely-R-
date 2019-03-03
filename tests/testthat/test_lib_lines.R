# input: a script
input1 <- "script_for_test1.R"

# expected output: a list that has the information of number of lines and characters
exp_output1 <- list(num_line = 7, num_char = 193)

test_that("In case the input is not a .R script", {

  expect_error(lib_lines("test.txt"))
  expect_error(lib_lines("test.pdf"))

})

test_that("If user specifies an additional argument, it throws an error", {

  expect_error(lib_lines(input1, "script"))

})

test_that("In case the input is not a string", {

  expect_error(lib_lines(123))
  expect_error(lib_lines(c(1,2,3)))
})


test_that("test if the the ouput is correct", {
  #expect_true(file.exists(file.path(".","tests", "script_for_test1.R")))
  expect_equal(lib_lines(input1), exp_output1)
})







