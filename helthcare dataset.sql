create database healthmanagement;
use healthmanagement;
show databases;

select * from healthcare_dataset;

# Count of patients by gender

select * from healthcare_dataset;

select gender,count(*) as number_of_patient
from healthcare_dataset
group by gender;

# Average age of patients

select avg(age) as avg_age from healthcare_dataset;

# Distribution of blood types

SELECT `Blood Type`, COUNT(*) AS count
FROM healthcare_dataset
GROUP BY `Blood Type`
ORDER BY count;

# List all distinct medical conditions

SELECT DISTINCT `Medical Condition`
FROM healthcare_dataset;

# Count of patients per medical condition

SELECT `Medical Condition`, COUNT(*) AS count
FROM healthcare_dataset
group by `Medical Condition`;

#Number of patients per hospital

select * from healthcare_dataset;

select `hospital`,count(*) as number0fpatient
from healthcare_dataset
group by `hospital`
order by number0fpatient desc;

#  Top 5 doctors with the most patients

select `doctor`,count(*) as numberofpatient
from healthcare_dataset
group by `doctor`
order by numberofpatient desc
limit 5;

select doctor,numberofpatient
from
(select `doctor`,count(*) as numberofpatient,
rank() over(order by count(*) desc) as rnkop
from healthcare_dataset
group by `doctor`) as top5doctor
where rnkop < 6;

# Average billing amount per hospital
select * from healthcare_dataset;

select `hospital`,avg(`Billing Amount`) as avgbillingamount
from healthcare_dataset
group by `hospital`;

# Count of patients admitted by each doctor

SELECT `Doctor`, COUNT(*) AS Patient_Count
FROM healthcare_dataset
GROUP BY `Doctor`
ORDER BY Patient_Count DESC;


# Top 3 hospitals by average billing amount


select `hospital`,avg(`Billing Amount`) as avgbillingamount
from healthcare_dataset
group by `hospital`
order by avgbillingamount desc
limit 3;

select hospital,avgbillingamount
from 
(select `hospital`,avg(`Billing Amount`) as avgbillingamount,
rank() over(order by avg(`Billing Amount`) desc) as rnking
from healthcare_dataset
group by `hospital`) as top3hospital
where rnking < 4;

# Total billing amount grouped by insurance provider

select * from healthcare_dataset;

select `Insurance Provider`,sum(`Billing Amount`) as totalbillingamount
from healthcare_dataset
group by `Insurance Provider`;

# Average billing amount for each medical condition


select `Medical Condition`,sum(`Billing Amount`) as totalbillingamount
from healthcare_dataset
group by `Medical Condition`;

#Highest billing amount recorded

select * from healthcare_dataset
order by `Billing Amount` desc
limit 1;

# List patients with billing amount > $30,000

SELECT Name, `Billing Amount`
FROM healthcare_dataset
WHERE `Billing Amount` > 24009;

# highest insurance providers by number of patients

select `Insurance Provider`,count(*) as numberofpatient
from healthcare_dataset
group by `Insurance Provider`
order by numberofpatient desc
limit 1;

# Count of patients by admission type

select * from healthcare_dataset;

select `Admission Type`,count(*) as numberofpatient
from healthcare_dataset
group by `Admission Type`;

# Average length of stay (Discharge Date - Admission Date)

SELECT round(AVG(DATEDIFF(`Discharge Date`, `Date of Admission`)),2) AS avg_length_of_stay
FROM healthcare_dataset;

select avg(length_of_stay) as  Averagelengthofstay
from
(SELECT `Date of Admission`,`Discharge Date`,DATEDIFF(`Discharge Date`, `Date of Admission`) AS length_of_stay
FROM healthcare_dataset
order by length_of_stay desc) as  Averagelengthofstay;

# Monthly patient admissions (group by month)
select * from healthcare_dataset;

select monthly,count(*) as number0fpatient
from
(select *, month(`Date of Admission`) as monthly 
from healthcare_dataset) as monthlyadmission
group by monthly
order by monthly;

# Most common month of admission

SELECT
  MONTHNAME(`Date of Admission`) AS admission_month,
  COUNT(*) AS total_admissions
FROM healthcare_dataset
GROUP BY admission_month
ORDER BY total_admissions DESC
LIMIT 1;

# Number of emergency admissions in 2024

select * from healthcare_dataset;

select `Admission Type`,year(`Date of Admission`) as year, 
count(*) as numberofpatient from healthcare_dataset
where `Admission Type` = "Emergency"
group by year
having year = 2024;

# Number of urgent admissions in 2024

select `Admission Type`, year,count(*) as numberofpatients
from
(select `Admission Type`,year(`Date of Admission`) as year from healthcare_dataset) as urgentadmission
where `Admission Type` = "Urgent"
group by year,`Admission Type`
having year = 2024;

# Most prescribed medications
select * from healthcare_dataset;

select `medication`,count(*) as numberofpatient
from healthcare_dataset
group by `medication`
order by numberofpatient desc
limit 1;

# Count of test results by category (Normal, Abnormal, etc.)

select * from healthcare_dataset;


select `Test Results`,count(*) as numberofpatient
from healthcare_dataset
group by `Test Results`;

# Top medications used for 'Cancer' patients

select medication,`Medical Condition`,count(*) as numberofpatient
from healthcare_dataset
where `Medical Condition` = "Cancer"
group by medication
order by numberofpatient desc
limit 1;

# Average billing amount by test result status

select `Test Results`,avg(`Billing Amount`) as Avg_Amount
from healthcare_dataset
group by `Test Results`;

# Most common test result for each medical condition

select * from healthcare_dataset;

select `Test Results`,`Medical Condition`,numberofpatient
from
(select `Medical Condition`,`Test Results`,numberofpatient,
rank() over(order by numberofpatient desc) as rnkop
from
(select `Medical Condition`,`Test Results`,count(*) as numberofpatient
from healthcare_dataset
group by `Medical Condition`,`Test Results`) as rankgiven) as top_five
where rnkop = 1;

# Calculating Patients Hospitalized Age-wise from Maximum to Minimum

select * from healthcare_dataset;

select age,count(*) as numberofcount
from healthcare_dataset
group by age
order by age desc;

#  Ranking Age on the number of patients Hospitalized in sql   

SELECT 
    age,
    COUNT(*) AS hospitalized_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS age_rank
FROM 
    healthcare_dataset
GROUP BY 
    age
ORDER BY 
    hospitalized_count DESC;


#  Finding Billing Amount of patients admitted and number of days spent in respective hospital.

SELECT 
    `hospital`, 
    `Billing Amount`, 
    `Date of Admission`, 
    `Discharge Date`, 
    DATEDIFF(`Discharge Date`, `Date of Admission`) AS numberofdays
FROM 
    healthcare_dataset
ORDER BY 
    numberofdays ASC;

#"For each hospital, what is the total amount billed,
 #the average number of days patients stayed, and 
 #how many patients were admitted?"

SELECT 
    `hospital`, 
    SUM(`Billing Amount`) AS total_billing, 
    AVG(DATEDIFF(`Discharge Date`, `Date of Admission`)) AS avg_days_spent,
    COUNT(*) AS total_patients
FROM 
    healthcare_dataset
GROUP BY 
    `hospital`
ORDER BY 
    avg_days_spent ASC;

# Finding Total number of days sepnt by patient in 
#an hospital for given medical condition

select * from healthcare_dataset;

SELECT `Name`, 
`Medical Condition`, 
`Hospital`, 
sum(DATEDIFF(`Discharge Date`, `Date of Admission`)) as Total_Hospitalized_days
FROM healthcare_dataset
GROUP BY `Name`, `Medical Condition`, `Hospital`
order by Total_Hospitalized_days desc;

# -- 14. Finding Hospitals which were 
#successful in discharging patients after 
#having test results as 'Normal' with count of days 
#taken to get results to Normal


select `name`,`hospital`,DATEDIFF(`Discharge Date`, `Date of Admission`) as Total_Hospitalized_days
from healthcare_dataset
where `Test Results` = "Normal";

# 2nd way

select `hospital`,
sum(DATEDIFF(`Discharge Date`, `Date of Admission`)) as Total_Hospitalized_days,
count(*) as  discharging_numberofpatients
from healthcare_dataset
where `Test Results` = "Normal"
group by `hospital`;

# 3rd way

select `hospital`,
`Test Results`,
sum(DATEDIFF(`Discharge Date`, `Date of Admission`)) as Total_Hospitalized_days,
count(*) as  numberofpatients
from healthcare_dataset
group by `hospital`,`Test Results`;

# Calculate number of blood types of patients which lies betwwen age 20 to 45

SELECT `age`, `Blood Type`, COUNT(`Blood Type`) as Count_Blood_Type
FROM healthcare_dataset
WHERE `age` BETWEEN 20 AND 45
GROUP BY `age`, `Blood Type`
ORDER BY `Blood Type` DESC;

# Find how many of patient are Universal Blood Donor and Universal Blood reciever

select * from healthcare_dataset;
select blood_category,number_of_blood
from
(SELECT 
    CASE 
        WHEN `Blood Type` = 'O-' THEN 'Universal Donor'
        WHEN `Blood Type` = 'AB+' THEN 'Universal Recipient'
        ELSE 'Other'
    END AS blood_category,
    COUNT(*) AS number_of_blood
FROM healthcare_dataset
GROUP BY blood_category) as sub
where blood_category in ('Universal Donor', 'Universal Recipient') ;

# 2nd way

SELECT
    SUM(CASE WHEN `Blood Type` = 'O-' THEN 1 ELSE 0 END) AS universal_donors,
    SUM(CASE WHEN `Blood Type` = 'AB+' THEN 1 ELSE 0 END) AS universal_recipients
FROM healthcare_dataset;

# 

SELECT 
    blood_category,
    COUNT(*) AS number_of_blood
FROM (
    SELECT 
        CASE 
            WHEN `Blood Type` = 'O-' THEN 'Universal Donor'
            WHEN `Blood Type` = 'AB+' THEN 'Universal Recipient'
            ELSE 'Other'
        END AS blood_category
    FROM healthcare_dataset
) AS sub
WHERE blood_category IN ('Universal Donor', 'Universal Recipient')
GROUP BY blood_category;


#  Provide a list of hospitals along with the count of patients 
#admitted in the year 2021 AND 2024?

      SELECT * FROM healthcare_dataset;
      
      create table tem_ 
      select year(`Date of Admission`) as year
      from  healthcare_dataset;
      
      select  distinct year from tem_ ;

select  `hospital` ,count(*) as numberofpatient
from healthcare_dataset
where year(`Date of Admission`) in (2021,2024)
group by `hospital`;


# -- 19. Find the average, minimum and maximum billing amount for each insurance provider?

      SELECT * FROM healthcare_dataset;

  SELECT distinct `insurance provider` FROM healthcare_dataset;

 SELECT `insurance provider` ,
 avg(`billing amount`) as avg_billing_amount,
 min(`billing amount`) as minimun_billing_amount,
 max(`billing amount`) as max_billing_amount
 FROM healthcare_dataset
 group by `insurance provider`;

 #  Create a new column that categorizes patients as high, medium, or low risk based on their medical condition.

      SELECT * FROM healthcare_dataset;
      
  SELECT distinct `Test Results` FROM healthcare_dataset;

  select *,case
  	    when `Test Results` = "Normal" then "low risk"
  	    when `Test Results` = "Inconclusive" then "high risk"
  	    when `Test Results` = "Abnormal" then "medium risk"
  	    else "no risk"
  end as patients_situation
  from healthcare_dataset;
  
  