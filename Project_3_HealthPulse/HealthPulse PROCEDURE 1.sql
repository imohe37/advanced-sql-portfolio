CREATE PROCEDURE sp_GetDepartmentFinancials
    @TargetDept VARCHAR(50) = NULL
AS
SELECT 
    Department,
    COUNT(Visits.VisitID) AS Total_Visits,
    SUM(Cost_USD) AS Total_Revenue
FROM Visits
JOIN Billing
ON Visits.VisitID = Billing.VisitID
WHERE Department = @TargetDept OR @TargetDept IS NULL
GROUP BY Department
ORDER BY Total_Revenue DESC


EXEC sp_GetDepartmentFinancials

EXEC sp_GetDepartmentFinancials @TargetDept = 'Cardiology'