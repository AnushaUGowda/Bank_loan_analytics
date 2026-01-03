# Bank Loan Analytics Project

## 1. Project Overview

The objective of this project is to analyze bank loan data to understand lending patterns, borrower behavior, and repayment trends. The project follows an end-to-end data analytics workflow, starting from raw data ingestion and cleaning to KPI creation and dashboard-ready outputs. The analysis helps stakeholders make data-driven decisions related to credit risk, customer segmentation, and loan performance.

---

## 2. Project Workflow & Tasks

The project was executed in the following structured phases:

 **SQL Conversion & Database Creation**

   * Converted XLSX data to CSV and loaded it into MySQL.
   * Created and managed the `Bank_Analytics` database.

1. **Understand Data**

   * Reviewed raw dataset structure, columns, and data types.
   * Identified date fields, numeric measures, and categorical attributes relevant to banking analytics.

2. **Load Data**

   * Loaded the raw dataset into MySQL as a base table (`bank_analytics`).
   * Kept date columns as VARCHAR initially to avoid CSV import and format inconsistencies.

3. **Data Cleaning**

   * Initial checks and formatting were done before database insertion where required.

4. **Data Modelling**

   * Created a cleaned and transformed table (`cleaned_bank_analytics`) from the raw table.
   * Created a separate `state` dimension table mapping state codes to full state names.
   * Joined with the cleaned fact table to improve readability and dashboard usability.

5. **Pivot Table Logic (Analytical Design)**

   * Designed aggregations and grouping logic aligned with business KPIs.


---

## 3. Data Preparation & Cleaning

### 3.1 Raw Table (`bank_analytics`)

* Stored imported data with minimal transformation.
* Date fields (`issue_d`, `last_pymnt_d`, `last_credit_pull_d`) were stored as VARCHAR to prevent import errors.

### 3.2 Cleaned Table (`cleaned_bank_analytics`)

Key transformations applied:

* Trimmed whitespace and converted empty strings to NULL values.
* Standardized categorical fields (uppercase for grades, lowercase for statuses).
* Converted percentage and numeric text fields into DECIMAL values.
* Converted date strings into proper DATE format using `STR_TO_DATE`.
* Ensured consistent state codes for joining with a state dimension table.

This separation ensured data integrity, reproducibility, and professional ETL practices.

---

## 4. Data Quality Checks

* **Row Count Validation**: Verified that cleaned data retained expected records.
* **Duplicate Check**: Confirmed no duplicate loan IDs were present.
* **Null Analysis**: Audited missing values in key analytical columns such as loan amount, state, loan status, and date fields.

These checks ensured reliability of KPI calculations.

---

## 5. Key Performance Indicators (KPIs)

### KPI 1: Year-wise Loan Amount Statistics

**Purpose:** Analyze loan disbursement trends over time.

**Metrics:**

* Total loan amount issued per year
* Average loan amount per year
* Number of loans issued per year

**Insight Value:** Helps identify growth or decline in lending activity across years.

---

### KPI 2: Grade & Sub-grade Wise Revolving Balance

**Purpose:** Understand revolving balance distribution across credit grades.

**Metrics:**

* Total revolving balance by grade and sub-grade

**Insight Value:** Indicates risk exposure and borrowing behavior across different credit quality segments.

---

### KPI 3: Total Payment – Verified vs Non-Verified Customers

**Purpose:** Compare repayment contributions based on verification status.

**Metrics:**

* Total payment amount for verified customers
* Total payment amount for non-verified customers

**Insight Value:** Helps assess the impact of verification on repayment reliability.

---

### KPI 4: State-wise & Last Credit Pull Date-wise Loan Status

**Purpose:** Track loan status trends geographically and over time.

**Metrics:**

* Number of loans by state
* Loan status distribution by year-month of last credit pull

**Insight Value:** Identifies regional and temporal patterns in loan performance.

---

### KPI 5: Home Ownership vs Last Payment Date Statistics

**Purpose:** Analyze repayment trends based on home ownership status.

**Metrics:**

* Number of loans by home ownership type
* Distribution by year-month of last payment date

**Insight Value:** Helps understand how asset ownership correlates with repayment behavior.

---

## 6. Data Modelling – State Dimension

* Created a separate `state` dimension table mapping state codes to full state names.
* Joined with the cleaned fact table to improve readability and dashboard usability.

This follows dimensional modelling best practices.

---

## 7. Dashboard Readiness

All SQL queries were written to:

* Use consistent date grains (Year or Year-Month)
* Avoid unnecessary NULLs
* Support filters, slicers, and drill-down analysis

The dataset is fully ready for visualization in Power BI or Excel dashboards.

---

## 8. Tools & Technologies Used

* **Database:** MySQL
* **Data Cleaning:** SQL
* **Data Modelling:** SQL (Fact & Dimension tables)
* **Visualization:** Power BI / Excel (Dashboard-ready)

---

## 9. Conclusion

This project demonstrates a complete banking analytics lifecycle, from raw data ingestion to business-ready insights. Strong emphasis was placed on data quality, structured transformations, and meaningful KPI design. The analysis provides actionable insights into loan trends, credit risk, regional performance, and customer behavior.





