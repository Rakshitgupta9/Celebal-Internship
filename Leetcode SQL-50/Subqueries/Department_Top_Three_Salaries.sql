SELECT 
    Department, 
    Employee, 
    salary 
FROM (
    SELECT     
        dept.name AS Department,     
        emp.name AS Employee,     
        emp.salary,     
        DENSE_RANK() OVER (PARTITION BY dept.name ORDER BY emp.salary DESC) AS rate
    FROM 
        Employee emp
    JOIN 
        Department dept
    ON 
        emp.departmentid = dept.id 
) t1 
WHERE 
    rate <= 3;




--Rakshit Gupta
