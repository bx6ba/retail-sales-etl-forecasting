library(dplyr)
library(lubridate)

rfm_data <- read.csv("C:/Users/user/Downloads/rfm_input.csv")

rfm_data$LastOrderDate <- as.Date(rfm_data$LastOrderDate)

analysis_date <- max(rfm_data$LastOrderDate)

rfm_data <- rfm_data %>%
  mutate(
    Recency = as.numeric(analysis_date - LastOrderDate)
  )

rfm_data <- rfm_data %>%
  mutate(
    R_score = ntile(-Recency, 5),  
    F_score = ntile(Frequency, 5),
    M_score = ntile(Monetary, 5),
    RFM = paste0(R_score, F_score, M_score)
  )

rfm_data <- rfm_data %>%
  mutate(
    Segment = case_when(
      R_score >= 4 & F_score >= 4 & M_score >= 4 ~ "Champions",
      R_score >= 4 & F_score >= 3 ~ "Loyal Customers",
      R_score >= 3 & M_score >= 4 ~ "Big Spenders",
      R_score >= 4 ~ "Recent Buyers",
      R_score <= 2 & F_score <= 2 & M_score <= 2 ~ "At Risk",
      TRUE ~ "Others"
    )
  )

rfm_numeric <- rfm_data %>% select(Recency, Frequency, Monetary)

rfm_scaled <- scale(rfm_numeric)

set.seed(123)
k_result <- kmeans(rfm_scaled, centers = 4)

rfm_data$Cluster <- as.factor(k_result$cluster)

head(rfm_data)

write.csv(rfm_data, "rfm_output.csv", row.names = FALSE)