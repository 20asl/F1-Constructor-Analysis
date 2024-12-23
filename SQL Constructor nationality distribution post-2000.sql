/*
This query calculates the percentage of constructors by nationality and orders them by total count.
The data is filtered to include only entries from the year 2000 onwards, focusing on the modern era of Formula 1.
The results can be compared with historical data to identify how the sport's constructor distribution has evolved over time.
*/

SELECT Nationality, -- Selects each nationality
	COUNT(nationality) AS TotalNumber, -- Finds the total number for each nationality
	CAST(COUNT(Nationality) * 100.0 / SUM(COUNT(Nationality)) OVER () AS DECIMAL(5, 2)) AS Percentage -- Finds what percentage each nationality holds
FROM F1_Analysis.dbo.constructors AS Constructors /* Selecting from the DataBase (F1_Analysis), the schema (DBO), and the table (Contructors), while also 
simplifying the term down to 'Contructors' for easier use and readability*/
WHERE year >= 2000 -- Filters out data older than the year 2000, making the data more relevant to the modern sport
	GROUP BY Nationality -- Grouped by each nationality
	ORDER BY TotalNumber DESC; -- Ordered by the total number of each nationality descending, this also corrolates with the percentage

/*
This query analyses the distribution of constructors by nationality, highlighting which countries dominate Formula 1.
The findings show that 29.70% of constructors are British, which is 52% higher than the Italian count of 19.55%. 
This suggests that, while British dominance has declined compared to historical trends, nearly a third of the constructor positions in Formula 1 
since the year 2000 have still been held by British constructors. This demonstrates that the British continue to maintain a strong position 
in the modern sporting era.

Another interesting insight is the rise in Swiss constructors compared to the decline in American constructors.
The Swiss have doubled their share from 3.87% overall to 7.89% post-2000, indicating a growing influence in Formula 1. 
Conversely, the American share has dropped from 11.52% overall to just 3.38% post-2000. This is a drastic decline, which could suggest 
a reduced interest in Formula 1 among American constructors.

The rise of Swiss constructors may reflect increased investment in European motorsport. Conversely, the decline in American constructors 
could be attributed to a stronger focus on domestic motorsport, such as NASCAR or IndyCar.
*/
