# Assigned data to variable

library(readr)
library(dplyr)
ten_checkout <- read_csv("2017-2023-10-Checkouts-SPL-Data.csv")
View(ten_checkout)

#Trend in physical and digital checkout over the last 5 years

#Group by checkout years

library(plotly)
checkout_trend_5years_material <- ten_checkout %>% group_by(CheckoutYear, MaterialType) %>% summarise(
  
  total_2 = sum(Checkouts))

top_n(checkout_trend_5years_material, 4)

# Graph

plot_2 <- plot_ly(
  data = top_n(checkout_trend_5years_material, 4), x = ~CheckoutYear, y = ~total_2, type = "scatter", name = ~MaterialType, linetype = ~MaterialType  
) %>%
  layout(
    title = "COVID-19's impact on the class of media (2017-2023)",
    xaxis = list(title = "Year"),
    yaxis = list(title= "Media Type")
  )

plot_2




