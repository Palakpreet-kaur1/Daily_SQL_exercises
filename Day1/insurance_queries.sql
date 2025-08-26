/********************************************************************
* Project: Insurance Claim Analysis
* Script: insurance_queries.sql
* Author: Palakpreet Kaur
* Date: 2025-08-25
* Description: SQL queries to analyze claim approval patterns
*********************************************************************/

/* Problem:
Identify inconsistencies in claim approvals by accident type and age group.
*/

/* Objective:
1. Approval rates by accident type.
2. Approval rates by age group.
*/


-- Step 1: Approval rate by accident type
SELECT accident_type,
       COUNT(*) AS total_claims,
       SUM(approved) AS approved_claims,
       ROUND(SUM(approved)/COUNT(*)*100,2) AS approval_rate
FROM approval_table
GROUP BY accident_type
ORDER BY approval_rate DESC;


-- Step 2: Approval Rate by Age Group
SELECT 
    CASE 
        WHEN age < 25 THEN '<25'
        WHEN age BETWEEN 25 AND 40 THEN '25-40'
        WHEN age BETWEEN 41 AND 60 THEN '41-60'
        ELSE '>60'
    END AS age_group,
    COUNT(*) AS total_claims,
    SUM(approved) AS approved_claims,
    ROUND(SUM(approved)/COUNT(*)*100, 2) AS approval_rate
FROM approval_table
GROUP BY age_group;

