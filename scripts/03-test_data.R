#### Preamble ####
# Purpose: Test and check of the simulated data
# Author: Maggie Zhang
# Date: 19 September 2024
# Contact: maggiey.zhang@mail.utoronto.ca
# License: MIT
# Pre-requisites: have the data ready into R
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)


#### Test data ####
data <- read.csv("starter_folder-main/data/raw_data/simulated.csv")

# Test for Neg
data$number_of_marriage |> min() <= 0


# Test for NAs
all(is.na(data$number_of_marriage))