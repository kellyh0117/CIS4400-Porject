### **TEXAS WORKERS’ COMPENSATION DATA WAREHOUSE SETUP – CIS 4400 PROJECT**

**Group 4 – Baruch College, Spring 2025**
**Professor: Jefferson Bien-Aime**
**Prepared by: Kelly Huang**

---

### **Project Objectives**

* Design a relational data warehouse schema to analyze employer participation in Texas workers’ compensation.
* Identify companies with the highest number of non-subscriber filings.
* Create a centralized and clean data model for efficient business reporting.
* Support business users with visual insights using BI tools like Tableau or Looker Studio.

---

### **Business Requirements**

* Analyze which companies have the highest number of people **without** Texas workers’ compensation coverage.
* Track filings over time by location and company name.
* Compare non-subscriber trends across different states and years.
* Visualize the data to support public policy decisions and business analysis.

---

### **Data Model Overview**

The data warehouse is built around a central fact table, `FACT_TAX_COMPANY`, which stores key filing and coverage details. It links to three dimension tables:

* `DIM_COMPANY` (company metadata)
* `DIM_LOCATION` (geographic context)
* `DIM_CALENDAR` (time context)

All foreign key relationships ensure referential integrity and efficient analytics.

---

### **Fact Table: `FACT_TAX_COMPANY`**

Captures all measurable and transactional filing records.

**Key Columns:**

* `Filing_ID` (Primary Key)
* `Filing_Date_Received` (FK to `DIM_CALENDAR`)
* `Company_Name` (FK to `DIM_COMPANY`)
* `Address_1` (FK to `DIM_LOCATION`)
* `Address_2`, `City`, `State`, `Zip_Code`
* `Start_Date`, `End_Date`, `Date_Type`
* `Duration` (calculated from Start and End Date)

---

### **Dimension Tables**

**`DIM_COMPANY`**
Describes employers and their filing records.

* `Company_Name` (PK)
* `Record_Type` (Parent or Location)
* `Filing_ID` (optional FK to fact)

**`DIM_LOCATION`**
Stores normalized location data.

* `Address_1` (PK)
* `Address_2`, `City`, `State`, `Zip_Code`

**`DIM_CALENDAR`**
Time dimension for historical tracking.

* `Filing_Date_Received` (PK)
* `Start_Date`, `End_Date`, `Date_Type`, `Duration`
* `Year_Number`, `Month_Number`, `Day_Number`

---

### **Information Architecture**

The fact table is joined with dimensions to enable analysis by time, company, and geography.

* Clear, descriptive field names (e.g., `Filing_Date_Received`, not `fdr`)
* Duration is derived for time span analysis
* Pre-built views enable users to track filings by year and by top companies
* Example view: `Annual_NonSubscriber_Report_View`

---

### **ETL/Data Integration Process**

1. **Source**: Texas Open Data Portal
   [Link to Dataset](https://data.texas.gov/dataset/Workers-compensation-non-subscriber-employer-infor/azae-8krr/data_preview)

2. **Steps:**

   * **Gather**: Import CSV data
   * **Clean**: Remove duplicates, fix inconsistent formats
   * **Transform**:

     * Extract `Duration` (days between `Start_Date` and `End_Date`)
     * Normalize company and location fields
     * Standardize date formats
   * **Load**: Push into `FACT_TAX_COMPANY` and linked dimensions
   * **Store**: Save final dataset in cloud-based data warehouse (e.g., Snowflake)

---

### **Technical Architecture**

* **Programming**: Python (Pandas, NumPy)
* **Data Storage**: Snowflake
* **ETL Tools**: DBT
* **BI Tools**: Tableau
* **Partitioning**: By `Filing_Date_Received` for performance

---

### **Business Use Cases**

* Identify companies with the most non-subscriber filings
* Monitor trends by year, city, and company
* Highlight states with high rates of non-coverage
* Visual dashboards for stakeholder communication

---

### **Governance & Quality**

* Remove duplicate records
* Ensure `Filing_ID` uniqueness
* Add audit columns for processing timestamp
* Validate date fields and missing values

---

### **BI Integration**

* **Dashboards**:

  * Top 10 Non-Subscriber Companies
  * Yearly Filing Trends
  * State-Level Non-Participation Heatmap
* **Filters**: Company Name, Filing Year, State
* **Prebuilt Reports**: Company Risk Profile, Non-Subscriber Trends

![image](https://github.com/user-attachments/assets/b8c3842a-19c9-47fc-8770-600866db990b)


