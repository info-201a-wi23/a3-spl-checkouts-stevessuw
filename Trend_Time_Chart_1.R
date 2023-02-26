# Assigned data to variable

  library(readr)
  ten_checkout <- read_csv("~/Info201code/a3-spl-checkouts-stevessuw/2017-2023-10-Checkouts-SPL-Data.csv")
  View(ten_checkout)

#Trend in physical and digital checkout over the last 5 years

#Group by checkout years

library(plotly)

checkout_trend_5years <- ten_checkout %>% group_by(CheckoutYear, UsageClass) %>% summarise(
  
  total = sum(Checkouts))

# Graph

plot <- plot_ly(
    data = checkout_trend_5years, x = ~CheckoutYear, y = ~total, type = "scatter", name = ~UsageClass, linetype = ~UsageClass  
  ) %>%
  layout(
    title = "COVID-19's impact on the class of media (2017-2023)",
    xaxis = list(title = "Year"),
    yaxis = list(title= "Media Type")
  )

plot


 



