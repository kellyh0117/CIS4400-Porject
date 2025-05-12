CIS4400 Cloud Data Pipeline Project – Workers' Compensation Analytics
Dataset: [Texas Workers' Compensation Non-Subscriber Employer Info](https://data.texas.gov/dataset/Workers-compensation-non-subscriber-employer-infor/azae-8krr)


Project Overview

This project focuses on analyzing a real-world dataset of employers in Texas who have opted out of providing workers’ compensation coverage. The goal was to build a cloud-based data pipeline that could collect, clean, transform, and visualize this data using modern tools. The project covers everything from data sourcing and storage to transformation, modeling, and interactive dashboard reporting.



Dataset Description

The dataset includes the following key information:
- `filing_id`: Unique ID for each filing
- `filing_date_received`: Date the filing was received
- `company_name`: Name of the employer
- `address`, `city`, `state`, `zip_code`: Location details
- `start_date` and `end_date`and `duation`: Period during which the company opted out
- `record_type` and `date_type`: Additional metadata about the filing
These fields were used to assess the duration of non-coverage, identify trends, and compare opt-out behavior across companies, ZIP codes, and time.

Project Workflow

1. Data Sourcing & Storage
- Data was downloaded from the Texas Open Data Portal.
- Uploaded into Snowflake, a cloud data warehouse platform.
- Created a structured table to store the raw data.

2. Data Cleaning & Transformation (DBT)
- Used DBT (Data Build Tool) to:
  - Clean the raw data
  - Standardize date formats (to `YYYY-MM-DD`)
  - Remove duplicate records
  - Handle null values
  - Calculate the duration between `start_date` and `end_date`
  - Extract date parts like `year`, `month`, and `quarter`
- Created reusable DBT models for cleaned data and fact tables.

3. Data Modeling
- Designed a star schema within Snowflake:
  - Fact Table: Stores durations and keys to dimension tables
  - Dimension Tables: Includes company and date breakdowns
- Used surrogate keys for relationships between tables

4. Data Visualization (Tableau)
- Connected Tableau directly to Snowflake
- Created a live, interactive dashboard with:
  - Pie chart to compare companies
  - Bar chart by ZIP code
  - Line chart to show changes over time
  - Heat map to explore duration by company and state
  - Filter controls for date and location

---
Tools Used

| Tool       | Purpose                           |
|------------|-----------------------------------|
| Snowflake  | Cloud data warehouse and storage  |
| DBT        | Data transformation and modeling  |
| Tableau    | Data visualization and dashboard  |
| SQL        | Query language for data handling  |
| GitHub     | Version control and documentation |


Project Outcome

This project resulted in a full end-to-end cloud data pipeline. I was able to transform raw government data into meaningful insights using DBT and Snowflake, then visualize the results using Tableau. It reinforced my understanding of cloud storage, data modeling, ETL pipelines, and real-time reporting.

