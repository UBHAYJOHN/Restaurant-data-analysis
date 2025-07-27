
select * from task;


WITH rating_ranges as(
SELECT 
    CASE 
        WHEN Aggregate_rating >= 0 AND Aggregate_rating < 1 THEN '0-1'
        WHEN Aggregate_rating >= 1 AND Aggregate_rating < 2 THEN '1-2'
        WHEN Aggregate_rating >= 2 AND Aggregate_rating < 3 THEN '2-3'
        WHEN Aggregate_rating >= 3 AND Aggregate_rating < 4 THEN '3-4'
        WHEN Aggregate_rating >= 4 AND Aggregate_rating <= 5 THEN '4-5'
    END as rating_ranges
	
FROM 
    task)
select rating_ranges,
count(*) as county,
ROUND((count(*) * 100.0 / (select count(*) from rating_ranges)),2) As percentage_
from 
rating_ranges
group by rating_ranges
order by county desc;



WITH rating_ranges as(
SELECT 
    CASE 
        WHEN Aggregate_rating >= 0 AND Aggregate_rating < 1 THEN '0-1'
        WHEN Aggregate_rating >= 1 AND Aggregate_rating < 2 THEN '1-2'
        WHEN Aggregate_rating >= 2 AND Aggregate_rating < 3 THEN '2-3'
        WHEN Aggregate_rating >= 3 AND Aggregate_rating < 4 THEN '3-4'
        WHEN Aggregate_rating >= 4 AND Aggregate_rating <= 5 THEN '4-5'
    END as rating_ranges
	
FROM 
    task)
select  top 1 rating_ranges,
count(*) as county,
ROUND((count(*) * 100.0 / (select count(*) from rating_ranges)),2) As percentage_
from 
rating_ranges
group by rating_ranges
order by county desc;



select distinct Restaurant_Name, avg(votes) as avg_vote 
from task
group by Restaurant_Name
order by avg_vote desc;

select votes from task
where votes=0;
select avg(votes) as avg_votes from task;
select avg(votes) as avg_votes from task
where votes>0;

SELECT  top 10
    Cuisines, 
    COUNT(*) AS num_restaurants
FROM 
    task
GROUP BY 
    Cuisines
ORDER BY 
    num_restaurants DESC;

	select * from task;
