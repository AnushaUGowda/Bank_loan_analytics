# 📊 Bank Loan Analytics Project

## 📌 Project Overview

This project focuses on **end-to-end analysis of bank loan data** to uncover insights related to lending trends, customer behavior, repayment patterns, and credit risk. The analysis was carried out using **Excel (Power Query & Pivot Tables)** , with a strong emphasis on data cleaning, modelling, KPI creation, and dashboard development.

The project demonstrates practical data analyst skills commonly used in the **finance and banking domain**.

---

## 🏦 Domain

**Finance / Banking Analytics**

---

## 📂 Datasets

* **Finance_1.xlsx**
* **Finance_2.xlsx**

**Dataset Type:** Excel files
**Dataset Size:** ~39,000+ records in each file

**Key Data Attributes**:
  Loan amount, funded amount, revolving balance
  Loan issue date, last payment date, last credit pull date
  Customer verification status, home ownership
  Loan grade and sub-grade
  State and loan status



---

## 🎯 Business Objectives

* Analyze loan disbursement trends over time
* Understand repayment behavior across customer segments
* Compare verified vs non-verified customers
* Identify state-wise and credit-grade-wise risk patterns
* Build an interactive dashboard for business users

---
## 🛠 Tools & Technologies

* **Excel:** Power Query, Pivot Tables, Dashboards

---
## 🔄 Project Workflow

### 1️⃣ Data Understanding

* Reviewed both datasets to understand schema, data types, and key financial attributes.
* Identified inconsistencies in date formats, text casing, and missing values.

---

### 2️⃣ Data Cleaning (Excel – Power Query)

* Loaded both Excel files using **Power Query**
* Performed the following cleaning steps:

  * Corrected data types (dates, numeric fields)
  * Applied **TRIM** and **CLEAN** functions
  * Standardized text using uppercase/lowercase
  * Replaced blanks and missing values with appropriate defaults
  * Loaded cleaned datasets as **Connection Only**
This approach ensured efficient memory usage and clean data lineage.

<img width="954" height="429" alt="{2994A316-1D68-427D-9175-65ECA2C9D79B}" src="https://github.com/user-attachments/assets/134ca281-4111-4739-a34e-4e2726727bf4" />

<img width="945" height="403" alt="{EF0C43F7-404B-430A-8006-CC65C41F9FC0}" src="https://github.com/user-attachments/assets/4a99fed9-af1c-4767-a9db-708d925a1097" />


---

### 3️⃣ Data Modelling (Excel)

* Used **Merge Query** in Power Query to combine Finance_1 and Finance_2
* Created a single merged fact table
* Loaded merged data as a table for analysis

<img width="953" height="383" alt="{735C16C7-17BD-4B7F-96D9-AF80131AD0BD}" src="https://github.com/user-attachments/assets/09bc008e-3aa9-4da1-ace6-97b5b032b9bb" />

---

### 4️⃣ KPI Analysis (Excel – Pivot Tables & Charts)

Pivot tables and charts were created to meet business requirements.

**Key KPIs:**

### KPI 1: Year-wise Loan Amount Statistics

**Purpose:** Analyze loan disbursement trends over time.

**Metrics:**

* Total loan amount issued per year
* Average loan amount per year
* Number of loans issued per year

**Insight Value:** Helps identify growth or decline in lending activity across years.

  <img width="323" height="106" alt="{84C5691E-DAED-456A-B0FE-D0692748E34C}" src="https://github.com/user-attachments/assets/d57b19bf-3656-4fd1-a64f-3c6514d33488" />
  
---
### KPI 2: Grade & Sub-grade Wise Revolving Balance

**Purpose:** Understand revolving balance distribution across credit grades.

**Metrics:**

* Total revolving balance by grade and sub-grade

**Insight Value:** Indicates risk exposure and borrowing behavior across different credit quality segments.

  <img width="81" height="311" alt="{CC9494D2-1483-45A3-B915-7B031EE51316}" src="https://github.com/user-attachments/assets/bdb8f8d8-ba6a-4b14-8160-eb5034bf7ff7" /> 
  
---
### KPI 3: Total Payment – Verified vs Non-Verified Customers

**Purpose:** Compare repayment contributions based on verification status.

**Metrics:**

* Total payment amount for verified customers
* Total payment amount for non-verified customers

**Insight Value:** Helps assess the impact of verification on repayment reliability.
    <img width="198" height="71" alt="{3482BE11-BBCD-4E04-B7C7-16A0950A630C}" src="https://github.com/user-attachments/assets/b9cd44cb-fde5-4cb5-b749-91f7e9c38972" />

---
### KPI 4: State-wise & Last Credit Pull Date-wise Loan Status

**Purpose:** Track loan status trends geographically and over time.

**Metrics:**

* Number of loans by state
* Loan status distribution by year-month of last credit pull

**Insight Value:** Identifies regional and temporal patterns in loan performance.
    <img width="105" height="342" alt="{80AEAE7B-539D-49C1-B99D-0318E22A1A0E}" src="https://github.com/user-attachments/assets/51ae9d13-dab5-42dc-9957-49b18fd2a562" />
    <img width="96" height="96" alt="{03B05FDE-2730-4DD2-8AAA-F0B63E0F0FFE}" src="https://github.com/user-attachments/assets/e4d9dc3d-d472-4f03-bc20-09dfd684a57c" />

---
### KPI 5: Home Ownership vs Last Payment Date Statistics

**Purpose:** Analyze repayment trends based on home ownership status.

**Metrics:**

* Number of loans by home ownership type
* Distribution by year-month of last payment date

**Insight Value:** Helps understand how asset ownership correlates with repayment behavior.
    <img width="151" height="76" alt="{C480A683-CF95-442B-B110-433C2A88A63D}" src="https://github.com/user-attachments/assets/8696e056-ec2b-4be2-acdb-f3816735829a" />
    <img width="89" height="111" alt="{702B305C-4408-4171-81DE-D2CF2C95E4B2}" src="https://github.com/user-attachments/assets/3a694856-5c92-4b95-8c73-32d8ea48c358" />


---

### 5️⃣ Dashboard Development (Excel)

An interactive Excel dashboard was built using:

* KPI cards (Total Loan Amount, Average Loan, Number of Loans)
* Line chart for year-wise loan trends
* Donut chart for verification status comparison
* Bar charts for grade-wise and home ownership analysis
* Map visualization for state-wise loan status
* Slicers for dynamic filtering (Year, Loan Status, Dates)

📷 **Dashboard Preview:**
<img width="1190" height="724" alt="Screenshot (76)" src="https://github.com/user-attachments/assets/7627e0a2-265f-4892-a423-2c6817984624" />


---


# 📈 Key Insights

* Loan disbursement shows a clear upward trend over time
* Higher revolving balances are concentrated in lower credit grades
* Verified customers contribute more reliably to total payments
* Certain states show higher loan concentration and risk exposure
* Home ownership status influences repayment behavior

---

## 💡 Business Recommendations

* Strengthen customer verification processes
* Closely monitor high revolving balance segments
* Apply region-specific credit risk strategies
* Use home ownership insights for targeted loan products

---



## ✅ Conclusion

This project demonstrates hands-on experience in **data cleaning, modelling, KPI analysis,  and dashboard storytelling**. It reflects real-world analytical workflows used in financial institutions and is suitable for showcasing skills required for **Data Analyst / Business Analyst roles**.

---

⭐ *If you find this project useful, feel free to star the repository!*
