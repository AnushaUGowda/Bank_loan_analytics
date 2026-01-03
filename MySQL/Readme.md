# Bank Loan Analytics Project

## 1. Project Overview

The objective of this project is to analyze bank loan data to understand lending patterns, borrower behavior, and repayment trends. The project follows an end-to-end data analytics workflow, starting from raw data ingestion and cleaning to KPI creation and dashboard-ready outputs. The analysis helps stakeholders make data-driven decisions related to credit risk, customer segmentation, and loan performance.

---

## 2. Project Workflow & Tasks

The project was executed in the following structured phases:

 **SQL Conversion & Database Creation**

   * Converted XLSX data to CSV and loaded it into MySQL.
   * Created and managed the `Bank_Analytics` database.
     
```sql

     Create database Bank_Analytics;

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

---

## 3. Data Preparation & Cleaning

### 3.1 Raw Table (`bank_analytics`)

* Stored imported data with minimal transformation.
* Date fields (`issue_d`, `last_pymnt_d`, `last_credit_pull_d`) were stored as VARCHAR to prevent import errors.
  
```sql
   create table bank_analytics(id int,
							              member_id int,
                            loan_amnt int,
                            funded_amnt int,
                            funded_amnt_inv int,
                            term varchar(50),
                            int_rate decimal(10,2),
                            installment decimal(10,2),
                            grade varchar(50),
                            sub_grade varchar(50),
                            home_ownership varchar(50),
                            verification_status varchar(50),
                            issue_d varchar(50),
                            loan_status varchar(50),
                            zip_code varchar(50),
                            addr_state varchar(50),
                            dti decimal(10,2),
                            revol_bal int,
                            total_pymnt int,
                            last_pymnt_d varchar(50),
                            last_credit_pull_d varchar(50) );

### 3.2 Cleaned Table (`cleaned_bank_analytics`)

Key transformations applied:

* Trimmed whitespace and converted empty strings to NULL values.
* Standardized categorical fields (uppercase for grades, lowercase for statuses).
* Converted percentage and numeric text fields into DECIMAL values.
* Converted date strings into proper DATE format using `STR_TO_DATE`.
* Ensured consistent state codes for joining with a state dimension table.

This separation ensured data integrity, reproducibility, and professional ETL practices.

create table cleaned_bank_analytics(id int,
							member_id int,
                            loan_amnt int,
                            funded_amnt int,
                            funded_amnt_inv int,
                            term varchar(50),
                            int_rate decimal(10,2),
                            installment decimal(10,2),
                            grade varchar(50),
                            sub_grade varchar(50),
                            home_ownership varchar(50),
                            verification_status varchar(50),
                            issue_date date,
                            loan_status varchar(50),
                            zip_code varchar(50),
                            state varchar(50),
                            dti decimal(10,2),
                            revol_bal int,
                            total_pymnt int,
                            last_pymnt_date date,
                            last_credit_pull_date date ) AS
select id,
      member_id,
      nullif(trim(loan_amnt),'') as loan_amnt,
      nullif(trim(funded_amnt),'') as funded_amnt,
      nullif(trim(funded_amnt_inv),'') as funded_amnt_inv,
      term,
	  cast(nullif(trim(REPLACE(int_rate,'%','')),'') AS decimal(10,2)) as int_rate,
      cast(nullif(trim(installment),'') as decimal(10,2)) as installment,
      upper(trim(grade)) as grade,
      upper(trim(sub_grade)) as sub_grade,
      lower(trim(home_ownership)) as home_ownership,
      lower(trim(verification_status)) as verification_status,
      str_to_date(nullif(trim(issue_d),''),'%d-%m-%Y') as issue_date,
      lower(trim(loan_status)) as loan_status,
      zip_code,
      trim(upper(addr_state)) as state,
      cast(nullif(trim(dti),'') as decimal(10,2)) as dti,
      nullif(trim(revol_bal),'') as revol_bal,
      nullif(trim(total_pymnt),'') as total_pymnt,
      str_to_date(nullif(trim(last_pymnt_d),''),'%d-%m-%Y') as last_pymnt_date,
      str_to_date(nullif(trim(last_credit_pull_d),''),'%d-%m-%Y') as last_credit_pull_date
from bank_analytics;

---

## 4.Understand the Data and Data Quality Checks

* **Understand the data**: To know the data fields ,data types , constraints of each column.
  
  desc cleaned_bank_analytics;
  <img width="298" height="286" alt="{42DB291F-8374-4506-B578-4B8CA2373001}" src="https://github.com/user-attachments/assets/c31ba7ca-33ac-46d3-8875-86490e57669d" />
 -----
   select * from cleaned_bank_analytics 
   limit 10;
   <img width="730" height="179" alt="{31F31A1A-927A-4931-A778-4AA3D81B0C85}" src="https://github.com/user-attachments/assets/0664872c-a95b-4a2c-994a-0328a13cbb46" />

-----   
* **Row Count Validation**: Verified that cleaned data retained expected records.
  
  select count(*) from cleaned_bank_analytics;
  <img width="71" height="40" alt="{5E2F55CF-8F55-450B-947C-A9A1A2A44AAA}" src="https://github.com/user-attachments/assets/dcf5d12e-26c3-42e5-88f4-bea2bc248574" />

-----
* **Duplicate Check**: Confirmed no duplicate loan IDs were present.

   select id , count(*)
   from cleaned_bank_analytics 
   group by id
   having count(*)>1;
  <img width="98" height="87" alt="{EEAB667C-897C-4B79-A979-DBB000446446}" src="https://github.com/user-attachments/assets/1f0bca95-bbec-4b34-91f5-5d023f3bd559" />

-----
* **Null Analysis**: Audited missing values in key analytical columns such as loan amount, state, loan status, and date fields.

These checks ensured reliability of KPI calculations.

select
    sum(id is null or id = '') as id_missing,
    sum(loan_amnt is null or loan_amnt = '') as loan_amnt_missing,
    sum(grade is null or grade = '') as grade_missing,
    sum(sub_grade is null or sub_grade = '') as sub_grade_missing,
    sum(revol_bal is null ) as revol_bal_missing,
    sum(verification_status is null or verification_status = '') as verification_status_missing,
    sum(total_pymnt is null ) as total_pymnt_missing,
    sum(state is null or state = '') as state_missing,
	sum(loan_status is null or loan_status = '') as loan_status_missing,
    sum(last_credit_pull_date is null ) as last_credit_pull_date_missing,
    sum(home_ownership is null or home_ownership = '') as home_ownership_missing,
    sum(last_pymnt_date is null ) as last_pymnt_date_missing
from cleaned_bank_analytics ;
 <img width="711" height="77" alt="{4641CB23-0BBE-4317-96A5-71AC35212D71}" src="https://github.com/user-attachments/assets/02bfde78-9771-4fce-9b75-4f347a4409a1" />

---

## 5. Key Performance Indicators (KPIs)

### KPI 1: Year-wise Loan Amount Statistics

**Purpose:** Analyze loan disbursement trends over time.

**Metrics:**

* Total loan amount issued per year
* Average loan amount per year
* Number of loans issued per year

**Insight Value:** Helps identify growth or decline in lending activity across years.

select 
   year(issue_date) as issue_year,
   sum(loan_amnt) as total_loan_amnt,
   avg(loan_amnt) as averg_loan_amnt,
   count(id) as Numbr_of_loans
from cleaned_bank_analytics
group by year(issue_date)
order by issue_year  ;
<img width="286" height="88" alt="{ECE7A55F-F3D2-4BC8-9FA8-664F89D3CEAC}" src="https://github.com/user-attachments/assets/7d4dd1f4-5c86-4e84-a1e2-ffddbcd581ff" />


---

### KPI 2: Grade & Sub-grade Wise Revolving Balance

**Purpose:** Understand revolving balance distribution across credit grades.

**Metrics:**

* Total revolving balance by grade and sub-grade

**Insight Value:** Indicates risk exposure and borrowing behavior across different credit quality segments.

select 
   grade,
   sub_grade,
   sum(revol_bal) as revol_balance
from cleaned_bank_analytics
group by grade , sub_grade 
order by grade , sub_grade;
<img width="163" height="264" alt="{4BCAE749-394A-41A8-9A0E-F065BD536CC8}" src="https://github.com/user-attachments/assets/65828de1-1334-4d13-b841-bd84c5552b38" />

 
---

### KPI 3: Total Payment – Verified vs Non-Verified Customers

**Purpose:** Compare repayment contributions based on verification status.

**Metrics:**

* Total payment amount for verified customers
* Total payment amount for non-verified customers

**Insight Value:** Helps assess the impact of verification on repayment reliability.

select 
   verification_status,
   sum(total_pymnt) as total_payment
from cleaned_bank_analytics
group by verification_status;
<img width="170" height="66" alt="{CC1E3E37-EDCB-4A1C-9630-E7750321BA64}" src="https://github.com/user-attachments/assets/345f28c8-5443-4ad8-adfa-d474f99e2732" />


---

### KPI 4: State-wise & Last Credit Pull Date-wise Loan Status

**Purpose:** Track loan status trends geographically and over time.

**Metrics:**

* Number of loans by state
* Loan status distribution by year-month of last credit pull

**Insight Value:** Identifies regional and temporal patterns in loan performance.

### . Data Modelling – State Dimension table

* Created a separate `state` dimension table mapping state codes to full state names.
* Joined with the cleaned fact table to improve readability and dashboard usability.

This follows dimensional modelling best practices.

---

-- to create states full name , first create state table and then join with the cleaned_bank_analytics
create table state(
                   state_code char(2) primary key,
                   state_name varchar(50)
                   );
         
-- to know how many states are there          
with state as(
    select 
        count(*) as count,
        state
     from cleaned_bank_analytics
     group by state)
select count(*) from state;
                   
                   
insert into state values
('OR','Oregon'),
('MI','Michigan'),
('FL','Florida'),
('VA','Virginia'),
('PA','Pennsylvania'),
('CA','California'),
('WI','Wisconsin'),
('OH','Ohio'),
('AZ','Arizona'),
('NM','New Mexico'),
('NY','New York'),
('TX','Texas'),
('GA','Georgia'),
('NJ','New Jersey'),
('DC','District of Columbia'),
('MD','Maryland'),
('CO','Colorado'),
('HI','Hawaii'),
('IL','Illinois'),
('NV','Nevada'),
('KS','Kansas'),
('MO','Missouri'),
('NC','North Carolina'),
('WA','Washington'),
('SD','South Dakota'),
('KY','Kentucky'),
('SC','South Carolina'),
('NH','New Hampshire'),
('WY','Wyoming'),
('OK','Oklahoma'),
('LA','Louisiana'),
('AR','Arkansas'),
('MA','Massachusetts'),
('MT','Montana'),
('WV','West Virginia'),
('MN','Minnesota'),
('AL','Alabama'),
('CT','Connecticut'),
('DE','Delaware'),
('UT','Utah'),
('RI','Rhode Island'),
('VT','Vermont'),
('AK','Alaska'),
('MS','Mississippi'),
('TN','Tennessee'),
('ID','Idaho'),
('NE','Nebraska'),
('IA','Iowa'),
('IN','Indiana'),
('ME','Maine');

select 
	date_format(B.last_credit_pull_date, '%Y-%m') as last_credit_pull_YM,
    S.state_name,
    B.loan_status,
    count(B.id) as no_of_loans
from cleaned_bank_analytics as B 
join state as S 
on B.state = S.state_code
where last_credit_pull_date is not null
group by S.state_code, 
		 date_format(B.last_credit_pull_date, '%Y-%m'),
         B.loan_status
order by S.state_code, 
		 last_credit_pull_YM,
         B.loan_status;

<img width="260" height="273" alt="{4B00978B-1787-4E10-8D5B-4B17C1D0E3FF}" src="https://github.com/user-attachments/assets/08518eec-3011-4ff4-8517-993a395bfaa8" />
         

---

### KPI 5: Home Ownership vs Last Payment Date Statistics

**Purpose:** Analyze repayment trends based on home ownership status.

**Metrics:**

* Number of loans by home ownership type
* Distribution by year-month of last payment date

**Insight Value:** Helps understand how asset ownership correlates with repayment behavior.

select home_ownership,
      date_format(last_pymnt_date,'%Y-%m') as last_pymnt_YM,
      count(id) no_of_loans
from cleaned_bank_analytics
where last_pymnt_date is not null
group by  home_ownership,
		  last_pymnt_YM
order by  home_ownership,
		  last_pymnt_YM;  

<img width="222" height="277" alt="{75470751-C7A3-484C-8EBA-ACEAF26349CF}" src="https://github.com/user-attachments/assets/7d8d1240-9786-4706-abe1-84224ae154d5" />

      
---



##  Dashboard Readiness

All SQL queries were written to:

* Use consistent date grains (Year or Year-Month)
* Avoid unnecessary NULLs
* Support filters, slicers, and drill-down analysis

The dataset is fully ready for visualization in Power BI or Excel dashboards.

---

##  Tools & Technologies Used

* **Database:** MySQL
* **Data Cleaning:** MySQL
* **Data Modelling:** MySQL (Fact & Dimension tables)
* **Visualization:** Power BI / Excel (Dashboard-ready)

---

## 9. Conclusion

This project demonstrates a complete banking analytics lifecycle, from raw data ingestion to business-ready insights. Strong emphasis was placed on data quality, structured transformations, and meaningful KPI design. The analysis provides actionable insights into loan trends, credit risk, regional performance, and customer behavior.





