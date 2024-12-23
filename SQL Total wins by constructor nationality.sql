/*
This query finds the number of wins by constructors grouped by nationality.
It helps assess how effective each nationality is at winning and whether there is a correlation between the number of constructors and their success rates.
*/
SELECT c.Nationality, -- Constructor nationality
       COUNT(CASE WHEN r.Position = 1 THEN r.Position END) AS TotalWins, -- Count only wins
       COUNT(DISTINCT c.Name) AS TotalConstructors -- Count unique constructors
FROM F1_Analysis.dbo.results r
INNER JOIN F1_Analysis.dbo.constructors c ON r.ConstructorName = c.Name -- Join results with constructors
GROUP BY c.Nationality
ORDER BY TotalWins DESC; -- Sort by most wins

/*
The data shows that the Italians, with 9018 wins, are far ahead of the competition. 
They have won more than double the number of times (127.33% more) than runners up, the British, who have 3967 wins. 

Interestingly, the data reveals no correlation between the number of constructors and their success rates. 
Despite having almost half the number of constructors compared to the British, the Italians have more than double the wins. 
This suggests that success in Formula 1 is driven more by the quality of a few dominant teams rather than the sheer number of constructors.

To delve deeper into this insight, we will analyze the distribution of the 9018 wins among the six Italian constructors. 
This will help determine whether the wins are evenly distributed or if one or two constructors, like Ferrari, contribute disproportionately to the total.
*/
