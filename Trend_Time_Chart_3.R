# Assigned data to variable

library(readr)
library(dplyr)
library(plotly)
ten_checkout <- read_csv("2017-2023-10-Checkouts-SPL-Data.csv")
View(ten_checkout)

checkout_by_year <- ten_checkout %>% group_by(CheckoutYear) %>% summarise(Checkouts = sum(Checkouts))

plot_3 <- plot_ly(data = checkout_by_year, x = ~CheckoutYear, y = ~Checkouts, type = "bar"
) %>%
  layout(
    title = "SPL Checkouts per year (2017-2023)",
    xaxis = list(title = "Year"),
    yaxis = list(title= "Checkouts")
  )

plot_3
