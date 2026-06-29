select * from HR_Analytics

SELECT count(*) as tot_employee from HR_Analytics

SELECT
ROUND(
    COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100 / COUNT(*),
    2
) AS attrition_percentage
FROM HR_Analytics

SELECT department,
ROUND(
    COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) * 100,2) as depart_atri
    FROM HR_Analytics
    GROUP BY department
    ORDER BY depart_atri desc

SELECT
    CASE
    WHEN age BETWEEN 20 AND 30 THEN '20-30'
    WHEN age BETWEEN 31 AND 40 THEN '31-40'
    WHEN age BETWEEN 41 AND 50 THEN '41-50'
    ELSE '50+'
    END AS age_group,
    COUNT(*) as total,
    SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)* 100 as age_atri
 FROM HR_Analytics
 GROUP BY
     CASE
     WHEN age BETWEEN 20 AND 30 THEN '20-30'
     WHEN age BETWEEN 31 AND 40 THEN '31-40'
     WHEN age BETWEEN 41 AND 50 THEN '41-50'
     ELSE '50+'
     END;


SELECT over_time,
 COUNT(CASE WHEN attrition='Yes' THEN 1 END)*100/count(*) as over_time_atri
 from HR_Analytics
 GROUP BY over_time

 SELECT 
 CASE 
    WHEN monthly_income between 1000 and 7000 THEN 'low'
    WHEN monthly_income between 7001 and 14000 THEN 'mid'
    ELSE 'high'
    END as salary_group,
    COUNT(*) as total,
    SUM((CASE WHEN attrition='Yes' THEN 1 ELSE 0 END)* 100 )/ count (*)as salary_atri
 FROM HR_Analytics
 GROUP BY
 CASE
    WHEN monthly_income between 1000 and 7000 THEN 'low'
    WHEN monthly_income between 7001 and 14000 THEN 'mid'
    ELSE 'high'
    END 
ORDER BY salary_atri 