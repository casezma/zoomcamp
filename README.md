# Question 1
24.3.1

docker run -it python:3.12.8 pip --version

# Question 2 - c

postgres:5433

# Question 3 - b

````
104802

SELECT COUNT(*) FROM green_taxis WHERE 
CAST(lpep_dropoff_datetime AS DATE) >= '2019-10-01' and 
CAST(lpep_dropoff_datetime AS DATE) < '2019-11-01' and
trip_distance <= 1;  

198924

SELECT COUNT(*) FROM green_taxis WHERE 
CAST(lpep_dropoff_datetime AS DATE) >= '2019-10-01' and 
CAST(lpep_dropoff_datetime AS DATE) < '2019-11-01' and
trip_distance > 1 and trip_distance <= 3;  

109603

SELECT COUNT(*) FROM green_taxis WHERE 
CAST(lpep_dropoff_datetime AS DATE) >= '2019-10-01' and 
CAST(lpep_dropoff_datetime AS DATE) < '2019-11-01' and
trip_distance > 3 and trip_distance <= 7;  

27678


SELECT COUNT(*) FROM green_taxis WHERE 
CAST(lpep_dropoff_datetime AS DATE) >= '2019-10-01' and 
CAST(lpep_dropoff_datetime AS DATE) < '2019-11-01' and
trip_distance > 7 and trip_distance <= 10;  

35189

SELECT COUNT(*) FROM green_taxis WHERE 
CAST(lpep_dropoff_datetime AS DATE) >= '2019-10-01' and 
CAST(lpep_dropoff_datetime AS DATE) < '2019-11-01' and
trip_distance > 10;  
````

# QUESTION 4

2019-10-31
````
select CAST(lpep_pickup_datetime AS DATE) 
from green_taxis group by lpep_pickup_datetime order by SUM(trip_distance) DESC 
LIMIT 1;       
````

# QUESTION 5
````
East Harlem North, East Harlem South, Morningside Heights

SELECT "zones"."Zone"
FROM "zones"
LEFT JOIN "green_taxis"
ON "zones"."LocationID" = "green_taxis"."PULocationID"
where CAST("green_taxis"."lpep_pickup_datetime" AS DATE) = '2019-10-18'
GROUP BY "zones"."Zone"
ORDER BY SUM("green_taxis"."total_amount") DESC
LIMIT 3;
````
# QUESTION 6
````
JFK Airport

SELECT "zones"."Zone" FROM "zones" 
RIGHT JOIN
(SELECT  "green_taxis"."DOLocationID", MAX("green_taxis"."tip_amount") as max_tip_amount
FROM "zones"
LEFT JOIN "green_taxis"
ON "zones"."LocationID" = "green_taxis"."PULocationID"
where CAST("green_taxis"."lpep_pickup_datetime" AS DATE) >= '2019-10-01' and
CAST("green_taxis"."lpep_pickup_datetime" AS DATE) <= '2019-10-31'
and "zones"."Zone" = 'East Harlem North'
GROUP BY "green_taxis"."DOLocationID") s on "s"."DOLocationID" = "zones"."LocationID"
ORDER BY "s"."max_tip_amount" DESC
LIMIT 1
````

# QUESTION 7
````
terraform init, terraform apply -auto-aprove, terraform destroy
````