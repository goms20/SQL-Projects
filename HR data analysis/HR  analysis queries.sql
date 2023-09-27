
SELECT * FROM hrdata

SELECT SUM (employee_count) AS Employee_Count FROM hrdata;

SELECT COUNT(attrition) AS Attrition FROM hrdata
WHERE attrition='Yes';

SELECT (SELECT SUM(employee_count) FROM hrdata) - COUNT(attrition) AS Active_Employee FROM hrdata
WHERE attrition='Yes';

SELECT ROUND (AVG(age),0) AS Age 
FROM hrdata;

SELECT gender, COUNT(attrition) AS Attrition_count 
FROM hrdata
WHERE attrition='Yes'
GROUP BY gender
ORDER BY count(attrition) desc;

SELECT department, COUNT(attrition), ROUND ((cast (COUNT (attrition) AS numeric) /
(SELECT COUNT(attrition) FROM hrdata WHERE attrition= 'Yes')) * 100, 2) AS pct 
FROM hrdata
WHERE attrition='Yes'
GROUP BY department 
ORDER BY count(attrition) desc;

SELECT age,  SUM (employee_count) AS employee_count
FROM hrdata
GROUP BY age
order by age;

SELECT education_field, COUNT(attrition) AS attrition_count 
FROM hrdata
WHERE attrition='Yes'
GROUP BY education_field
ORDER BY count(attrition) desc;

SELECT age_band, gender, COUNT(attrition) AS attrition, 
ROUND ((cast(COUNT (attrition) as numeric) / (SELECT COUNT (attrition) FROM hrdata WHERE attrition = 'Yes')) * 100,2) AS pct
FROM hrdata
WHERE attrition = 'Yes'
GROUP BY age_band, gender
ORDER BY age_band, gender desc;


