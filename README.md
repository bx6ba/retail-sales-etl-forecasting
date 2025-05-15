# End-to-End Retail Sales Analysis and Forecasting

This project presents a full ETL and analytics pipeline for analyzing and forecasting retail sales. It uses SQL, R, and Power BI to process over 10,000 transaction records, segment customers based on behavior, and forecast sales for the next six months.

## Tech Stack

- **SQL**: Data extraction, transformation, and KPI calculation  
- **R**: RFM segmentation, k-means clustering, ARIMA time series forecasting  
- **Power BI**: Interactive dashboard to visualize KPIs, customer segments, forecasts, and regional performance

## Key Features

- Built an ETL pipeline to process more than 10,000 transaction records  
- Calculated KPIs including $2.3M in total sales, 4,922 orders, $459 average order value, and 793 unique customers  
- Performed RFM analysis and applied k-means clustering to segment 793 customers  
- Built and visualized an ARIMA model in R forecasting $328K in sales over 6 months (peak in March, lowest in February)  
- Developed an interactive Power BI dashboard to explore sales trends, customer segments, forecasts, and top-performing states (California and New York)

## Folder Structure

- `sql/`: SQL script  
- `r/`: R scripts for customer segmentation and forecasting  
- `dashboard/`: Power BI dashboard 
- `data/`: Original dataset

## Insights

The analysis revealed seasonal sales trends, customer behavior clusters, and regional sales concentration in California and New York. Forecasting provided a forward-looking view that can inform inventory and marketing strategies.



## License
GPL 2
