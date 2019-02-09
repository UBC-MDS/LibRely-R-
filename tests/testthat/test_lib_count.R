# input: a script
input <- "tests/scripts/summarized_data.R"

# expected output: a dataframe of the package, function and count
exp_output <- data.frame(pkg = c("dplyr", "dplyr"),
                         functions = c("mutate", "summarize"),
                         count = c(1,1))


test_that("Simple case with one pkg and two funs", {

  expect_equal(lib_count("tests/scripts/summarized_data.R"), exp_output)

})
