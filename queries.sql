-- I renamed the columns in the data so that it was easier to use. However, that code is not shared, below 
-- As I forgot the save that SQL query, and I do indeed apologize for that.

--1. The Most Polluted Counties
SELECT State, County, (Unhealthy_Days+Unhealthy_Sensitive_Days+Very_Unhealthy_Days+Hazardous_Days) as Total_Polluted_Days
FROM AQI_split_2024
ORDER BY Total_Polluted_Days DESC
Limit 10; 

--2. Highest to Lowest Percentage of Polluted Days 
SELECT State,
  SUM(Days_Collected) AS Total_days,
  SUM(Unhealthy_Days + Unhealthy_Sensitive_Days + Very_Unhealthy_Days + Hazardous_Days) AS Total_Polluted_Days,
  ROUND((100.0 * (SUM(Unhealthy_Days + Unhealthy_Sensitive_Days + Very_Unhealthy_Days + Hazardous_Days)) / SUM(Days_Collected)), 2) AS PCT_Poluted_days
FROM AQI_split_2024
GROUP BY State
ORDER BY PCT_Poluted_days DESC;

--3. Highest to Lowest Percentage of Good Days 
SELECT State,
  SUM(Days_Collected) AS Total_days,
  SUM(Good_Days) AS Good,
  ROUND((100.0 * SUM(Good_days) / SUM(Days_Collected)), 2) AS Pct_Good_days
FROM AQI_split_2024
GROUP BY State
ORDER BY Pct_Good_days DESC;

--4. Number of counties in a State with Poor AQI readings for 5 or  more
SELECT State, COUNT(*) AS Counties_With_Issues
FROM AQI_split_2024
WHERE (Unhealthy_Days + Very_Unhealthy_Days + Hazardous_Days) > 5
GROUP BY State
ORDER BY Counties_With_Issues DESC;

--5. Top 10 Highest AQI readings
SELECT STATE, COUNTY, Max_AQI
FROM AQI_stats_2024
ORDER BY Max_AQI DESC
Limit 10; 

--6. Number of counties in a State that exceed a reading of 201 AQI
SELECT State, Count(*)as Bad_max_AQI
FROM AQI_stats_2024
WHERE MAX_AQI> 201
GROUP BY State
ORDER BY Bad_max_AQI DESC
Limit 5;




