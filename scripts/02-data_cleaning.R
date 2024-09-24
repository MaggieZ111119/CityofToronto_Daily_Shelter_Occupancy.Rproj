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
cleaned_2017 <- raw_2017_shelter %>%
  group_by(OCCUPANCY_DATE,SHELTER_CITY,SECTOR) %>% 
  summarize(
    Totoal_Occupancy = sum(OCCUPANCY, na.rm = TRUE),
    Totoal_Capacity = sum(CAPACITY, na.rm = TRUE),
    .groups = 'drop') %>%
  select(OCCUPANCY_DATE, SHELTER_CITY, SECTOR, 
         Totoal_Occupancy, Totoal_Capacity)

#2018 Data
cleaned_2018 <- raw_2018_shelter %>%
  group_by(OCCUPANCY_DATE,SHELTER_CITY,SECTOR) %>% 
  summarize(
    Totoal_Occupancy = sum(OCCUPANCY, na.rm = TRUE),
    Totoal_Capacity = sum(CAPACITY, na.rm = TRUE),
    .groups = 'drop') %>%
  select(OCCUPANCY_DATE, SHELTER_CITY, SECTOR, 
         Totoal_Occupancy, Totoal_Capacity)

#2019 Data
cleaned_2019 <- raw_2019_shelter %>%
  group_by(OCCUPANCY_DATE,SHELTER_CITY,SECTOR) %>% 
  summarize(
    Totoal_Occupancy = sum(OCCUPANCY, na.rm = TRUE),
    Totoal_Capacity = sum(CAPACITY, na.rm = TRUE),
    .groups = 'drop') %>%
  select(OCCUPANCY_DATE, SHELTER_CITY, SECTOR, 
         Totoal_Occupancy, Totoal_Capacity)

#2020 Data
cleaned_2020 <- raw_2020_shelter %>%
  group_by(OCCUPANCY_DATE,SHELTER_CITY,SECTOR) %>% 
  summarize(
    Totoal_Occupancy = sum(OCCUPANCY, na.rm = TRUE),
    Totoal_Capacity = sum(CAPACITY, na.rm = TRUE),
    .groups = 'drop') %>%
  select(OCCUPANCY_DATE, SHELTER_CITY, SECTOR, 
         Totoal_Occupancy, Totoal_Capacity)

## Combine 4 dataset in order
full_shelter_data <- rbind(raw_2017_shelter, raw_2018_shelter,
                  raw_2019_shelter, raw_2020_shelter)


cleaned_data <-
  raw_marriage_data |>
  janitor::clean_names() |>
  separate(col = time_period, into = c("year", "month"), sep = "-") |>
  mutate(date = lubridate::ymd(paste(year, month, "01", sep = "-")))

#### Save data ####
write_csv(cleaned_data, "starter_folder-main/data/analysis_data/cleaned_data.csv")
