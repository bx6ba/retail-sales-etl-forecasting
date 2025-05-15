library(forecast)
library(ggplot2)
library(lubridate)

ts_data <- read.csv("C:/Users/user/Downloads/monthly_sales.csv")

ts_data$MonthYear <- as.Date(paste0(ts_data$MonthYear, "-01"))

sales_ts <- ts(
  ts_data$MonthlySales,
  start = c(year(min(ts_data$MonthYear)), month(min(ts_data$MonthYear))),
  frequency = 12
)

autoplot(sales_ts) +
  labs(title = "Monthly Sales", y = "Sales", x = "Time")

fit <- auto.arima(sales_ts)

forecast_result <- forecast(fit, h = 6)

autoplot(forecast_result) +
  labs(title = "6-Month Sales Forecast", y = "Sales", x = "Time")

forecast_df <- data.frame(
  Date = seq.Date(from = max(ts_data$MonthYear) %m+% months(1), by = "month", length.out = 6),
  Forecast = as.numeric(forecast_result$mean)
)

write.csv(forecast_df, "sales_forecast.csv", row.names = FALSE)
