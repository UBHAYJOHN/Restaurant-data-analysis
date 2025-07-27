
select * from task;


WITH CuisineList AS (
    SELECT 
        TRIM(value) AS Cuisine
    FROM 
        task
    CROSS APPLY 
        STRING_SPLIT(Cuisines, ',')
    WHERE 
        Cuisines IS NOT NULL
)
SELECT TOP 3 
    Cuisine, 
    COUNT(*) AS CuisineCount
FROM 
    CuisineList
GROUP BY 
    Cuisine
ORDER BY 
    CuisineCount DESC;




WITH CuisineList AS (
    SELECT DISTINCT
        Restaurant_ID,
        TRIM(value) AS Cuisine
    FROM 
        task
    CROSS APPLY 
        STRING_SPLIT(Cuisines, ',')
    WHERE 
        Cuisines IS NOT NULL
),
TotalRestaurants AS (
    SELECT COUNT(DISTINCT Restaurant_ID) AS Total
    FROM task
),
CuisineCounts AS (
    SELECT 
        Cuisine,
        COUNT(DISTINCT Restaurant_ID) AS RestaurantCount
    FROM 
        CuisineList
    GROUP BY 
        Cuisine
)
SELECT 
	top 50
    c.Cuisine,
    c.RestaurantCount,
    ROUND(100.0 * c.RestaurantCount / t.Total, 2) AS Percentage
FROM 
    CuisineCounts c,
    TotalRestaurants t
ORDER BY 
    Percentage DESC;
