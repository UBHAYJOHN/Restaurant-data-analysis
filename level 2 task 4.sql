
select Cuisines, avg(Aggregate_rating) as avg_rating
from task
group by Cuisines;


SELECT 
    Restaurant_Name,
    COUNT(*) AS Branch_Count,
    ROUND(AVG(Aggregate_rating), 2) AS Average_Rating
FROM 
    task 
GROUP BY 
    Restaurant_Name
HAVING 
    COUNT(*) > 1
ORDER BY 
    Branch_Count DESC;


SELECT 
    Restaurant_Name,
    COUNT(*) AS Branch_Count,
    ROUND(AVG(Aggregate_rating), 2) AS Average_Rating
FROM 
    task 
GROUP BY 
    Restaurant_Name
HAVING 
    COUNT(*) > 1
ORDER BY 
    Average_Rating DESC;

