# City of Toronto Shelter Analysis

## Overview
Toronto faces persistent challenges in assisting individuals who, primarily due to poverty, cannot afford housing and struggle to meet basic living. In response to the issue, City of Toronto operates a network of shelters catering to men, women, youth, and families, making it essential to balance the availability of these services with demand. Monitoring shelter occupancy trends with capacity is crucial for identifying resource gaps and developing effective policies to address the needs of homeless populations.

This `paper` (https://github.com/MaggieZ111119/CityofToronto_Daily_Shelter_Occupancy.Rproj/blob/main/paper/paper.pdf) studies the shelter occupancy data from 2017 to 2020 across four cities: Toronto, Etobicoke, Scarborough, and North York.


## Data Access

City of Toronto Shelter data of 2017, 2018, 2019, and 2020 can be accessed from : https://open.toronto.ca/dataset/daily-shelter-occupancy/ 



## File Structure

The repository is structured as follows:

-   `other/sketches` contains the hand-drawn visualization on of how to do with the data
-   `other/llms` contains history with LLM ChatGPT, which was used to assist the code construct through the paper
-   `data/raw_data` contains the raw data as obtained from Open Data Toronto
-   `data/analysis_data` contains the cleaned full dataset from 2017 to 2020 that used for final analysis.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
-   `scripts`: R scripts used to download, simulate, test, and clean data.


## Statement on LLM usage

Aspects of the paper are written with the help of ChatGPT and the full chat history is available in other/llms/usage.txt.