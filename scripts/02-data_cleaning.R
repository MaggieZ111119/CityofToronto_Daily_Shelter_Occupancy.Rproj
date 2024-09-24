#### Preamble ####
# Purpose: Cleans the raw plane data by Open Data Toronto
# Author: Maggie Zhang
# Date: 19 September 2024
# Contact: maggiey.zhang@mail.utoronto.ca
# License: MIT
# Pre-requisites: Have the data downloaded
# Any other information needed? No

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_marriage_data <- read_csv(
  "starter_folder-main/data/raw_data/raw_marriage_data.csv")

cleaned_data <-
  raw_marriage_data |>
  janitor::clean_names() |>
  separate(col = time_period, into = c("year", "month"), sep = "-") |>
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-")))

#### Save data ####
write_csv(cleaned_data, "starter_folder-main/data/analysis_data/cleaned_data.csv")
