-- This query breaks down the Italian constructors, how many races they have each won.

SELECT c.Name AS Constructor, 
       c.Nationality, 
       COUNT(CASE WHEN r.Position = 1 THEN 1 END) AS TotalWins
FROM F1_Analysis.dbo.results r
INNER JOIN F1_Analysis.dbo.constructors c ON r.ConstructorName = c.Name
WHERE c.Nationality = 'Italian' AND r.Position = 1
GROUP BY c.Name, c.Nationality
ORDER BY TotalWins DESC;

/*
The data shows that out of the total six Italian constructors, only three have achieved race wins.
Amazingly, Ferrari accounts for 9000 of the 9018 total wins (99.8%), highlighting their unparalleled dominance.

This demonstrates that Ferrari not only live up to their outstanding reputation but also solidify their legacy as one of the most successful 
constructors in Formula 1 history.
*/
