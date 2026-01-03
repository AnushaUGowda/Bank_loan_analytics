Create database Bank_Analytics;

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

# UNDERSTAND THE DATA
						
select count(*) from bank_analytics; 
desc bank_analytics;
select * from bank_analytics 
limit 10;

/*

Let's create a temp table where we can manipulate and restructure the data without altering the original.     
 
 */


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

# UNDERSTAND THE DATA
						
select count(*) from cleaned_bank_analytics; 
desc cleaned_bank_analytics;
select * from cleaned_bank_analytics 
limit 10;

# IDENTIFICATION OF DUPLICATES

select id , count(*)
from cleaned_bank_analytics 
group by id
having count(*)>1;
-- get zero count. it means no duplicates.

# to count the nulls and blanks of required columns

select
    sum(id is null or id = '') as id_missing,
    sum(loan_amnt is null or loan_amnt = '') as loan_amnt_missing,
    sum(grade is null or grade = '') as grade_missing,
    sum(sub_grade is null or sub_grade = '') as sub_grade_missing,
    sum(revol_bal is null or revol_bal = '') as revol_bal_missing,
    sum(verification_status is null or verification_status = '') as verification_status_missing,
    sum(total_pymnt is null or total_pymnt = '') as total_pymnt_missing,
    sum(state is null or state = '') as state_missing,
	sum(loan_status is null or loan_status = '') as loan_status_missing,
    sum(last_credit_pull_date is null ) as last_credit_pull_date_missing,
    sum(home_ownership is null or home_ownership = '') as home_ownership_missing,
    sum(last_pymnt_date is null ) as last_pymnt_date_missing
from cleaned_bank_analytics ;

/* KPI's
>Year wise loan amount Stats
>Grade and sub grade wise revol_bal 
>Total Payment for Verified Status Vs Total Payment for Non Verified Status 
>State wise and last_credit_pull_d wise loan status
>Home ownership Vs last payment date stats
*/

#Year wise loan amount Stats
 
 select 
   year(issue_date) as issue_year,
   sum(loan_amnt) as total_loan_amnt,
   avg(loan_amnt) as averg_loan_amnt,
   count(id) as Numbr_of_loans
from cleaned_bank_analytics
group by year(issue_date)
order by issue_year  ;
   
# Grade and sub grade wise revol_bal 

select 
   grade,
   sub_grade,
   sum(revol_bal) as revol_balance
from cleaned_bank_analytics
group by grade , sub_grade 
order by grade , sub_grade;

# Total Payment for Verified Status Vs Total Payment for Non Verified Status 

select 
   verification_status,
   sum(total_pymnt) as total_payment
from cleaned_bank_analytics
group by verification_status;

# State wise and last_credit_pull_d wise loan status

-- to create states full name , create state table and then join with the cleaned_bank_analytics
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

#Home ownership Vs last payment date stats

select home_ownership,
      date_format(last_pymnt_date,'%Y-%m') as last_pymnt_YM,
      count(id) no_of_loans
from cleaned_bank_analytics
where last_pymnt_date is not null
group by  home_ownership,
		  last_pymnt_YM
order by  home_ownership,
		  last_pymnt_YM;     



