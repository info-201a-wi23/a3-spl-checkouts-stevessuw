#Loading libaries and dataset 
library(readr)
library(dplyr)
library(plotly)
ten_checkout <- read_csv("2017-2023-10-Checkouts-SPL-Data.csv")
View(ten_checkout)

# How many physical forms of media get checked out in 2020?
  
physical_forms <- ten_checkout %>% filter(UsageClass == "Physical") %>% filter(CheckoutYear == "2020") %>% summarise(total = sum(Checkouts)) %>% pull(total)
  
# How many digital forms of media get checked out in 2020?

digital_forms <- ten_checkout %>% filter(UsageClass == "Digital") %>% filter(CheckoutYear == "2020") %>% summarise(total = sum(Checkouts)) %>% pull(total)

# How many total checkouts were there in 2020? 

total_checkouts <- ten_checkout %>% filter(CheckoutYear == "2020") %>% summarise(total = sum(Checkouts)) %>% pull(total)

# Which specific form of media becomes the most checked out in 2020?

most_specific_forms <- ten_checkout %>% filter(CheckoutYear == "2020") %>% group_by(MaterialType) %>% summarise(total = sum(Checkouts)) %>% filter(total == max(total)) %>% pull(MaterialType)

# Which specific form of media becomes the least checked out in 2020?

least_specfic_forms <- ten_checkout %>% filter(CheckoutYear == "2020") %>% group_by(MaterialType) %>% summarise(total = sum(Checkouts)) %>% filter(total == min(total)) %>% pull(MaterialType)
