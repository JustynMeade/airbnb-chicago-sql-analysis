-- Chicago Airbnb Listings Analysis
-- SQLite dialect

-- 1. Which neighbourhoods have the highest average price?
SELECT neighbourhood_cleansed,
       count(*) as Total_Listings,
       round(avg(CAST(REPLACE(REPLACE(price, '$', ''), ',', '') AS REAL)), 2) as Average_Price
FROM listings
GROUP BY neighbourhood_cleansed
ORDER BY Average_Price DESC;


-- 2. Which neighbourhoods get the best reviews?
SELECT neighbourhood_cleansed,
       count(*) as Total_Listings,
       round(avg(review_scores_rating), 2) as Average_Review
FROM listings
GROUP BY neighbourhood_cleansed
ORDER BY Average_Review DESC;


-- 3. What room type gets the best reviews?
SELECT room_type,
       count(*) as Total_Listings,
       round(avg(review_scores_rating), 2) as Average_Review
FROM listings
GROUP BY room_type
ORDER BY Average_Review DESC;


-- 4. Which neighbourhood has the most demand (low availability)?
SELECT neighbourhood_cleansed,
       count(*) as Total_Listings,
       round(avg(availability_30), 2) as Average_Availability_in_30_Days
FROM listings
GROUP BY neighbourhood_cleansed
ORDER BY Average_Availability_in_30_Days ASC;


-- 5. What's the price difference between entire homes and private rooms?
SELECT room_type,
       count(*) as Total_Listings,
       round(avg(CAST(REPLACE(REPLACE(price, '$', ''), ',', '') AS REAL)), 2) as Average_Price
FROM listings
WHERE price IS NOT NULL
  AND (CAST(REPLACE(REPLACE(price, '$', ''), ',', '') AS REAL)) BETWEEN 0 AND 10000
GROUP BY room_type
ORDER BY Average_Price DESC;


-- 6. Which hosts have the most listings? Are they commercial operators?
SELECT host_id,
       host_name,
       count(*) as Total_Listings
FROM listings
GROUP BY host_id
ORDER BY Total_Listings DESC;


-- 7. What factors predict a higher review score?
SELECT room_type,
       round(avg(CAST(REPLACE(REPLACE(price, '$', ''), ',', '') AS REAL)), 2) as Average_Price,
       round(AVG(review_scores_rating), 2) as Average_Rating,
       round(AVG(review_scores_cleanliness), 2) as Average_Cleanliness,
       round(AVG(review_scores_location), 2) as Average_Location,
       round(AVG(review_scores_value), 2) as Average_Value_Score,
       COUNT(*) as Total_Listings
FROM listings
WHERE Review_Scores_Rating IS NOT NULL
  AND CAST(REPLACE(REPLACE(price, '$', ''), ',', '') AS REAL) BETWEEN 10 AND 1000
GROUP BY room_type
ORDER BY Average_Rating DESC;


-- 8. What percentage of listings are available year-round?
SELECT round(100.0 * SUM(CASE WHEN availability_365 = 365 THEN 1 ELSE 0 END) / count(*), 2) as Fully_Available_Percent,
       round(100.0 * SUM(CASE WHEN availability_365 = 0 THEN 1 ELSE 0 END) / count(*), 2) as Fully_Booked_Percent,
       round(100.0 * SUM(CASE WHEN availability_365 BETWEEN 1 AND 364 THEN 1 ELSE 0 END) / count(*), 2) as Partially_Available_Percent,
       count(*) as Total_Listings
FROM listings;
