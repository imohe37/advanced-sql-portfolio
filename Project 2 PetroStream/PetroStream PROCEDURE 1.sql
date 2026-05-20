CREATE PROCEDURE sp_RegionalOilProductionSUM
@TargetRegion VARCHAR(50) = NULL
AS
SELECT 
	Wells.WellID,
	Region,
	SUM(Barrels_Oil) AS SUM_Oil_Production
FROM Wells
JOIN Production
ON Wells.WellID = Production.WellID
WHERE (Region = @TargetRegion OR @TargetRegion IS NULL)
GROUP BY Wells.WellID, Region
ORDER BY SUM_Oil_Production DESC


EXEC sp_RegionalOilProductionSUM @TargetRegion = 'Niger Delta'
