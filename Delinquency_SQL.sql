create database delinquency;
use delinquency;

select * from Delinquency_prediction_dataset;

-- 1. Total Customers and Delinquency Count

SELECT COUNT(*) AS total_customers, SUM(Delinquent_Account) AS delinquent_customers,
    COUNT(*) - SUM(Delinquent_Account) AS non_delinquent_customers,
    ROUND(SUM(Delinquent_Account) * 100.0 / COUNT(*), 2) AS delinquency_rate_pct
FROM Delinquency_prediction_dataset;

-- 2. Delinquency Count by Credit Card Type

SELECT Credit_Card_Type , COUNT(*) AS total_customers, SUM(Delinquent_Account) AS delinquent_customers,
    ROUND(SUM(Delinquent_Account) * 100.0 / COUNT(*), 2) AS delinquency_rate_pct
	FROM Delinquency_prediction_dataset
	GROUP BY Credit_Card_Type
	ORDER BY delinquent_customers DESC;
    
-- 3. Delinquency Count by Location

SELECT Location, COUNT(*) AS total_customers, SUM(Delinquent_Account) AS delinquent_customers,
    ROUND(AVG(Credit_Utilization) * 100, 2) AS avg_credit_utilization_pct
FROM Delinquency_prediction_dataset
GROUP BY Location
ORDER BY delinquent_customers DESC;

-- 4. Average Financial Metrics by Delinquency Status

SELECT
    CASE WHEN Delinquent_Account = 1 THEN 'Delinquent' ELSE 'Non-Delinquent' END AS status,
    ROUND(AVG(Income)) AS avg_income,
    ROUND(AVG(Credit_Score)) AS avg_credit_score,
    ROUND(AVG(Missed_Payments)) AS avg_missed_payments,
    ROUND(AVG(Debt_to_Income_Ratio), 2) AS avg_debt_to_income_ratio,
    ROUND(AVG(Credit_Utilization), 2) AS avg_credit_utilization
FROM Delinquency_prediction_dataset
GROUP BY Delinquent_Account;

-- 5. Delinquency by Employment Status

SELECT Employment_Status,
    COUNT(*) AS total_customers,
    SUM(Delinquent_Account) AS delinquent_customers,
    ROUND(SUM(Delinquent_Account) * 100.0 / COUNT(*), 2) AS delinquency_rate_pct
FROM Delinquency_prediction_dataset
GROUP BY Employment_Status
ORDER BY delinquency_rate_pct DESC;

-- 6. High-Risk Customers (Multiple Risk Flags)

SELECT Customer_ID, Age, Income, Credit_Score, Missed_Payments, Debt_to_Income_Ratio, Employment_Status, Location, Delinquent_Account
FROM Delinquency_prediction_dataset
WHERE
    Missed_Payments >= 3
    AND Credit_Score < 500
    AND Debt_to_Income_Ratio > 0.40
    AND Employment_Status = 'Unemployed'
ORDER BY Missed_Payments DESC, Credit_Score ASC;

-- 7. Monthly Payment Status Distribution

SELECT
    'Month_1' AS month, Month_1 AS payment_status, COUNT(*) AS customer_count FROM Delinquency_prediction_dataset GROUP BY Month_1
UNION ALL
SELECT 'Month_2', Month_2, COUNT(*) FROM Delinquency_prediction_dataset GROUP BY Month_2
UNION ALL
SELECT 'Month_3', Month_3, COUNT(*) FROM Delinquency_prediction_dataset GROUP BY Month_3
UNION ALL
SELECT 'Month_4', Month_4, COUNT(*) FROM Delinquency_prediction_dataset GROUP BY Month_4
UNION ALL
SELECT 'Month_5', Month_5, COUNT(*) FROM Delinquency_prediction_dataset GROUP BY Month_5
UNION ALL
SELECT 'Month_6', Month_6, COUNT(*) FROM Delinquency_prediction_dataset GROUP BY Month_6
ORDER BY month, payment_status;


-- 8. Average Debt-to-Income Ratio by Income Segment

SELECT
    CASE
        WHEN Income < 50000 THEN 'Low'
        WHEN Income BETWEEN 50000 AND 100000 THEN 'Medium'
        ELSE 'High'
    END AS income_segment,
    COUNT(*) AS total_customers,
    ROUND(AVG(Debt_to_Income_Ratio), 2) AS avg_dti_ratio,
    SUM(Delinquent_Account) AS delinquent_customers
FROM Delinquency_prediction_dataset
GROUP BY income_segment
ORDER BY avg_dti_ratio DESC;

-- 9. Delinquency by Age Group

SELECT
    CASE
        WHEN Age BETWEEN 0 AND 25 THEN '0-25'
        WHEN Age BETWEEN 26 AND 50 THEN '26-50'
        WHEN Age BETWEEN 51 AND 75 THEN '51-75'
        ELSE '75+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(Delinquent_Account) AS delinquent_customers,
    ROUND(SUM(Delinquent_Account) * 100.0 / COUNT(*), 2) AS delinquency_rate_pct
FROM Delinquency_prediction_dataset
GROUP BY age_group
ORDER BY age_group;

-- 10. Top 10 Customers with Highest Delinquency Risk Score

SELECT
    Customer_ID,
    Income,
    Credit_Score,
    Missed_Payments,
    Debt_to_Income_Ratio,
    Credit_Utilization,
    Loan_Balance,
    (Missed_Payments * 10 + (1 - Credit_Score / 850.0) * 50 + Debt_to_Income_Ratio * 30) AS risk_score
FROM Delinquency_prediction_dataset
WHERE Delinquent_Account = 1
ORDER BY risk_score DESC
LIMIT 10;