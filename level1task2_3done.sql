SELECT TOP 1 
    City, 
    COUNT(*) AS RestaurantCount
FROM 
    task
GROUP BY 
    City
ORDER BY 
    RestaurantCount DESC;


SELECT 
    City,
    ROUND(AVG(Aggregate_rating),2) AS AverageRating
FROM 
    task
WHERE 
    Aggregate_rating IS NOT NULL
GROUP BY 
    City
ORDER BY 
    AverageRating DESC;



SELECT top 1
    City,
    ROUND(AVG(Aggregate_rating),2) AS AverageRating
FROM 
    task
WHERE 
    Aggregate_rating IS NOT NULL
GROUP BY 
    City
ORDER BY 
    AverageRating DESC;

select top 5 * from task;

SELECT 
  ROUND(100.0 * SUM(CASE WHEN "Has_Online_delivery"  = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Online_Delivery_Percentage
FROM task;


SELECT Price_range
  ,
  COUNT(*) * 100.0 / (SELECT COUNT(*) FROM task) AS Percentage
FROM 
  task
GROUP BY 
  Price_range
ORDER BY 
  Price_range;

