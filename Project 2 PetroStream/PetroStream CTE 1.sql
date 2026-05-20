WITH AverageDailyOilProduction_CTE AS (
    SELECT Wells.WellID, Region, Well_Type, AVG(Barrels_Oil) AS AVG_OIL_PRD
    FROM Production
    join Wells
    ON Production.WellID = Wells.WellID
    WHERE Well_Type = 'Offshore'
    GROUP BY Wells.WellID, Region, Well_Type

)
SELECT * FROM AverageDailyOilProduction_CTE
ORDER BY AVG_OIL_PRD DESC