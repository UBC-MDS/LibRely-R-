# This is a test script for the librely unit tests
# It is designed to test the pkg functions on that have not been installed on the users computer
# We expect a relevant error

library(dplyr)
library(abc) # This pkg has not been installed on my local computer.

df <- tibble(x = rnorm(1000),
             y = rnorm(1000))

df <- df %>%
  mutate(z = (x + y)/2) %>%
  summarize_all(c("mean", "sd"))
