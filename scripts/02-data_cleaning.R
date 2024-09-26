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
library(dplyr)

#### Clean data ####
raw_2017_shelter <- data.frame(read_csv(
  "data/raw_data/raw_2017_shelter_data.csv", show_col_types = FALSE))
raw_2018_shelter <- data.frame(read_csv(
  "data/raw_data/raw_2018_shelter_data.csv", show_col_types = FALSE))
raw_2019_shelter <- data.frame(read_csv(
  "data/raw_data/raw_2019_shelter_data.csv", show_col_types = FALSE))
raw_2020_shelter <- data.frame(read_csv(
  "data/raw_data/raw_2020_shelter_data.csv", show_col_types = FALSE))


## Fix issue with data in four dataset, and select columns within our interest.
#2017 Data
cleaned_2017 <- raw_2017_shelter |>
  # clean names of columns 
  janitor::clean_names() |>
  # change date to recognizable format
  mutate(date = as.Date(raw_2017_shelter$OCCUPANCY_DATE, format = "%Y-%m-%d"))

cleaned_2017 <- cleaned_2017 |>
  # get information needed for analysis with my interest
  group_by(occupancy_date,shelter_city,sector) |> 
  summarize(
    # occupancy number in each city for each sector 
    totoal_occupancy = sum(occupancy, na.rm = TRUE),
    # occupancy number in each city for each sector 
    totoal_capacity = sum(capacity, na.rm = TRUE),
    .groups = 'drop') |>
  select(occupancy_date, shelter_city, sector, 
         totoal_occupancy, totoal_capacity)

# Make sure date format is consistent with other three datasets
cleaned_2017$occupancy_date <-  as.Date(cleaned_2017$occupancy_date, 
                                        as.is = double, na.rm = TRUE)


#2018 Data
cleaned_2018 <- raw_2018_shelter |>
  # clean names of columns 
  janitor::clean_names() |>
  # change date to recognizable format
  mutate(date = as.Date(raw_2018_shelter$OCCUPANCY_DATE, format = "%Y-%m-%d"))

cleaned_2018 <- cleaned_2018 |>
  # get information needed for analysis with my interest
  group_by(occupancy_date,shelter_city,sector) |> 
  summarize(
    # occupancy number in each city for each sector 
    totoal_occupancy = sum(occupancy, na.rm = TRUE),
    # occupancy number in each city for each sector 
    totoal_capacity = sum(capacity, na.rm = TRUE),
    .groups = 'drop') |>
  select(occupancy_date, shelter_city, sector, 
         totoal_occupancy, totoal_capacity)

# Make sure date format is consistent with other three datasets
cleaned_2018$occupancy_date <-  as.Date(cleaned_2018$occupancy_date, 
                                        as.is = double, na.rm = TRUE)

#2019 Data
cleaned_2019 <- raw_2019_shelter |>
  # clean names of columns 
  janitor::clean_names() |>
  # change date to recognizable format
  mutate(date = as.Date(raw_2019_shelter$OCCUPANCY_DATE, format = "%Y-%m-%d"))

cleaned_2019 <- cleaned_2019 |>
  # get information needed for analysis with my interest
  group_by(occupancy_date,shelter_city,sector) |> 
  summarize(
    # occupancy number in each city for each sector 
    totoal_occupancy = sum(occupancy, na.rm = TRUE),
    # occupancy number in each city for each sector 
    totoal_capacity = sum(capacity, na.rm = TRUE),
    .groups = 'drop') |>
  select(occupancy_date, shelter_city, sector, 
         totoal_occupancy, totoal_capacity)

# Make sure date format is consistent with other three datasets
cleaned_2019$occupancy_date <-  as.Date(cleaned_2019$occupancy_date, 
                                        as.is = double, na.rm = TRUE)

#2020 Data
cleaned_2020 <- raw_2020_shelter |>
  # clean names of columns 
  janitor::clean_names() |>
  # change date to recognizable format
  mutate(date = as.Date(raw_2020_shelter$OCCUPANCY_DATE, format = "%Y-%m-%d"))

cleaned_2020 <- cleaned_2020 |>
  # get information needed for analysis with my interest
  group_by(occupancy_date,shelter_city,sector) |> 
  summarize(
    # occupancy number in each city for each sector 
    totoal_occupancy = sum(occupancy, na.rm = TRUE),
    # occupancy number in each city for each sector 
    totoal_capacity = sum(capacity, na.rm = TRUE),
    .groups = 'drop') |>
  select(occupancy_date, shelter_city, sector, 
         totoal_occupancy, totoal_capacity)

# Make sure date format is consistent with other three datasets
# Special notice here, 2020 have different date naming structure tha others.
cleaned_2020$occupancy_date <- format(as.Date(cleaned_2020$occupancy_date, 
                                              format = "%m/%d/%Y"), "%Y-%m-%d")


## Combine 4 dataset in order
full_shelter_data <- rbind(cleaned_2017, cleaned_2018,
                           cleaned_2019, cleaned_2020)


head(full_shelter_data)
tail(full_shelter_data)

#### Save data ####
write_csv(full_shelter_data, "data/analysis_data/full_shelter_data.csv")
