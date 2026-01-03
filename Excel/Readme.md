<img width="1507" height="105" alt="image" src="https://github.com/user-attachments/assets/23782e65-330a-4d7a-b297-7a036d4f33c8" /># 📊 Bank Loan Analytics Project

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



---

### 3️⃣ Data Modelling (Excel)

* Used **Merge Query** in Power Query to combine Finance_1 and Finance_2
* Created a single merged fact table
* Loaded merged data as a table for analysis

---

### 4️⃣ KPI Analysis (Excel – Pivot Tables & Charts)

Pivot tables and charts were created to meet business requirements.

**Key KPIs:**

* Year-wise Loan Amount Statistics
    Total loan amount per year
    Average loan amount
    Number of loans issued
* Grade & Sub-grade Wise Revolving Balance
    Distribution of revolving balance across credit grades
*Total Payment: Verified vs Non-Verified Customers
    Comparison of repayment amounts
*State-wise & Last Credit Pull Date-wise Loan Status
    Loan status trends across states and time
*Home Ownership vs Last Payment Date Statistics
    Repayment behavior by ownership type


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
