Air Quality Index (AQI) Data Analysis – 2024
📄 Overview
This project analyzes county-level air quality data from 2024 using Python and SQL. The workflow includes filtering and transforming the dataset to extract meaningful insights about pollution levels across U.S. states and counties.

📁 Files
annual_aqi_by_county_2024.csv: Raw AQI dataset from the EPA or similar source.

AQI_split_2024.csv: Cleaned dataset with breakdown of air quality days by type.

AQI_stats.csv: Summary statistics including max, median, and 90th percentile AQI values.

🧠 Objectives
Filter: Focus on counties with at least 100 days of air quality data.

Transform: Split data into different air quality day types (e.g., Good, Unhealthy, etc.).

Summarize: Calculate aggregate AQI statistics.

Query: Use SQL to derive insights such as most polluted counties or states with the cleanest air.

⚙️ Code Explanation
1. Data Preprocessing (Python)
Load and Filter
python

def get_data(file_path):
    df = pd.read_csv(file_path)
    df = df[df['Days with AQI'] >= 100]
    return df
AQI Type Breakdown
python
def days_with_AQI_split(df):
    # Keeps relevant columns and ensures totals match
Filters and renames columns for easier analysis.

Ensures daily counts match Days with AQI.

AQI Statistics Extraction
python
def AQI_stats(df):
    # Extracts max, 90th percentile, and median AQI for each county
2. Output
AQI_split_2024.csv: Used for pollution day type queries.

AQI_stats.csv: Used for maximum and percentile AQI analysis.

🧮 SQL Queries (Sample Insights)
⚠️ Note: Column names in the SQL queries assume you have renamed them in your DB to be SQL-friendly.

Make sure to align column names between your CSV and SQL environment (e.g., Days with AQI → Days_Collected, etc.)

✅ Future Improvements
Automate the SQL column renaming via Python.

Add data visualizations (e.g., pollution heatmaps, trend lines).

Enable year-to-year comparison by expanding to other years.

👤 Author
Aiman Sharma
Industrial Engineering @ Georgia Tech | Class of 2028
