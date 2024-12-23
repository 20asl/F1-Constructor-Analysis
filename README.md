# Formula 1 Constructor Analysis

## Overview
This project examines the performance of Formula 1 constructors, analysing their success rates by nationality. Through SQL queries and data insights, we explore the historical and modern dominance of certain nationalities and teams within the sport.

## Data Overview
The analysis uses data from the `F1_Analysis` database, focusing on two key tables:
- **constructors**: Provides details about constructor names and their nationalities.
- **results**: Records race results, including constructors’ positions in each race.

## SQL Queries and Insights

### 1. Constructor Distribution by Nationality
**Purpose**: This query calculates the percentage of constructors by nationality and orders them by total count. It identifies the representation of each nationality among constructors in Formula 1.

```sql
SELECT c.Nationality, 
       COUNT(c.Nationality) AS TotalConstructors, 
       CAST(COUNT(c.Nationality) * 100.0 / SUM(COUNT(c.Nationality)) OVER () AS DECIMAL(5, 2)) AS Percentage
FROM F1_Analysis.dbo.constructors c
GROUP BY c.Nationality
ORDER BY TotalConstructors DESC;
'''sql
